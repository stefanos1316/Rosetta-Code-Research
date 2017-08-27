Imports System.Text.RegularExpressions

Module Module1

    Sub Main()
        ' Match ignoring case of letters.

        Dim input As String = "this is a matching string"
        Dim pattern As String = "string"
        Dim replacement As String = "istyfied"

        Dim match As Match = Regex.Match(input,
                                         "string",
                                         RegexOptions.IgnoreCase)
        For value As Integer = 0 To 10000000

            If match.Success Then
            End If

            Dim rgx As New Regex(pattern)
            Dim result As String = rgx.Replace(input, replacement)
        Next
    End Sub

End Module
