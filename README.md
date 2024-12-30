# Haskell Lazy Evaluation Bug

This repository demonstrates a subtle bug in Haskell code that arises from the interaction between lazy evaluation and input/output (IO) operations.

## Bug Description

The program `bug.hs` reads lines from a file, filters them based on a prefix, and prints the result.  If the input file is large or contains an infinitely long stream of data, the program will hang because of lazy evaluation's behavior with `IO` actions. The `lines` function doesn't fully evaluate until it's forced to, causing a deadlock.

## Solution

The solution (`bugSolution.hs`) addresses this issue by using a more controlled approach to processing the input file line by line to avoid forcing the full evaluation of an infinite or extremely large list before starting output.