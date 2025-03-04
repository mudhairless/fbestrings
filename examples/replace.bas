''File: replace.bas
''Description: Demonstration of strings.replace and replace_copy functions.
''
''Copyright (c) 2025 Ebben Feagan
''Copyright (c) 2007-2024 FreeBASIC Extended Library Development Group
''
''Distributed under the FreeBASIC Extended Library Group license. (See
''accompanying file LICENSE.txt or copy at
''https://github.com/FreeBASIC-Extended-Library/fb-ext-lib/blob/master/COPYING)

# include "strings.bi"

using strings

dim examplesstrings(3) as string = _
{ _
	"John likes to fly kites.", _
	"'Flying kites is fun,' said John.", _
	"December 25th is John's birthday.", _
	"On his birthday, John received a brand new kite." _
}

dim oldtexts(1) as const string = { "John", "kite" }
dim newtexts(1) as const string = { "Luke", "airplane" }

strings.replace(examplesstrings(), oldtexts(), newtexts())

' Luke likes to fly airplanes.
' 'Flying airplanes is fun,' said Luke.
' December 25th is Luke's birthday.
' On his birthday, Luke received a brand new airplane.
'
for i as integer = lbound(examplesstrings) to ubound(examplesstrings)
	print examplesstrings(i)
next

' Thequickbrownfox
'
print ReplaceCopy("The quick brown fox", " ", "")
