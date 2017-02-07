require 'tictactoe'

describe 'initial baord' do

  let(:game) { File.readlines('./spec/fixtures/O_wins_in_four.txt') }

  let(:first_output) { game[0..9].join }

  it 'has X in A1 and nothing else' do
    expect(TicTacToe.new.initial_board).to eq first_output
  end
end