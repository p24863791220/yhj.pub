Attribute VB_Name = "FormModule"
Public Stepmax As Integer 'STEP的最大值
Public Stepitme As Integer 'STEP值
Public YiQistate As Boolean
    Type TestCondition '测试条件，测量结果
          No As String
          Stepdescription As String
          AudioSet As String
          Mset As String
          Rs232 As String
          Ry As String
          Wait As Long
          Po As String
          Hi As String
          Low As String
          TestVal As String
          Judge As String
          Okng As Boolean
          LinuxReceive As String
    End Type
Public Retest1 As Integer
Public LinuxIp As String
Public TestPub As String
Public TestCondition1(100) As TestCondition
Public NGflag As Integer
Public Manual As Integer

Public Prot_1 As Integer
Public Prot_2 As Integer
Public Prot_3 As Integer
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
Public Const JiZhong = "EBX5021"
Public MMn As String
Public TESTrem As Byte
Public PASSWORDSET As String
Public DialogStart_pub  As Integer
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName _
    As String, ByVal lpWindowName As String) As Long
Public Declare Function SetWindowPos& Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
Declare Function SendMessageTimeout Lib "user32" Alias "SendMessageTimeoutA" (ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long, ByVal fuFlags As Long, ByVal uTimeout As Long, lpdwResult As Long) As Long

Public Sub TestDataSave() '测试数据保存命令
Dim FILEstr As String
Dim OLDfile As String
Dim NEWfile As String
Dim Ngstep As String
Dim i As Integer
Ngstep = ""
If NGflag = 0 Then
Open App.Path & "\SaveData\OKtestdata.dat" For Append As #4 '测试数据save
OLDfile = App.Path & "\SaveData\OKtestdata.dat"
FILEstr = Date$ + Left$(Time$, 2)
NEWfile = App.Path & "\" + FILEstr
For i = 1 To Stepmax
    Write #4, TestCondition1(i).TestVal,
Next i
   Write #4, Time$, Date$, GpibType, EBX5009_1.Time_Label.Caption
   Close #4
Else
For i = 0 To Stepmax
If EBX5009_1.Judge(i).BackColor = vbRed Then
Ngstep = Ngstep & i & "-" & EBX5009_1.Measure(i).Caption & ";"
End If
Next i
Open App.Path & "\SaveData\NGtestdata.dat" For Append As #4 '测试数据save
OLDfile = App.Path & "\SaveData\NGtestdata.dat"
FILEstr = Date$ + Left$(Time$, 2)
NEWfile = App.Path & "\" + FILEstr
   Write #4, Ngstep, Time$, Date$, EBX5009_1.Time_Label.Caption
   Close #4
End If
'Select Case PageNo
'Case 1
'Case 2
'End Select

   If FileLen(OLDfile) > 1000000 Then
 Name OLDfile As NEWfile
 End If
End Sub


