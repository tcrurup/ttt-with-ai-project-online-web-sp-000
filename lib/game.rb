class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def turn 
    chosen_move = nil
    until self.board.valid_move?(chosen_move)
      chosen_move = current_player.move
    end
    self.board.update(chosen_move, current_player)
  end
  
  def play 
    while self.over? == false
      turn
    end
    if self.won? 
      puts "Congratulations #{self.winner}!"
    else self.draw?
      puts "Cat's Game!"
    end
  end
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    if self.board.turn_count % 2 == 0  
      self.player_1
    else
      self.player_2
    end
  end
  
  def draw?
    self.board.full? && !self.won?
  end
  
  def over?
    self.draw? || self.won?
  end
  
  def winner
    if self.won? 
      self.board.cells[won?[0]]
    else
      nil
    end
  end
  
  def won?
    
    player_1_cells = []
    player_2_cells = []
    
    self.board.cells.each_with_index do |cell, index|
      if cell == self.player_1.token 
        player_1_cells << index
      elsif cell == self.player_2.token
        player_2_cells << index
      end
    end
    won = false
    
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.collect{ |cell| player_1_cells.include?(cell) }.all?(true) || 
        win_combo.collect{ |cell| player_2_cells.include?(cell) }.all?(true)
        won = win_combo
        break
      end
    end
    
    won
  end
  
  def self.start
    num_players = -1
    token_pref = nil
    
    until num_players.between?(0, 2) 
      puts "How many human players will there be? (0 - 2)"
      num_players = gets.strip.to_i
    end
    
    if num_players === 1
      until ["X","O"].include?(token_pref)
        puts "What is your preferred token? ('X' or 'O')"
        token_pref = gets.strip.to_i
      end
    end
    
    game = self.new
    game.play
    
  end

end