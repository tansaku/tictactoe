class TicTacToe

  def self.play
    next_output
    next_output
    next_output
    next_output
    next_output
  end 

  def self.new_game
    @@TicTacToe ||= TicTacToe.new
  end

  def self.next_output
    @@TicTacToe ||= TicTacToe.new
    @@TicTacToe.choose_move 
  end

  def initialize
    @moves = 0
    @board_template = File.read('./lib/board_template.txt')
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
    puts @board_template
    @moves += 1
    puts
    if @moves < 4 
      puts 'Where do you want to move?' 
      @human_next_move = STDIN.gets
    else
      puts 'O has won!' 
    end
  end

  def initial_board
    @board_template.gsub(/A1/,'X')
                   .gsub(/B1/,' ')
                   .gsub(/C1/,' ')
                   .gsub(/A2/,' ')
                   .gsub(/B2/,' ')
                   .gsub(/C2/,' ')
                   .gsub(/A3/,' ')
                   .gsub(/B3/,' ')
                   .gsub(/C3/,' ')
  end
end