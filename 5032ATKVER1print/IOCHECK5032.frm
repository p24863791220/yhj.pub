VERSION 5.00
Begin VB.Form IOCHECK5032 
   Caption         =   "IOCHECKER"
   ClientHeight    =   8490
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   566
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   792
   StartUpPosition =   2  '屏幕中心
   Begin VB.CommandButton Control_Command 
      Caption         =   "开始"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   600
      Left            =   6210
      TabIndex        =   132
      Top             =   7620
      Width           =   1680
   End
   Begin VB.CommandButton EBX5032Out 
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
      Left            =   3915
      TabIndex        =   115
      Top             =   7605
      Width           =   1815
   End
   Begin VB.CommandButton EBX5032Run 
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
      Left            =   1995
      TabIndex        =   114
      Top             =   7590
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   0
      Top             =   0
   End
   Begin VB.TextBox TotalSIXTEEN 
      Enabled         =   0   'False
      Height          =   375
      Index           =   5
      Left            =   11070
      TabIndex        =   78
      Text            =   "0"
      Top             =   5850
      Width           =   735
   End
   Begin VB.TextBox TotalSIXTEEN 
      Enabled         =   0   'False
      Height          =   375
      Index           =   4
      Left            =   11070
      TabIndex        =   77
      Text            =   "0"
      Top             =   5010
      Width           =   735
   End
   Begin VB.TextBox TotalSIXTEEN 
      Enabled         =   0   'False
      Height          =   375
      Index           =   3
      Left            =   11070
      TabIndex        =   76
      Text            =   "0"
      Top             =   4155
      Width           =   735
   End
   Begin VB.TextBox TotalSIXTEEN 
      Enabled         =   0   'False
      Height          =   375
      Index           =   2
      Left            =   11100
      TabIndex        =   75
      Text            =   "0"
      Top             =   2850
      Width           =   735
   End
   Begin VB.TextBox TotalSIXTEEN 
      Enabled         =   0   'False
      Height          =   375
      Index           =   1
      Left            =   11100
      TabIndex        =   74
      Text            =   "0"
      Top             =   2025
      Width           =   735
   End
   Begin VB.TextBox TotalSIXTEEN 
      Enabled         =   0   'False
      Height          =   375
      Index           =   0
      Left            =   11100
      TabIndex        =   73
      Text            =   "0"
      Top             =   1080
      Width           =   735
   End
   Begin VB.CommandButton Clear 
      Caption         =   "全部清除"
      Height          =   495
      Index           =   6
      Left            =   10095
      TabIndex        =   72
      Top             =   6465
      Width           =   1215
   End
   Begin VB.CommandButton Clear 
      Caption         =   "清除"
      Height          =   495
      Index           =   5
      Left            =   10110
      TabIndex        =   70
      Top             =   5805
      Width           =   855
   End
   Begin VB.CommandButton Clear 
      Caption         =   "清除"
      Height          =   495
      Index           =   4
      Left            =   10110
      TabIndex        =   68
      Top             =   4995
      Width           =   855
   End
   Begin VB.CommandButton Clear 
      Caption         =   "清除"
      Height          =   495
      Index           =   3
      Left            =   10110
      TabIndex        =   66
      Top             =   4155
      Width           =   855
   End
   Begin VB.CommandButton Clear 
      Caption         =   "清除"
      Height          =   495
      Index           =   2
      Left            =   10155
      TabIndex        =   64
      Top             =   2805
      Width           =   855
   End
   Begin VB.CommandButton Clear 
      Caption         =   "清除"
      Height          =   495
      Index           =   1
      Left            =   10155
      TabIndex        =   62
      Top             =   1980
      Width           =   855
   End
   Begin VB.CommandButton Clear 
      Caption         =   "清除"
      Height          =   495
      Index           =   0
      Left            =   10140
      TabIndex        =   60
      Top             =   1080
      Width           =   855
   End
   Begin VB.CommandButton Command10 
      Caption         =   "READ"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1770
      Style           =   1  'Graphical
      TabIndex        =   58
      Top             =   6495
      Width           =   650
   End
   Begin VB.CommandButton Command9 
      Caption         =   "EXIT"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   8205
      TabIndex        =   55
      Top             =   6420
      Width           =   650
   End
   Begin VB.CommandButton Command8 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   8205
      Style           =   1  'Graphical
      TabIndex        =   54
      Top             =   5790
      Width           =   650
   End
   Begin VB.CommandButton Command7 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   7305
      Style           =   1  'Graphical
      TabIndex        =   53
      Top             =   5790
      Width           =   650
   End
   Begin VB.CommandButton Command6 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   6360
      Style           =   1  'Graphical
      TabIndex        =   52
      Top             =   5790
      Width           =   650
   End
   Begin VB.CommandButton Command5 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   5430
      Style           =   1  'Graphical
      TabIndex        =   51
      Top             =   5790
      Width           =   650
   End
   Begin VB.CommandButton Command4 
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   4470
      Style           =   1  'Graphical
      TabIndex        =   50
      Top             =   5790
      Width           =   650
   End
   Begin VB.CommandButton Command3 
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   3615
      Style           =   1  'Graphical
      TabIndex        =   49
      Top             =   5790
      Width           =   650
   End
   Begin VB.CommandButton Command2 
      Caption         =   "40"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   2670
      Style           =   1  'Graphical
      TabIndex        =   48
      Top             =   5790
      Width           =   650
   End
   Begin VB.CommandButton Command1 
      Caption         =   "80"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   1770
      Style           =   1  'Graphical
      TabIndex        =   47
      Top             =   5790
      Width           =   650
   End
   Begin VB.CommandButton Command8 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   8205
      Style           =   1  'Graphical
      TabIndex        =   45
      Top             =   4965
      Width           =   650
   End
   Begin VB.CommandButton Command7 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   7305
      Style           =   1  'Graphical
      TabIndex        =   44
      Top             =   4965
      Width           =   650
   End
   Begin VB.CommandButton Command6 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   6360
      Style           =   1  'Graphical
      TabIndex        =   43
      Top             =   4965
      Width           =   650
   End
   Begin VB.CommandButton Command5 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   5430
      Style           =   1  'Graphical
      TabIndex        =   42
      Top             =   4965
      Width           =   650
   End
   Begin VB.CommandButton Command4 
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   4470
      Style           =   1  'Graphical
      TabIndex        =   41
      Top             =   4965
      Width           =   650
   End
   Begin VB.CommandButton Command3 
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   3615
      Style           =   1  'Graphical
      TabIndex        =   40
      Top             =   4965
      Width           =   650
   End
   Begin VB.CommandButton Command2 
      Caption         =   "40"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   2670
      Style           =   1  'Graphical
      TabIndex        =   39
      Top             =   4965
      Width           =   650
   End
   Begin VB.CommandButton Command1 
      Caption         =   "80"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   1770
      Style           =   1  'Graphical
      TabIndex        =   38
      Top             =   4965
      Width           =   650
   End
   Begin VB.CommandButton Command8 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   8205
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   4155
      Width           =   650
   End
   Begin VB.CommandButton Command7 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   7305
      Style           =   1  'Graphical
      TabIndex        =   35
      Top             =   4155
      Width           =   650
   End
   Begin VB.CommandButton Command6 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   6360
      Style           =   1  'Graphical
      TabIndex        =   34
      Top             =   4155
      Width           =   650
   End
   Begin VB.CommandButton Command5 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   5430
      Style           =   1  'Graphical
      TabIndex        =   33
      Top             =   4155
      Width           =   650
   End
   Begin VB.CommandButton Command4 
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   4470
      Style           =   1  'Graphical
      TabIndex        =   32
      Top             =   4155
      Width           =   650
   End
   Begin VB.CommandButton Command3 
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   3615
      Style           =   1  'Graphical
      TabIndex        =   31
      Top             =   4155
      Width           =   650
   End
   Begin VB.CommandButton Command2 
      Caption         =   "40"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   2640
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   4155
      Width           =   650
   End
   Begin VB.CommandButton Command1 
      Caption         =   "80"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   1770
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   4155
      Width           =   650
   End
   Begin VB.CommandButton Command8 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   2
      Left            =   8205
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   2820
      Width           =   650
   End
   Begin VB.CommandButton Command7 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   2
      Left            =   7305
      Style           =   1  'Graphical
      TabIndex        =   26
      Top             =   2820
      Width           =   650
   End
   Begin VB.CommandButton Command6 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   2
      Left            =   6360
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   2820
      Width           =   650
   End
   Begin VB.CommandButton Command5 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   2
      Left            =   5430
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   2820
      Width           =   650
   End
   Begin VB.CommandButton Command4 
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   2
      Left            =   4485
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   2820
      Width           =   650
   End
   Begin VB.CommandButton Command3 
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   2
      Left            =   3615
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   2820
      Width           =   650
   End
   Begin VB.CommandButton Command2 
      Caption         =   "40"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   2
      Left            =   2670
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   2820
      Width           =   650
   End
   Begin VB.CommandButton Command1 
      Caption         =   "80"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   2
      Left            =   1770
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   2820
      Width           =   650
   End
   Begin VB.CommandButton Command8 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   1
      Left            =   8205
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   1965
      Width           =   650
   End
   Begin VB.CommandButton Command7 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   1
      Left            =   7305
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   1965
      Width           =   650
   End
   Begin VB.CommandButton Command6 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   1
      Left            =   6360
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   1965
      Width           =   650
   End
   Begin VB.CommandButton Command5 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   1
      Left            =   5430
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   1965
      Width           =   650
   End
   Begin VB.CommandButton Command4 
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   1
      Left            =   4485
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   1965
      Width           =   650
   End
   Begin VB.CommandButton Command3 
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   1
      Left            =   3615
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   1965
      Width           =   650
   End
   Begin VB.CommandButton Command2 
      Caption         =   "40"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   1
      Left            =   2670
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   1965
      Width           =   650
   End
   Begin VB.CommandButton Command1 
      Caption         =   "80"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   1
      Left            =   1770
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   1965
      Width           =   650
   End
   Begin VB.CommandButton Command8 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   8205
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   1080
      Width           =   650
   End
   Begin VB.CommandButton Command7 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   7305
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   1080
      Width           =   650
   End
   Begin VB.CommandButton Command6 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   6360
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   1080
      Width           =   650
   End
   Begin VB.CommandButton Command5 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   5430
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   1080
      Width           =   650
   End
   Begin VB.CommandButton Command4 
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   4485
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   1080
      Width           =   650
   End
   Begin VB.CommandButton Command3 
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   3615
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1080
      Width           =   650
   End
   Begin VB.CommandButton Command2 
      Caption         =   "40"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   2670
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1080
      Width           =   650
   End
   Begin VB.CommandButton Command1 
      Caption         =   "80"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   1770
      MaskColor       =   &H8000000F&
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1080
      Width           =   650
   End
   Begin VB.Frame Frame1 
      Caption         =   "CN1"
      Height          =   2805
      Left            =   1545
      TabIndex        =   56
      Top             =   570
      Width           =   7500
      Begin VB.Label Label6 
         Caption         =   "IN8"
         Height          =   255
         Index           =   24
         Left            =   420
         TabIndex        =   123
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "IN7"
         Height          =   255
         Index           =   25
         Left            =   1275
         TabIndex        =   122
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "IN6"
         Height          =   255
         Index           =   26
         Left            =   2220
         TabIndex        =   121
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "IN5"
         Height          =   255
         Index           =   27
         Left            =   3105
         TabIndex        =   120
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "IN4"
         Height          =   255
         Index           =   28
         Left            =   4065
         TabIndex        =   119
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "IN3"
         Height          =   255
         Index           =   29
         Left            =   4935
         TabIndex        =   118
         Top             =   285
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "IN2"
         Height          =   255
         Index           =   30
         Left            =   5910
         TabIndex        =   117
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "IN1"
         Height          =   255
         Index           =   31
         Left            =   6795
         TabIndex        =   116
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY17"
         Height          =   255
         Index           =   23
         Left            =   6810
         TabIndex        =   96
         Top             =   2010
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY18"
         Height          =   255
         Index           =   22
         Left            =   5880
         TabIndex        =   95
         Top             =   2025
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY19"
         Height          =   255
         Index           =   21
         Left            =   4920
         TabIndex        =   94
         Top             =   2010
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY20"
         Height          =   255
         Index           =   20
         Left            =   4035
         TabIndex        =   93
         Top             =   2025
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY21"
         Height          =   255
         Index           =   19
         Left            =   3060
         TabIndex        =   92
         Top             =   2010
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY22"
         Height          =   255
         Index           =   18
         Left            =   2160
         TabIndex        =   91
         Top             =   2010
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY23"
         Height          =   255
         Index           =   17
         Left            =   1245
         TabIndex        =   90
         Top             =   2010
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY24"
         Height          =   255
         Index           =   16
         Left            =   600
         TabIndex        =   89
         Top             =   2010
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY9"
         Height          =   255
         Index           =   7
         Left            =   6855
         TabIndex        =   88
         Top             =   1140
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY10"
         Height          =   255
         Index           =   6
         Left            =   5880
         TabIndex        =   87
         Top             =   1155
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY11"
         Height          =   255
         Index           =   5
         Left            =   4920
         TabIndex        =   86
         Top             =   1140
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY12"
         Height          =   255
         Index           =   4
         Left            =   4005
         TabIndex        =   85
         Top             =   1140
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY13"
         Height          =   255
         Index           =   3
         Left            =   3060
         TabIndex        =   84
         Top             =   1140
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY14"
         Height          =   255
         Index           =   2
         Left            =   2160
         TabIndex        =   83
         Top             =   1140
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY15"
         Height          =   255
         Index           =   1
         Left            =   1245
         TabIndex        =   82
         Top             =   1140
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY16"
         Height          =   255
         Index           =   0
         Left            =   600
         TabIndex        =   81
         Top             =   1140
         Width           =   495
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "CN2"
      Height          =   3480
      Left            =   1500
      TabIndex        =   57
      Top             =   3615
      Width           =   7530
      Begin VB.Label Label6 
         Caption         =   "RY8"
         Height          =   255
         Index           =   8
         Left            =   495
         TabIndex        =   131
         Top             =   270
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY7"
         Height          =   255
         Index           =   9
         Left            =   1335
         TabIndex        =   130
         Top             =   270
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY6"
         Height          =   255
         Index           =   10
         Left            =   2220
         TabIndex        =   129
         Top             =   270
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY5"
         Height          =   255
         Index           =   11
         Left            =   3105
         TabIndex        =   128
         Top             =   285
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY4"
         Height          =   255
         Index           =   12
         Left            =   4110
         TabIndex        =   127
         Top             =   270
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY3"
         Height          =   255
         Index           =   13
         Left            =   4980
         TabIndex        =   126
         Top             =   270
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY2"
         Height          =   255
         Index           =   14
         Left            =   5925
         TabIndex        =   125
         Top             =   285
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY1"
         Height          =   255
         Index           =   15
         Left            =   6825
         TabIndex        =   124
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY25"
         Height          =   255
         Index           =   47
         Left            =   6810
         TabIndex        =   112
         Top             =   1965
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY26"
         Height          =   255
         Index           =   46
         Left            =   5925
         TabIndex        =   111
         Top             =   1965
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY27"
         Height          =   255
         Index           =   45
         Left            =   4995
         TabIndex        =   110
         Top             =   1980
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY28"
         Height          =   255
         Index           =   44
         Left            =   4050
         TabIndex        =   109
         Top             =   1965
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY29"
         Height          =   255
         Index           =   43
         Left            =   3120
         TabIndex        =   108
         Top             =   1965
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY30"
         Height          =   255
         Index           =   42
         Left            =   2235
         TabIndex        =   107
         Top             =   1965
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY31"
         Height          =   255
         Index           =   41
         Left            =   1305
         TabIndex        =   106
         Top             =   1965
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY32"
         Height          =   255
         Index           =   40
         Left            =   420
         TabIndex        =   105
         Top             =   1965
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY33"
         Height          =   255
         Index           =   39
         Left            =   2220
         TabIndex        =   104
         Top             =   1155
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY34"
         Height          =   255
         Index           =   38
         Left            =   1290
         TabIndex        =   103
         Top             =   1155
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY35"
         Height          =   255
         Index           =   37
         Left            =   435
         TabIndex        =   102
         Top             =   1155
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY36"
         Height          =   255
         Index           =   36
         Left            =   6795
         TabIndex        =   101
         Top             =   1155
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY37"
         Height          =   255
         Index           =   35
         Left            =   5910
         TabIndex        =   100
         Top             =   1155
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY38"
         Height          =   255
         Index           =   34
         Left            =   4980
         TabIndex        =   99
         Top             =   1140
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY39"
         Height          =   255
         Index           =   33
         Left            =   4095
         TabIndex        =   98
         Top             =   1125
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "RY40"
         Height          =   255
         Index           =   32
         Left            =   3090
         TabIndex        =   97
         Top             =   1155
         Width           =   495
      End
   End
   Begin VB.Label Total 
      Alignment       =   2  'Center
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   6
      Left            =   9120
      TabIndex        =   113
      Top             =   3600
      Width           =   1695
   End
   Begin VB.Label Label5 
      Caption         =   "SIXTEEN"
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
      Left            =   9135
      TabIndex        =   80
      Top             =   600
      Width           =   975
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "TEN"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   11220
      TabIndex        =   79
      Top             =   600
      Width           =   495
   End
   Begin VB.Label Total 
      Alignment       =   2  'Center
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   5
      Left            =   9090
      TabIndex        =   71
      Top             =   5805
      Width           =   975
   End
   Begin VB.Label Total 
      Alignment       =   2  'Center
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   4
      Left            =   9105
      TabIndex        =   69
      Top             =   4980
      Width           =   975
   End
   Begin VB.Label Total 
      Alignment       =   2  'Center
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   3
      Left            =   9105
      TabIndex        =   67
      Top             =   4155
      Width           =   975
   End
   Begin VB.Label Total 
      Alignment       =   2  'Center
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   2
      Left            =   9135
      TabIndex        =   65
      Top             =   2820
      Width           =   975
   End
   Begin VB.Label Total 
      Alignment       =   2  'Center
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   1
      Left            =   9135
      TabIndex        =   63
      Top             =   1980
      Width           =   975
   End
   Begin VB.Label Total 
      Alignment       =   2  'Center
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   0
      Left            =   9135
      TabIndex        =   61
      Top             =   1080
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "2010 DEC Seigi TOWADA China Co."
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
      Left            =   4785
      TabIndex        =   59
      Top             =   7125
      Width           =   4230
   End
   Begin VB.Label Label2 
      Caption         =   "PORT-5  OUT"
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
      Index           =   5
      Left            =   75
      TabIndex        =   46
      Top             =   5865
      Width           =   1365
   End
   Begin VB.Label Label2 
      Caption         =   "PORT-4  OUT"
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
      Index           =   4
      Left            =   105
      TabIndex        =   37
      Top             =   5040
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "PORT-3  OUT"
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
      Index           =   3
      Left            =   90
      TabIndex        =   28
      Top             =   4275
      Width           =   1350
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
      Left            =   90
      TabIndex        =   19
      Top             =   2910
      Width           =   1365
   End
   Begin VB.Label Label2 
      Caption         =   "PORT-1  OUT"
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
      Index           =   1
      Left            =   75
      TabIndex        =   10
      Top             =   2010
      Width           =   1395
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
      Left            =   120
      TabIndex        =   1
      Top             =   1200
      Width           =   1365
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H0080FF80&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "5032 ATK PIO Data Check"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   21.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3810
      TabIndex        =   0
      Top             =   60
      Width           =   5895
   End
