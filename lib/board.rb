class Board
  
  attr_accessor :cells
  
  def initialize(template = nil)
    if template.nil?
      self.reset!
    else
      @cells = template
    end
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    x = self.cells
    system "clear"
    puts "TIC-TAC-TOE"
    puts "Player #{(self.turn_count % 2) + 1}'s Turn"
    puts " #{x[0]} | #{x[1]} | #{x[2]} "
    puts "-----------"
    puts " #{x[3]} | #{x[4]} | #{x[5]} "
    puts "-----------"
    puts " #{x[6]} | #{x[7]} | #{x[8]} "
  end
  
  def position(input)
    index = input_to_index(input)
    self.cells[index]
  end
  
  def full?
    self.cells.collect{ |cell| ["X", "O"].include?(cell) }.all?(true)
  end
  
  def taken?(input)
    index = input_to_index(input)
    ["X", "O"].include?(self.cells[index])
  end
  
  def valid_move?(input)
   input.to_i.between?(1, 9) && !taken?(input) 
  end
  
  def turn_count
    self.cells.reject{ |cell| cell == " " }.length
  end
  
  def update(input, player)
    index = input_to_index(input)
    self.cells[index] = player.token
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def get_cells_with_token(token)
    my_cells = []
    self.cells.each_with_index.each do |value, index|
      my_cells << index if value == token
    end
    my_cells
  end
  
end