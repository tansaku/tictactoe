class TicTacToe

  def self.play
    5.times { next_output } 
  end 

  def self.new_game
    @@game = TicTacToe.new
  end

  def self.game
    @@game
  end

  def self.next_output
    @@game ||= TicTacToe.new
    @@game.choose_move 
  end

  attr_writer :game_state, :strategy

  def initialize
    @moves = 0
    @board_template = File.read('./lib/board_template.txt')
    @game_state = { A1: 'X' }
    @strategy = STRATEGY1
  end

  def has_ended?
    return false if @game_state.count < 2 
    @game_state.count == 9 || winner?
  end

  def winner?
    @game_state[:A1] == @game_state[:B1] && @game_state[:B1] == @game_state[:C1] ||
    @game_state[:A2] == @game_state[:B2] && @game_state[:B2] == @game_state[:C2] ||
    @game_state[:A3] == @game_state[:B3] && @game_state[:B3] == @game_state[:C3] ||
    @game_state[:A1] == @game_state[:B2] && @game_state[:B2] == @game_state[:C3] ||
    @game_state[:A3] == @game_state[:B2] && @game_state[:B2] == @game_state[:C1] ||
    @game_state[:A1] == @game_state[:A2] && @game_state[:A2] == @game_state[:A3] ||
    @game_state[:B1] == @game_state[:B2] && @game_state[:B2] == @game_state[:B3] ||
    @game_state[:C1] == @game_state[:C2] && @game_state[:C2] == @game_state[:C3]
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

  def choose_move 
    return choose_player unless player_chosen? 
    puts board
    @moves += 1
    puts
    if @moves < 4 
      puts 'Where do you want to move?' 
      opponent_move = STDIN.gets.chomp
      @game_state[opponent_move.to_sym] = 'O'
      @game_state[@strategy[@moves-1]] = 'X'
    else
      puts "#{determine_winner} has won!"
    end
  end

  def determine_winner
    @strategy == STRATEGY1 ? 'O' : 'X'
  end

  def board
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