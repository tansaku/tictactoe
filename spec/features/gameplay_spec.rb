require 'tictactoe'

describe 'TicTacToe' do

  it 'should play the game' do
    expect(STDIN).to receive(:gets).and_return 'O'
    expect { TicTacToe.next_output }.to output("Which player do you want to be? X or O?\n").to_stdout  
    expect(STDIN).to receive(:gets).and_return 'B2'
    first_move = File.read('./spec/fixtures/move_result_01.txt')
    expect { TicTacToe.next_output }.to output("#{first_move}\n\nWhere do you want to move?\n").to_stdout
    expect(STDIN).to receive(:gets).and_return 'A3'
    second_move = File.read('./spec/fixtures/move_result_02.txt')
    expect { TicTacToe.next_output }.to output("#{second_move}\n\nWhere do you want to move?\n").to_stdout
    expect(STDIN).to receive(:gets).and_return 'C1'
    third_move = File.read('./spec/fixtures/move_result_03.txt')
    expect { TicTacToe.next_output }.to output("#{third_move}\n\nWhere do you want to move?\n").to_stdout
    fourth_move = File.read('./spec/fixtures/move_result_04.txt')
    expect { TicTacToe.next_output }.to output("#{fourth_move}\n\nO has won!\n").to_stdout
  end

end