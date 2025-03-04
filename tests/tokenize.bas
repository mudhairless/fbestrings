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

sub test_token

	var test_string = "This is, a	test."
	var delimiters = !" \t,."

	dim as ubyte what = 0
	var n = 1
	var t = strings.tokenize(test_string, delimiters, @what)

	while t <> ""
		select case n
		case 1
			assert_STRING_EQUAL( "This", t )
			assert_TRUE( asc(" ") = what )
		case 2
			assert_STRING_EQUAL( "is", t )
			assert_TRUE( asc(",") = what )
		case 3
			assert_STRING_EQUAL( "a", t )
			assert_TRUE( asc(!"\t") = what )
		case 4
			assert_STRING_EQUAL( "test", t )
			assert_TRUE( asc(".") = what )
		end select

		t = strings.tokenize(, delimiters, @what)
		n += 1
	wend

end sub

private sub test_token_no_eat

	var test_string = "testing. extlib, "
	var delimiters = "., "

	dim as ubyte what = 0
	var n = 1

	var t = strings.tokenize(test_string, delimiters, @what, false)

	while what <> 0

		select case n
		case 1
			assert_STRING_EQUAL( "testing", t )
			assert_TRUE( asc(".") = what )
		case 2
			assert_STRING_EQUAL( "", t )
			assert_TRUE( asc(" ") = what )
		case 3
			assert_STRING_EQUAL( "extlib", t )
			assert_TRUE( asc(",") = what )
		case 4
			assert_STRING_EQUAL( "", t )
			assert_TRUE( asc(" ") = what )
		case else
			? "test-token-no-eat should not have more than 4 iterations"
		end select

		t = strings.tokenize(, delimiters, @what, false)
		n += 1
	wend

end sub

test_token()
test_token_no_eat()
	
