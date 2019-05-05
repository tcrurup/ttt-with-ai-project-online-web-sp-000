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
    
    def imminent_ending?
      Game::WIN_COMBINATIONS.each do |combo|
        combo.collect{ |x| get_my_cells.include?(x) }
      end
    end
    
    def get_my_cells
      my_cells = []
      self.board.each_with_index.each do |value, index|
        my_cells << index if value == self.token
      end
      my_cells
    end
    
  end
end