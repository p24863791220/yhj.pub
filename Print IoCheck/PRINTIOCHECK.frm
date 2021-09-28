VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6705
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12090
   LinkTopic       =   "Form1"
   ScaleHeight     =   6705
   ScaleWidth      =   12090
   StartUpPosition =   2  '屏幕中心
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   1800
      TabIndex        =   14
      Text            =   "Text3"
      Top             =   1440
      Width           =   7335
   End
   Begin VB.TextBox Text2 
      Height          =   480
      Left            =   6240
      TabIndex        =   13
      Text            =   "Text2"
      Top             =   2010
      Width           =   1560
   End
   Begin VB.CommandButton Port2 
      Caption         =   "1"
      Height          =   405
      Index           =   7
      Left            =   9645
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   2865
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "2"
      Height          =   405
      Index           =   6
      Left            =   8520
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   2865
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "4"
      Height          =   405
      Index           =   5
      Left            =   7365
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   2880
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "8"
      Height          =   405
      Index           =   4
      Left            =   6315
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   2880
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "10"
      Height          =   405
      Index           =   3
      Left            =   5205
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   2880
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "20"
      Height          =   405
      Index           =   2
      Left            =   4125
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   2865
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "40"
      Height          =   405
      Index           =   1
      Left            =   3015
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   2865
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "80"
      Height          =   405
      Index           =   0
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   2850
      Width           =   870
   End
   Begin VB.CommandButton Command9 
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15.75
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   915
      Left            =   6975
      TabIndex        =   4
      Top             =   4455
      Width           =   3225
   End
   Begin VB.TextBox Text1 
      Height          =   525
      Left            =   1770
      TabIndex        =   1
      Top             =   1950
      Width           =   2895
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   2520
      Top             =   4575
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "整体状态"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   5160
      TabIndex        =   16
      Top             =   2160
      Width           =   1020
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "位状态"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   600
      TabIndex        =   15
      Top             =   1440
      Width           =   765
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Print IoChecker"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   36
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   885
      Left            =   105
      TabIndex        =   3
      Top             =   120
      Width           =   11505
   End
   Begin VB.Label Label2 
      Caption         =   "PORT-0  IN"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   15
      TabIndex        =   2
      Top             =   1995
      Width           =   1695
   End
   Begin VB.Label Label2 
      Caption         =   "PORT-2  OUT"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   -90
      TabIndex        =   0
      Top             =   2895
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command9_Click()
Unload Me
End Sub

Private Sub Form_Load()
Call IOini
End Sub

Private Sub Port2_Click(Index As Integer)
Call IOwrite(2, Val("&h" & Port2(Index).Caption))
For i = 0 To 7
Port2(i).BackColor = &H8000000F
Next i
Port2(Index).BackColor = vbRed
End Sub

Private Sub Timer1_Timer()
Text1.Text = IOread
End Sub

