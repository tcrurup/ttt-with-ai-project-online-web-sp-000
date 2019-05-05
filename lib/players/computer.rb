#Logic tree for computer Players
#Quip and pause showing the computers turn
#Check the center square first, take if empty
#If not empty check for iminent victory
#If not empty then check for imminent defeat
#Otherwise take an available corner at random
#If no corners take a middle spot at random





module Players
  class Computer < Player
    
    attr_accessor :board
    
    def move(board = nil)
      "1"
    end
    
    def middle_cell_taken?(board)
      ["X", "O"].include?(self.board.cells[4])
    end
    
    def imminent_ending?(token)
      ending_cell = false
      Game::WIN_COMBINATIONS.each do |combo|
        
        #combo match is an array of boolean values that represent a match to the winning
        #combo.  For example if the winning combo is [0,1,2] and my cells are [0,2,5,6]
        #this will be [true, false, true]
        
        combo_match = combo.collect{ |x| get_my_cells.include?(x) }
        
        ##If there are two trues in the combo match array that means there is only one more
        #square needed for a victory.  Find the index of the false value and return the 
        #corresponding winning combination index
        
        if combo_match.count{ |x| x == true } == 2
          ending_cell = combo[combo_match.index(false)]
        end  
      end
      ending_cell
    end
    
    def get_cells_with_token(token)
      my_cells = []
      self.board.each_with_index.each do |value, index|
        my_cells << index if value == self.token
      end
      my_cells
    end
    
  end
end