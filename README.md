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

```
./bin/ttt
```

You will be asked to choose a player 'O' or 'X'.  At the moment the computer always goes first, and you will be asked to specify the location you want to place your marker in letter, number order, e.g. A1, B2 etc.

At the moment the computer has a very limited randomized strategy, but does have the ability to check if there is a winner and if there is a draw.

At the moment incorrect input and marker collisions are not handled.

The game was designed using an outside-in strategy driving from feature tests that checked that certain hard coded games could be played on the terminal.  As the feature (or acceptance) tests were working, development dropped to the integration and unit level.  The process was not watertight, and there are parts of the system that are not currently covered by unit tests.

Some of the tests use a little under the hood knowledge about the code to reach in and manipulate computer strategy or game state in order to test aspects of the system.  This is not ideal from a BDD perspective since the tests have some knowledge of the internal state, however it allowed quick development given the time constraints.

Moving foward I'd like to improve the test coverage and refactor the underlying engine design.

That current code uses two classes related by composition using delegation.  The two classes are more coupled than I would like, and the encapsulation of the board class is not as good as I would like.  For this development I focused on setting up an outside-in approach where we could see complete end-to-end acceptance tests.  What's nice about this current set up is that new acceptance test fixture can be generated relatively easily from playing the game itself, so that if once encounters an error in the gameplay it can be quickly wrapped in an acceptance test and the code evolved further to address the issue.

Handling incorrect user input was left out in the interests of time - please see the detailed TODO list of features below.

###TODO

* [x] play a different game than the example
* [x] might be nice to have full game in one file
* [x] drop to integration test level to check we can display user move
* [ ] could keep hard coding but obtuse - let's make it work
  - [x] find a way to display the board to represent the game state - use template
  - [x] receive the users move and add that to the game state
  - [ ] be able to make a computer move effectively
    - [x] hard coded strategy
    - [x] randomized strategy
    - [ ] testing of randomized strategy using seeds
    - [ ] more effective strategy
  - [x] detect winning state
  - [x] play until game is over
  - [x] refactor to reduce public interface of main class
  - [x] add an executable to run the game 
* [x] properly support choosing a different user  
* [ ] error handling
  - [x] avoid illegal moves by computer
  - [ ] handle illegal moves by player
  - [ ] handle incorrect input
* [ ] refactor game 
  - [x] could drive from acceptance test for longer game?
  - [ ] extract other domain entities
    - [x] extracted board class
    - [ ] encapsulate board better
    - [ ] extract other entities
  - [ ] extract an engine that doesn't rely on STDIN/STDOUT
* [ ] DRYing out and improving test suite


###Early Notes

I started working on this problem by reading back and forth over the [spec](specifications.md) and thinking I would test drive using Rspec

I thought there's probably a nice ruby gem for generating terminal tables. searched google for "print table on terminal ruby gem"

I found these two:

* https://github.com/tj/terminal-table
* https://github.com/aptinio/text-table

The former had order of magnitude more stars so thought I'd probably use that.

Given the spec showed a particular game, I thought the simplest way to start would be to write acceptance test in RSpec that drive precisely that, writing the minimum amount of code to get the result, and worrying about detecting game states etc. later

Then I set up a local git repo and had a look at https://github.com/cucumber/aruba after vanilla rspec seemed not so good for testing off a sequence of interactions, but eventually settled on the style seen in the acceptance tests in the repo  
