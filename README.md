TicTacToe
=========

To install (assuming Ruby and bundler installed)

```sh
$ git clone http://github.com/tansaku/tictactoe
$ cd TicTacToe
$ bundle
```
To run the tests:

```
$ bundle exec rspec
```

To play the game 

```./ttt```

You will be asked to choose a player 'O' or 'X'.  At the moment the computer always goes first, and you will be asked to specify the location you want to place your marker in letter, number order, e.g. A1, B2 etc.

At the moment the computer has a very limited repetitive strategy, but does have the ability to check if there is a winner and if there is a draw.

At the moment incorrect input and marker collisions are not handled.

The game was designed using an outside-in strategy driving from feature tests that checked that certain hard coded games could be played on the terminal.  As the feature (or acceptance) tests were working, development dropped to the integration and unit level.  The process was not watertight, and there are parts of the system that are not currently covered by unit tests.

All the tests use a little under the hood knowledge about the code to reach in and manipulate computer strategy or game state in order to test aspects of the system.  This is not ideal from a BDD perspective since the tests have some knowledge of the internal state, however it allowed quick development given the time constraints.

Moving foward I'd like to implement strategies for the computer that were based on some randomness, and then the tests could set the random seed in order to be appropriately deterministic.  Then the tests could be adjusted to be more behavioural.

That current code is in a single class that is under 100 lines, and while it could be broken out into sub-classes such as board, strategy and so on, I'm thinking that's slightly premature in this instance.  For this development I focused on setting up an outside-in approach where we could see complete end-to-end acceptance tests.  To my mind the next steps would be to add more acceptance tests to check that collisions and different player markers are handled correctly.  That would likely push the code over the 100 line limit and then the most appropriate way to refactor the code into separate classes would become clear.

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
  - [x] detect winning state
  - [x] play until game is over
  - [x] refactor to reduce public interface of main class
  - [x] add an executable to run the game 
* [ ] properly support choosing a different user  
* [ ] error handling
  - [ ] handle illegal moves
  - [ ] handle incorrect input
* [ ] refactor game 
  - [x] could drive from acceptance test for longer game?
  - [ ] extract other domain entities
  - [ ] extract an engine that doesn't rely on STDIN/STDOUT
