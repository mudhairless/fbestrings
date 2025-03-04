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

namespace strings

	'' :::::
	function ReplaceCopy (byref subject as const string, byref oldtext as const string, byref newtext as const string) as string

		dim as string result = subject
		strings.Replace(result, oldtext, newtext)
		return result

	end function

	'' :::::
	function ReplaceCopy (byref subject as const string, oldtext() as const string, byref newtext as const string) as string

		dim as string result = subject
		strings.Replace(result, oldtext(), newtext)
		return result

	end function

	'' :::::
	function ReplaceCopy (byref subject as const string, oldtext() as const string, newtext() as const string) as string

		dim as string result = subject
		strings.Replace(result, oldtext(), newtext())
		return result

	end function

	'' :::::
	sub ReplaceCopy (subject() as const string, byref oldtext as const string, byref newtext as const string, result() as string)

		redim result(lbound(subject) to ubound(subject)) as string

		for i as integer = lbound(subject) to ubound(subject)
			result(i) = ReplaceCopy(subject(i), oldtext, newtext)
		next

	end sub

	'' :::::
	sub ReplaceCopy (subject() as const string, oldtext() as const string, byref newtext as const string, result() as string)

		redim result(lbound(subject) to ubound(subject)) as string

		for i as integer = lbound(subject) to ubound(subject)
			result(i) = ReplaceCopy(subject(i), oldtext(), newtext)
		next

	end sub

	'' :::::
	sub ReplaceCopy (subject() as const string, oldtext() as const string, newtext() as const string, result() as string)

		redim result(lbound(subject) to ubound(subject)) as string

		for i as integer = lbound(subject) to ubound(subject)
			result(i) = ReplaceCopy(subject(i), oldtext(), newtext())
		next

	end sub

end namespace
