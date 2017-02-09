class TicTacToe

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
    puts board_with_current_state
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
    @game_state[opponent_move.to_sym] = 'O'
    @game_state[@strategy[@moves-1]] = 'X'
  end

  def has_ended?
    return false if @game_state.count < 2 
    @game_state.count == 9 || winner?
  end

  private

  attr_writer :game_state, :strategy

  def initialize
    @moves = 0
    @board_template = File.read('./lib/board_template.txt')
    @game_state = { A1: 'X' }
    @strategy = STRATEGY3
  end

  def winner?
    same_and_not_nil?(:A1,:B1,:C1) ||
    same_and_not_nil?(:A2,:B2,:C2) ||
    same_and_not_nil?(:A3,:B3,:C3) ||
    same_and_not_nil?(:A1,:B2,:C3) ||
    same_and_not_nil?(:A3,:B2,:C1) ||
    same_and_not_nil?(:A1,:A2,:A3) ||
    same_and_not_nil?(:B1,:B2,:B3) ||
    same_and_not_nil?(:C1,:C2,:C3)
  end

  def same_and_not_nil?(x,y,z)
    return false if @game_state[x].nil? || @game_state[y].nil? || @game_state[z].nil?
    result = @game_state[x] == @game_state[y] && @game_state[y] == @game_state[z]
    @winner = @game_state[x] if result
    result
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
    @winner ? "#{@winner} has won!" : "It's a draw!" 
  end

  def board_with_current_state
    @board_template.gsub(/A1/,@game_state.fetch(:A1,' '))
                   .gsub(/B1/,@game_state.fetch(:B1,' '))
                   .gsub(/C1/,@game_state.fetch(:C1,' '))
                   .gsub(/A2/,@game_state.fetch(:A2,' '))
                   .gsub(/B2/,@game_state.fetch(:B2,' '))
                   .gsub(/C2/,@game_state.fetch(:C2,' '))
                   .gsub(/A3/,@game_state.fetch(:A3,' '))
                   .gsub(/B3/,@game_state.fetch(:B3,' '))
                   .gsub(/C3/,@game_state.fetch(:C3,' '))
  end
end