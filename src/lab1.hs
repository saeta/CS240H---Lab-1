import System
import Lab1

main :: IO ()
main = do
  f <- getArgs
  let files = map readFile f
  contents <- sequence files
  let unlined = foldl (++) "" contents
  let processed = processFile unlined
  putStr $ foldl (++) "" processed
