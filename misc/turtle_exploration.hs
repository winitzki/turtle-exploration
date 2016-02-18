#!/usr/bin/env runhaskell
{-# LANGUAGE OverloadedStrings, QuasiQuotes, ExtendedDefaultRules #-}
import Turtle -- cabal install turtle
-- import Text.InterpolatedString.Perl6 (q) -- requires text 1.1.*, which conflicts with text 1.2.* required by shakespeare
import Text.Shakespeare.Text -- cabal install shakespeare
-- import Data.Text.Lazy

{- Turtle is a partial replacement of bash functionality. Here are typical tasks that we would like to see implemented:

1. Define a variable with a string value; the string should contain quotation symbols, newlines, tabs, etc.

2. Print a string to STDOUT; the string should contain variable interpolations

3. Print a string to a file; either appending or overwriting existing files

4. Run a shell command, capture its STDOUT into a stream or into a string or into a file

5. Also capture STDERR of a shell command, in the same way

6. Perform regular expression search and replacement with match groups

7. Perform operations with streams, such as grep, sed, cut, sort, uniq

8. Perform conditional execution of shell commands according to values computed at run time

9. Parse command-line arguments given to the script

10. Read values of environment variables: PATH, HOME, TMPDIR, USER

11. Read a file into stream or string value

12. Test that a given file or directory exist

13. Enumerate files in a directory

14. Run a shell command concurrently, capturing its output; wait for completion; kill running command

15. Use several pipe streams concurrently (without using named pipes)?

Use Haskell types and data structures:
16.   - typed stream values with parsing
17.   - use a hash map for counting word occurrences

18. Write a Haskell script that uses several Haskell modules (many .hs files) without compiling them first

19. Parse and format JSON values

20. Download a set of files, checking that the download was successful and retrying up to 10 times on failure

21. Read a given file line by line, look for a line matching a regex, read further lines until another regex matches, print report on the lines between those

22. Read a given file line by line, fetch a URL if a line contains one, matching a regex

23. From all files in a given directory whose names match a given regex, extract part of the regex and move them to a new subdirectory named according to the part of the regex

24. Read a file line by line, print sum of the numbers appearing on each line

 -}

-- Begin exploration

-- 1. String values

-- define a named value of type Text

userName = "John Smith"

-- define a named value containing quote characters, TAB characters, and newlines

--preformattedString :: Text
preformattedString = [st|	TAB	separated	words
	"newline"   
	'TAB'   |]

-- concatenate text strings

string1 = "User:\t" <> userName <> "\n"

-- 2. Print to STDOUT

-- a1 :: MonadIO io => io ()
--a1 = echo "Hello world!"

a2 = echo preformattedString

-- main = a2

-- string interpolation

a3 = echo [st|Hello, #{userName}!|]

-- the "sh $ do" boilerplate is something I haven't yet fully understood
{-

main = sh $ do
  gadgetData <- select [bundle1, bundle2]
  proc "curl" ["-X", "POST", "-s", "-H", "sid:" <> sessionId, "-d", gadgetData, addBundleItemUrl] empty

-}