VERSION 5.00
Begin VB.Form PrintForm1 
   AutoRedraw      =   -1  'True
   Caption         =   "5032ATK VCOM IOCHECKER"
   ClientHeight    =   6705
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   LinkMode        =   1  'Source
   LinkTopic       =   "PrintForm"
   ScaleHeight     =   6705
   ScaleWidth      =   11880
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox IOreadText 
      Height          =   480
      Left            =   8700
      TabIndex        =   44
      Top             =   1980
      Width           =   1560
   End
   Begin VB.CommandButton EBX5032Run_2 
      Caption         =   "RUN"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   24
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1800
      TabIndex        =   43
      Top             =   5385
      Width           =   1455
   End
   Begin VB.CommandButton EBX5032Out_2 
      Caption         =   "OUT"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   24
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3735
      TabIndex        =   42
      Top             =   5340
      Width           =   1815
   End
   Begin VB.CommandButton Port37A 
      Caption         =   "8"
      Height          =   405
      Index           =   0
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   3450
      Width           =   870
   End
   Begin VB.CommandButton Port37A 
      Caption         =   "4"
      Height          =   405
      Index           =   1
      Left            =   2970
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   3450
      Width           =   870
   End
   Begin VB.CommandButton Port37A 
      Caption         =   "2"
      Height          =   405
      Index           =   2
      Left            =   4125
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   3435
      Width           =   870
   End
   Begin VB.CommandButton Port37A 
      Caption         =   "1"
      Height          =   405
      Index           =   3
      Left            =   5250
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   3435
      Width           =   870
   End
   Begin VB.TextBox Total37A 
      Height          =   480
      Left            =   8700
      TabIndex        =   20
      Top             =   915
      Width           =   1560
   End
   Begin VB.TextBox Text37A 
      Height          =   495
      Left            =   1800
      TabIndex        =   18
      Top             =   945
      Width           =   5160
   End
   Begin VB.CommandButton InitCommand 
      Caption         =   "初始化"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   18
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   585
      Left            =   2760
      TabIndex        =   17
      Top             =   4575
      Width           =   1320
   End
   Begin VB.CommandButton StartCommand 
      Caption         =   "START"
      Height          =   405
      Left            =   195
      TabIndex        =   16
      Top             =   5070
      Visible         =   0   'False
      Width           =   960
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   450
      Left            =   270
      TabIndex        =   15
      Top             =   4455
      Visible         =   0   'False
      Width           =   1305
   End
   Begin VB.TextBox Text379 
      Height          =   495
      Left            =   1800
      TabIndex        =   12
      Top             =   1440
      Width           =   5160
   End
   Begin VB.TextBox Total379 
      Height          =   480
      Left            =   8700
      TabIndex        =   11
      Top             =   1455
      Width           =   1560
   End
   Begin VB.CommandButton Port2 
      Caption         =   "1"
      Height          =   405
      Index           =   7
      Left            =   9645
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   2865
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "2"
      Height          =   405
      Index           =   6
      Left            =   8520
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   2865
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "4"
      Height          =   405
      Index           =   5
      Left            =   7365
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   2880
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "8"
      Height          =   405
      Index           =   4
      Left            =   6315
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   2880
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "10"
      Height          =   405
      Index           =   3
      Left            =   5205
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   2880
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "20"
      Height          =   405
      Index           =   2
      Left            =   4125
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   2865
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "40"
      Height          =   405
      Index           =   1
      Left            =   3015
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   2865
      Width           =   870
   End
   Begin VB.CommandButton Port2 
      Caption         =   "80"
      Height          =   405
      Index           =   0
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   3
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
      Left            =   6930
      TabIndex        =   2
      Top             =   4650
      Width           =   3225
   End
   Begin VB.Timer Timer1 
      Interval        =   20
      Left            =   2040
      Top             =   5415
   End
   Begin VB.Label Label22 
      AutoSize        =   -1  'True
      Caption         =   "I0read:"
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
      Left            =   7665
      TabIndex        =   45
      Top             =   2130
      Width           =   945
   End
   Begin VB.Label Label21 
      AutoSize        =   -1  'True
      Caption         =   "初始化为高"
      Height          =   180
      Left            =   5340
      TabIndex        =   41
      Top             =   4275
      Width           =   900
   End
   Begin VB.Label Label20 
      AutoSize        =   -1  'True
      Caption         =   "初始化为高"
      Height          =   180
      Left            =   4110
      TabIndex        =   40
      Top             =   4305
      Width           =   900
   End
   Begin VB.Label Label19 
      AutoSize        =   -1  'True
      Caption         =   "初始化为高"
      Height          =   180
      Left            =   1875
      TabIndex        =   39
      Top             =   4290
      Width           =   900
   End
   Begin VB.Label Label18 
      AutoSize        =   -1  'True
      Caption         =   "29"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   9975
      TabIndex        =   38
      Top             =   2520
      Width           =   240
   End
   Begin VB.Label Label17 
      AutoSize        =   -1  'True
      Caption         =   "28"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   8850
      TabIndex        =   37
      Top             =   2535
      Width           =   240
   End
   Begin VB.Label Label16 
      AutoSize        =   -1  'True
      Caption         =   "27"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   7665
      TabIndex        =   36
      Top             =   2550
      Width           =   240
   End
   Begin VB.Label Label15 
      AutoSize        =   -1  'True
      Caption         =   "26"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   6645
      TabIndex        =   35
      Top             =   2535
      Width           =   240
   End
   Begin VB.Label Label14 
      AutoSize        =   -1  'True
      Caption         =   "25"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   5490
      TabIndex        =   34
      Top             =   2505
      Width           =   240
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      Caption         =   "24"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4365
      TabIndex        =   33
      Top             =   2520
      Width           =   240
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      Caption         =   "23"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3180
      TabIndex        =   32
      Top             =   2535
      Width           =   240
   End
   Begin VB.Label Label11 
      AutoSize        =   -1  'True
      Caption         =   "22"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2160
      TabIndex        =   31
      Top             =   2520
      Width           =   240
   End
   Begin VB.Label Label10 
      AutoSize        =   -1  'True
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3300
      TabIndex        =   30
      Top             =   3930
      Width           =   120
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "31"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2190
      TabIndex        =   29
      Top             =   3930
      Width           =   240
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "32"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4410
      TabIndex        =   28
      Top             =   3930
      Width           =   240
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "30"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   5535
      TabIndex        =   27
      Top             =   3915
      Width           =   240
   End
   Begin VB.Label Label2 
      Caption         =   "37A  OUT"
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
      Left            =   495
      TabIndex        =   26
      Top             =   3450
      Width           =   1155
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "37A整体状态:"
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
      Left            =   7080
      TabIndex        =   21
      Top             =   1065
      Width           =   1560
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "37A位状态:"
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
      Left            =   510
      TabIndex        =   19
      Top             =   1095
      Width           =   1305
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "379整体状态:"
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
      Left            =   7110
      TabIndex        =   14
      Top             =   1605
      Width           =   1560
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "379位状态:"
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
      Left            =   450
      TabIndex        =   13
      Top             =   1545
      Width           =   1305
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "IoChecker"
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
      TabIndex        =   1
      Top             =   120
      Width           =   11505
   End
   Begin VB.Label Label2 
      Caption         =   "378  OUT"
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
      Left            =   525
      TabIndex        =   0
      Top             =   2880
      Width           =   1155
   End