End
Attribute VB_Name = "IOCHECK5032"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim SetIn As Integer

Private Sub Clear_Click(Index As Integer)
Dim i As Integer
Select Case Index
Case 0
Total(0).Caption = 0
TotalSIXTEEN(0).Text = 0
Call IOwrite(0, 0)
 Command1(Index).Caption = "80"
 Command1(Index).BackColor = &H8000000F
  Command2(Index).Caption = "40"
 Command2(Index).BackColor = &H8000000F
  Command3(Index).Caption = "20"
 Command3(Index).BackColor = &H8000000F
  Command4(Index).Caption = "10"
 Command4(Index).BackColor = &H8000000F
  Command5(Index).Caption = "8"
 Command5(Index).BackColor = &H8000000F
  Command6(Index).Caption = "4"
 Command6(Index).BackColor = &H8000000F
  Command7(Index).Caption = "2"
 Command7(Index).BackColor = &H8000000F
  Command8(Index).Caption = "1"
 Command8(Index).BackColor = &H8000000F
Case 1
Total(1).Caption = 0
TotalSIXTEEN(1).Text = 0
Call IOwrite(1, 0)
 Command1(Index).Caption = "80"
 Command1(Index).BackColor = &H8000000F
  Command2(Index).Caption = "40"
 Command2(Index).BackColor = &H8000000F
  Command3(Index).Caption = "20"
 Command3(Index).BackColor = &H8000000F
  Command4(Index).Caption = "10"
 Command4(Index).BackColor = &H8000000F
  Command5(Index).Caption = "8"
 Command5(Index).BackColor = &H8000000F
  Command6(Index).Caption = "4"
 Command6(Index).BackColor = &H8000000F
  Command7(Index).Caption = "2"
 Command7(Index).BackColor = &H8000000F
  Command8(Index).Caption = "1"
 Command8(Index).BackColor = &H8000000F
