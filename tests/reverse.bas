# include once "strings.bi"

#macro assert_string_equal(lhs, rhs)
if (stringcompare((lhs), (rhs)) = true) then
        print __FUNCTION__ & " " & #lhs & " = " & #rhs & " is working"
    else 
        print __FUNCTION__ & " " & #lhs & " = " & #rhs & " is NOT working"
    end if
#endmacro

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

function reverse_and_check overload (byref s as string, byref target as string) as boolean
	
	strings.reverse(s)
	return stringcompare(s, target)

end function
	
sub test_reverse_string

	assert_TRUE( reverse_and_check("", "")         )
	assert_TRUE( reverse_and_check("a", "a")       )
	assert_TRUE( reverse_and_check("ab", "ba")     )
	assert_TRUE( reverse_and_check("abc", "cba")   )
	assert_TRUE( reverse_and_check("abcd", "dcba") )

end sub

function reverse_and_check (s() as string, target() as string) as boolean

	strings.reverse(s())
	for i as integer = lbound(s) to ubound(s)
		if s(i) <> target(i) then return false
	next
	return true

end function

sub test_reverse_array

	dim s0(0) as string = { "" }
	dim t0(0) as string = { "" }
	assert_TRUE( reverse_and_check(s0(), t0()) )

	dim s1(0) as string = { "abc" }
	dim t1(0) as string = { "cba" }
	assert_TRUE( reverse_and_check(s1(), t1()) )
	
	dim s2(1) as string = { "abc", "abc" }
	dim t2(1) as string = { "cba", "cba" }
	assert_TRUE( reverse_and_check(s2(), t2()) )

end sub
	
	
test_reverse_string()
test_reverse_array()
	
