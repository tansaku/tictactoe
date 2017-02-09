# Tic-tac-toe

Your task is to write a program to play
[tic-tac-toe](http://en.wikipedia.org/wiki/Tic-tac-toe) in the terminal. When the program is invoked, it must let the user pick whether to play as `X` or `O`, and then run through the game letting the user play against the computer. When it is the user's turn, you must display the current state of the board and give the user a choice of which square to play next. The game must stop when one player wins or when the board is full.

A typical session might look like this:

```
$ ./bin/ttt

Which player do you want to be? X or O?
O

          A   B   C

        +---+---+---+
    1   | X |   |   |
        +---+---+---+
    2   |   |   |   |
        +---+---+---+
    3   |   |   |   |
        +---+---+---+

Where do you want to move?
B2

          A   B   C

        +---+---+---+
    1   | X |   |   |
        +---+---+---+
    2   |   | O |   |
        +---+---+---+
    3   |   | X |   |
        +---+---+---+

Where do you want to move?
A3

          A   B   C

        +---+---+---+
    1   | X | X |   |
        +---+---+---+
    2   |   | O |   |
        +---+---+---+
    3   | O | X |   |
        +---+---+---+

Where do you want to move?
C1

          A   B   C

        +---+---+---+
    1   | X | X | O |
        +---+---+---+
    2   |   | O |   |
        +---+---+---+
    3   | O | X |   |
        +---+---+---+

O has won!
```

You are free to write the program however you like, and use any language,
libraries and tools you think might be useful.

You should aim to write code that you would be happy to put into production and have other people maintain; we would rather see you write maintainable code than a messy but complete program.