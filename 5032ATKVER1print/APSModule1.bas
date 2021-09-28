Attribute VB_Name = "APSModule1"
'Option Explicit
'MY MODULE
Public YiQistate As Boolean '仪器状态
Public IoState As Boolean 'IO状态
Public ControlOld As String 'IO控制选择
Public ControlOldGPIB As String 'GPIB控制选择
Public NGflag As Integer   '测试NG标记  NG发生＝1
Public Stepitme As Integer 'STEPNO
Public Stepmax As Integer 'STEP的最大值
Public POmax As Integer 'STEP的最大值
Public Po As Integer       '测试ch 参考设定数据list
Public SETTINGdata(40, 54) As String    '条件规格'参考设定数据list
Public meavalue(40, 16) As Single '(Stepitme,CHNO)
Public IOin As Integer    'NEXTSTEP使用
Public Retest1 As Integer
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
'**************************************************
Public Sub IOini()
Call IOwrite(2, 0)
Call IOwrite(1, 0)
'ClrPortBit
End Sub
Public Sub EBX5032Out_Click()
Dim i As Integer
Dim IOin As Integer
Dim Xx As Long
Dim Yy As Long
NGflag = 0
Call IOwrite(1, 0) '气tui
Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = IOread
    IOin = IOin And 32
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 32 Or Yy > 2500 ' 检测tui到位
        If Yy > 2500 Then
        NGflag = 1
        Else
        Sleep (500)
        End If
        Call IOwrite(2, 0)
If NGflag = 0 Then
Call IOwrite(2, 64) '气tui
Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = IOread
    IOin = IOin And 4
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 4 Or Yy > 2500 ' 检测tui到位
        If Yy > 2500 Then
        NGflag = 1
        Else
        Sleep (50)
        End If
        Call IOwrite(2, 0)
End If
End Sub

Public Sub EBX5032Run_Click()
Dim i As Integer
Dim IOin As Integer
Dim Xx As Long
Dim Yy As Long
NGflag = 0
Call IOwrite(1, 0) '气tui
Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = IOread And 32
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 32 Or Yy > 2500 ' song kai
        If Yy > 2500 Then
        NGflag = 1
        Else
        Sleep (300)
        End If
        Call IOwrite(2, 0)

If NGflag = 0 Then
    NGflag = 0
    Call IOwrite(2, 128) '气jin
    Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = IOread
    DoEvents
    Yy = GetTickCount() - Xx
    If (IOin And 2) = 2 Then '检测到复位 后 退出
        Call EBX5032Out_Click
        NGflag = 1
        SetIn = 0
        Exit Sub
    End If
    IOin = IOin And 8
    Loop Until IOin = 8 Or Yy > 2500 ' 检测推出到位
        If Yy > 2500 Then
        NGflag = 1
        Else
        Sleep (200)
        End If
        Call IOwrite(2, 0)
End If
If NGflag = 0 Then
    NGflag = 0
    Sleep (20)
    Call IOwrite(1, 4) 'jia jin
    Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = IOread And 16
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 16 Or Yy > 2500 ' 检测夹紧到位
        If Yy > 2500 Then
        NGflag = 1
        Else
        Sleep (50)
        End If
End If
    If Yy > 2500 Or NGflag = 1 Then
        Call EBX5032Out_Click 'NG未到位退出
        NGflag = 1
        SetIn = 0
    End If
