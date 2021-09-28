VERSION 5.00
Begin VB.Form Dialog 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "对话框标题"
   ClientHeight    =   945
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5265
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   945
   ScaleWidth      =   5265
   StartUpPosition =   1  '所有者中心
   Begin VB.CommandButton Command1 
      Caption         =   "确定"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   4200
      TabIndex        =   1
      Top             =   180
      Width           =   750
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15.75
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      IMEMode         =   3  'DISABLE
      Left            =   1530
      PasswordChar    =   "*"
      TabIndex        =   0
      Top             =   180
      Width           =   2400
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "密码框："
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15.75
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   120
      TabIndex        =   2
      Top             =   210
      Width           =   1395
   End
End
Attribute VB_Name = "Dialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub OKButton_Click()

End Sub

Private Sub Command1_Click()
DialogStart_pub = 0
PASSWORDSET = Text1.Text
If PASSWORDSET = "" Then
    Call EBX5009_1.ResettingALL(False, "myself", &H8000000F)  '锁定界面,clear result
Else
    MsgBox ("对不起,密码错误")
End If
Unload Me
End Sub

Private Sub Form_Load()
DialogStart_pub = 1
PASSWORDSET = ""
End Sub

Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then
Call Command1_Click
End If
End Sub
