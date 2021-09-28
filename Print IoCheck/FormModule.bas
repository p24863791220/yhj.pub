Attribute VB_Name = "FormModule"
Public Stepmax As Integer 'STEP的最大值
Public Stepitme As Integer 'STEP值
    Type TestCondition '测试条件，测量结果
          NO As String
          Stepdescription As String
          AudioSet As String
          Meter As String
          Rs232 As String
          Ry As String
          Wait As String
          Po As String
          Hi As String
          Low As String
          TestVal As String
          Judge As String
          Okng As Boolean
    End Type
Public TestCondition1(100) As TestCondition
Public NGflag As Integer
Public Manual As Integer
Public Prot_0 As Integer
Public Prot_1 As Integer
Public Prot_2 As Integer
Public Prot_4 As Integer
Public Prot_5 As Integer
Public GpibType As String
Public Saveinf As Integer
Public AUDIOadr As Integer '7
Public R64Adr As Integer '3
Public R64Rang As String
Public IOin As Integer    'NEXTSTEP使用
Public Ioindata As Integer
Public Retest As Integer
Public Stopinf As Integer
Public PageNo As Integer
Public PageMax As Integer
Public Const JiZhong = "EBX5009"
Public JiZHong_Form1 As Form '全局窗体设定
Public JiZHong_Form2 As New EBX5009_2
Public JiZHong_Form3 As New EBX5009_3
Public JiZHong_Form4 As New EBX5009_4
Public CurrentForm As Form
Public MMn As String
Public TESTrem As Byte
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName _
    As String, ByVal lpWindowName As String) As Long
Public Declare Function SetWindowPos& Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
Public Sub DataSave() '条件设定数据保存
Dim RST As Integer
Dim i As Integer
RST = MsgBox("以前的数据将被覆盖，是否继续", vbInformation + vbOKCancel, "注意！")
If RST = vbCancel Then Exit Sub
Open App.Path & "\Setting" For Output As #2 '数据LOAD
For i = 1 To Stepmax
If i <= 25 Then
    Write #2, JiZHong_Form1.Meano(i).Caption,
    Write #2, JiZHong_Form1.Step_text(i).Text,
    Write #2, JiZHong_Form1.AudioSet_text(i).Text,
    Write #2, JiZHong_Form1.Mmeter(i).Text,
    Write #2, JiZHong_Form1.Rs232send(i).Text,
    Write #2, JiZHong_Form1.Ry(i).Text,
    Write #2, JiZHong_Form1.Wtime(i).Text,
    Write #2, JiZHong_Form1.Po(i).Text,
    Write #2, JiZHong_Form1.Hi(i).Text,
    Write #2, JiZHong_Form1.Low(i).Text
ElseIf i <= 50 And i > 25 Then
    Write #2, JiZHong_Form2.Meano(i - 25).Caption,
    Write #2, JiZHong_Form2.Step_text(i - 25).Text,
    Write #2, JiZHong_Form2.AudioSet_text(i - 25).Text,
    Write #2, JiZHong_Form2.Mmeter(i - 25).Text,
    Write #2, JiZHong_Form2.Rs232send(i - 25).Text,
    Write #2, JiZHong_Form2.Ry(i - 25).Text,
    Write #2, JiZHong_Form2.Wtime(i - 25).Text,
    Write #2, JiZHong_Form2.Po(i - 25).Text,
    Write #2, JiZHong_Form2.Hi(i - 25).Text,
    Write #2, JiZHong_Form2.Low(i - 25).Text
ElseIf i <= 75 And i > 50 Then
    Write #2, JiZHong_Form3.Meano(i - 50).Caption,
    Write #2, JiZHong_Form3.Step_text(i - 50).Text,
    Write #2, JiZHong_Form3.AudioSet_text(i - 50).Text,
    Write #2, JiZHong_Form3.Mmeter(i - 50).Text,
    Write #2, JiZHong_Form3.Rs232send(i - 50).Text,
    Write #2, JiZHong_Form3.Ry(i - 50).Text,
    Write #2, JiZHong_Form3.Wtime(i - 50).Text,
    Write #2, JiZHong_Form3.Po(i - 50).Text,
    Write #2, JiZHong_Form3.Hi(i - 50).Text,
    Write #2, JiZHong_Form3.Low(i - 50).Text
