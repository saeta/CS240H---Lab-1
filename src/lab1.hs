import System
import Lab1

main :: IO ()
main = do
  f <- getArgs
  let files = map readFile f
  contents <- sequence files
  stdinContents <- getContents
  let unlined = if not $ null f
                then foldl (++) "" contents
                else stdinContents
  let processed = processFile unlined
  putStr $ foldl (++) "" processed
