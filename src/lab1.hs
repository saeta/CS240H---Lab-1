import System
import System.IO
import Lab1

main :: IO ()
main = do
  f <- getArgs
  print f
  let files = map readFile f
  let contents = 
  putStrLn "Hello world!"