ElseIf i <= 100 And i > 75 Then
    Write #2, JiZHong_Form4.Meano(i - 75).Caption,
    Write #2, JiZHong_Form4.Step_text(i - 75).Text,
    Write #2, JiZHong_Form4.AudioSet_text(i - 75).Text,
    Write #2, JiZHong_Form4.Mmeter(i - 75).Text,
    Write #2, JiZHong_Form4.Rs232send(i - 75).Text,
    Write #2, JiZHong_Form4.Ry(i - 75).Text,
    Write #2, JiZHong_Form4.Wtime(i - 75).Text,
    Write #2, JiZHong_Form4.Po(i - 75).Text,
    Write #2, JiZHong_Form4.Hi(i - 75).Text,
    Write #2, JiZHong_Form4.Low(i - 75).Text
End If
Next i
Write #2, Date, Time()
Close #2
   Call DataLoad
End Sub

Public Sub DataLoad() '条件设定数据装载
On Error Resume Next
Open App.Path & "\Setting" For Input As #2 '数据LOAD
For i = 1 To Stepmax
Input #2, TestCondition1(i).NO, TestCondition1(i).Stepdescription, TestCondition1(i).AudioSet, TestCondition1(i).Meter, _
     TestCondition1(i).Rs232, TestCondition1(i).Ry, TestCondition1(i).Wait, TestCondition1(i).Po, _
     TestCondition1(i).Hi, TestCondition1(i).Low
If i <= 25 Then
'条件读入
'    JiZHong_Form1.Meano(i).Caption = TestCondition1(i).NO
    JiZHong_Form1.Step_text(i).Text = TestCondition1(i).Stepdescription
    JiZHong_Form1.AudioSet_text(i).Text = TestCondition1(i).AudioSet
    JiZHong_Form1.Mmeter(i).Text = TestCondition1(i).Meter
    JiZHong_Form1.Rs232send(i).Text = TestCondition1(i).Rs232
    JiZHong_Form1.Ry(i).Text = TestCondition1(i).Ry
    JiZHong_Form1.Wtime(i).Text = TestCondition1(i).Wait
    JiZHong_Form1.Po(i).Text = TestCondition1(i).Po
    JiZHong_Form1.Hi(i).Text = TestCondition1(i).Hi
    JiZHong_Form1.Low(i).Text = TestCondition1(i).Low
'工具提示
'    JiZHong_Form1.Meano(i).ToolTipText = TestCondition1(i).NO
    JiZHong_Form1.Step_text(i).ToolTipText = TestCondition1(i).Stepdescription
    JiZHong_Form1.AudioSet_text(i).ToolTipText = TestCondition1(i).AudioSet
    JiZHong_Form1.Mmeter(i).ToolTipText = TestCondition1(i).Meter
    JiZHong_Form1.Rs232send(i).ToolTipText = TestCondition1(i).Rs232
    JiZHong_Form1.Ry(i).ToolTipText = TestCondition1(i).Ry
    JiZHong_Form1.Wtime(i).ToolTipText = TestCondition1(i).Wait
    JiZHong_Form1.Po(i).ToolTipText = TestCondition1(i).Po
    JiZHong_Form1.Hi(i).ToolTipText = TestCondition1(i).Hi
    JiZHong_Form1.Low(i).ToolTipText = TestCondition1(i).Low
ElseIf i <= 50 And i > 25 Then
'    JiZHong_Form2.Meano(i - 25).Caption = TestCondition1(i).NO
    JiZHong_Form2.Step_text(i - 25).Text = TestCondition1(i).Stepdescription
    JiZHong_Form2.AudioSet_text(i - 25).Text = TestCondition1(i).AudioSet
    JiZHong_Form2.Mmeter(i - 25).Text = TestCondition1(i).Meter
    JiZHong_Form2.Rs232send(i - 25).Text = TestCondition1(i).Rs232
    JiZHong_Form2.Ry(i - 25).Text = TestCondition1(i).Ry
    JiZHong_Form2.Wtime(i - 25).Text = TestCondition1(i).Wait
    JiZHong_Form2.Po(i - 25).Text = TestCondition1(i).Po
    JiZHong_Form2.Hi(i - 25).Text = TestCondition1(i).Hi
    JiZHong_Form2.Low(i - 25).Text = TestCondition1(i).Low
    '工具提示
