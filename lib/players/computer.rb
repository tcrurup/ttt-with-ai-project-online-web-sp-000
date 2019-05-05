#Logic tree for computer Players
#Quip and pause showing the computers turn
#Check the center square first, take if empty
#If not empty check for iminent victory
#If not empty then check for imminent defeat
#Otherwise take an available corner at random
#If no corners take a middle spot at random





module Players
  class Computer < Player
    
    def move(board = nil)
      self.turn_start(board)
      
      "1"
    end
    
    def turn_start(board)
      puts "Hmmm... Let me think..."
      sleep 1
    end
    
    def middle_cell_taken?(board)
      ["X", "O"].include?(board.cells[4])
    end
    
    
  end
end