Case 2
Total(2).Caption = 0
TotalSIXTEEN(2).Text = 0
Call IOwrite(2, 0)
 Command1(Index).Caption = "80"
 Command1(Index).BackColor = &H8000000F
  Command2(Index).Caption = "40"
 Command2(Index).BackColor = &H8000000F
  Command3(Index).Caption = "20"
 Command3(Index).BackColor = &H8000000F
  Command4(Index).Caption = "10"
 Command4(Index).BackColor = &H8000000F
  Command5(Index).Caption = "8"
 Command5(Index).BackColor = &H8000000F
  Command6(Index).Caption = "4"
 Command6(Index).BackColor = &H8000000F
  Command7(Index).Caption = "2"
 Command7(Index).BackColor = &H8000000F
  Command8(Index).Caption = "1"
 Command8(Index).BackColor = &H8000000F
Case 3
Total(3).Caption = 0
TotalSIXTEEN(3).Text = 0
Call IOwrite(3, 0)
 Command1(Index).Caption = "80"
 Command1(Index).BackColor = &H8000000F
  Command2(Index).Caption = "40"
 Command2(Index).BackColor = &H8000000F
  Command3(Index).Caption = "20"
 Command3(Index).BackColor = &H8000000F
  Command4(Index).Caption = "10"
 Command4(Index).BackColor = &H8000000F
  Command5(Index).Caption = "8"
 Command5(Index).BackColor = &H8000000F
  Command6(Index).Caption = "4"
 Command6(Index).BackColor = &H8000000F
  Command7(Index).Caption = "2"
 Command7(Index).BackColor = &H8000000F
  Command8(Index).Caption = "1"
 Command8(Index).BackColor = &H8000000F
