Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text.RegularExpressions
Imports System.String

Namespace Rextester
    Public Module Program
        Public Sub Main(args() As string)
            'Your code goes here
            Dim flag As Boolean
            Dim value As String = "saippuakivikauppias"
            For values As Integer = 0 To 1000000000
                IsPalindrome(value)
            Next
        End Sub
    
    
    Public Function IsPalindrome(s As String) As Boolean
	Dim i As Integer = 0
	Dim j As Integer = s.Length - 1
	While i < j
		If s(i) <> s(j) Then
			Return False
		End If
		i += 1
		j -= 1
	End While
	Return True
End Function
    
End Module
End Namespace