End
Attribute VB_Name = "PrintForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim A As Long
Dim B As Long
Dim Port_2 As Integer
Private Sub Command1_Click()
Do
'DoEvents
A = A + 1
If GetPortBit(&H379, 6) = False Then
B = 1
End If
Call IOwrite(2, 0)
Call IOwrite(2, Val("&h" & "FF"))
Loop Until A > 200000000
End Sub

Private Sub Command9_Click()
Unload Me
End Sub



Private Sub EBX5032Out_2_Click()
EBX5032Out_Click
End Sub

Private Sub EBX5032Run_2_Click()
EBX5032Run_Click
End Sub

Private Sub Form_Load()
On Error Resume Next
Port_2 = 0
'    DIOINIT 'io初始化
Call IOini
End Sub

Private Sub InitCommand_Click()
Call IOini
For i = 0 To 3
Port37A(i).BackColor = &H8000000F
Next i
For i = 0 To 7
Port2(i).BackColor = &H8000000F
Next i
End Sub

Private Sub Port2_Click(Index As Integer)
If Port2(Index).BackColor = vbRed Then
Port_2 = Port_2 - Val("&h" & Port2(Index).Caption)
Call IOwrite(2, Port_2)
Port2(Index).BackColor = &H8000000F
Else
Port_2 = Port_2 + Val("&h" & Port2(Index).Caption)
Call IOwrite(2, Port_2)
Port2(Index).BackColor = vbRed
End If
End Sub

Private Sub Port37A_Click(Index As Integer)
Call IOwrite(1, Val("&h" & Port37A(Index).Caption))
For i = 0 To 3
Port37A(i).BackColor = &H8000000F
Next i
Port37A(Index).BackColor = vbRed
End Sub

Private Sub StartCommand_Click()
If StartCommand.Caption = "START" Then
StartCommand.Caption = "END"
A = 1
Else
StartCommand.Caption = "START"
A = 0
End If
End Sub

Private Sub Timer1_Timer()
Call IOread
End Sub

