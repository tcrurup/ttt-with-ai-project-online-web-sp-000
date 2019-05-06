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
    
    CORNER_INPUTS = [1, 3, 7, 9]
    EDGE_INPUTS = [2, 4, 6, 8]
    
    def move(board = nil)
      chosen_move = nil
      
      print "Hmmmm, let me see"
      self.show_thinking
      self.board.update(calculate_input, self)
      
    end
    
    def calculate_input
      if !self.board.taken?("5")
        self.take_middle_cell
      elsif self.imminent_win?
        self.imminent_win? 
      elsif self.imminent_loss?
        self.imminent_loss? 
      elsif self.take_rand_corner
        self.take_rand_corner
      else 
        self.take_rand_edge
      end
    end
    
    def take_rand_corner
      inputs = CORNER_INPUTS.select{ |input| self.board.taken?(input) }
      inputs.length > 0 ? inputs.rand : false 
    end
    
    def take_rand_edge
      inputs = EDGE_INPUTS.select{ |input| self.board.taken?(input) }
      inputs.length > 0 ? inputs.rand : false 
    end
    
    def take_middle_cell
      if self.board.turn_count == 1 
        puts "Me first? I guess I will just take the middle"
      else 
        puts "You don't want the middle?  I guess I'll take it!"
      end
      "5"
    end
    
    def imminent_win?
      imminent_ending?(self.token)
    end
    
    def imminent_loss?
      imminent_ending?( ["O", "X"].reject!{ |x| x == self.token}[0] )
    end
    
    def imminent_ending?(checked_token)
      
      ending_index = false
      cells_with_token = self.board.get_cells_with_token(checked_token)
      
      Game::WIN_COMBINATIONS.each do |combo|
        
        #combo_match will be an array of boolean values that represent a match to the winning
        #combo.  For example if the winning combo is [0,1,2] and my cells are [0,2,5,6]
        #this will be [true, false, true]
        
        
        combo_match = combo.collect{ |x| cells_with_token.include?(x) }
        
        ##If there are two trues in the combo match array that means there is only one more
        #square needed for a victory.  Find the index of the false value and check of the spot 
        #has been taken (adds 1 to simulate input instead of index).  If not taken this will 
        #return the index that would end the game
        
        if combo_match.count{ |x| x == true } == 2
          possible_ending_index = combo[combo_match.index(false)]
          unless self.board.taken?(possible_ending_index + 1)
            ending_index = possible_ending_index + 1
          end
        end  
      end
      
      ending_index 
    end
    
    def show_thinking
      4.times do
        sleep 0.5
        print "."
      end
    end
    
  end
end