'    JiZHong_Form2.Meano(i - 25).ToolTipText = TestCondition1(i).NO
    JiZHong_Form2.Step_text(i - 25).ToolTipText = TestCondition1(i).Stepdescription
    JiZHong_Form2.AudioSet_text(i - 25).ToolTipText = TestCondition1(i).AudioSet
    JiZHong_Form2.Mmeter(i - 25).ToolTipText = TestCondition1(i).Meter
    JiZHong_Form2.Rs232send(i - 25).ToolTipText = TestCondition1(i).Rs232
    JiZHong_Form2.Ry(i - 25).ToolTipText = TestCondition1(i).Ry
    JiZHong_Form2.Wtime(i - 25).ToolTipText = TestCondition1(i).Wait
    JiZHong_Form2.Po(i - 25).ToolTipText = TestCondition1(i).Po
    JiZHong_Form2.Hi(i - 25).ToolTipText = TestCondition1(i).Hi
    JiZHong_Form2.Low(i - 25).ToolTipText = TestCondition1(i).Low
ElseIf i <= 75 And i > 50 Then
'    JiZHong_Form3.Meano(i - 50).Caption = TestCondition1(i).NO
    JiZHong_Form3.Step_text(i - 50).Text = TestCondition1(i).Stepdescription
    JiZHong_Form3.AudioSet_text(i - 50).Text = TestCondition1(i).AudioSet
    JiZHong_Form3.Mmeter(i - 50).Text = TestCondition1(i).Meter
    JiZHong_Form3.Rs232send(i - 50).Text = TestCondition1(i).Rs232
    JiZHong_Form3.Ry(i - 50).Text = TestCondition1(i).Ry
    JiZHong_Form3.Wtime(i - 50).Text = TestCondition1(i).Wait
    JiZHong_Form3.Po(i - 50).Text = TestCondition1(i).Po
    JiZHong_Form3.Hi(i - 50).Text = TestCondition1(i).Hi
    JiZHong_Form3.Low(i - 50).Text = TestCondition1(i).Low
    '工具提示
'    JiZHong_Form3.Meano(i - 50).ToolTipText = TestCondition1(i).NO
    JiZHong_Form3.Step_text(i - 50).ToolTipText = TestCondition1(i).Stepdescription
    JiZHong_Form3.AudioSet_text(i - 50).ToolTipText = TestCondition1(i).AudioSet
    JiZHong_Form3.Mmeter(i - 50).ToolTipText = TestCondition1(i).Meter
    JiZHong_Form3.Rs232send(i - 50).ToolTipText = TestCondition1(i).Rs232
    JiZHong_Form3.Ry(i - 50).ToolTipText = TestCondition1(i).Ry
    JiZHong_Form3.Wtime(i - 50).ToolTipText = TestCondition1(i).Wait
    JiZHong_Form3.Po(i - 50).ToolTipText = TestCondition1(i).Po
    JiZHong_Form3.Hi(i - 50).ToolTipText = TestCondition1(i).Hi
    JiZHong_Form3.Low(i - 50).ToolTipText = TestCondition1(i).Low
ElseIf i <= 100 And i > 75 Then
'    JiZHong_Form4.Meano(i - 75).Caption = TestCondition1(i).NO
    JiZHong_Form4.Step_text(i - 75).Text = TestCondition1(i).Stepdescription
    JiZHong_Form4.AudioSet_text(i - 75).Text = TestCondition1(i).AudioSet
    JiZHong_Form4.Mmeter(i - 75).Text = TestCondition1(i).Meter
    JiZHong_Form4.Rs232send(i - 75).Text = TestCondition1(i).Rs232
    JiZHong_Form4.Ry(i - 75).Text = TestCondition1(i).Ry
    JiZHong_Form4.Wtime(i - 75).Text = TestCondition1(i).Wait
    JiZHong_Form4.Po(i - 75).Text = TestCondition1(i).Po
    JiZHong_Form4.Hi(i - 75).Text = TestCondition1(i).Hi
    JiZHong_Form4.Low(i - 75).Text = TestCondition1(i).Low
    '工具提示
