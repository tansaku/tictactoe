require 'board'

describe Board do

  subject(:board) { described_class.new }

  let(:game) { File.readlines('./spec/fixtures/O_wins_in_four.txt') }

  let(:first_output) { game[0..9].join << "\n" }
  let(:second_output) { game[10..19].join << "\n" }
  let(:third_output) { game[20..29].join << "\n" }

  it 'orrectly reflects game state with one move' do
    board.game_state = { A1: 'X'}
    expect(board.current_state).to eq first_output
  end

  it 'correctly reflects game state with three moves' do
    board.game_state = { A1: 'X', B2: 'O', B3: 'X'}
    expect(board.current_state).to eq second_output
  end

  it 'correctly reflects game state with five moves' do
    board.game_state = { A1: 'X', B1: 'X', B2: 'O', A3: 'O', B3: 'X'}
    expect(board.current_state).to eq third_output
  end

  it 'can tell the game is still in play' do
    expect(board).not_to have_ended
  end

  it 'can tell the game is still in play with a few moves' do
    board.game_state = {  A1: 'X', B2: 'O', B3: 'X' }
    expect(board).not_to have_ended
  end

  it 'can tell the game is still in play with more moves' do
    board.game_state =  {
      A1: 'X', A2: 'X', 
      B2: 'O', 
      A3: 'O', B3: 'X'
    }
    expect(board).not_to have_ended
  end

  it 'can tell the game has ended in a draw' do
    board.game_state =  { 
      A1: 'O', B1: 'X', C1: 'X',
      A2: 'O', B2: 'X', C2: 'O',
      A3: 'X', B3: 'O', C3: 'X',
    }
    expect(board).to have_ended
  end

  it 'can tell the game has ended with X winning' do
    board.game_state =  {  
      A1: 'X', B1: 'O',
      A2: 'O', B2: 'X', C2: 'O',
      A3: 'X', B3: 'O', C3: 'X',
    }
    expect(board).to have_ended
  end

  it 'can indicate open locations when only one left' do
    board.game_state =  {  
      A1: 'X', B1: 'O',
      A2: 'O', B2: 'X', C2: 'O',
      A3: 'X', B3: 'O', C3: 'X',
    }
    expect(board.open_locations).to match [:C1]
  end

  it 'can indicate open locations when several left' do
    board.game_state =  {  
      A1: 'X', B1: 'O',
      B2: 'X', C2: 'O',
      A3: 'X', C3: 'X',
    }
    expect(board.open_locations).to match [:C1, :A2, :B3]
  end


end