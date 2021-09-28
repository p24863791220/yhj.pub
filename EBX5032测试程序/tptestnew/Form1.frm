VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4815
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6900
   LinkTopic       =   "Form1"
   ScaleHeight     =   4815
   ScaleWidth      =   6900
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command7 
      Caption         =   "delete"
      Enabled         =   0   'False
      Height          =   855
      Left            =   4410
      TabIndex        =   11
      Top             =   360
      Width           =   975
   End
   Begin MSComctlLib.ProgressBar PBar1 
      Height          =   255
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Visible         =   0   'False
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
      Max             =   8000
   End
   Begin VB.OptionButton Option2 
      Caption         =   "LG"
      Height          =   255
      Left            =   5640
      TabIndex        =   9
      Top             =   3960
      Width           =   975
   End
   Begin VB.OptionButton Option1 
      Caption         =   "PVI"
      Height          =   255
      Left            =   4800
      TabIndex        =   8
      Top             =   3960
      Width           =   1095
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   240
      TabIndex        =   7
      Top             =   4320
      Width           =   6495
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   6480
      Top             =   3960
   End
   Begin VB.CommandButton Command6 
      Caption         =   "copy"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15.75
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   5880
      TabIndex        =   6
      Top             =   0
      Width           =   1095
   End
   Begin VB.CommandButton Command5 
      Caption         =   "clean"
      Height          =   855
      Left            =   3360
      TabIndex        =   5
      Top             =   375
      Width           =   975
   End
   Begin VB.CommandButton Command4 
      Caption         =   "start"
      Height          =   855
      Left            =   240
      TabIndex        =   4
      Top             =   360
      Width           =   1935
   End
   Begin VB.CommandButton Command3 
      Caption         =   "root"
      Height          =   855
      Left            =   2265
      TabIndex        =   3
      Top             =   360
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "recovery"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   4680
      TabIndex        =   2
      Top             =   2640
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "normal"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15.75
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   4680
      TabIndex        =   1
      Top             =   1320
      Width           =   1935
   End
   Begin VB.TextBox Text1 
      Height          =   2895
      Left            =   240
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   1320
      Width           =   4335
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   6240
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   3
      DTREnable       =   -1  'True
      RThreshold      =   1
      BaudRate        =   115200
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim Ngflag As Integer


Private Sub Command1_Click()
Dim Pos As Long
Rs232TX2 "change_boot_mode.sh normal"
Sleep 500
Text1.Text = ""

Text1.Text = Text1.Text & MSComm1.Input
Pos = InStr(1, Text1.Text, "OK")
If Pos > 0 Then

Text1.Text = Text1.Text & Chr(13) & Chr(10) & "进入通常模式成功"

End If


End Sub

Private Sub Command2_Click()
Dim fso As New FileSystemObject
If fso.FileExists("F:\ccE$F_h^fGs#=-M]PphW8[Ap4$%]e@Zo!.v9!S9{a)Rt8kN-Wk{2jZJ=^nPZqA@3e") = True Then
    Text1.Text = ""
    Text1.Text = "ccE$F_h^fGs#=-M]PphW8[Ap4$%]e@Zo!.v9!S9{a)Rt8kN-Wk{2jZJ=^nPZqA@3e文件未删除,请先删除文件 & Chr(13) & Chr(10) & Chr(13) & Chr(10) & """
    Text.BackColor = vbRed
    Exit Sub
    Else
    Text1.BackColor = vbWhite
End If


Dim Pos As Long
Rs232TX2 "change_boot_mode.sh recovery"
Sleep 500
Text1.Text = ""

Text1.Text = Text1.Text & MSComm1.Input

Pos = InStr(1, Text1.Text, "OK")
If Pos > 0 Then

Text1.Text = Text1.Text & Chr(13) & Chr(10) & "进入测试模式成功"


End If


End Sub

Private Sub Command3_Click()
Rs232TX2 "root"
Sleep 500
Rs232TX2 "root"
Sleep 200
Text1.Text = Text1.Text & MSComm1.Input
End Sub

Private Sub Command4_Click()
On Error GoTo ERRADR
If MSComm1.PortOpen = False Then
MSComm1.PortOpen = True

MSComm1.RThreshold = 1
MSComm1.InBufferCount = 0
MSComm1.OutBufferCount = 0

End If

Text1.Text = ""

Rs232TX2 ""
Sleep 200
Text1.Text = Text1.Text & MSComm1.Input
Exit Sub
ERRADR:
Text1.Text = ""
Text1.Text = "制品没有找到"
End Sub

Private Sub Command5_Click()
Text1.Text = ""
End Sub

Private Sub Command6_Click()
Ngflag = 0
Text1.BackColor = vbWhite
CopytoSonyReader
If Ngflag = 0 Then
Text1.Text = ""
Text1.Text = "文件复制成功" & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "拔出USB线，进行TPTEST"
Else
Text1.Text = ""
Text1.Text = "文件复制失败" & Chr(13) & Chr(10) & Chr(13) & Chr(10) & ""
Text1.BackColor = vbRed
End If
End Sub





