TicTacToe
=========

```ruby -r './lib/tictactoe.rb' -e 'TicTacToe.play'```

TODO

* [x] play a different game than the example
* [x] might be nice to have full game in one file
* [x] drop to integration test level to check we can display user move
* [ ] could keep hard coding but obtuse - let's make it work
  - [x] find a way to display the board to represent the game state - use template
  - [x] receive the users move and add that to the game state
  - [ ] be able to make a computer move effectively
    - [x] hard coded strategy
    - [ ] more effective strategy
  - [ ] refactor game 
    - [x] could drive from acceptance test for longer game?
  - [ ] detect winning state
  - [ ] play until game is over
  - [ ] handle illegal moves