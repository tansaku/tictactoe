require 'tictactoe'

describe TicTacToe do

  before { TicTacToe.new_game }

  context 'first move B2' do

    let(:game) { File.readlines('./spec/fixtures/O_wins_in_four.txt') }

    let(:first_output) { game[0..9].join }
    let(:second_output) { game[10..19].join }

    it 'should present the users first move correctly' do
      allow(STDIN).to receive(:gets).and_return 'O'
      expect { TicTacToe.next_output }.to output("Which player do you want to be? X or O?\n").to_stdout  
      allow(STDIN).to receive(:gets).and_return 'B2'
      expect { TicTacToe.next_output }.to output("#{first_output}\nWhere do you want to move?\n").to_stdout
      allow(STDIN).to receive(:gets).and_return 'A3'
      expect { TicTacToe.next_output }.to output("#{second_output}\nWhere do you want to move?\n").to_stdout
    end

  end
  
  context 'first move A2' do

    let(:game) { File.readlines('./spec/fixtures/X_wins_in_four.txt') }

    let(:first_output) { game[0..9].join }
    let(:second_output) { game[10..19].join }

    it 'should present the users first move correctly' do
      allow(STDIN).to receive(:gets).and_return 'O'
      expect { TicTacToe.next_output }.to output("Which player do you want to be? X or O?\n").to_stdout  
      allow(STDIN).to receive(:gets).and_return 'A2'
      expect { TicTacToe.next_output }.to output("#{first_output}\nWhere do you want to move?\n").to_stdout
      allow(STDIN).to receive(:gets).and_return 'A3'
      expect { TicTacToe.next_output }.to output("#{second_output}\nWhere do you want to move?\n").to_stdout
    end

  end
  
end