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

sub test_string_replacecopy
	
	var res = ""
	
	res = strings.replacecopy("a", "a", "x")
	assert_STRING_EQUAL("x", res)
	
	res = strings.replacecopy("ab", "ab", "x")
	assert_STRING_EQUAL("x", res)

	res = strings.replacecopy("abab", "ab", "x")
	assert_STRING_EQUAL("xx", res)
	
	res = strings.replacecopy("abab", "abab", "x")
	assert_STRING_EQUAL("x", res)
	
	res = strings.replacecopy("ababab", "abab", "x")
	assert_STRING_EQUAL("xab", res)

end sub
	
test_string_replacecopy()
