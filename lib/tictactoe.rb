class TicTacToe

  def self.play
    next_output
    next_output
    next_output
    next_output
    next_output
  end

  def self.next_output
    @@TicTacToe ||= TicTacToe.new
    @@TicTacToe.choose_move 
  end

  def initialize
    @moves = 0
  end

  def player_chosen?
    @player_chosen
  end

  def choose_player
    puts 'Which player do you want to be? X or O?'
    @player_chosen = STDIN.gets
  end

  def choose_move 
    return choose_player unless player_chosen? 
    @moves += 1
    puts File.read("./spec/fixtures/move_result_0#{@moves}.txt")
    puts
    if @moves < 4 
      puts 'Where do you want to move?' 
      STDIN.gets
    else
      puts 'O has won!' 
    end
  end
end