Private Sub Command7_Click()
Dim fso As New FileSystemObject
If fso.FileExists("F:\ccE$F_h^fGs#=-M]PphW8[Ap4$%]e@Zo!.v9!S9{a)Rt8kN-Wk{2jZJ=^nPZqA@3e") = True Then
fso.DeleteFile ("F:\ccE$F_h^fGs#=-M]PphW8[Ap4$%]e@Zo!.v9!S9{a)Rt8kN-Wk{2jZJ=^nPZqA@3e")
    If fso.FileExists("F:\ccE$F_h^fGs#=-M]PphW8[Ap4$%]e@Zo!.v9!S9{a)Rt8kN-Wk{2jZJ=^nPZqA@3e") = True Then
    Ngflag = 1
    Text1.Text = "ccE$F_h^fGs#=-M]PphW8[Ap4$%]e@Zo!.v9!S9{a)Rt8kN-Wk{2jZJ=^nPZqA@3e文件删除失败"
    Else
    Text1.Text = ""
    Text1.Text = "文件删除成功" & Chr(13) & Chr(10) & Chr(13) & Chr(10) & ""
    End If
Else
    Text1.Text = ""
    Text1.Text = "文件未找到" & Chr(13) & Chr(10) & Chr(13) & Chr(10) & ""
End If
End Sub

Private Sub Form_Load()
If App.PrevInstance = True Then End


End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
MSComm1.PortOpen = False
End
End Sub
Public Sub Rs232TX2(OUTString As String)
Dim OUTString_1 As String * 1
Dim iii As Integer
OUTString = OUTString
For iii = 1 To Len(OUTString)
OUTString_1 = Mid$(OUTString, iii, 1)
MSComm1.Output = OUTString_1
Sleep 5
Next iii

Sleep 3
MSComm1.Output = Chr(13)
End Sub

Private Sub CopytoSonyReader()
Dim XX As Long
Dim YY As Long
Dim F_name As String
Dim S_name As String
Dim OLDname As String
Dim NEWname As String
Dim Ret
On Error Resume Next
Dim fso As New FileSystemObject
'fso.CopyFolder App.Path & "\Sony Reader", "F:\", True
'If fso.FolderExists("F:\Sony Reader") = False Then
'Ngflag = 1
'Text1.Text = "copy Sony Reader error ,retry"
'End If
OLDname = "F:\Reader"
NEWname = "F:\Sony Reader"

Ret = Dir(NEWname & "\")

If Ret = "" Then


Text1.Text = "文件复制中"
S_name = "xcopy " & App.Path & "\FW\Reader" & " F:\Reader\ /e /c /y"
Shell S_name, 0
XX = GetTickCount
PBar1.Visible = True
Do
DoEvents

Sleep 200

YY = GetTickCount
If YY - XX <= PBar1.Max Then PBar1.Value = YY - XX
Loop Until YY - XX > PBar1.Max
PBar1.Visible = False

Name OLDname As NEWname

End If


Open "F:\ccE$F_h^fGs#=-M]PphW8[Ap4$%]e@Zo!.v9!S9{a)Rt8kN-Wk{2jZJ=^nPZqA@3e" For Output As #1  '数据LOAD
 
   Close #1
 If Option1.Value = True Then F_name = App.Path & "\FW\PVI_V220_E004_60_WM1003_ED060SC8_BTC.wbf"
 If Option2.Value = True Then F_name = App.Path & "\FW\LG_V220_E004_60_VM0602_BTC.wbf"
If Option1.Value = False And Option2.Value = False Then
F_name = "注意！没有选择文件"
Else
FileCopy F_name, "F:\Sony Reader\software\data\lut.bin"

End If
Text2.Text = F_name
'If fso.FileExists("F:\ccE$F_h^fGs#=-M]PphW8[Ap4$%]e@Zo!.v9!S9{a)Rt8kN-Wk{2jZJ=^nPZqA@3e") = True Then
'
'Else
'Ngflag = 1
'Text1.Text = "ccE$F_h^fGs#=-M]PphW8[Ap4$%]e@Zo!.v9!S9{a)Rt8kN-Wk{2jZJ=^nPZqA@3e文件COPY失败"
'End If
End Sub



Private Sub Timer1_Timer()
Dim Ret
On Error GoTo ERRADR
Ret = Dir("F:\")
If Ret = "" Then
Command6.Enabled = False
Command7.Enabled = False

Else
Command7.Enabled = True
Command6.Enabled = True
Command1.Enabled = False
Command2.Enabled = False
Command3.Enabled = False
Command4.Enabled = False
'MSComm1.PortOpen = False
End If
If MSComm1.PortOpen = True Then MSComm1.PortOpen = False
MSComm1.PortOpen = True

If MSComm1.PortOpen = False Then
Command1.Enabled = False
Command2.Enabled = False
Command3.Enabled = False
Command4.Enabled = False
Else
Command1.Enabled = True
Command2.Enabled = True
Command3.Enabled = True
Command4.Enabled = True
End If
Exit Sub
ERRADR:
A = Err.Number
If Err.Number = 8002 Then

Command1.Enabled = False
Command2.Enabled = False
Command3.Enabled = False
Command4.Enabled = False
End If

End Sub




