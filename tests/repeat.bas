# include once "strings.bi"

#macro assert_string_equal(lhs, rhs)
if (stringcompare((lhs), (rhs)) = true) then
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

sub test_string_repeat

	var res = ""
	
	res = strings.repeat("abc", 0)
	assert_STRING_EQUAL("", res)

	res = strings.repeat("", 0)
	assert_STRING_EQUAL("", res)
	
	res = strings.repeat("", 3)
	assert_STRING_EQUAL("", res)
	
	res = strings.repeat("abc", 3)
	assert_STRING_EQUAL("abcabcabc", res)

end sub

sub test_char_repeat

	var res = ""
	
	res = strings.repeat(asc("a"), 0)
	assert_STRING_EQUAL("", res)

	res = strings.repeat(asc("a"), 3)
	assert_STRING_EQUAL("aaa", res)

end sub


test_string_repeat()
test_char_repeat()


