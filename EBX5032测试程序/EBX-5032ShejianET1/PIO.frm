VERSION 5.00
Begin VB.Form PIO 
   BorderStyle     =   0  'None
   Caption         =   "PIOcheck"
   ClientHeight    =   9000
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   12000
   FillStyle       =   0  'Solid
   LinkTopic       =   "Form1"
   ScaleHeight     =   9000
   ScaleWidth      =   12000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   0
      Top             =   0
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
      Left            =   3600
      TabIndex        =   61
      Top             =   8160
      Width           =   1455
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
      Left            =   5835
      TabIndex        =   60
      Top             =   8160
      Width           =   1815
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
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   58
      Top             =   7920
      Width           =   975
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
      Left            =   10440
      TabIndex        =   55
      Top             =   7920
      Width           =   975
   End
   Begin VB.CommandButton Command8 
      Caption         =   "①CH9"
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
      Left            =   10440
      Style           =   1  'Graphical
      TabIndex        =   54
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton Command7 
      Caption         =   "②CH9"
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
      Left            =   9240
      Style           =   1  'Graphical
      TabIndex        =   53
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton Command6 
      Caption         =   "①CH10"
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
      Left            =   8040
      Style           =   1  'Graphical
      TabIndex        =   52
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton Command5 
      Caption         =   "②CH10"
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
      Left            =   6840
      Style           =   1  'Graphical
      TabIndex        =   51
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton Command4 
      Caption         =   "①CH11"
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
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   50
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "②CH11"
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
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   49
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "①CH12"
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
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   48
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "②CH12"
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
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   47
      Top             =   6960
      Width           =   975
   End
   Begin VB.CommandButton Command8 
      Caption         =   "①CH5"
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
      Left            =   10440
      Style           =   1  'Graphical
      TabIndex        =   45
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton Command7 
      Caption         =   "②CH5"
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
      Left            =   9240
      Style           =   1  'Graphical
      TabIndex        =   44
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton Command6 
      Caption         =   "①CH6"
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
      Left            =   8040
      Style           =   1  'Graphical
      TabIndex        =   43
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton Command5 
      Caption         =   "②CH6"
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
      Left            =   6840
      Style           =   1  'Graphical
      TabIndex        =   42
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton Command4 
      Caption         =   "①CH7"
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
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   41
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "②CH7"
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
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   40
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "①CH8"
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
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   39
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "②CH8"
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
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   38
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton Command8 
      Caption         =   "①CH1"
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
      Left            =   10440
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   4800
      Width           =   975
   End
   Begin VB.CommandButton Command7 
      Caption         =   "②CH1"
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
      Left            =   9240
      Style           =   1  'Graphical
      TabIndex        =   35
      Top             =   4800
      Width           =   975
   End
   Begin VB.CommandButton Command6 
      Caption         =   "①CH2"
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
      Left            =   8040
      Style           =   1  'Graphical
      TabIndex        =   34
      Top             =   4800
      Width           =   975
   End
   Begin VB.CommandButton Command5 
      Caption         =   "②CH2"
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
      Left            =   6840
      Style           =   1  'Graphical
      TabIndex        =   33
      Top             =   4800
      Width           =   975
   End
   Begin VB.CommandButton Command4 
      Caption         =   "①CH3"
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
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   32
      Top             =   4800
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "②CH3"
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
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   31
      Top             =   4800
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "①CH4"
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
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   4800
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "②CH4"
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
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   4800
      Width           =   975
   End
   Begin VB.CommandButton Command8 
      Caption         =   "SW9"
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
      Left            =   10440
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton Command7 
      Caption         =   "SW10"
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
      Left            =   9240
      Style           =   1  'Graphical
      TabIndex        =   26
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton Command6 
      Caption         =   "SW11"
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
      Left            =   8040
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton Command5 
      Caption         =   "SW12"
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
      Left            =   6840
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton Command4 
      Caption         =   "SW13"
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
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "SW14"
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
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "SW15"
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
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "SW16"
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
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton Command8 
      Caption         =   "SW1"
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
      Left            =   10440
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   2520
      Width           =   975
   End
   Begin VB.CommandButton Command7 
      Caption         =   "SW2"
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
      Left            =   9240
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   2520
      Width           =   975
   End
   Begin VB.CommandButton Command6 
      Caption         =   "SW3"
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
      Left            =   8040
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   2520
      Width           =   975
   End
   Begin VB.CommandButton Command5 
      Caption         =   "SW4"
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
      Left            =   6840
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   2520
      Width           =   975
   End
   Begin VB.CommandButton Command4 
      Caption         =   "SW5"
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
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   2520
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "SW6"
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
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   2520
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "SW7"
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
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   2520
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "SW8"
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
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   2520
      Width           =   975
   End
   Begin VB.CommandButton Command8 
      Caption         =   "0"
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
      Left            =   10440
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton Command7 
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
      Left            =   9240
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton Command6 
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
      Left            =   8040
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton Command5 
      Caption         =   "3"
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
      Left            =   6840
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton Command4 
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
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "5"
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
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "6"
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
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "7"
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
      Left            =   2040
      MaskColor       =   &H8000000F&
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1440
      Width           =   975
   End
   Begin VB.Frame Frame1 
      Caption         =   "CN1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3375
      Left            =   1680
      TabIndex        =   56
      Top             =   960
      Width           =   9975
   End
   Begin VB.Frame Frame2 
      Caption         =   "CN2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3375
      Left            =   1680
      TabIndex        =   57
      Top             =   4440
      Width           =   9975
   End
   Begin VB.Label Label3 
      Caption         =   "2004 DEC Seigi TOWADA China Co."
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
      Left            =   8040
      TabIndex        =   59
      Top             =   8640
      Width           =   3855
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
      Left            =   240
      TabIndex        =   46
      Top             =   7080
      Width           =   1695
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
      Left            =   240
      TabIndex        =   37
      Top             =   6000
      Width           =   1695
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
      Left            =   240
      TabIndex        =   28
      Top             =   4920
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
      Left            =   240
      TabIndex        =   19
      Top             =   3600
      Width           =   1695
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
      Left            =   240
      TabIndex        =   10
      Top             =   2520
      Width           =   1695
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
      Left            =   240
      TabIndex        =   1
      Top             =   1440
      Width           =   1695
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H0080FF80&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "PIO Data Check"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   36
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3840
      TabIndex        =   0
      Top             =   120
      Width           =   5895
   End
