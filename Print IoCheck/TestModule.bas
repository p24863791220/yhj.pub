Attribute VB_Name = "TestModule"
Public Declare Sub PortOut Lib "IO.DLL" (ByVal Port As Integer, ByVal Data As Byte)
Public Declare Sub PortWordOut Lib "IO.DLL" (ByVal Port As Integer, ByVal Data As Integer)
Public Declare Sub PortDWordOut Lib "IO.DLL" (ByVal Port As Integer, ByVal Data As Long)
Public Declare Function PortIn Lib "IO.DLL" (ByVal Port As Integer) As Byte
Public Declare Function PortWordIn Lib "IO.DLL" (ByVal Port As Integer) As Integer
Public Declare Function PortDWordIn Lib "IO.DLL" (ByVal Port As Integer) As Long
Public Declare Sub SetPortBit Lib "IO.DLL" (ByVal Port As Integer, ByVal Bit As Byte)
Public Declare Sub ClrPortBit Lib "IO.DLL" (ByVal Port As Integer, ByVal Bit As Byte)
Public Declare Sub NotPortBit Lib "IO.DLL" (ByVal Port As Integer, ByVal Bit As Byte)
Public Declare Function GetPortBit Lib "IO.DLL" (ByVal Port As Integer, ByVal Bit As Byte) As Boolean
Public Declare Function RightPortShift Lib "IO.DLL" (ByVal Port As Integer, ByVal Val As Boolean) As Boolean
Public Declare Function LeftPortShift Lib "IO.DLL" (ByVal Port As Integer, ByVal Val As Boolean) As Boolean
Public Declare Function IsDriverInstalled Lib "IO.DLL" () As Boolean
Public Sub IOini()
Call IOwrite(2, 0)
'ClrPortBit
'    Call IOwrite(1, 0)
'    Call IOwrite(2, 0)
'    Call IOwrite(3, 0)
'    Call IOwrite(4, 0)
'    Call IOwrite(5, 0)
End Sub

Public Function IOread()
Form1.Text2.Text = PortIn(&H379)
Form1.Text3 = GetPortBit(&H379, 1) & GetPortBit(&H379, 2)
Form1.Text3 = Form1.Text3 & GetPortBit(&H379, 3) & GetPortBit(&H379, 4)
Form1.Text3 = Form1.Text3 & GetPortBit(&H379, 5) & GetPortBit(&H379, 6)
Form1.Text3 = Form1.Text3 & GetPortBit(&H379, 7) & GetPortBit(&H379, 8)
IOread = 0
If GetPortBit(&H379, 5) = False Then
IOread = IOread + 4
End If
If GetPortBit(&H379, 7) = True Then
IOread = IOread + 2
End If
If GetPortBit(&H379, 6) = False Then
IOread = IOread + 1
End If

'Dim IObyte As Integer
'IObyte = PIODIO_InputByte(wBaseAddr + &HC0)
'IObyte = IObyte Xor &HFF
'IOread = IObyte
End Function

Public Function IOwrite(Port As Long, IObcd As Integer)
PortOut &H378, IObcd
'Select Case Port
' Case 1
'   PIODIO_OutputByte (wBaseAddr + &HC4), IObcd '  SW1-SW8
' Case 2
'
'   PIODIO_OutputByte (wBaseAddr + &HC8), IObcd
' Case 3
'   PIODIO_OutputByte (wBaseAddr + &HD0), IObcd
' Case 4
'   PIODIO_OutputByte (wBaseAddr + &HD4), IObcd
' Case 5
'   PIODIO_OutputByte (wBaseAddr + &HD8), IObcd
' End Select
End Function
