require 'tictactoe'

describe 'board' do

  let(:game) { File.readlines('./spec/fixtures/O_wins_in_four.txt') }

  let(:first_output) { game[0..9].join << "\n" }
  let(:second_output) { game[10..19].join << "\n" }
  let(:third_output) { game[20..29].join << "\n" }

  it 'initially has X in A1 and nothing else' do
    expect(TicTacToe.new.send(:board_with_current_state)).to eq first_output
  end

  it 'correctly reflects game state with three moves' do
    ttt = TicTacToe.new
    ttt.send(:game_state=, { A1: 'X', B2: 'O', B3: 'X'})
    expect(ttt.send(:board_with_current_state)).to eq second_output
  end

  it 'correctly reflects game state with five moves' do
    ttt = TicTacToe.new
    ttt.send(:game_state=, { A1: 'X', B1: 'X', B2: 'O', A3: 'O', B3: 'X'})
    expect(ttt.send(:board_with_current_state)).to eq third_output
  end

end