End
Attribute VB_Name = "PIO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim SetIn As Integer
'Public Function IOread()
'Dim IObyte As Integer
'IObyte = PIODIO_InputByte(wBaseAddr + &HC0)
'IObyte = IObyte Xor &HFF
'IOread = IObyte
'End Function
'
'Public Function IOwrite(port As Long, IObcd As Integer)
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
'End Function

Private Sub Command10_Click()
If Command10.Caption = "READ" Then
 Command10.Caption = "ON"
 Command10.BackColor = &HFF
Else
 Command10.Caption = "READ"
 Command10.BackColor = &H8000000F
 End If
Do
 IOin = IOREAD
 Select Case IOin
  Case 128
   Command1(0).Caption = "ON"
   Command1(0).BackColor = &HFF
  Case 64
   Command2(0).Caption = "ON"
   Command2(0).BackColor = &HFF
  Case 32
   Command3(0).Caption = "ON"
   Command3(0).BackColor = &HFF
  Case 16
   Command4(0).Caption = "ON"
   Command4(0).BackColor = &HFF
  Case 8
   Command5(0).Caption = "ON"
   Command5(0).BackColor = &HFF
  Case 4
   Command6(0).Caption = "ON"
   Command6(0).BackColor = &HFF
  Case 2
   Command7(0).Caption = "ON"
   Command7(0).BackColor = &HFF
  Case 1
   Command8(0).Caption = "ON"
   Command8(0).BackColor = &HFF
  Case 0
   Command1(0).Caption = "7"
   Command1(0).BackColor = &H8000000F
   Command2(0).Caption = "6"
   Command2(0).BackColor = &H8000000F
   Command3(0).Caption = "5"
   Command3(0).BackColor = &H8000000F
   Command4(0).Caption = "4"
   Command4(0).BackColor = &H8000000F
   Command5(0).Caption = "3"
   Command5(0).BackColor = &H8000000F
   Command6(0).Caption = "2"
   Command6(0).BackColor = &H8000000F
   Command7(0).Caption = "1"
   Command7(0).BackColor = &H8000000F
   Command8(0).Caption = "0"
   Command8(0).BackColor = &H8000000F
 End Select
    DoEvents  '循环等待期间其他事件响应ON/OFF
