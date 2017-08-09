Imports System
Imports System.Collections.Generic
Imports System.Text.RegularExpressions
Imports System.IO

Namespace Rextester
    Public Module Program
        Public Sub Main(args() As string)

	For value As Integer = 0 To 1000000

	Dim objStreamReader As StreamReader
	Dim strLine As String = Nothing
	Dim text As String = Nothing	     

	    'Pass the file path and the file name to the StreamReader constructor.
	    objStreamReader = New StreamReader("../input.txt")

	    'Read the first line of text.
	    strLine = objStreamReader.ReadLine

	    'Continue to read until you reach the end of the file.
	    Do While Not strLine Is Nothing

	      'Write the line to the Console window.
	      'Console.WriteLine(strLine)

	      'Read the next line.
	      strLine = objStreamReader.ReadLine
		text = text & strLine
	    Loop

	    'Close the file.
	    objStreamReader.Close()

	Dim objStreamWriter As StreamWriter
	    
	   'Pass the file path and the file name to the StreamWriter constructor.
	   objStreamWriter = New StreamWriter("output.txt")

	   'Write a line of text.
	   objStreamWriter.WriteLine(text)

	   'Write a second line of text.
	   'objStreamWriter.WriteLine("From the StreamWriter class")

	   'Close the file.
	   objStreamWriter.Close()
	Next
End Sub
    End Module
End Namespace
