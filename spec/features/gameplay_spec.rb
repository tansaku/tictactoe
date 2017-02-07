require 'tictactoe'
require 'byebug'

describe 'TicTacToe' do

  before { TicTacToe.new_game }

  context 'O wins in four' do

    let(:game) { File.readlines('./spec/fixtures/O_wins_in_four.txt') }
    let(:first_move) { game[0..9].join }
    let(:second_move) { game[10..19].join }
    let(:third_move) { game[20..29].join }
    let(:fourth_move) { game[30..39].join }


    it 'should play the game' do
      expect(STDIN).to receive(:gets).and_return 'O'
      expect { TicTacToe.next_output }.to output("Which player do you want to be? X or O?\n").to_stdout  
      expect(STDIN).to receive(:gets).and_return 'B2'
      expect { TicTacToe.next_output }.to output("#{first_move}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'A3'
      expect { TicTacToe.next_output }.to output("#{second_move}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'C1'
      expect { TicTacToe.next_output }.to output("#{third_move}\nWhere do you want to move?\n").to_stdout
      expect { TicTacToe.next_output }.to output("#{fourth_move}\n\nO has won!\n").to_stdout
    end

  end

  context 'X wins in four' do

    let(:game) { File.readlines('./spec/fixtures/X_wins_in_four.txt') }
    let(:first_move) { game[0..9].join }
    let(:second_move) { game[10..19].join }
    let(:third_move) { game[20..29].join }
    let(:fourth_move) { game[30..39].join }

    it 'should play more than one game' do
      expect(STDIN).to receive(:gets).and_return 'O'
      expect { TicTacToe.next_output }.to output("Which player do you want to be? X or O?\n").to_stdout  
      expect(STDIN).to receive(:gets).and_return 'A2'
      expect { TicTacToe.next_output }.to output("#{first_move}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'A3'
      expect { TicTacToe.next_output }.to output("#{second_move}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'C2'
      expect { TicTacToe.next_output }.to output("#{third_move}\nWhere do you want to move?\n").to_stdout
      expect { TicTacToe.next_output }.to output("#{fourth_move}\n\nX has won!\n").to_stdout
    end

  end

end