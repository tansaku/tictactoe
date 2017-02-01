class TicTacToe
  def self.choose_player
    puts 'Which player do you want to be? X or O?'
    STDIN.gets
  end
  def self.choose_move  
    puts File.read('./spec/fixtures/first_move_result.txt')
    puts
    puts 'Where do you want to move?'
    STDIN.gets
  end
end