'    JiZHong_Form4.Meano(i - 75).ToolTipText = TestCondition1(i).NO
    JiZHong_Form4.Step_text(i - 75).ToolTipText = TestCondition1(i).Stepdescription
    JiZHong_Form4.AudioSet_text(i - 75).ToolTipText = TestCondition1(i).AudioSet
    JiZHong_Form4.Mmeter(i - 75).ToolTipText = TestCondition1(i).Meter
    JiZHong_Form4.Rs232send(i - 75).ToolTipText = TestCondition1(i).Rs232
    JiZHong_Form4.Ry(i - 75).ToolTipText = TestCondition1(i).Ry
    JiZHong_Form4.Wtime(i - 75).ToolTipText = TestCondition1(i).Wait
    JiZHong_Form4.Po(i - 75).ToolTipText = TestCondition1(i).Po
    JiZHong_Form4.Hi(i - 75).ToolTipText = TestCondition1(i).Hi
    JiZHong_Form4.Low(i - 75).ToolTipText = TestCondition1(i).Low
End If
Next i
Close #2
End Sub
Public Sub ResettingALL(LockSelect As Boolean, Inival As String, Bgcolor As String) '界面初始化可选，界面锁定、解锁
Dim i As Integer

For i = 1 To 25
'form1 initalize
JiZHong_Form1.Meano(i).Caption = i 'no
JiZHong_Form1.Step_text(i).Locked = LockSelect 'step description
JiZHong_Form1.Hi(i).Locked = LockSelect 'high value
JiZHong_Form1.Low(i).Locked = LockSelect 'low value
JiZHong_Form1.AudioSet_text(i).Locked = LockSelect 'audioset condition
JiZHong_Form1.Mmeter(i).Locked = LockSelect 'meter condition
JiZHong_Form1.Rs232send(i).Locked = LockSelect 'Rs232 command
JiZHong_Form1.Ry(i).Locked = LockSelect 'relay board set
JiZHong_Form1.Wtime(i).Locked = LockSelect 'wait time set
JiZHong_Form1.Po(i).Locked = LockSelect 'test option
If UCase(Inival) = "MYSELF" Then
Else
JiZHong_Form1.Measure(i).Caption = Inival 'measre value
JiZHong_Form1.Judge(i).Caption = Inival 'result text
JiZHong_Form1.Judge(i).BackColor = Bgcolor 'result backcolor initialize
End If
'form2 initalize
JiZHong_Form2.Meano(i).Caption = i + 25
JiZHong_Form2.Step_text(i).Locked = LockSelect
JiZHong_Form2.Hi(i).Locked = LockSelect
JiZHong_Form2.Low(i).Locked = LockSelect
JiZHong_Form2.AudioSet_text(i).Locked = LockSelect
JiZHong_Form2.Mmeter(i).Locked = LockSelect
JiZHong_Form2.Rs232send(i).Locked = LockSelect
JiZHong_Form2.Ry(i).Locked = LockSelect
JiZHong_Form2.Wtime(i).Locked = LockSelect
JiZHong_Form2.Po(i).Locked = LockSelect
If UCase(Inival) = "MYSELF" Then
Else
JiZHong_Form2.Measure(i).Caption = ""
JiZHong_Form2.Judge(i).Caption = ""
JiZHong_Form2.Judge(i).BackColor = Bgcolor
End If
'form3 initalize
JiZHong_Form3.Meano(i).Caption = i + 50
JiZHong_Form3.Step_text(i).Locked = LockSelect
JiZHong_Form3.Hi(i).Locked = LockSelect
JiZHong_Form3.Low(i).Locked = LockSelect
JiZHong_Form3.AudioSet_text(i).Locked = LockSelect
JiZHong_Form3.Mmeter(i).Locked = LockSelect
JiZHong_Form3.Rs232send(i).Locked = LockSelect
JiZHong_Form3.Ry(i).Locked = LockSelect
JiZHong_Form3.Wtime(i).Locked = LockSelect
JiZHong_Form3.Po(i).Locked = LockSelect
If UCase(Inival) = "MYSELF" Then
Else
JiZHong_Form3.Measure(i).Caption = ""
JiZHong_Form3.Judge(i).Caption = ""
JiZHong_Form3.Judge(i).BackColor = Bgcolor
End If
'form4 initalize
JiZHong_Form4.Meano(i).Caption = i + 75
JiZHong_Form4.Step_text(i).Locked = LockSelect
JiZHong_Form4.Hi(i).Locked = LockSelect
JiZHong_Form4.Low(i).Locked = LockSelect
JiZHong_Form4.AudioSet_text(i).Locked = LockSelect
JiZHong_Form4.Mmeter(i).Locked = LockSelect
JiZHong_Form4.Rs232send(i).Locked = LockSelect
JiZHong_Form4.Ry(i).Locked = LockSelect
JiZHong_Form4.Wtime(i).Locked = LockSelect
JiZHong_Form4.Po(i).Locked = LockSelect
If UCase(Inival) = "MYSELF" Then
Else
JiZHong_Form4.Measure(i).Caption = ""
JiZHong_Form4.Judge(i).Caption = ""
JiZHong_Form4.Judge(i).BackColor = Bgcolor
End If
Next i
'four form command initalize
JiZHong_Form1.IOCHECKER.Enabled = Not (LockSelect)
JiZHong_Form1.Command3.Enabled = Not (LockSelect)
JiZHong_Form2.IOCHECKER.Enabled = Not (LockSelect)
JiZHong_Form2.Command3.Enabled = Not (LockSelect)
JiZHong_Form3.IOCHECKER.Enabled = Not (LockSelect)
JiZHong_Form3.Command3.Enabled = Not (LockSelect)
JiZHong_Form4.IOCHECKER.Enabled = Not (LockSelect)
JiZHong_Form4.Command3.Enabled = Not (LockSelect)
JiZHong_Form1.Refresh
JiZHong_Form2.Refresh
JiZHong_Form3.Refresh
JiZHong_Form4.Refresh
End Sub
Public Sub TestDataSave() '测试数据保存命令
Dim FILEstr As String
Dim OLDfile As String
Dim NEWfile As String
OLDfile = App.Path & "\testdata"
FILEstr = Date$ + Left$(Time$, 2)
NEWfile = App.Path & "\" + FILEstr
Open App.Path & "\testdata" For Append As #4 '测试数据save
'Select Case PageNo
'Case 1
'Case 2
'End Select
For i = 1 To Stepmax
    Write #4, Meavalue(i),
