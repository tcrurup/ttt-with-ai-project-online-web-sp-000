class Board
  
  attr_accessor :cells
  
  def initialize(template = nil)
    if template.nil?
      self.reset_board
    else
      @cells = template
    end
  end
  
  def reset_board 
    @cells = Array.new(9, " ")
  end
  
  def display
    x = self.cells
    
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
  
  def get_empty_cell_indexes
    empty_cells = []
    self.board.each_with_index do |cell, index|
      empty_cells << index unless ["X", "O"].include?(cell)
    end
    empty_cells
  end
  
  
end