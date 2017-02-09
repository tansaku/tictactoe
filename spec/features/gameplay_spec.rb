require 'tictactoe'
require 'byebug'

describe 'TicTacToe' do

  before { TicTacToe.new_game }

  context 'O wins in four' do

    let(:game) { File.readlines('./spec/fixtures/O_wins_in_four.txt') }
    let(:first_output) { game[0..9].join }
    let(:second_output) { game[10..19].join }
    let(:third_output) { game[20..29].join }
    let(:fourth_output) { game[30..39].join }


    it 'plays successfully' do
      TicTacToe.game.send(:strategy=, TicTacToe::STRATEGY1)
      expect(STDIN).to receive(:gets).and_return 'O'
      expect { TicTacToe.take_a_turn }.to output("Which player do you want to be? X or O?\n").to_stdout  
      expect(STDIN).to receive(:gets).and_return 'B2'
      expect { TicTacToe.take_a_turn }.to output("#{first_output}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'A3'
      expect { TicTacToe.take_a_turn }.to output("#{second_output}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'C1'
      expect { TicTacToe.take_a_turn }.to output("#{third_output}\nWhere do you want to move?\n").to_stdout
      expect { TicTacToe.take_a_turn }.to output("#{fourth_output}\n\nO has won!\n").to_stdout
    end

  end

  context 'X wins in four' do

    let(:game) { File.readlines('./spec/fixtures/X_wins_in_four.txt') }
    let(:first_output) { game[0..9].join }
    let(:second_output) { game[10..19].join }
    let(:third_output) { game[20..29].join }
    let(:fourth_output) { game[30..39].join }

    it 'plays successfully' do
      TicTacToe.game.send(:strategy=, TicTacToe::STRATEGY2)
      expect(STDIN).to receive(:gets).and_return 'O'
      expect { TicTacToe.take_a_turn }.to output("Which player do you want to be? X or O?\n").to_stdout  
      expect(STDIN).to receive(:gets).and_return 'A2'
      expect { TicTacToe.take_a_turn }.to output("#{first_output}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'A3'
      expect { TicTacToe.take_a_turn }.to output("#{second_output}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'C2'
      expect { TicTacToe.take_a_turn }.to output("#{third_output}\nWhere do you want to move?\n").to_stdout
      expect { TicTacToe.take_a_turn }.to output("#{fourth_output}\n\nX has won!\n").to_stdout
    end

  end

  context 'draw in five' do

    let(:game) { File.readlines('./spec/fixtures/draw_in_five.txt') }
    let(:first_output) { game[0..9].join }
    let(:second_output) { game[10..19].join }
    let(:third_output) { game[20..29].join }
    let(:fourth_output) { game[30..39].join }
    let(:fifth_output) { game[40..49].join }

    it 'plays successfully' do
      TicTacToe.game.send(:strategy=, TicTacToe::STRATEGY3)
      expect(STDIN).to receive(:gets).and_return 'O'
      expect { TicTacToe.take_a_turn }.to output("Which player do you want to be? X or O?\n").to_stdout  
      expect(STDIN).to receive(:gets).and_return 'A2'
      expect { TicTacToe.take_a_turn }.to output("#{first_output}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'A3'
      expect { TicTacToe.take_a_turn }.to output("#{second_output}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'B1'
      expect { TicTacToe.take_a_turn }.to output("#{third_output}\nWhere do you want to move?\n").to_stdout
      expect(STDIN).to receive(:gets).and_return 'C3'
      expect { TicTacToe.take_a_turn }.to output("#{fourth_output}\nWhere do you want to move?\n").to_stdout
      expect { TicTacToe.take_a_turn }.to output("#{fifth_output}\n\nIt's a draw!\n").to_stdout
    end

  end
end