Case 4
Total(4).Caption = 0
TotalSIXTEEN(4).Text = 0
Call IOwrite(4, 0)
 Command1(Index).Caption = "80"
 Command1(Index).BackColor = &H8000000F
  Command2(Index).Caption = "40"
 Command2(Index).BackColor = &H8000000F
  Command3(Index).Caption = "20"
 Command3(Index).BackColor = &H8000000F
  Command4(Index).Caption = "10"
 Command4(Index).BackColor = &H8000000F
  Command5(Index).Caption = "8"
 Command5(Index).BackColor = &H8000000F
  Command6(Index).Caption = "4"
 Command6(Index).BackColor = &H8000000F
  Command7(Index).Caption = "2"
 Command7(Index).BackColor = &H8000000F
  Command8(Index).Caption = "1"
 Command8(Index).BackColor = &H8000000F
Case 5
Total(5).Caption = 0
TotalSIXTEEN(5).Text = 0
Call IOwrite(5, 0)
 Command1(Index).Caption = "80"
 Command1(Index).BackColor = &H8000000F
  Command2(Index).Caption = "40"
 Command2(Index).BackColor = &H8000000F
  Command3(Index).Caption = "20"
 Command3(Index).BackColor = &H8000000F
  Command4(Index).Caption = "10"
 Command4(Index).BackColor = &H8000000F
  Command5(Index).Caption = "8"
 Command5(Index).BackColor = &H8000000F
  Command6(Index).Caption = "4"
 Command6(Index).BackColor = &H8000000F
  Command7(Index).Caption = "2"
 Command7(Index).BackColor = &H8000000F
  Command8(Index).Caption = "1"
 Command8(Index).BackColor = &H8000000F
