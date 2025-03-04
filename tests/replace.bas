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

type TestInput
	subject as const zstring ptr
	oldtext as const zstring ptr
	newtext as const zstring ptr
	result as const zstring ptr
end type

sub testEqualNewText

	dim test_input(1 to 4) as TestInput = _
	{ _
		( @"a", 		@"a", 		@"x", 	@"x" )			, _
		( @"aa", 		@"a", 		@"x", 	@"xx" )		, _
		( @"aa..a.",	@"a", 		@"x", 	@"xx..x." )		, _
		( @".a..aa",	@"a", 		@"x", 	@".x..xx" )		_
	}
	
	var subject = ""
	
	for i as integer = lbound(test_input) to ubound(test_input)
		subject = *test_input(i).subject
		strings.Replace(subject, _
			*test_input(i).oldtext, _
			*test_input(i).newtext _
		)
		assert_STRING_EQUAL(*test_input(i).result, subject)
	next

end sub

sub testSmallerNewText

	dim test_input(1 to 4) as TestInput = _
	{ _
		( @"[a]", 			@"[a]", 	@"x", 	@"x" )			, _
		( @"[a][a]", 		@"[a]", 	@"x", 	@"xx" )			, _
		( @"[a][a]..[a].",	@"[a]", 	@"x", 	@"xx..x." )		, _
		( @".[a]..[a][a]",	@"[a]", 	@"x", 	@".x..xx" )		_
	}
	
	var subject = ""
	
	for i as integer = lbound(test_input) to ubound(test_input)
		subject = *test_input(i).subject
		strings.Replace(subject, _
			*test_input(i).oldtext, _
			*test_input(i).newtext _
		)
		assert_STRING_EQUAL(*test_input(i).result, subject)
	next

end sub

sub testLargerNewText

	dim test_input(1 to 4) as TestInput = _
	{ _
		( @"a", 		@"a", 	@"[x]", 	@"[x]" )			, _
		( @"aa", 		@"a", 	@"[x]", 	@"[x][x]" )			, _
		( @"aa..a.",	@"a", 	@"[x]", 	@"[x][x]..[x]." )	, _
		( @".a..aa",	@"a", 	@"[x]", 	@".[x]..[x][x]" )	_
	}
	
	var subject = ""
	
	for i as integer = lbound(test_input) to ubound(test_input)
		subject = *test_input(i).subject
		strings.Replace(subject, _
			*test_input(i).oldtext, _
			*test_input(i).newtext _
		)
		assert_STRING_EQUAL(*test_input(i).result, subject)
	next

end sub
	
	
testEqualNewText()
testSmallerNewText()
testLargerNewText()
	
