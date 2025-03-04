''File: join.bas
''Description: Demonstration of strings.join function.
''
''Copyright (c) 2025 Ebben Feagan
''Copyright (c) 2007-2024 FreeBASIC Extended Library Development Group
''
''Distributed under the FreeBASIC Extended Library Group license. (See
''accompanying file LICENSE.txt or copy at
''https://github.com/FreeBASIC-Extended-Library/fb-ext-lib/blob/master/COPYING)

# include "strings.bi"

using strings

dim examplesstrings(3) as string = { "a", "b", "c", "d" }

' a b c d
'
print join(examplesstrings())

' abcd
'
print join(examplesstrings(), "")

' a
' b
' c
' d
'
print join(examplesstrings(), !"\r\n")