Case 6
Total(0).Caption = 0
Call IOwrite(0, 0)
Total(1).Caption = 0
Call IOwrite(1, 0)
Total(2).Caption = 0
Call IOwrite(2, 0)
Total(3).Caption = 0
Call IOwrite(3, 0)
Total(4).Caption = 0
Call IOwrite(4, 0)
Total(5).Caption = 0
Call IOwrite(5, 0)
TotalSIXTEEN(0).Text = 0
TotalSIXTEEN(1).Text = 0
TotalSIXTEEN(2).Text = 0
TotalSIXTEEN(3).Text = 0
TotalSIXTEEN(4).Text = 0
TotalSIXTEEN(5).Text = 0
For i = 0 To 5
 Command1(i).Caption = "80"
 Command1(i).BackColor = &H8000000F
  Command2(i).Caption = "40"
 Command2(i).BackColor = &H8000000F
  Command3(i).Caption = "20"
 Command3(i).BackColor = &H8000000F
  Command4(i).Caption = "10"
 Command4(i).BackColor = &H8000000F
  Command5(i).Caption = "8"
 Command5(i).BackColor = &H8000000F
  Command6(i).Caption = "4"
 Command6(i).BackColor = &H8000000F
  Command7(i).Caption = "2"
 Command7(i).BackColor = &H8000000F
  Command8(i).Caption = "1"
 Command8(i).BackColor = &H8000000F
 Next i
End Select
End Sub

Private Sub Command10_Click()
If Command10.Caption = "READ" Then
 Command10.Caption = "ON"
 Command10.BackColor = &HFF
Else
 Command10.Caption = "READ"
 Command10.BackColor = &H8000000F
 End If
Do
 IOin = IOread
 TotalSIXTEEN(0).Text = IOin
 IOREAD_ch (0)
 DoEvents
 Loop Until Command10.Caption = "READ"
End Sub

Private Sub Command1_Click(Index As Integer)
Select Case Index
Case 0
If Command1(0).Caption = "80" Then
 Command1(0).Caption = "ON"
  Command1(0).BackColor = &HFF
 TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) + 128
 Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
Else
 Command1(0).Caption = "80"
 Command1(0).BackColor = &H8000000F
  TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) - 128
  Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
End If
Case 1
If Command1(1).Caption = "80" Then
Command1(1).Caption = "ON"
  Command1(1).BackColor = &HFF
 TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) + 128
 Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
Else
 Command1(1).Caption = "80"
 Command1(1).BackColor = &H8000000F
  TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) - 128
  Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
End If
Case 2
 If Command1(2).Caption = "80" Then
 Command1(2).Caption = "ON"
 Command1(2).BackColor = &HFF
  TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) + 128
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
Else
 Command1(2).Caption = "80"
 Command1(2).BackColor = &H8000000F
 TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) - 128
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
End If
Case 3
'If InStr(1, Label2(3).Caption, "IN", vbTextCompare) < 1 Then Exit Sub
 If Command1(3).Caption = "80" Then
 Command1(3).Caption = "ON"
 Command1(3).BackColor = &HFF
  TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) + 128
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
Else
 Command1(3).Caption = "40"
 Command1(3).BackColor = &H8000000F
 TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) - 128
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
End If
Case 4
 If Command1(4).Caption = "80" Then
 Command1(4).Caption = "ON"
 Command1(4).BackColor = &HFF
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) + 128
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
Else
 Command1(4).Caption = "80"
 Command1(4).BackColor = &H8000000F
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) - 128
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
End If
Case 5
If Command1(5).Caption = "80" Then
 Command1(5).Caption = "ON"
 Command1(5).BackColor = &HFF
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) + 128
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
Else
 Command1(5).Caption = "80"
 Command1(5).BackColor = &H8000000F
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) - 128
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
End If
End Select
End Sub



Private Sub Command2_Click(Index As Integer)
Select Case Index
Case 0
If Command2(0).Caption = "40" Then
 Command2(0).Caption = "ON"
  Command2(0).BackColor = &HFF
 TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) + 64
 Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
Else
 Command2(0).Caption = "40"
 Command2(0).BackColor = &H8000000F
  TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) - 64
  Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
End If
Case 1
If Command2(1).Caption = "40" Then
Command2(1).Caption = "ON"
  Command2(1).BackColor = &HFF
 TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) + 64
 Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
Else
 Command2(1).Caption = "40"
 Command2(1).BackColor = &H8000000F
  TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) - 64
  Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
End If
Case 2
 If Command2(2).Caption = "40" Then
 Command2(2).Caption = "ON"
 Command2(2).BackColor = &HFF
  TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) + 64
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
Else
 Command2(2).Caption = "40"
 Command2(2).BackColor = &H8000000F
 TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) - 64
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
End If
Case 3
'If InStr(1, Label2(3).Caption, "IN", vbTextCompare) < 1 Then Exit Sub
 If Command2(3).Caption = "40" Then
 Command2(3).Caption = "ON"
 Command2(3).BackColor = &HFF
  TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) + 64
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
Else
 Command2(3).Caption = "40"
 Command2(3).BackColor = &H8000000F
 TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) - 64
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
End If
Case 4
 If Command2(4).Caption = "40" Then
 Command2(4).Caption = "ON"
 Command2(4).BackColor = &HFF
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) + 64
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
Else
 Command2(4).Caption = "40"
 Command2(4).BackColor = &H8000000F
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) - 64
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
End If
Case 5
If Command2(5).Caption = "40" Then
 Command2(5).Caption = "ON"
 Command2(5).BackColor = &HFF
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) + 64
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
Else
 Command2(5).Caption = "40"
 Command2(5).BackColor = &H8000000F
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) - 64
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
End If
End Select
End Sub
Private Sub Command3_Click(Index As Integer)
Select Case Index
Case 0
If Command3(0).Caption = "20" Then
 Command3(0).Caption = "ON"
  Command3(0).BackColor = &HFF
 TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) + 32
 Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
Else
 Command3(0).Caption = "20"
 Command3(0).BackColor = &H8000000F
  TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) - 32
  Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
End If
Case 1
If Command3(1).Caption = "20" Then
Command3(1).Caption = "ON"
  Command3(1).BackColor = &HFF
 TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) + 32
 Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