Loop Until Command10.Caption = "READ"

End Sub

Private Sub Command1_Click(Index As Integer)
Select Case Index + 1
Case 2
If Command1(1).Caption = "SW8" Then
 Command1(1).Caption = "ON"
 Command1(1).BackColor = &HFF
 Call IOwrite(1, &H80)
Else
 Command1(1).Caption = "SW8"
 Command1(1).BackColor = &H8000000F
 Call IOwrite(1, 0)
End If
Case 3
If Command1(2).Caption = "SW16" Then
 Command1(2).Caption = "ON"
 Command1(2).BackColor = &HFF
 Call IOwrite(2, &H80)
Else
 Command1(2).Caption = "SW16"
 Command1(2).BackColor = &H8000000F
 Call IOwrite(2, 0)
End If
Case 4
 If Command1(3).Caption = "②CH4" Then
 Command1(3).Caption = "ON"
 Command1(3).BackColor = &HFF
 Call IOwrite(3, &H80)
Else
 Command1(3).Caption = "②CH4"
 Command1(3).BackColor = &H8000000F
 Call IOwrite(3, 0)
End If
Case 5
 If Command1(4).Caption = "②CH8" Then
 Command1(4).Caption = "ON"
 Command1(4).BackColor = &HFF
 Call IOwrite(4, &H80)
Else
 Command1(4).Caption = "②CH8"
 Command1(4).BackColor = &H8000000F
 Call IOwrite(4, 0)
End If
Case 6
If Command1(5).Caption = "②CH12" Then
 Command1(5).Caption = "ON"
 Command1(5).BackColor = &HFF
 Call IOwrite(5, &H80)
Else
 Command1(5).Caption = "②CH12"
 Command1(5).BackColor = &H8000000F
 Call IOwrite(5, 0)
End If
End Select
End Sub



Private Sub Command2_Click(Index As Integer)
Select Case Index + 1
Case 2
If Command2(1).Caption = "SW7" Then
 Command2(1).Caption = "ON"
 Command2(1).BackColor = &HFF
 Call IOwrite(1, &H40)
Else
 Command2(1).Caption = "SW7"
 Command2(1).BackColor = &H8000000F
 Call IOwrite(1, 0)
End If
Case 3
If Command2(2).Caption = "SW15" Then
 Command2(2).Caption = "ON"
 Command2(2).BackColor = &HFF
 Call IOwrite(2, &H40)
Else
 Command2(2).Caption = "SW15"
 Command2(2).BackColor = &H8000000F
 Call IOwrite(2, 0)
End If
Case 4
If Command2(3).Caption = "①CH4" Then
 Command2(3).Caption = "ON"
 Command2(3).BackColor = &HFF
 Call IOwrite(3, &H40)
Else
 Command2(3).Caption = "①CH4"
 Command2(3).BackColor = &H8000000F
 Call IOwrite(3, 0)
End If
Case 5
If Command2(4).Caption = "①CH8" Then
 Command2(4).Caption = "ON"
 Command2(4).BackColor = &HFF
 Call IOwrite(4, &H40)
Else
 Command2(4).Caption = "①CH8"
 Command2(4).BackColor = &H8000000F
 Call IOwrite(4, 0)
End If
Case 6
If Command2(5).Caption = "①CH12" Then
 Command2(5).Caption = "ON"
 Command2(5).BackColor = &HFF
 Call IOwrite(5, &H40)
Else
 Command2(5).Caption = "①CH12"
 Command2(5).BackColor = &H8000000F
 Call IOwrite(5, 0)
End If
End Select
End Sub

Private Sub Command3_Click(Index As Integer)
Select Case Index + 1
Case 2
If Command3(1).Caption = "SW6" Then
 Command3(1).Caption = "ON"
 Command3(1).BackColor = &HFF
 Call IOwrite(1, &H20)
Else
 Command3(1).Caption = "SW6"
 Command3(1).BackColor = &H8000000F
 Call IOwrite(1, 0)
