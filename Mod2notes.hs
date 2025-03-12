{-# OPTIONS_GHC -Wall #-} -- show all warnings
-- {-# is a pragma, it is used to give special instructions to the compiler
module Mod2notes where
import Prelude hiding (length)


length :: [a]-> Int
    -- length = _
    -- _ is a wildcard character, it is used to define functions that are not yet implemented. It's called a type hole. 

    {-
    Steps for defining a function
        1. Define the type of the function and the bindings
        2. Define the base case
        3. Define the recursive case
    -}

length []       = 0
length (_ : xs) = 1 + length xs
   {-
   here is a very detailed explanation of the above function
     the recursive call can compute the length of the longer list because it is a tail recursive function, i.e the recursive call is the last thing that happens in the function, 
        for example, 
            length [1,2,3] = 1 + length [2,3] = 1 + 1 + length [3] = 1 + 1 + 1 + length [] = 1 + 1 + 1 + 0 = 3
    we don't need to use brackets because function binding is stronger than any infix operator

    _ in length(_ : xs) is a wildcard character, it is used to ignore the value of the head of the list and ignoring the the head of the list works as it is not used in the function.
   -}




