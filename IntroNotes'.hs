import Prelude hiding (elem)
--for information regarding the types we can use the :t command in ghci
-- :t 'a' will return 'a' :: Char
-- :t "hello" will return "hello" :: [Char]
-- below is a sample code
not :: Bool -> Bool
--function name parameter = function body
not True = False
not False = True

displacement :: Num a => a->a->a --type declarations are enforced in haskell, if given
displacement x y = abs(x-y)

-- it is typically a good idea to enclose to negative numbers in brackets
-- so that the compiler does not get confused with the binary subtraction operator

{- 
THE PRELUDE 
The prelude is a module that is imported by default into every Haskell program
It contains the library functions such as the cons (:), max, min,abs,map,filter etc
    -}


--  #DEFINING OWN DATA TYPES
-- data keyword is used to define a new data type
data Choice = Rock | Paper | Scissors --rock paper and scissors are the constructors
-- Choice is the type and Rock, Paper and Scissors are the values of the type
--constructors evaluate to themselves
-- :t Rock will return Rock :: Choice
-- When we define a new data types, there is no show instance for it, so we need to define it
    deriving (Show) -- this will automatically define the show instance for the type
--Or we can define it manually
{-
instance Show Choice where
    show :: Choice -> String
    show Rock = "Rock"
    show Paper = "Paper"
    show Scissors = "Scissors"
--or-}

improve :: Choice -> Choice
improve Rock = Paper
improve Paper = Scissors
improve Scissors = Rock
  --this is called pattern matching
  --pattern matching is a way to define functions by cases

--we can also use pattern matching to define functions that take multiple arguments
--for example, we can define a function that takes two arguments and returns the maximum of the two
max2 :: Ord a => a -> a -> a
max2 x y = if x > y then x else y
--or
max2' :: Ord a => a -> a -> a
max2' x y | x > y = x
          | otherwise = y
    -- data [a] = [] | a : [a] -- | this is the definition of the list data type
    -- deriving (Show)
    -- | [] is the empty list constructor
    -- | : is the cons constructor

--pattern matching can be used to define functions that operate on lists
elem :: Eq a => a -> [a] -> Bool
elem x [] = False
elem x (y:ys) = x==y || elem x ys -- |this is a recursive function
{- here y is the head of the list and ys is the tail of the list

#1 Eq is a type-class that defines the equality operator and the type of elem is hence is from the Eq type-class to "a" to a list of "a" to a boolean.

#2 cons operator is used to add an element to the front of the list and it is right associative, i.e a:b:c:[] is equivalent to a:(b:(c:[])), for example 1:2:3:[] is equivalent to [1,2,3].
-}

{- 
  Functions over lists are naturally recursive. for example, the length function can be defined as follows 
    length :: [a] -> Int
    length [] = 0
    length (x:xs) = 1 + length xs
-}

-- we can use pattern matching to define functions on tuples as well
-- for example, we can define a function that takes a pair of integers and returns their sum
addPair :: (Int, Int) -> Int
addPair (x,y) = x + y
{-
the explanation of the above function is as follows
  #1 the type of addPair is (Int, Int) -> Int
  #2 the function takes a pair of integers as input and returns an integer
  #3 the function is defined using pattern matching
  #4 the pattern (x,y) matches any pair of integers
  #5 the function returns the sum of the two integers
-}


-- #EQUATIONAL REASONING
  {- 
  Equational reasoning is a technique for reasoning about programs by substituting equals for equals, meaning that we can replace equals with equals in a program without changing its meaning
  for example,
    example 1:
      addPair (3,4) = 3 + 4 = 7
      addPair (3,4) = 7

    example 2:
      elem 9 [6,9,42]
      = 9 == 6 || elem 9 [9,42]
      = False || 9 == 9 || elem 9 [42]
      = False || True || elem 9 [42]
      = True

  -}

-- #LAZY EVALUATION
  {-
  Lazy evaluation is a technique used by Haskell to evaluate expressions only when their results are needed
    
    example 1:
      elem 9 [6,9,42]
      = 9 == 6 || elem 9 [9,42]
      = False || 9 == 9 || elem 9 [42]
      = False || True || elem 9 [42]
      = True
    here, the function elem 9 [42] is never evaluated because the result of the expression is already known
    
  -}




