module Lab1(processFile) where
import Data.Char
import Data.List
import Data.Function
import Control.Arrow

splitFile :: String -> [String]
splitFile contents = map stripTailPunct $ words $ map toLower contents

stripTailPunct :: String -> String
stripTailPunct word = stp $ reverse word
    where stp (w:ws) = if isPunctuation w then stp ws else reverse (w:ws)

groupTokens :: [String] -> [(String, Int)]
groupTokens = map (head Control.Arrow.&&& length) . group . sort

processInput :: String -> [(String, Int)]
processInput = reverse . sortBy (compare `on` snd) . groupTokens . splitFile

maxLengthToken :: [(String, Int)] -> Int
maxLengthToken = foldl maxLen 0

maxLen :: Int -> (String, Int) -> Int
maxLen a (b, _) = max a $ length b

maxOccurences :: [(String, Int)] -> Int
maxOccurences = foldl maxOcc 0

maxOcc :: Int -> (String, Int) -> Int
maxOcc a (_, b) = max a b

calculateNumHashes :: Int -> Int -> [(String, Int)] -> [(String, Int)]
calculateNumHashes maxL maxO' input =
    let maxHashes = fromIntegral $ 80 - 1 - maxL
        maxO = fromIntegral maxO'
    in map (\(s, occ) -> (s, truncate $
             fromIntegral occ / maxO * maxHashes)) input

processFile :: String -> [String]
processFile sourceText = 
    let processed = processInput sourceText
        maxTokLen = maxLengthToken processed
        intermediate = filter (\(_, b) -> b > 0) $
          calculateNumHashes (maxLengthToken processed) 
            (maxOccurences processed) processed
    in map (\(tok, numHash) -> 
               take (maxTokLen + 1) (tok ++ repeat ' ')
                 ++ replicate numHash '#' ++ "\n")
           intermediate
