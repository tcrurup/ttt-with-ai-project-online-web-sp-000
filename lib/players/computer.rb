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
      Game::WIN_COMBINATIONS.each do |combo|
        
      end
    end
    
  end
end