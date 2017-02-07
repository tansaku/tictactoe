class TicTacToe

  def self.play
    next_output
    next_output
    next_output
    next_output
    next_output
  end 

  def self.new_game
    @@TicTacToe = TicTacToe.new
  end

  def self.next_output
    @@TicTacToe ||= TicTacToe.new
    @@TicTacToe.choose_move 
  end

  def initialize
    @moves = 0
    game = File.readlines('./spec/fixtures/O_wins_in_four.txt')
    @output = []
    @output << game[0..9].join
    @output << game[10..19].join 
    @output << game[20..29].join 
    @output << game[30..39].join 
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
    puts @output[@moves]
    @moves += 1
    puts
    if @moves < 4 
      puts 'Where do you want to move?' 
      STDIN.gets
    else
      puts 'O has won!' 
    end
  end
end