Next i
   Write #4, Time$, Date$, GpibType
   Close #4
   If FileLen(OLDfile) > 1000000 Then
 Name OLDfile As NEWfile
 End If

End Sub
Public Sub PageVar(Dirction As Integer, Optional PageNo_Pri As Integer) '上下翻页
If PageNo_Pri <> 0 Then
Else
Select Case Dirction
Case 0
PageNo = PageNo + 1
Case 1
PageNo = PageNo - 1
End Select
End If
If PageNo < 1 Then PageNo = 1
If PageNo > PageMax Then PageNo = PageMax
    Select Case PageNo
    Case 1
    JiZHong_Form1.Show
    JiZHong_Form2.Hide
    JiZHong_Form3.Hide
    JiZHong_Form4.Hide
    Set CurrentForm = JiZHong_Form1
    Case 2
    JiZHong_Form2.Show
    JiZHong_Form1.Hide
    JiZHong_Form3.Hide
    JiZHong_Form4.Hide
    Set CurrentForm = JiZHong_Form2
    Case 3
    JiZHong_Form3.Show
    JiZHong_Form1.Hide
    JiZHong_Form2.Hide
    JiZHong_Form4.Hide
    Set CurrentForm = JiZHong_Form3
    Case 4
    JiZHong_Form4.Show
    JiZHong_Form1.Hide
    JiZHong_Form2.Hide
    JiZHong_Form3.Hide
    Set CurrentForm = JiZHong_Form4
    End Select
