''Copyright (c) 2025 Ebben Feagan
''Copyright (c) 2007-2024, FreeBASIC Extended Library Development Group
''
''All rights reserved.
''
''Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
''
''    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
''    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
''    * Neither the name of the copyright holders nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
''
''THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
''"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
''LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
''A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
''CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
''EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
''PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
''PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
''LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
''NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
''SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# include once "strings.bi"
# include once "detail/strings.bi"

namespace strings

	'' :::::
	function strpos (byref haystack as const string, byref needle as const string, byval offset as integer) as integer
	
		if 0 = len(haystack) then return STR_NOT_FOUND
		if 0 = len(needle) then return STR_NOT_FOUND
		
		FBE_DETAIL_STRINGS_FIXOFFSET(haystack, offset)
		
		if 0 > offset then return STR_NOT_FOUND
		if len(haystack) <= offset then return STR_NOT_FOUND
		
		for h as integer = offset to len(haystack) - 1
			if len(haystack) - h < len(needle) then
				return STR_NOT_FOUND
			end if
			
			if haystack[h] = needle[0] then
				var found_str = true
				
				var h2 = h + 1
				for n as integer = 1 to len(needle) - 1
					if haystack[h2] <> needle[n] then
						found_str = false
						exit for
					end if
					
					h2 += 1
				next
				
				if found_str then return h
			end if
		next
		return STR_NOT_FOUND
		
	end function

end namespace ' strings
