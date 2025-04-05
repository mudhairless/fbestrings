#include once "strings/split.bi"

redim result() as string
strings.split("test;test;test;test", result(), ";")

var count = 0
for n as integer = lbound(result) to ubound(result)

count += 1

next n

if (count <> 4) then
    ? "split TEST FAILED"
else
    ? "split TEST PASSED"
end if