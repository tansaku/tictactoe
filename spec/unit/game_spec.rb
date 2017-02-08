require 'tictactoe'

describe 'game' do

  it 'can tell the game is still in play' do
    ttt = TicTacToe.new
    expect(ttt).not_to have_ended
  end

  it 'can tell the game is still in play with a few moves' do
    ttt = TicTacToe.new
    ttt.game_state = { A1: 'X', B2: 'O', B3: 'X' }
    expect(ttt).not_to have_ended
  end

  it 'can tell the game is still in play with more moves' do
    ttt = TicTacToe.new
    ttt.game_state = { 
      A1: 'X', A2: 'X', 
      B2: 'O', 
      A1: 'O', B3: 'X'
    }
    expect(ttt).not_to have_ended
  end

  it 'can tell the game has ended in a draw' do
    ttt = TicTacToe.new
    ttt.game_state = { 
      A1: 'O', B1: 'X', C1: 'X',
      A2: 'O', B2: 'X', C2: 'O',
      A3: 'X', B3: 'O', C3: 'X',
    }
    expect(ttt).to have_ended
  end

  it 'can tell the game has ended with X winning' do
    ttt = TicTacToe.new
    ttt.game_state = { 
      A1: 'X', B1: 'O',
      A2: 'O', B2: 'X', C2: 'O',
      A3: 'X', B3: 'O', C3: 'X',
    }
    expect(ttt).to have_ended
  end

end