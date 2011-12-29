module Lab1(processFile) where
import Char
import Data.Char
import List
import Data.Function

splitFile :: String -> [String]
splitFile contents = map stripTailPunct $ words $ map toLower contents

stripTailPunct :: String -> String
stripTailPunct word = stp $ reverse word
    where stp (w:ws) = if isPunctuation w then stp ws else reverse (w:ws)

groupTokens :: [String] -> [(String, Int)]
groupTokens = map (\xs -> (head xs, length xs)) . group . sort

processInput :: String -> [(String, Int)]
processInput = reverse . sortBy (compare `on` snd) . groupTokens . splitFile

maxLengthToken :: [(String, Int)] -> Int
maxLengthToken l = foldl maxLen 0 l

maxLen :: Int -> (String, Int) -> Int
maxLen a (b, _) = max a $ length b

maxOccurences :: [(String, Int)] -> Int
maxOccurences l = foldl maxOcc 0 l

maxOcc :: Int -> (String, Int) -> Int
maxOcc a (_, b) = max a b

calculateNumHashes :: Int -> Int -> [(String, Int)] -> [(String, Int)]
calculateNumHashes maxLen maxOcc' input = 
    let maxHashes = fromIntegral $ 80 - 1 - maxLen
        maxOcc = fromIntegral maxOcc'
    in map (\(s, occ) -> (s, truncate $
             (fromIntegral occ) / maxOcc * maxHashes)) input

processFile :: String -> [String]
processFile sourceText = 
    let processed = processInput sourceText
        maxTokLen = maxLengthToken processed
        intermediate = filter (\(_, b) -> b > 0) $
          calculateNumHashes (maxLengthToken processed) 
            (maxOccurences processed) processed
    in map (\(tok, numHash) -> 
               take (maxTokLen + 1) (tok ++ (repeat ' '))
                 ++ (take numHash $ repeat '#') ++ "\n")
           intermediate
