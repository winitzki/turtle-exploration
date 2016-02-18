{-# LANGUAGE OverloadedStrings, QuasiQuotes, ExtendedDefaultRules #-}
{-# OPTIONS_GHC -Wall -fwarn-incomplete-patterns -fwarn-incomplete-uni-patterns #-}
{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}

-- compile with: ghc -no-user-package-db -package-db=`ls -d .cabal-sandbox/*-packages.conf.d` turtle_02_file_manipulation.hs

import Prelude hiding (length,FilePath)
import Turtle                               -- cabal install turtle
import Text.Shakespeare.Text                -- cabal install shakespeare
import Data.Text as T                       -- need for `length`
import Data.Text.IO as TIO

-- print a string to a new file

computed_string = [st|#{1+2+3}|]

output_file = FilePath "/tmp/1.txt"

main = do
  writeFile output_file computed_string