End If
Case 3
If Command3(2).Caption = "SW14" Then
 Command3(2).Caption = "ON"
 Command3(2).BackColor = &HFF
 Call IOwrite(2, &H20)
Else
 Command3(2).Caption = "SW14"
 Command3(2).BackColor = &H8000000F
 Call IOwrite(2, 0)
End If
Case 4
If Command3(3).Caption = "②CH3" Then
 Command3(3).Caption = "ON"
 Command3(3).BackColor = &HFF
 Call IOwrite(3, &H20)
Else
 Command3(3).Caption = "②CH3"
 Command3(3).BackColor = &H8000000F
 Call IOwrite(3, 0)
End If
Case 5
If Command3(4).Caption = "②CH7" Then
 Command3(4).Caption = "ON"
 Command3(4).BackColor = &HFF
 Call IOwrite(4, &H20)
Else
 Command3(4).Caption = "②CH7"
 Command3(4).BackColor = &H8000000F
 Call IOwrite(4, 0)
End If
Case 6
If Command3(5).Caption = "②CH11" Then
 Command3(5).Caption = "ON"
 Command3(5).BackColor = &HFF
 Call IOwrite(5, &H20)
Else
 Command3(5).Caption = "②CH11"
 Command3(5).BackColor = &H8000000F
 Call IOwrite(5, 0)
End If
End Select
End Sub

Private Sub Command4_Click(Index As Integer)
Select Case Index + 1
Case 2
If Command4(1).Caption = "SW5" Then
 Command4(1).Caption = "ON"
 Command4(1).BackColor = &HFF
 Call IOwrite(1, &H10)
Else
 Command4(1).Caption = "SW5"
 Command4(1).BackColor = &H8000000F
 Call IOwrite(1, 0)
End If
Case 3
If Command4(2).Caption = "SW13" Then
 Command4(2).Caption = "ON"
 Command4(2).BackColor = &HFF
 Call IOwrite(2, &H10)
Else
 Command4(2).Caption = "SW13"
 Command4(2).BackColor = &H8000000F
 Call IOwrite(2, 0)
End If
Case 4
If Command4(3).Caption = "①CH3" Then
 Command4(3).Caption = "ON"
 Command4(3).BackColor = &HFF
 Call IOwrite(3, &H10)
Else
 Command4(3).Caption = "①CH3"
 Command4(3).BackColor = &H8000000F
 Call IOwrite(3, 0)
End If
Case 5
If Command4(4).Caption = "①CH7" Then
 Command4(4).Caption = "ON"
 Command4(4).BackColor = &HFF
 Call IOwrite(4, &H10)
Else
 Command4(4).Caption = "①CH7"
 Command4(4).BackColor = &H8000000F
 Call IOwrite(4, 0)
End If
Case 6
If Command4(5).Caption = "①CH11" Then
 Command4(5).Caption = "ON"
 Command4(5).BackColor = &HFF
 Call IOwrite(5, &H10)
Else
 Command4(5).Caption = "①CH11"
 Command4(5).BackColor = &H8000000F
 Call IOwrite(5, 0)
End If
End Select
End Sub

Private Sub Command5_Click(Index As Integer)
Select Case Index + 1
Case 2
If Command5(1).Caption = "SW4" Then
 Command5(1).Caption = "ON"
 Command5(1).BackColor = &HFF
 Call IOwrite(1, &H8)
Else
 Command5(1).Caption = "SW4"
 Command5(1).BackColor = &H8000000F
 Call IOwrite(1, 0)
End If
Case 3
If Command5(2).Caption = "SW12" Then
 Command5(2).Caption = "ON"
 Command5(2).BackColor = &HFF
 Call IOwrite(2, &H8)
Else
 Command5(2).Caption = "SW12"
 Command5(2).BackColor = &H8000000F
 Call IOwrite(2, 0)
End If
Case 4
If Command5(3).Caption = "②CH2" Then
 Command5(3).Caption = "ON"
 Command5(3).BackColor = &HFF
 Call IOwrite(3, &H8)
Else
 Command5(3).Caption = "②CH2"
 Command5(3).BackColor = &H8000000F
 Call IOwrite(3, 0)
