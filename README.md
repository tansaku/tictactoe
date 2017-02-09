TicTacToe
=========

To install (assuming Ruby and bundler installed)

```sh
$ git clone http://github.com/tansaku/TicTacToe
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
    - [ ] extract other domain entities
  - [x] detect winning state
  - [x] play until game is over
  - [ ] handle illegal moves
  - [x] refactor to reduce public interface of main class
  - [x] add an executable to run the game 