Else
 Command3(1).Caption = "20"
 Command3(1).BackColor = &H8000000F
  TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) - 32
  Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
End If
Case 2
 If Command3(2).Caption = "20" Then
 Command3(2).Caption = "ON"
 Command3(2).BackColor = &HFF
  TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) + 32
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
Else
 Command3(2).Caption = "20"
 Command3(2).BackColor = &H8000000F
 TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) - 32
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
End If
Case 3
'If InStr(1, Label2(3).Caption, "IN", vbTextCompare) < 1 Then Exit Sub
 If Command3(3).Caption = "20" Then
 Command3(3).Caption = "ON"
 Command3(3).BackColor = &HFF
  TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) + 32
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
Else
 Command3(3).Caption = "20"
 Command3(3).BackColor = &H8000000F
 TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) - 32
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
End If
Case 4
 If Command3(4).Caption = "20" Then
 Command3(4).Caption = "ON"
 Command3(4).BackColor = &HFF
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) + 32
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
Else
 Command3(4).Caption = "20"
 Command3(4).BackColor = &H8000000F
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) - 32
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
End If
Case 5
If Command3(5).Caption = "20" Then
 Command3(5).Caption = "ON"
 Command3(5).BackColor = &HFF
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) + 32
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
Else
 Command3(5).Caption = "20"
 Command3(5).BackColor = &H8000000F
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) - 32
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
End If
End Select
End Sub
Private Sub Command4_Click(Index As Integer)
Select Case Index
Case 0
If Command4(0).Caption = "10" Then
 Command4(0).Caption = "ON"
  Command4(0).BackColor = &HFF
 TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) + 16
 Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
Else
 Command4(0).Caption = "10"
 Command4(0).BackColor = &H8000000F
  TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) - 16
  Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
End If
Case 1
If Command4(1).Caption = "10" Then
Command4(1).Caption = "ON"
  Command4(1).BackColor = &HFF
 TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) + 16
 Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
Else
 Command4(1).Caption = "10"
 Command4(1).BackColor = &H8000000F
  TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) - 16
  Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
End If
Case 2
 If Command4(2).Caption = "10" Then
 Command4(2).Caption = "ON"
 Command4(2).BackColor = &HFF
  TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) + 16
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
Else
 Command4(2).Caption = "10"
 Command4(2).BackColor = &H8000000F
 TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) - 16
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
End If
Case 3
'If InStr(1, Label2(3).Caption, "IN", vbTextCompare) < 1 Then Exit Sub
 If Command4(3).Caption = "10" Then
 Command4(3).Caption = "ON"
 Command4(3).BackColor = &HFF
  TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) + 16
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
Else
 Command4(3).Caption = "10"
 Command4(3).BackColor = &H8000000F
 TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) - 16
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
End If
Case 4
 If Command4(4).Caption = "10" Then
 Command4(4).Caption = "ON"
 Command4(4).BackColor = &HFF
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) + 16
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
Else
 Command4(4).Caption = "10"
 Command4(4).BackColor = &H8000000F
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) - 16
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
End If
Case 5
If Command4(5).Caption = "10" Then
 Command4(5).Caption = "ON"
 Command4(5).BackColor = &HFF
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) + 16
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
Else
 Command4(5).Caption = "10"
 Command4(5).BackColor = &H8000000F
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) - 16
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
End If
End Select
End Sub
Private Sub Command5_Click(Index As Integer)
Select Case Index
Case 0
If Command5(0).Caption = "8" Then
 Command5(0).Caption = "ON"
  Command5(0).BackColor = &HFF
 TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) + 8
 Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
Else
 Command5(0).Caption = "8"
 Command5(0).BackColor = &H8000000F
  TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) - 8
  Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
End If
Case 1
If Command5(1).Caption = "8" Then
Command5(1).Caption = "ON"
  Command5(1).BackColor = &HFF
 TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) + 8
 Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
Else
 Command5(1).Caption = "8"
 Command5(1).BackColor = &H8000000F
  TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) - 8
  Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
End If
Case 2
 If Command5(2).Caption = "8" Then
 Command5(2).Caption = "ON"
 Command5(2).BackColor = &HFF
  TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) + 8
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
Else
 Command5(2).Caption = "8"
 Command5(2).BackColor = &H8000000F
 TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) - 8
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
End If
Case 3
'If InStr(1, Label2(3).Caption, "IN", vbTextCompare) < 1 Then Exit Sub
 If Command5(3).Caption = "8" Then
 Command5(3).Caption = "ON"
 Command5(3).BackColor = &HFF
  TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) + 8
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
Else
 Command5(3).Caption = "8"
 Command5(3).BackColor = &H8000000F
 TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) - 8
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
End If
Case 4
 If Command5(4).Caption = "8" Then
 Command5(4).Caption = "ON"
 Command5(4).BackColor = &HFF
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) + 8
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
Else
 Command5(4).Caption = "8"
 Command5(4).BackColor = &H8000000F
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) - 8
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
End If
Case 5
If Command5(5).Caption = "8" Then
 Command5(5).Caption = "ON"
 Command5(5).BackColor = &HFF
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) + 8
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
Else
 Command5(5).Caption = "8"
 Command5(5).BackColor = &H8000000F
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) - 8
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
End If
End Select
End Sub
Private Sub command6_Click(Index As Integer)
Select Case Index
Case 0
If Command6(0).Caption = "4" Then
 Command6(0).Caption = "ON"
  Command6(0).BackColor = &HFF
 TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) + 4
 Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
Else
 Command6(0).Caption = "4"
 Command6(0).BackColor = &H8000000F
  TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) - 4
  Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
End If
Case 1
If Command6(1).Caption = "4" Then
Command6(1).Caption = "ON"
  Command6(1).BackColor = &HFF
 TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) + 4
 Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
Else
 Command6(1).Caption = "4"
 Command6(1).BackColor = &H8000000F
  TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) - 4
  Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