End If
Case 5
If Command5(4).Caption = "②CH6" Then
 Command5(4).Caption = "ON"
 Command5(4).BackColor = &HFF
 Call IOwrite(4, &H8)
Else
 Command5(4).Caption = "②CH6"
 Command5(4).BackColor = &H8000000F
 Call IOwrite(4, 0)
End If
Case 6
If Command5(5).Caption = "②CH10" Then
 Command5(5).Caption = "ON"
 Command5(5).BackColor = &HFF
 Call IOwrite(5, &H8)
Else
 Command5(5).Caption = "②CH10"
 Command5(5).BackColor = &H8000000F
 Call IOwrite(5, 0)
End If
End Select
End Sub

Private Sub command6_Click(Index As Integer)
Select Case Index + 1
Case 2
If Command6(1).Caption = "SW3" Then
 Command6(1).Caption = "ON"
 Command6(1).BackColor = &HFF
 Call IOwrite(1, &H4)
Else
 Command6(1).Caption = "SW3"
 Command6(1).BackColor = &H8000000F
 Call IOwrite(1, 0)
End If
Case 3
If Command6(2).Caption = "SW11" Then
 Command6(2).Caption = "ON"
 Command6(2).BackColor = &HFF
 Call IOwrite(2, &H4)
Else
 Command6(2).Caption = "SW11"
 Command6(2).BackColor = &H8000000F
 Call IOwrite(2, 0)
End If
Case 4
If Command6(3).Caption = "①CH2" Then
 Command6(3).Caption = "ON"
 Command6(3).BackColor = &HFF
 Call IOwrite(3, &H4)
Else
 Command6(3).Caption = "①CH2"
 Command6(3).BackColor = &H8000000F
 Call IOwrite(3, 0)
End If
Case 5
If Command6(4).Caption = "①CH6" Then
 Command6(4).Caption = "ON"
 Command6(4).BackColor = &HFF
 Call IOwrite(4, &H4)
Else
 Command6(4).Caption = "①CH6"
 Command6(4).BackColor = &H8000000F
 Call IOwrite(4, 0)
End If
Case 6
If Command6(5).Caption = "①CH10" Then
 Command6(5).Caption = "ON"
 Command6(5).BackColor = &HFF
 Call IOwrite(5, &H4)
Else
 Command6(5).Caption = "①CH10"
 Command6(5).BackColor = &H8000000F
 Call IOwrite(5, 0)
End If
End Select
End Sub

Private Sub command7_Click(Index As Integer)
Select Case Index + 1
Case 2
If Command7(1).Caption = "SW2" Then
 Command7(1).Caption = "ON"
 Command7(1).BackColor = &HFF
 Call IOwrite(1, &H2)
Else
 Command7(1).Caption = "SW2"
 Command7(1).BackColor = &H8000000F
 Call IOwrite(1, 0)
End If
Case 3
If Command7(2).Caption = "SW10" Then
 Command7(2).Caption = "ON"
 Command7(2).BackColor = &HFF
 Call IOwrite(2, &H2)
Else
 Command7(2).Caption = "SW10"
 Command7(2).BackColor = &H8000000F
 Call IOwrite(2, 0)
End If
Case 4
If Command7(3).Caption = "②CH1" Then
 Command7(3).Caption = "ON"
 Command7(3).BackColor = &HFF
 Call IOwrite(3, &H2)
Else
 Command7(3).Caption = "②CH1"
 Command7(3).BackColor = &H8000000F
 Call IOwrite(3, 0)
End If
Case 5
If Command7(4).Caption = "②CH5" Then
 Command7(4).Caption = "ON"
 Command7(4).BackColor = &HFF
 Call IOwrite(4, &H2)
Else
 Command7(4).Caption = "②CH5"
 Command7(4).BackColor = &H8000000F
 Call IOwrite(4, 0)
End If
Case 6
If Command7(5).Caption = "②CH9" Then
 Command7(5).Caption = "ON"
 Command7(5).BackColor = &HFF
 Call IOwrite(5, &H2)
Else
 Command7(5).Caption = "②CH9"
 Command7(5).BackColor = &H8000000F
 Call IOwrite(5, 0)
End If
End Select
End Sub

