import System

main :: IO ()
main = do
  f <- getArgs
  print f
  putStrLn "Hello world!"