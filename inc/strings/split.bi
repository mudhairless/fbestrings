''Title: strings/split.bi
''
''About: License
''Copyright (c) 2025 Ebben Feagan
''Copyright (c) 2007-2024, FreeBASIC Extended Library Development Group
''
''Distributed under the Modified BSD license. See LICENSE

# ifndef FB_STRINGS_SPLIT_BI__
# define FB_STRINGS_SPLIT_BI__ -1

# include once "strings/detail/common.bi"

'' Namespace: strings
namespace strings

    '' Function: Join
    '' Joins together a string array.
    ''
    '' Parameters:
    '' subject() - array of strings to join together.
    '' (-*glue*) - optional "glue" to use between strings, defaults to a single space
    ''
    '' Returns:
    '' The assembled string.
    ''
    declare function Join (subject() as const string, byref glue as const string = " ") as string

    '' Function: Split
    '' Splits a string into an array.
    ''
    '' Parameters:
    '' subject - the string to split up.
    '' result() - string array that results will be passed into.
    '' delimiter - The delimiter to use when splitting the array.
    '' limit - the maximum number of substrings to split to. -1 = unlimited (default)
    ''
    '' Returns:
    '' Integer number of delimited strings found.
    ''
    declare function Split overload (byref subject as const string, result() as string, byref delimiter as const string, byval limit as integer = -1) as integer
end namespace

# endif ' include guard
