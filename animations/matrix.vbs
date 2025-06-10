' Matrix-style animation for Windows
Option Explicit
Dim objShell, i, j, line, width, height, delay
Set objShell = CreateObject("WScript.Shell")

' Configuration
width = 100
height = 35
delay = 50 ' milliseconds

' Set console properties
objShell.Run "mode con: cols=" & width & " lines=" & height, 0, True
objShell.Run "color 0A", 0, True

' Run the matrix animation
For i = 1 To 10 ' Number of frames
    ' Clear screen
    objShell.Run "cls", 0, True
    
    ' Generate random matrix lines
    For j = 1 To height - 5
        line = ""
        For k = 1 To width - 1
            If Int((10 * Rnd) + 1) > 8 Then
                line = line & Chr(Int((26 * Rnd) + 65))
            ElseIf Int((10 * Rnd) + 1) > 6 Then
                line = line & Chr(Int((10 * Rnd) + 48))
            ElseIf Int((10 * Rnd) + 1) > 4 Then
                line = line & Chr(Int((15 * Rnd) + 33))
            Else
                line = line & " "
            End If
        Next
        WScript.Echo line
    Next
    
    ' Delay
    WScript.Sleep delay
Next

' Clear screen at the end
objShell.Run "cls", 0, True
