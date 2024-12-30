The solution uses `hGetLine` to process the input file line by line, avoiding the lazy evaluation problem:

```haskell
import System.IO

main :: IO ()
main = do
  handle <- openFile "input.txt" ReadMode
  loop handle
  hClose handle

loop :: Handle -> IO ()
loop h = do
  eof <- hIsEOF h
  if eof
    then return ()
    else do
      line <- hGetLine h
      if "apple" `isPrefixOf` line
        then putStrLn line >> loop h
        else loop h
```

This iterative approach ensures that only one line is processed at a time, thus preventing the program from hanging on large or infinite input streams.