End Sub
Public Function IOread()
If ControlOld = "PRINT" Then
    PrintForm1.Total37A.Text = PortIn(&H37A)
    PrintForm1.Text37A = GetPortBit(&H37A, 1) & GetPortBit(&H37A, 2)
    PrintForm1.Text37A = PrintForm1.Text37A & GetPortBit(&H37A, 3) & GetPortBit(&H37A, 4)
    PrintForm1.Text37A = PrintForm1.Text37A & GetPortBit(&H37A, 5) & GetPortBit(&H37A, 6)
    PrintForm1.Text37A = PrintForm1.Text37A & GetPortBit(&H37A, 7) & GetPortBit(&H37A, 8)
    
    PrintForm1.Total379.Text = PortIn(&H379)
    PrintForm1.Text379 = GetPortBit(&H379, 1) & GetPortBit(&H379, 2)
    PrintForm1.Text379 = PrintForm1.Text379 & GetPortBit(&H379, 3) & GetPortBit(&H379, 4)
    PrintForm1.Text379 = PrintForm1.Text379 & GetPortBit(&H379, 5) & GetPortBit(&H379, 6)
    PrintForm1.Text379 = PrintForm1.Text379 & GetPortBit(&H379, 7) & GetPortBit(&H379, 8)
    IOread = 0
    If GetPortBit(&H37A, 2) = True Then
    IOread = IOread + 16
    End If
    If GetPortBit(&H37A, 3) = False Then
    IOread = IOread + 32
    End If
    If GetPortBit(&H379, 3) = False Then
    IOread = IOread + 8
    End If
    If GetPortBit(&H379, 5) = False Then
    IOread = IOread + 4
    End If
    If GetPortBit(&H379, 7) = True Then
    IOread = IOread + 2
    End If
    If GetPortBit(&H379, 6) = False Then
    IOread = IOread + 1
    End If
Else
    If IoState = False Then Exit Function
    Dim IObyte As Integer
    IObyte = PIODIO_InputByte(wBaseAddr + &HC0)
    IObyte = IObyte Xor &HFF
    IOread = IObyte
End If
PrintForm1.IOreadText.Text = IOread
End Function

Public Function IOwrite(Port As Long, IObcd As Integer)
If ControlOld = "IO" Then
    If IoState = False Then Exit Function
    Select Case Port
        Case 1
            PIODIO_OutputByte (wBaseAddr + &HC4), IObcd '  SW1-SW8
        Case 2
            PIODIO_OutputByte (wBaseAddr + &HC8), IObcd '  SW9-SW16
        Case 3
            PIODIO_OutputByte (wBaseAddr + &HD0), IObcd 'CH1-8切换
        Case 4
            PIODIO_OutputByte (wBaseAddr + &HD4), IObcd 'CH9-16切换
        Case 5
            PIODIO_OutputByte (wBaseAddr + &HD8), IObcd 'ACIN,BZ,PINUP,OPEN
    End Select
Else
Select Case Port
 Case 1
    PortOut &H37A, IObcd
 Case 2 '
   PortOut &H378, IObcd
 End Select
 End If
End Function

'Public Function IOread()                            'io 读取
'    Dim IObyte As Integer
'    IObyte = PIODIO_InputByte(wBaseAddr + &HC0)
'    IObyte = IObyte Xor &HFF
'    IOread = IObyte
'End Function
'Public Function IOwrite(port As Long, IObcd As Integer) 'IO写入
'    Select Case port
'        Case 1
'            PIODIO_OutputByte (wBaseAddr + &HC4), IObcd '  SW1-SW8
'        Case 2
'            PIODIO_OutputByte (wBaseAddr + &HC8), IObcd '  SW9-SW16
'        Case 3
'            PIODIO_OutputByte (wBaseAddr + &HD0), IObcd 'CH1-8切换
'        Case 4
'            PIODIO_OutputByte (wBaseAddr + &HD4), IObcd 'CH9-16切换
'        Case 5
'            PIODIO_OutputByte (wBaseAddr + &HD8), IObcd 'ACIN,BZ,PINUP,OPEN
'    End Select
'End Function
'Public Sub IOini()                                    'IO复位
'    Call IOwrite(1, 0)
'    Call IOwrite(3, 0)
'    Call IOwrite(4, 0)
'    Call IOwrite(5, 0)
'End Sub
'CH1-CH16
Public Sub Relaymap(porm As Integer) '测试通道切换
    Dim wValue As Integer

    Call IOwrite(3, 0) 'CH全部OFF
    Call IOwrite(4, 0)
    If porm > 16 Or porm < 0 Then Exit Sub
    Sleep (10)
    If porm <= 8 Then
        wValue = 2 ^ (porm - 1)
        Call IOwrite(3, wValue)

    Else
        wValue = 2 ^ (porm - 9)
        Call IOwrite(4, wValue)
    End If
    Sleep (10)
