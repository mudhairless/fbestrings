#include once "strings.bi"

#macro assert_string_equal(lhs, rhs)
if (stringcompare((lhs), (rhs)) = true) then
        print __FUNCTION__ & " " & #lhs & " = " & #rhs & " is working"
    else 
        print __FUNCTION__ & " " & #lhs & " = " & #rhs & " is NOT working"
    end if
#endmacro

#macro assert_STRING_NOT_EQUAL(lhs, rhs)
if (stringcompare((lhs), (rhs)) = false) then
        print __FUNCTION__ & " " & #lhs & " = " & #rhs & " is working"
    else 
        print __FUNCTION__ & " " & #lhs & " = " & #rhs & " is NOT working"
    end if
#endmacro

function stringcompare( byref rhs as const string, byref lhs as const string ) as boolean

    var len_r = len(rhs) - 1
    var len_l = len(lhs) - 1

    var len_u = len_r
    if len_l < len_r then len_u = len_l

    for n as integer = 0 to len_u
        if rhs[n] <> lhs[n] then return false
    next

    return true

end function

testltstr:

DATA "testing",         !"   \t\ttesting"
DATA "testing ",        "testing "
DATA "testing",         "testing"
DATA "one ring to",     "  one ring to"
DATA "rule them all",   !" \t    rule them all"
DATA "."

testrtstr:

DATA "and in the",      "and in the    "
DATA "darkness",        !"darkness \t"
DATA "bind them",       "bind them"
DATA " testing",        " testing"
DATA "llama",           !"llama \t   "
DATA "."

testtstr:

DATA "i",               "   i "
DATA "love",            !" \tlove      \t\t"
DATA "my wife",         "my wife"
DATA "testing",         " testing "
DATA "test 1 2 3",      " test 1 2 3  "
DATA "b-i-n-g-o",       !"\vb-i-n-g-o\v"
DATA "lemurs",          !"\rlemurs\r\n"
DATA "yo gabba",        !"     \nyo gabba \t"
DATA "."

testcompact:

DATA "i like cheese",   "i     like   cheese"
DATA "badger badger",   !"badger \t badger"
DATA "badger badger",   "badger badger"
DATA "mushroom mushroom","mushroom          mushroom"
DATA !"t\tt",!"t\t\tt"
DATA "."

sub test_ltrimall
    restore testltstr
    dim as string sWanted, sValue
    read sWanted
    while sWanted <> "."
        read sValue
        var t = strings.ltrimall(sValue)
        ASSERT_STRING_EQUAL(t,sWanted)
        read sWanted
    wend
end sub

sub test_rtrimall
    restore testrtstr
    dim as string sWanted, sValue
    read sWanted
    while sWanted <> "."
        read sValue
        var t = strings.rtrimall(sValue)
        ASSERT_STRING_EQUAL(t,sWanted)
        read sWanted
    wend
end sub

sub test_trimall
    restore testtstr
    dim as string sWanted, sValue
    read sWanted
    while sWanted <> "."
        read sValue
        var t = strings.trimall(sValue)
        ASSERT_STRING_EQUAL(t,sWanted)
        read sWanted
    wend
end sub

sub test_compact
    restore testcompact
    dim as string sWanted, sValue
    read sWanted
    while sWanted <> "."
        read sValue
        var t = strings.compact(sValue)
        ASSERT_STRING_EQUAL(t,sWanted)
        read sWanted
    wend
end sub


test_ltrimall()
test_rtrimall()
test_trimall()
test_compact()

