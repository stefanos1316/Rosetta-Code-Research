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
        Dim ArrayOfNumbers As Integer() = {16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85}
        Dim ListOfNumbers As New List(Of Integer)
        ListOfNumbers.AddRange(ArrayOfNumbers)
        QuickSort(ListOfNumbers)          
        Next
        End Sub
        
         Private Function QuickSort(ByVal ListOfNumbers As List(Of Integer)) As List(Of Integer)
        ''If the list is 1 or 0 then it is sorted
        If ListOfNumbers.Count < 1 Then Return ListOfNumbers
        ''List of numbers smaller than the pivot, and larger than it
        Dim SmallList, LargeList As New List(Of Integer)
        ''Pivot = n/2 rounded down
        Dim Pivot As Integer = ListOfNumbers(Math.Floor((ListOfNumbers.Count) / 2))
        Dim PivotCount As Integer = 0
        QuickSort = New List(Of Integer)
        ''Add to appropriate list
        For i As Integer = 0 To ListOfNumbers.Count - 1
            If ListOfNumbers(i) < Pivot Then
                SmallList.Add(ListOfNumbers(i))
            ElseIf ListOfNumbers(i) > Pivot Then
                LargeList.Add(ListOfNumbers(i))
            Else
                PivotCount = PivotCount + 1
            End If
        Next
        ''Quicksort smaller list
        QuickSort.AddRange(QuickSort(SmallList))
        ''Add pivot
        While PivotCount > 0
            QuickSort.Add(Pivot)
            PivotCount -= 1
        End While
        ''Sort large list 
        QuickSort.AddRange(QuickSort(LargeList))
    End Function
    End Module
End Namespace
