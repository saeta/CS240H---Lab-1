# CS 240H - Lab 1 #
 - Author: saeta@cs.stanford.edu
 - Start:  December 2011

# Background #
I want to learn Haskell. So, I'm doing the assignments 1 and 2 of CS240H, and
hopefully learning functional programming in Haskell along the way.
[Website][cs240h]

# Notes #
## Building ##
    cabal configure
    cabal build

## Linting ##
    hlint src

# Conclusion #
I did this assignment in one night. The git commit logs are an accurate
representation of how long I took to do this. I spent a lot of time looking
up the way to try and do things right. I also got stuck when I couldn't
figure out how to lift things into the `IO Monad`. I now know about
`sequence` and `liftM` (at least a bit). While implementing, I took a few
breaks, but not too many.

[cs240h]: http://www.scs.stanford.edu/11au-cs240h/ "CS240H Website Fall 11"
