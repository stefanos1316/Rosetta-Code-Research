'Code was retrieve from https://www.codeproject.com/Articles/49417/Sorting-Algorithms-in-VB-NET-How-To-Implement-Merg
'and we applied changes for adapted it to our needs

'Rextester.Program.Main is the entry point for your code. Don't change it.
'Compiler version 11.0.50709.17929 for Microsoft (R) .NET Framework 4.5


Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text.RegularExpressions

Namespace Rextester
    Public Module Program
        Public Sub Main(args() As string)
            'Your code goes here
            For value As Integer = 0 To 1000000
            Dim arr() As Integer = New Integer() {16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85}
            MergeSort(arr)
            Next
        End Sub
        
        Public Sub MergeSort(ByVal ar() As Integer)
             DoMergeSort(ar, 0, ar.Length - 1)
        End Sub
        
        Public Sub DoMergeSort(ByVal ar() As Integer, ByVal low As Integer, ByVal high As Integer)

            If low >= high Then Return 
                Dim length As Integer = high - low + 1
                Dim middle As Integer = Math.Floor((low + high) / 2)
                DoMergeSort(ar, low, middle)
                DoMergeSort(ar, middle + 1, high)
                Dim temp(ar.Length - 1) As Integer
                For i As Integer = 0 To length - 1
                    temp(i) = ar(low + i)
                Next
            Dim m1 As Integer = 0
            Dim m2 As Integer = middle - low + 1
            For i As Integer = 0 To length - 1
                If m2 <= high - low Then
                If m1 <= middle - low Then
                If temp(m1) > temp(m2) Then
                        ar(i + low) = temp(m2)
                        m2 += 1
                Else
                        ar(i + low) = temp(m1)
                        m1 += 1
                    End If
                Else
                    ar(i + low) = temp(m2)
                    m2 += 1
                End If
            Else
                ar(i + low) = temp(m1)
                m1 += 1
            End If
        Next

End Sub
        
    End Module
End Namespace