End Sub



'==============================================================================GPIB UNIT


Public Sub GPIBCleanup(msg$)
    Dim ErrorMnemonic
    ErrorMnemonic = Array("EDVR", "ECIC", "ENOL", "EADR", "EARG", _
            "ESAC", "EABO", "ENEB", "EDMA", "", _
            "EOIP", "ECAP", "EFSO", "", "EBUS", _
            "ESTB", "ESRQ", "", "", "", "ETAB")

    ErrMsg$ = msg$ & Chr(13) & "ibsta = &H" & Hex(ibsta) & Chr(13) _
            & "iberr = " & iberr & " <" & ErrorMnemonic(iberr) & ">"
    MsgBox ErrMsg$, vbCritical, "Error"
    ilonl Dev%, 0
    End
End Sub



Public Sub DIScharge()
    Call IOwrite(5, &H0) 'ACOFF 编程误操作防止,可删除
    Call IOwrite(1, 8) '电调
    Sleep (1000)
    Call IOwrite(1, 0) '电调
End Sub



Public Sub MeaClear() '测试值清0
    For j = 1 To Stepmax
        For i = 1 To POmax
            meavalue(j, i) = 0

        Next i
    Next j
End Sub

Public Sub OKDATAsave()
    Dim NO As String
    Dim FILEstr As String
    Dim OLDfile As String
    Dim NEWfile As String
    OLDfile = App.Path & "\DenDATA\OKDATA"
    FILEstr = Date$ + Left$(Time$, 2) + "OK"
    NEWfile = App.Path & "\DenDATA\OKDATA" + FILEstr
    Open App.Path & "\DenDATA\OKDATA" For Append As #4 '测试数据save

    For j = 1 To Stepmax
        Write #4, j,

        For i = 1 To POmax
            If Trim(SETTINGdata(j, 20 + i * 2) + SETTINGdata(j, 21 + i * 2)) <> "" Then
                Write #4, meavalue(j, i),
            End If
        Next i
    Next j

    Write #4, Time$, Date$
    Close #4
    NO = FileLen(OLDfile)
    If FileLen(OLDfile) > 1000000 Then
        Name OLDfile As NEWfile
    End If

End Sub
Public Sub NGDATAsave()
    Dim NO As String
    Dim FILEstr As String
    Dim OLDfile As String
    Dim NEWfile As String
    Dim i As Integer
    OLDfile = App.Path & "\DenDATA\NGDATA"
    FILEstr = Date$ + Left$(Time$, 2) + "NG"
    NEWfile = App.Path & "\DenDATA\NGDATA" + FILEstr
    Po = 0
    For i = 1 To POmax
    If SettingFrm.CHMeaText(i).BackColor = vbRed Then
    Po = i
    Exit For
    End If
    Next i
    Open App.Path & "\DenDATA\NGDATA" For Append As #4 '测试数据save
    Write #4, Stepitme, Po, meavalue(Stepitme, Po), Time$, Date$
'    For j = 1 To Stepitme
'        Write #4, j,
'
'        For i = 1 To Po
'            If Trim(SETTINGdata(j, 20 + i * 2) + SETTINGdata(j, 21 + i * 2)) <> "" Then
'                Write #4, meavalue(j, i),
'            End If
'        Next i
'    Next j
    Close #4
    NO = FileLen(OLDfile)
    If FileLen(OLDfile) > 1000000 Then
        Name OLDfile As NEWfile
    End If
End Sub