End If
Case 2
 If Command6(2).Caption = "4" Then
 Command6(2).Caption = "ON"
 Command6(2).BackColor = &HFF
  TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) + 4
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
Else
 Command6(2).Caption = "4"
 Command6(2).BackColor = &H8000000F
 TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) - 4
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
End If
Case 3
'If InStr(1, Label2(3).Caption, "IN", vbTextCompare) < 1 Then Exit Sub
 If Command6(3).Caption = "4" Then
 Command6(3).Caption = "ON"
 Command6(3).BackColor = &HFF
  TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) + 4
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
Else
 Command6(3).Caption = "4"
 Command6(3).BackColor = &H8000000F
 TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) - 4
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
End If
Case 4
 If Command6(4).Caption = "4" Then
 Command6(4).Caption = "ON"
 Command6(4).BackColor = &HFF
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) + 4
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
Else
 Command6(4).Caption = "4"
 Command6(4).BackColor = &H8000000F
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) - 4
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
End If
Case 5
If Command6(5).Caption = "4" Then
 Command6(5).Caption = "ON"
 Command6(5).BackColor = &HFF
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) + 4
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
Else
 Command6(5).Caption = "4"
 Command6(5).BackColor = &H8000000F
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) - 4
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
End If
End Select
End Sub
Private Sub command7_Click(Index As Integer)
Select Case Index
Case 0
If Command7(0).Caption = "2" Then
 Command7(0).Caption = "ON"
  Command7(0).BackColor = &HFF
 TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) + 2
 Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
Else
 Command7(0).Caption = "2"
 Command7(0).BackColor = &H8000000F
  TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) - 2
  Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
End If
Case 1
If Command7(1).Caption = "2" Then
Command7(1).Caption = "ON"
  Command7(1).BackColor = &HFF
 TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) + 2
 Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
Else
 Command7(1).Caption = "2"
 Command7(1).BackColor = &H8000000F
  TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) - 2
  Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
End If
Case 2
 If Command7(2).Caption = "2" Then
 Command7(2).Caption = "ON"
 Command7(2).BackColor = &HFF
  TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) + 2
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
Else
 Command7(2).Caption = "2"
 Command7(2).BackColor = &H8000000F
 TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) - 2
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
End If
Case 3
'If InStr(1, Label2(3).Caption, "IN", vbTextCompare) < 1 Then Exit Sub
 If Command7(3).Caption = "2" Then
 Command7(3).Caption = "ON"
 Command7(3).BackColor = &HFF
  TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) + 2
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
Else
 Command7(3).Caption = "2"
 Command7(3).BackColor = &H8000000F
 TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) - 2
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
End If
Case 4
 If Command7(4).Caption = "2" Then
 Command7(4).Caption = "ON"
 Command7(4).BackColor = &HFF
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) + 2
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
Else
 Command7(4).Caption = "2"
 Command7(4).BackColor = &H8000000F
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) - 2
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
End If
Case 5
If Command8(5).Caption = "ON" Then Exit Sub

If Command7(5).Caption = "2" Then
 Command7(5).Caption = "ON"
 Command7(5).BackColor = &HFF
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) + 2
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
Else
 Command7(5).Caption = "2"
 Command7(5).BackColor = &H8000000F
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) - 2
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
End If
End Select
End Sub
Private Sub command8_Click(Index As Integer)
Select Case Index
Case 0
If Command8(0).Caption = "1" Then
 Command8(0).Caption = "ON"
  Command8(0).BackColor = &HFF
 TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) + 1
 Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
Else
 Command8(0).Caption = "1"
 Command8(0).BackColor = &H8000000F
  TotalSIXTEEN(0).Text = Val(TotalSIXTEEN(0).Text) - 1
  Total(0).Caption = Hex(TotalSIXTEEN(0).Text)
  Call IOwrite(0, Val(TotalSIXTEEN(0).Text))
End If
Case 1
If Command8(1).Caption = "1" Then
Command8(1).Caption = "ON"
  Command8(1).BackColor = &HFF
 TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) + 1
 Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
Else
 Command8(1).Caption = "1"
 Command8(1).BackColor = &H8000000F
  TotalSIXTEEN(1).Text = Val(TotalSIXTEEN(1).Text) - 1
  Total(1).Caption = Hex(TotalSIXTEEN(1).Text)
  Call IOwrite(1, Val(TotalSIXTEEN(1).Text))
End If
Case 2
 If Command8(2).Caption = "1" Then
 Command8(2).Caption = "ON"
 Command8(2).BackColor = &HFF
  TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) + 1
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
Else
 Command8(2).Caption = "1"
 Command8(2).BackColor = &H8000000F
 TotalSIXTEEN(2).Text = Val(TotalSIXTEEN(2).Text) - 1
 Total(2).Caption = Hex(TotalSIXTEEN(2).Text)
  Call IOwrite(2, Val(TotalSIXTEEN(2).Text))
End If
Case 3
'If InStr(1, Label2(3).Caption, "IN", vbTextCompare) < 1 Then Exit Sub
 If Command8(3).Caption = "1" Then
 Command8(3).Caption = "ON"
 Command8(3).BackColor = &HFF
  TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) + 1
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
Else
 Command8(3).Caption = "1"
 Command8(3).BackColor = &H8000000F
 TotalSIXTEEN(3).Text = Val(TotalSIXTEEN(3).Text) - 1
 Total(3).Caption = Hex(TotalSIXTEEN(3).Text)
  Call IOwrite(3, Val(TotalSIXTEEN(3).Text))
End If
Case 4
 If Command8(4).Caption = "1" Then
 Command8(4).Caption = "ON"
 Command8(4).BackColor = &HFF
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) + 1
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
Else
 Command8(4).Caption = "1"
 Command8(4).BackColor = &H8000000F
   TotalSIXTEEN(4).Text = Val(TotalSIXTEEN(4).Text) - 1
 Total(4).Caption = Hex(TotalSIXTEEN(4).Text)
  Call IOwrite(4, Val(TotalSIXTEEN(4).Text))
End If
Case 5
If Command8(5).Caption = "1" Then
 Command8(5).Caption = "ON"
 Command8(5).BackColor = &HFF
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) + 1
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
Else
 Command8(5).Caption = "1"
 Command8(5).BackColor = &H8000000F
   TotalSIXTEEN(5).Text = Val(TotalSIXTEEN(5).Text) - 1
 Total(5).Caption = Hex(TotalSIXTEEN(5).Text)
  Call IOwrite(5, Val(TotalSIXTEEN(5).Text))
End If
End Select
End Sub
Private Sub Command9_Click()
Stopinf = 0 '停止标示
Unload Me
End Sub

Private Sub Control_Command_Click()
If Control_Command.Caption = "开始" Then
Control_Command.Caption = "停止"
Else
Control_Command.Caption = "开始"
End If
End Sub

