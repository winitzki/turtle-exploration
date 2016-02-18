{-# LANGUAGE OverloadedStrings, QuasiQuotes, ExtendedDefaultRules #-}

-- compile with: ghc -no-user-package-db -package-db=`ls -d .cabal-sandbox/*-packages.conf.d` turtle_01_text_interpolation.hs

import Turtle                               -- cabal install turtle
import Text.Shakespeare.Text                -- cabal install shakespeare
import Data.Text as T                       -- need for `length`
import Prelude hiding (length)              -- won't have to say T.length

user_name = "user"

greeting = [st|hello, #{user_name}!
Length of your name is #{length user_name} characters.|]

-- command1 :: MonadIO io => io ()         -- ghc can infer this type if command1 is used immediately in main
command1 = echo [st|	Greeting =
		#{greeting}
|]
command2 = echo [st|Length of greeting = #{length greeting} characters.
|]

main = do
  echo "starting"
  command1
  command2
