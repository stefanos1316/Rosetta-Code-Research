'Rextester.Program.Main is the entry point for your code. Don't change it.
'Compiler version 11.0.50709.17929 for Microsoft (R) .NET Framework 4.5

Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text.RegularExpressions

Namespace Rextester
    Public Module Program
        Public Sub Main(args() As string)
	For value As Integer = 0 To 1000000                 
        Dim arr() As Integer = New Integer() {16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85}
        'sort the array using bubble sort
        bubbleSort(arr, arr.Length)
	Next
    End Sub
    
     Sub bubbleSort(ByVal dataset() As Integer, ByVal n As Integer)
        Dim i, j As Integer
        For i = 0 To n Step 1
            For j = n - 1 To i + 1 Step -1
                If (dataset(j) < dataset(j - 1)) Then
                    Dim temp As Integer = dataset(j)

                    dataset(j) = dataset(j - 1)
                    dataset(j - 1) = temp
                End If
            Next
        Next

    End Sub
    
    End Module
End Namespace