Private Sub command8_Click(Index As Integer)
Select Case Index + 1
Case 2
If Command8(1).Caption = "SW1" Then
 Command8(1).Caption = "ON"
 Command8(1).BackColor = &HFF
 Call IOwrite(1, &H1)
Else
 Command8(1).Caption = "SW1"
 Command8(1).BackColor = &H8000000F
 Call IOwrite(1, 0)
End If
Case 3
If Command8(2).Caption = "SW9" Then
 Command8(2).Caption = "ON"
 Command8(2).BackColor = &HFF
 Call IOwrite(2, &H1)
Else
 Command8(2).Caption = "SW9"
 Command8(2).BackColor = &H8000000F
 Call IOwrite(2, 0)
End If
Case 4
If Command8(3).Caption = "①CH1" Then
 Command8(3).Caption = "ON"
 Command8(3).BackColor = &HFF
 Call IOwrite(3, &H1)
Else
 Command8(3).Caption = "①CH1"
 Command8(3).BackColor = &H8000000F
 Call IOwrite(3, 0)
End If
Case 5
If Command8(4).Caption = "①CH5" Then
 Command8(4).Caption = "ON"
 Command8(4).BackColor = &HFF
 Call IOwrite(4, &H1)
Else
 Command8(4).Caption = "①CH5"
 Command8(4).BackColor = &H8000000F
 Call IOwrite(4, 0)
End If
Case 6
If Command8(5).Caption = "①CH9" Then
 Command8(5).Caption = "ON"
 Command8(5).BackColor = &HFF
 Call IOwrite(5, &H1)
Else
 Command8(5).Caption = "①CH9"
 Command8(5).BackColor = &H8000000F
 Call IOwrite(5, 0)
End If
End Select
End Sub

Private Sub Command9_Click()
 Unload Me
End Sub

Private Sub EBX5032Out_Click()
Dim i As Integer
Dim IOin As Integer
Dim Xx As Long
Dim Yy As Long
NGflag = 0
Call IOwrite(5, 0) '气tui
    Xx = GetTickCount()
    Do
    IOin = FORM2.IOREAD
    IOin = IOin And 32
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 32 Or Yy > 1500 ' 检测tui到位
        If Yy > 1500 Then NGflag = 1
        Call IOwrite(5, 0)
If NGflag = 0 Then
Call IOwrite(5, 2) '气tui
    Xx = GetTickCount()
    Do
    IOin = FORM2.IOREAD
    IOin = IOin And 40
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 40 Or Yy > 1500 ' 检测tui到位
        If Yy > 1500 Then NGflag = 1
        Call IOwrite(5, 0)
End If
End Sub

Private Sub EBX5032Run_Click()
Dim i As Integer
Dim IOin As Integer
Dim Xx As Long
Dim Yy As Long
NGflag = 0
Call IOwrite(5, 0) '气tui
Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = FORM2.IOREAD
    IOin = IOin
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 40 Or Yy > 1500 ' song kai
        If Yy > 1500 Then NGflag = 1
        Call IOwrite(5, 0)

If NGflag = 0 Then
    NGflag = 0
    Call IOwrite(5, 4) '气jin
    Sleep (20)
    Xx = GetTickCount()
    Do
    IOin = FORM2.IOREAD
    IOin = IOin
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 48 Or Yy > 1500 ' 检测顶杆推出到位
        If Yy > 1500 Then NGflag = 1
        Call IOwrite(5, 0)
End If
If NGflag = 0 Then
    NGflag = 0
    Call IOwrite(5, 1) 'jia jin
    Xx = GetTickCount()
    Do
    IOin = FORM2.IOREAD
    IOin = IOin And 4
    DoEvents
    Yy = GetTickCount() - Xx
    Loop Until IOin = 4 Or Yy > 1500 ' 检测顶杆推出到位
        If Yy > 1500 Then NGflag = 1
End If
End Sub

Private Sub Form_Load()
Call DIOINIT
End Sub

Private Sub Timer1_Timer()
Timer1.Enabled = False
Select Case SetIn
Case 0
    If FORM2.IOREAD = 41 Then
        EBX5032Run_Click
        SetIn = 1
    End If
Case 1
    If FORM2.IOREAD = 18 Then
        EBX5032Out_Click
        SetIn = 0
    End If
End Select
Timer1.Enabled = True
End Sub
