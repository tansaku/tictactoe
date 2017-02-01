require 'tictactoe'

describe 'gameplay' do
  subject(:play_game) {  }

  it 'should ask which player you want to be' do
    expect(STDIN).to receive(:gets).and_return 'O'
    expect { TicTacToe.choose_player }.to output("Which player do you want to be? X or O?\n").to_stdout  
  end


  it 'should ask what move you want to make' do
    expect(STDIN).to receive(:gets).and_return 'B2'
    first_move = File.read('./spec/fixtures/first_move_result.txt')
    expect { TicTacToe.choose_move }.to output("#{first_move}\n\nWhere do you want to move?\n").to_stdout
  end  

end