Public Sub EBX5032Out_Click()
Dim i As Integer
Dim IOin As Integer
Dim Xx As Long
Dim Yy As Long
NGflag = 0
Call IOwrite(2, 0) '气tui
Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = IOread
    IOin = IOin And 32
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 32 Or Yy > 1500 ' 检测tui到位
        If Yy > 1500 Then
        NGflag = 1
        Else
        Sleep (20)
        End If
        Call IOwrite(2, 0)
         Sleep (20)
If NGflag = 0 Then
Call IOwrite(2, 64) '气tui
Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = IOread
    IOin = IOin And 4
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 4 Or Yy > 1500 ' 检测tui到位
        If Yy > 1500 Then
        NGflag = 1
        Else
        Sleep (20)
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
Call IOwrite(2, 0) '气tui
Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = IOread
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 36 Or Yy > 1500 ' song kai
        If Yy > 1500 Then
        NGflag = 1
        Else
        Sleep (20)
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
    Loop Until IOin = 40 Or Yy > 1500 ' 检测推出到位
        If Yy > 1500 Then
        NGflag = 1
        Else
        Sleep (20)
        End If
        Call IOwrite(2, 0)
End If
If NGflag = 0 Then
    NGflag = 0
    Sleep (20)
    Call IOwrite(2, 16) 'jia jin
    Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = IOread
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 8 Or Yy > 1500 ' 检测夹紧到位
        If Yy > 1500 Then
        NGflag = 1
        Else
        Sleep (20)
        End If
End If
    If Yy > 1500 Then
        Call EBX5032Out_Click 'NG未到位退出
        NGflag = 1
        SetIn = 0
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
PIODIO_DriverClose
End Sub

Private Sub Timer1_Timer()
Timer1.Enabled = False
If Control_Command.Caption = "停止" Then Exit Sub
Select Case SetIn
Case 0
    If (IOread And 1) = 1 Then
            SetIn = 1
        EBX5032Run_Click
    End If
Case 1
    If (IOread And 2) = 2 Then
        EBX5032Out_Click
        SetIn = 0
    End If
End Select
Timer1.Enabled = True
End Sub

Private Sub Total_Change(Index As Integer)
Dim LS As String
Dim MS As String
Dim RS As String
LS = Total(2).Caption
If Len(LS) = 1 Then
LS = "0" & LS
End If
MS = Total(1).Caption
If Len(MS) = 1 Then
MS = "0" & MS
End If
RS = Total(0).Caption
If Len(RS) = 1 Then
RS = "0" & RS
End If
Total(6).Caption = LS & MS & RS
End Sub
Public Sub IOREAD_ch(Index As Integer)
Dim IO_PRI As Long
Sleep (5)
   Command1(Index).Caption = "80"
   Command1(Index).BackColor = &H8000000F
   Command2(Index).Caption = "40"
   Command2(Index).BackColor = &H8000000F
   Command3(Index).Caption = "20"
   Command3(Index).BackColor = &H8000000F
   Command4(Index).Caption = "10"
   Command4(Index).BackColor = &H8000000F
   Command5(Index).Caption = "8"
   Command5(Index).BackColor = &H8000000F
   Command6(Index).Caption = "4"
   Command6(Index).BackColor = &H8000000F
   Command7(Index).Caption = "2"
   Command7(Index).BackColor = &H8000000F
   Command8(Index).Caption = "1"
   Command8(Index).BackColor = &H8000000F
IO_PRI = IOin
Do
If IO_PRI - 128 >= 0 Then
IO_PRI = IO_PRI - 128
IOin = 128
GoTo Ne
End If
If IO_PRI - 64 >= 0 Then
IO_PRI = IO_PRI - 64
IOin = 64
GoTo Ne
End If
If IO_PRI - 32 >= 0 Then
IO_PRI = IO_PRI - 32
IOin = 32
GoTo Ne
End If
If IO_PRI - 16 >= 0 Then
IO_PRI = IO_PRI - 16
IOin = 16
GoTo Ne
End If
If IO_PRI - 8 >= 0 Then
IO_PRI = IO_PRI - 8
IOin = 8
GoTo Ne
End If
If IO_PRI - 4 >= 0 Then
IO_PRI = IO_PRI - 4
IOin = 4
GoTo Ne
End If
If IO_PRI - 2 >= 0 Then
IO_PRI = IO_PRI - 2
IOin = 2
GoTo Ne
End If
If IO_PRI - 1 >= 0 Then
IO_PRI = IO_PRI - 1
IOin = 1
GoTo Ne
End If
Ne:
 Select Case IOin
  Case 128
   Command1(Index).Caption = "ON"
   Command1(Index).BackColor = &HFF
  Case 64
   Command2(Index).Caption = "ON"
   Command2(Index).BackColor = &HFF
  Case 32
   Command3(Index).Caption = "ON"
   Command3(Index).BackColor = &HFF
  Case 16
   Command4(Index).Caption = "ON"
   Command4(Index).BackColor = &HFF
  Case 8
   Command5(Index).Caption = "ON"
   Command5(Index).BackColor = &HFF
  Case 4
   Command6(Index).Caption = "ON"
   Command6(Index).BackColor = &HFF
  Case 2
   Command7(Index).Caption = "ON"
   Command7(Index).BackColor = &HFF
  Case 1
   Command8(Index).Caption = "ON"
   Command8(Index).BackColor = &HFF
  Case 0
   Command1(Index).Caption = "80"
   Command1(Index).BackColor = &H8000000F
   Command2(Index).Caption = "40"
   Command2(Index).BackColor = &H8000000F
   Command3(Index).Caption = "20"
   Command3(Index).BackColor = &H8000000F
   Command4(Index).Caption = "10"
   Command4(Index).BackColor = &H8000000F
   Command5(Index).Caption = "8"
   Command5(Index).BackColor = &H8000000F
   Command6(Index).Caption = "4"
   Command6(Index).BackColor = &H8000000F
   Command7(Index).Caption = "2"
   Command7(Index).BackColor = &H8000000F
   Command8(Index).Caption = "1"
   Command8(Index).BackColor = &H8000000F
 End Select
    DoEvents  '循环等待期间其他事件响应ON/OFF
Loop Until IO_PRI = 0
End Sub
