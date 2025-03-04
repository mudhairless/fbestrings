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

 sub test_insertinto

    assert_string_equal("Ext insert rocks!" , strings.InsertInto(" insert", "Ext rocks!", 3))
    assert_string_equal("You can even prepend strings!" , strings.InsertInto("You can", " even prepend strings!", 0))
    assert_string_equal("Or even append them!" , strings.InsertInto(" append them!", "Or even", 6))
    assert_string_equal("You can even use negative indexing!" , strings.InsertInto(" negative", "You can even use indexing!", -10))
    assert_string_equal("Negative index can't go below zero when added to the string length" , strings.InsertInto("Negative ", "index can't go below zero when added to the string length", -160))

end sub

test_insertinto()
    

