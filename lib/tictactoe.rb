require 'delegate'
require_relative 'board'

class TicTacToe < SimpleDelegator

  def self.play
    loop do 
      take_a_turn 
      if game.has_ended?
        take_a_turn
        break
      end
    end
  end 

  def self.new_game
    @@game = TicTacToe.new
  end

  def self.game
    @@game ||= TicTacToe.new
  end

  def self.take_a_turn
    game.display_game_state_and_handle_game_turn
  end

  def display_game_state_and_handle_game_turn 
    return choose_player unless player_chosen? 
    puts current_state
    @moves += 1
    unless has_ended?
      handle_opponent_move
    else
      puts end_message 
    end
  end

  def handle_opponent_move
    puts 'Where do you want to move?' 
    opponent_move = STDIN.gets.chomp
    game_state[opponent_move.to_sym] = 'O'
    game_state[@strategy[@moves-1]] = 'X'
  end

  private

  attr_writer :game_state, :strategy

  def initialize(board_klass = Board)
    super(board_klass.new)
    @moves = 0
    @strategy = STRATEGY3
  end

  def player_chosen?
    @player_chosen
  end

  def choose_player
    puts 'Which player do you want to be? X or O?'
    @player_chosen = STDIN.gets.chomp
  end

  STRATEGY1 = [:B3, :B1]
  STRATEGY2 = [:B3, :B1, :C1]
  STRATEGY3 = [:B3, :B2, :C1, :C2]

  def end_message
    winner ? "#{winner} has won!" : "It's a draw!" 
  end

end