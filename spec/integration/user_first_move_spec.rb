require 'tictactoe'

describe 'initial opponent move' do

  context 'first move B2' do

    let(:game) { File.readlines('./spec/fixtures/O_wins_in_four.txt') }

    let(:first_output) { game[0..9].join }
    let(:second_output) { game[10..19].join }

    it 'should be presented correctly' do
      TicTacToe.new_game
      allow(STDIN).to receive(:gets).and_return 'O'
      expect { TicTacToe.take_a_turn }.to output("Which player do you want to be? X or O?\n").to_stdout  
      allow(STDIN).to receive(:gets).and_return 'B2'
      expect { TicTacToe.take_a_turn }.to output("#{first_output}\nWhere do you want to move?\n").to_stdout
      allow(STDIN).to receive(:gets).and_return 'A3'
      expect { TicTacToe.take_a_turn }.to output("#{second_output}\nWhere do you want to move?\n").to_stdout
    end

  end
  
  context 'first move A2' do

    let(:game) { File.readlines('./spec/fixtures/X_wins_in_four.txt') }

    let(:first_output) { game[0..9].join }
    let(:second_output) { game[10..19].join }

    it 'should be presented correctly' do
      TicTacToe.new_game
      allow(STDIN).to receive(:gets).and_return 'O'
      expect { TicTacToe.take_a_turn }.to output("Which player do you want to be? X or O?\n").to_stdout  
      allow(STDIN).to receive(:gets).and_return 'A2'
      expect { TicTacToe.take_a_turn }.to output("#{first_output}\nWhere do you want to move?\n").to_stdout
      allow(STDIN).to receive(:gets).and_return 'A3'
      expect { TicTacToe.take_a_turn }.to output("#{second_output}\nWhere do you want to move?\n").to_stdout
    end

  end
  
end