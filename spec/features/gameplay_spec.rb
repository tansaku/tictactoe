require 'tictactoe'

describe 'gameplay' do

  it 'should ask which player you want to be' do
    expect { TicTacToe.play }.to output("Which player do you want to be? X or O?\n").to_stdout
  end

end