If PageNo = 1 Then
JiZHong_Form1.Page_command(1).Enabled = False
JiZHong_Form2.Page_command(1).Enabled = False
JiZHong_Form3.Page_command(1).Enabled = False
JiZHong_Form4.Page_command(1).Enabled = False
JiZHong_Form1.Page_command(0).Enabled = True
JiZHong_Form2.Page_command(0).Enabled = True
JiZHong_Form3.Page_command(0).Enabled = True
JiZHong_Form4.Page_command(0).Enabled = True
End If
If PageNo = PageMax Then
JiZHong_Form1.Page_command(0).Enabled = False
JiZHong_Form2.Page_command(0).Enabled = False
JiZHong_Form3.Page_command(0).Enabled = False
JiZHong_Form4.Page_command(0).Enabled = False
JiZHong_Form1.Page_command(1).Enabled = True
JiZHong_Form2.Page_command(1).Enabled = True
JiZHong_Form3.Page_command(1).Enabled = True
JiZHong_Form4.Page_command(1).Enabled = True
End If
If PageNo <> 1 And PageNo <> PageMax Then
JiZHong_Form1.Page_command(0).Enabled = True
JiZHong_Form2.Page_command(0).Enabled = True
JiZHong_Form3.Page_command(0).Enabled = True
JiZHong_Form4.Page_command(0).Enabled = True
JiZHong_Form1.Page_command(1).Enabled = True
JiZHong_Form2.Page_command(1).Enabled = True
JiZHong_Form3.Page_command(1).Enabled = True
JiZHong_Form4.Page_command(1).Enabled = True
End If
End Sub
Public Sub ExitProgram() '退出程序
Call IOini
Sleep (500)
If IOread = 1 Then
Call IOwrite(4, &H40)
Sleep (1000)
Call IOwrite(4, 0)
End If
    '取得任务栏的句柄
'    MSComm1.PortOpen = False
'    hWnd1 = FindWindow("Shell_TrayWnd", "")
    '显示任务栏
'    Call SetWindowPos(hWnd1, 0, 0, 0, 0, 0, &H40)
'Closedevice
End
End Sub
Public Sub EditCommand() '编辑命令
Dim PASSWORDSET As String
Dim PASSWORDERR As String
PASSWORDSET = InputBox("请输入密码", "密码框")
If PASSWORDSET = "50135013" Then
    Call ResettingALL(False, "myself", 0) '锁定界面，但不把测量结果清空
Else
    Call ResettingALL(True, "myself", 0) '锁定界面，但不把测量结果清空
    PASSWORDERR = MsgBox("对不起,密码错误", vbInformation + vbRetryCancel, "取消")
    If PASSWORDERR = vbRetry Then Call EditCommand  '重新编辑，输入密码
End If
End Sub
Public Sub SelectSaveCommand()
If Saveinf = 1 Then
Saveinf = 0
JiZHong_Form1.Command6.Caption = "TestDataNoSave"
JiZHong_Form1.Command6.BackColor = &H8000000F
JiZHong_Form2.Command6.Caption = "TestDataNoSave"
JiZHong_Form2.Command6.BackColor = &H8000000F
JiZHong_Form3.Command6.Caption = "TestDataNoSave"
JiZHong_Form3.Command6.BackColor = &H8000000F
JiZHong_Form4.Command6.Caption = "TestDataNoSave"
JiZHong_Form4.Command6.BackColor = &H8000000F
Else
Saveinf = 1
JiZHong_Form1.Command6.Caption = "TestDataSave"
JiZHong_Form1.Command6.BackColor = &H80FF&
JiZHong_Form2.Command6.Caption = "TestDataSave"
JiZHong_Form2.Command6.BackColor = &H80FF&
JiZHong_Form3.Command6.Caption = "TestDataSave"
JiZHong_Form3.Command6.BackColor = &H80FF&
JiZHong_Form4.Command6.Caption = "TestDataSave"
JiZHong_Form4.Command6.BackColor = &H80FF&
End If
End Sub
