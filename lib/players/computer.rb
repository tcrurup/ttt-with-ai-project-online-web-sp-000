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
      self.turn_start
      
      middle_cell_taken?
    end
    
    def turn_start
      
    end
    
    def middle_cell_taken?(board)
      
    end
    
    
  end
end