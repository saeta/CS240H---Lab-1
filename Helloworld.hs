import System
import System.IO

{-openFiles files = map (\f -> openFile f ReadMode) files

--myLines openfiles = map (\f -> do { mf <- f; return readFile mf }) openFiles

main = do
  f <- getArgs
  let readFiles :: [IO Handle] = openFiles f
--  let allFiles = myLines readFiles
--  
--  putStrLn $ show allFiles
  putStrLn "Hello world!" -}


stuff :: IO [String] -> IO ()
stuff a = do
  foo <- a
  if foo == []
  then putStrLn "Empty"
  else putStrLn "Non-empty list!"

main = do
  stuff getArgs