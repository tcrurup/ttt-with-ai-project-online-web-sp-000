module Players
  class Human < Player
  
    def move(board = nil)
      puts "Please enter a number between 1 and 9"
      input = gets.strip
    end
  end
end