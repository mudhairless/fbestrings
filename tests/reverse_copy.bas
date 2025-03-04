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

sub testStringResult
	
	dim test_strings(4, 1) as string = _
	{ _
		{ "", "" }, _
		{ "a", "a" }, _
		{ "ab", "ba" }, _
		{ "abc", "cba" }, _
		{ "abcd", "dcba" } _
	}
	
	for i as integer = lbound(test_strings) to ubound(test_strings)
		var res = test_strings(i, 0)
		assert_string_EQUAL(test_strings(i, 1), strings.ReverseCopy(res))
	next

end sub

sub testVarLenArrayResult

	dim test_strings(4) as const string = { "", "a", "ab", "abc", "abcd" }
	dim target_strings(4) as string = { "", "a", "ba", "cba", "dcba" }
	dim result() as string
	
	strings.ReverseCopy(test_strings(), result())
	
	for i as integer = lbound(test_strings) to ubound(test_strings)
		assert_string_EQUAL(target_strings(i), result(i))
	next

end sub

sub testVarLenArrayResultWithIndex

	dim test_strings(4) as const string = { "", "a", "ab", "abc", "abcd" }
	dim target_strings(4) as string = { "", "a", "ba", "cba", "dcba" }
	dim result(9) as string
	
	dim index as integer = 5
	strings.ReverseCopy(test_strings(), result(), index)
	
	for i as integer = lbound(test_strings) to ubound(test_strings)
		assert_string_EQUAL(target_strings(i), result(index))
		index += 1
	next

end sub

testStringResult()
testVarLenArrayResult()
testVarLenArrayResultWithIndex()
	
