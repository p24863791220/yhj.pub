Attribute VB_Name = "TestModule"
Public Sub IOini()
'    Call IOwrite(1, 0)
'    Call IOwrite(2, 0)
'    Call IOwrite(3, 0)
'    Call IOwrite(4, 0)
'    Call IOwrite(5, 0)
End Sub

Public Function IOREAD()
'Dim IObyte As Integer
'IObyte = PIODIO_InputByte(wBaseAddr + &HC0)
'IObyte = IObyte Xor &HFF
'IOREAD = IObyte
End Function

Public Function IOwrite(port As Long, IObcd As Integer)
'Select Case port
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
Public Sub LinuxCommandSend(Optional Com_pri As String)  '条件设定
On Error GoTo Exit1
Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
If Ret <> 0 Then
Call Send_CTRL_C
SendMessageTimeout Ret, WM_CLOSE, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
Sleep (100)
End If
If Dir(RESFILE$) <> "" Then Kill RESFILE$
Exit1:
If Stepitme = 22 Or Stepitme = 27 Then Call EBX5009_1.WAITtime(800)
If Com_pri = "" Then
Response = Exec_Test(TestCondition1(Stepitme).Rs232, ProductIp, ProductID, TestCondition1(Stepitme).Wait, strBuffer)
Else
Response = Exec_Test(Com_pri, ProductIp, ProductID, TestCondition1(Stepitme).Wait, strBuffer)
End If
End Sub
Public Sub Wtime2(ByVal WaitSet As Long)  '等待时间
    Dim ii As Long
    Dim jj As Long
    Dim Ret As Long
    EBX5009_1.WaitMAX.value = 0
    EBX5009_1.WaitMAX.Max = WaitSet + 1  '时间设定0
    ii = GetTickCount()
    '条件设定WAITTIME
    Do Until (jj - ii) >= WaitSet
        jj = GetTickCount()
        DoEvents  '等待期间其他事件响应ON/OFF
        If (jj - ii) > EBX5009_1.WaitMAX.Max Then Exit Do
        EBX5009_1.WaitMAX.value = (jj - ii)
        Sleep (100)
        If Stepitme = 7 Then
            Call IOwrite(2, &H20)
            Sleep (500)
            Call IOwrite(2, &H0)
            Sleep (500)
        End If
        If TestCondition1(STEPTIME).Stepdescription <> "START" Then
        Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
       If Ret = 0 Then
       Sleep (200)
       Exit Sub
       End If
       End If
                If IOREAD = 7 Then
Exit Sub
End If
    Loop
End Sub
Public Sub WtimeOut() '等待时间
    Dim ii As Long
    Dim jj As Long
    Dim Ret As Long
    EBX5009_1.WaitMAX.value = 0
    EBX5009_1.WaitMAX.Max = 2000 ' Val(Tout_text(Stepitme).Text) + 1 '时间设定0
    ii = GetTickCount()
    '条件设定WAITTIME
    Do Until (jj - ii) >= 2000 'Val(Tout_text(Stepitme).Text)
        jj = GetTickCount()
        DoEvents  '等待期间其他事件响应ON/OFF
        If (jj - ii) > EBX5009_1.WaitMAX.Max Then Exit Do
        EBX5009_1.WaitMAX.value = (jj - ii)
        If TestCondition1(STEPTIME).Stepdescription <> "START" Then
        Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
       If Ret = 0 Then
       Sleep (200)
       Exit Sub
       End If
       End If
       Sleep (100)
If IOREAD = 7 Then
Exit Sub
End If
    Loop
End Sub
Public Function LinuxCommandReceive() As String  '测量
Dim s As String
On Error GoTo Ne
Sleep (200)
     If Dir(RESFILE$) <> "" Then
      Dim fso As New FileSystemObject, txtfile, _
  fil1 As File, ts As TextStream
  Set fil1 = fso.GetFile("c:\result.txt")
    Set ts = fil1.OpenAsTextStream(ForReading)
    s = ""
    s = s & ts.ReadLine
    Do While ts.AtEndOfStream = False
    If ts.AtEndOfStream = False Then
    s = s & ts.ReadLine
    End If
   Loop
  
      End If
Ne:
On Error Resume Next
      ts.Close
      LinuxCommandReceive = s
      TestCondition1(Stepitme).LinuxReceive = s
End Function
Public Function RemoteCommandReceive() As String  '测量
Dim s As String
On Error GoTo Ne
     If Dir(RESFILE$) <> "" Then
      Dim fso As New FileSystemObject, txtfile, _
  fil1 As File, ts As TextStream
  Set fil1 = fso.GetFile("c:\result.txt")
    Set ts = fil1.OpenAsTextStream(ForReading)
    s = ""
    s = s & ts.ReadLine
    Do While ts.AtEndOfStream = False
    If ts.AtEndOfStream = False Then
    s = s & ts.ReadLine
    End If
   Loop
   ts.Close
      End If
Ne:
     RemoteCommandReceive = s
      TestCondition1(Stepitme).LinuxReceive = s
          If InStr(1, s, "OK") <> 0 Then
     RemoteCommandReceive = 1
    Else
    RemoteCommandReceive = 0
    End If
End Function
Public Sub FileClear()
On Error Resume Next
 If Dir(RESFILE$) = "" Then Exit Sub
      Dim fso As New FileSystemObject, txtfile, _
  fil1 As File, ts As TextStream
  Set fil1 = fso.GetFile("c:\result.txt")
  fso.DeleteFile ("c:\result.txt")
End Sub
Public Sub Judge() '单步判断
If UCase(Trim(TestCondition1(Stepitme).Stepdescription)) = "START" Or UCase(Trim(TestCondition1(Stepitme).Stepdescription)) = "END" Then
EBX5009_1.Judge(Stepitme - (PageNo - 1) * 25).Caption = "OK"
EBX5009_1.Judge(Stepitme - (PageNo - 1) * 25).BackColor = vbGreen
Exit Sub
End If
If InStr(1, TestCondition1(Stepitme).LinuxReceive, "OK") > 0 Then
EBX5009_1.Judge(Stepitme - (PageNo - 1) * 25).Caption = "OK"
EBX5009_1.Judge(Stepitme - (PageNo - 1) * 25).BackColor = vbGreen
Else
EBX5009_1.Judge(Stepitme - (PageNo - 1) * 25).Caption = "NG"
EBX5009_1.Judge(Stepitme - (PageNo - 1) * 25).BackColor = vbRed
End If
End Sub
Public Sub Closedevice()
PIODIO_DriverClose
If YiQistate = False Then Exit Sub
ilonl AUDIOadr, 0
'ilonl R64Adr, 0
End Sub
