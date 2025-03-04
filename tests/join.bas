# include once "strings.bi"

#macro assert_true(x)
    if ((x) = true) then
        print __FUNCTION__ & " " & #x & " is working"
    else 
        print __FUNCTION__ & " " & #x & " is NOT working"
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

function test_result (byref a as string, byref b as string, byref c as string, byref glue as string, byref result as string) as boolean
	
	static array(2) as string
	
	array(0) = a
	array(1) = b
	array(2) = c
	
	return stringcompare(result, strings.join(array(), glue))

end function
	
sub test_join

	'                         a    	b		c		glue	res
	assert_TRUE(test_result( "",	"",		"",		"",		"" ))
	assert_TRUE(test_result( "a",	"",		"",		"",		"a" ))
	assert_TRUE(test_result( "",	"b",	"",		"",		"b" ))
	assert_TRUE(test_result( "",	"",		"c",	"",		"c" ))
	assert_TRUE(test_result( "",	"",		"",		" ",	"  " ))
	assert_TRUE(test_result( "a",	"b",	"c",	" ",	"a b c" ))

end sub
	
	
test_join()
	


