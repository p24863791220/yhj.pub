VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form ICX2361 
   Caption         =   "ICX0412 MOUNT CHECK PROGRAM"
   ClientHeight    =   3825
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5265
   LinkTopic       =   "Form1"
   ScaleHeight     =   3825
   ScaleWidth      =   5265
   StartUpPosition =   2  '屏幕中心
   WindowState     =   2  'Maximized
   Begin MSComctlLib.ProgressBar WaitMAX 
      Height          =   315
      Left            =   7740
      TabIndex        =   1005
      Top             =   9840
      Width           =   6960
      _ExtentX        =   12277
      _ExtentY        =   556
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton Page_command 
      Caption         =   "下一页"
      Height          =   375
      Left            =   5025
      Style           =   1  'Graphical
      TabIndex        =   71
      Top             =   10410
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "自动"
      Height          =   375
      Left            =   60
      TabIndex        =   6
      Top             =   10410
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "编辑"
      Height          =   375
      Left            =   990
      TabIndex        =   5
      Top             =   10410
      Width           =   855
   End
   Begin VB.CommandButton Command3 
      Caption         =   "保存"
      Height          =   375
      Left            =   1920
      TabIndex        =   4
      Top             =   10410
      Width           =   855
   End
   Begin VB.CommandButton Command4 
      Caption         =   "条件设定"
      Height          =   375
      Left            =   2850
      TabIndex        =   3
      Top             =   10410
      Width           =   975
   End
   Begin VB.CommandButton Command5 
      Caption         =   "EXIT"
      Height          =   375
      Left            =   14040
      TabIndex        =   2
      Top             =   10320
      Width           =   855
   End
   Begin VB.CommandButton Command6 
      Caption         =   "DATA"
      Height          =   375
      Left            =   3960
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   10410
      Width           =   855
   End
   Begin VB.CommandButton IOCHECKER 
      Caption         =   "IOCHECKER"
      Enabled         =   0   'False
      Height          =   375
      Left            =   6270
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   10410
      Width           =   1095
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.PictureBox Picture1 
      Height          =   9495
      Index           =   0
      Left            =   -45
      ScaleHeight     =   9435
      ScaleWidth      =   7320
      TabIndex        =   48
      Top             =   720
      Width           =   7380
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   37
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   143
         Top             =   9000
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   37
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   142
         Top             =   9000
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   36
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   141
         Top             =   8760
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   36
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   140
         Top             =   8760
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   35
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   139
         Top             =   8520
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   35
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   138
         Top             =   8520
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   34
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   137
         Top             =   8280
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   34
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   136
         Top             =   8280
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   33
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   135
         Top             =   8040
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   33
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   134
         Top             =   8040
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   32
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   133
         Top             =   7800
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   32
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   132
         Top             =   7800
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   31
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   131
         Top             =   7560
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   31
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   130
         Top             =   7560
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   30
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   129
         Top             =   7320
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   30
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   128
         Top             =   7320
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   29
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   127
         Top             =   7080
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   29
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   126
         Top             =   7080
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   28
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   125
         Top             =   6840
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   28
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   124
         Top             =   6840
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   27
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   123
         Top             =   6600
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   27
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   122
         Top             =   6600
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   26
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   121
         Top             =   6360
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   26
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   120
         Top             =   6360
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   25
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   119
         Top             =   6120
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   25
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   118
         Top             =   6120
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   24
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   117
         Top             =   5880
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   24
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   116
         Top             =   5880
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   23
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   115
         Top             =   5640
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   23
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   114
         Top             =   5640
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   22
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   113
         Top             =   5400
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   22
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   112
         Top             =   5400
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   21
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   111
         Top             =   5160
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   21
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   110
         Top             =   5160
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   20
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   109
         Top             =   4920
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   20
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   108
         Top             =   4920
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   19
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   107
         Top             =   4680
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   19
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   106
         Top             =   4680
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   18
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   105
         Top             =   4440
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   18
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   104
         Top             =   4440
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   17
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   103
         Top             =   4200
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   17
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   102
         Top             =   4200
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   16
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   101
         Top             =   3960
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   16
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   100
         Top             =   3960
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   15
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   99
         Top             =   3720
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   15
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   98
         Top             =   3720
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   14
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   97
         Top             =   3480
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   14
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   96
         Top             =   3480
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   13
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   95
         Top             =   3240
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   13
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   94
         Top             =   3240
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   12
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   93
         Top             =   3000
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   12
         Left            =   4200
         MaxLength       =   15
         TabIndex        =   92
         Top             =   3000
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   11
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   91
         Top             =   2760
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   11
         Left            =   4200
         MaxLength       =   8
         TabIndex        =   90
         Top             =   2760
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   10
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   89
         Top             =   2520
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   10
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   88
         Top             =   2520
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   9
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   87
         Top             =   2280
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   9
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   86
         Top             =   2280
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   8
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   85
         Top             =   2040
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   8
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   84
         Top             =   2040
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   7
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   83
         Top             =   1800
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   7
         Left            =   4200
         MaxLength       =   7
         TabIndex        =   82
         Top             =   1800
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   6
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   81
         Top             =   1560
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   6
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   80
         Top             =   1560
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   5
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   79
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   5
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   78
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   4
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   77
         Top             =   1080
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   4
         Left            =   4200
         TabIndex        =   76
         Top             =   1080
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   3
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   75
         Top             =   840
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   3
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   74
         Top             =   840
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   2
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   73
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   2
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   72
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   2  'Center
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   0
         Left            =   3120
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   52
         Text            =   "Hi"
         Top             =   60
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   0
         Left            =   4200
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   51
         Text            =   "Low"
         Top             =   60
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   1
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   50
         Top             =   330
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   1
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   49
         Top             =   330
         Width           =   1095
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "37"
         Height          =   255
         Index           =   37
         Left            =   120
         TabIndex        =   287
         Top             =   9000
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ヘッドホン低域f特測定Rch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   37
         Left            =   480
         TabIndex        =   286
         Top             =   9000
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   37
         Left            =   5280
         TabIndex        =   285
         Top             =   9000
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   270
         Index           =   37
         Left            =   6360
         TabIndex        =   284
         Top             =   9000
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "36"
         Height          =   255
         Index           =   36
         Left            =   120
         TabIndex        =   283
         Top             =   8760
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ヘッドホン低域f特測定Lch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   36
         Left            =   480
         TabIndex        =   282
         Top             =   8760
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   36
         Left            =   5280
         TabIndex        =   281
         Top             =   8760
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   36
         Left            =   6360
         TabIndex        =   280
         Top             =   8760
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "35"
         Height          =   255
         Index           =   35
         Left            =   120
         TabIndex        =   279
         Top             =   8520
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INT_INヘッドホン歪率測定Rch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   35
         Left            =   480
         TabIndex        =   278
         Top             =   8520
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   35
         Left            =   5280
         TabIndex        =   277
         Top             =   8520
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   35
         Left            =   6360
         TabIndex        =   276
         Top             =   8520
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "34"
         Height          =   255
         Index           =   34
         Left            =   120
         TabIndex        =   275
         Top             =   8280
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INT_INヘッドホン歪率測定Lch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   34
         Left            =   480
         TabIndex        =   274
         Top             =   8280
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   34
         Left            =   5280
         TabIndex        =   273
         Top             =   8280
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   34
         Left            =   6360
         TabIndex        =   272
         Top             =   8280
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "33"
         Height          =   255
         Index           =   33
         Left            =   120
         TabIndex        =   271
         Top             =   8040
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INT_INヘッドホンS/N測定Rch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   33
         Left            =   480
         TabIndex        =   270
         Top             =   8040
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   33
         Left            =   5280
         TabIndex        =   269
         Top             =   8040
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   33
         Left            =   6360
         TabIndex        =   268
         Top             =   8040
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "32"
         Height          =   255
         Index           =   32
         Left            =   120
         TabIndex        =   267
         Top             =   7800
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INT_INヘッドホンS/N測定Lch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   32
         Left            =   480
         TabIndex        =   266
         Top             =   7800
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   32
         Left            =   5280
         TabIndex        =   265
         Top             =   7800
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   32
         Left            =   6360
         TabIndex        =   264
         Top             =   7800
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "31"
         Height          =   255
         Index           =   31
         Left            =   120
         TabIndex        =   263
         Top             =   7560
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "チャンネルバランス測定L-R"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   31
         Left            =   480
         TabIndex        =   262
         Top             =   7560
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   31
         Left            =   5280
         TabIndex        =   261
         Top             =   7560
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   31
         Left            =   6360
         TabIndex        =   260
         Top             =   7560
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "30"
         Height          =   255
         Index           =   30
         Left            =   120
         TabIndex        =   259
         Top             =   7320
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INTSTMICヘッドホン出力確認L"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   30
         Left            =   480
         TabIndex        =   258
         Top             =   7320
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   30
         Left            =   5280
         TabIndex        =   257
         Top             =   7320
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   30
         Left            =   6360
         TabIndex        =   256
         Top             =   7320
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "29"
         Height          =   255
         Index           =   29
         Left            =   120
         TabIndex        =   255
         Top             =   7080
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ヘッドホン最大出力測定R"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   29
         Left            =   480
         TabIndex        =   254
         Top             =   7080
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   29
         Left            =   5280
         TabIndex        =   253
         Top             =   7080
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   29
         Left            =   6360
         TabIndex        =   252
         Top             =   7080
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "28"
         Height          =   255
         Index           =   28
         Left            =   120
         TabIndex        =   251
         Top             =   6840
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ヘッドホン最大出力測定L"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   28
         Left            =   480
         TabIndex        =   250
         Top             =   6840
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   28
         Left            =   5280
         TabIndex        =   249
         Top             =   6840
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   28
         Left            =   6360
         TabIndex        =   248
         Top             =   6840
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "27"
         Height          =   255
         Index           =   27
         Left            =   120
         TabIndex        =   247
         Top             =   6600
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホン高域f特測定Rch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   27
         Left            =   480
         TabIndex        =   246
         Top             =   6600
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   27
         Left            =   5280
         TabIndex        =   245
         Top             =   6600
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   27
         Left            =   6360
         TabIndex        =   244
         Top             =   6600
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "26"
         Height          =   255
         Index           =   26
         Left            =   120
         TabIndex        =   243
         Top             =   6360
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXT_ヘッドホン高域f特測定Lch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   26
         Left            =   480
         TabIndex        =   242
         Top             =   6360
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   26
         Left            =   5280
         TabIndex        =   241
         Top             =   6360
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   26
         Left            =   6360
         TabIndex        =   240
         Top             =   6360
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "25"
         Height          =   255
         Index           =   25
         Left            =   120
         TabIndex        =   239
         Top             =   6120
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホン低域f特測定Rch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   25
         Left            =   480
         TabIndex        =   238
         Top             =   6120
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   25
         Left            =   5280
         TabIndex        =   237
         Top             =   6120
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   25
         Left            =   6360
         TabIndex        =   236
         Top             =   6120
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "24"
         Height          =   255
         Index           =   24
         Left            =   120
         TabIndex        =   235
         Top             =   5880
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホン低域f特測定Lch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   24
         Left            =   480
         TabIndex        =   234
         Top             =   5880
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   24
         Left            =   5280
         TabIndex        =   233
         Top             =   5880
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   24
         Left            =   6360
         TabIndex        =   232
         Top             =   5880
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "23"
         Height          =   255
         Index           =   23
         Left            =   120
         TabIndex        =   231
         Top             =   5640
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXT_ヘッドホン歪率測定Rch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   23
         Left            =   480
         TabIndex        =   230
         Top             =   5640
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   23
         Left            =   5280
         TabIndex        =   229
         Top             =   5640
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   23
         Left            =   6360
         TabIndex        =   228
         Top             =   5640
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "22"
         Height          =   255
         Index           =   22
         Left            =   120
         TabIndex        =   227
         Top             =   5400
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホン歪率測定Lch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   22
         Left            =   480
         TabIndex        =   226
         Top             =   5400
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   22
         Left            =   5280
         TabIndex        =   225
         Top             =   5400
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   22
         Left            =   6360
         TabIndex        =   224
         Top             =   5400
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "21"
         Height          =   255
         Index           =   21
         Left            =   120
         TabIndex        =   223
         Top             =   5160
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホンS/N測定Rch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   21
         Left            =   480
         TabIndex        =   222
         Top             =   5160
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   21
         Left            =   5280
         TabIndex        =   221
         Top             =   5160
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   21
         Left            =   6360
         TabIndex        =   220
         Top             =   5160
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "20"
         Height          =   255
         Index           =   20
         Left            =   120
         TabIndex        =   219
         Top             =   4920
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホンS/N測定Lch"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   20
         Left            =   480
         TabIndex        =   218
         Top             =   4920
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   20
         Left            =   5280
         TabIndex        =   217
         Top             =   4920
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   20
         Left            =   6360
         TabIndex        =   216
         Top             =   4920
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "19"
         Height          =   255
         Index           =   19
         Left            =   120
         TabIndex        =   215
         Top             =   4680
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTチャンネルバランス測定L-R"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   19
         Left            =   480
         TabIndex        =   214
         Top             =   4680
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   19
         Left            =   5280
         TabIndex        =   213
         Top             =   4680
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   19
         Left            =   6360
         TabIndex        =   212
         Top             =   4680
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "18"
         Height          =   255
         Index           =   18
         Left            =   120
         TabIndex        =   211
         Top             =   4440
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTSTMICヘッドホン出力確認L"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   18
         Left            =   480
         TabIndex        =   210
         Top             =   4440
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   18
         Left            =   5280
         TabIndex        =   209
         Top             =   4440
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   18
         Left            =   6360
         TabIndex        =   208
         Top             =   4440
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "17"
         Height          =   255
         Index           =   17
         Left            =   120
         TabIndex        =   207
         Top             =   4200
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー実用最大出力測定"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   17
         Left            =   480
         TabIndex        =   206
         Top             =   4200
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   17
         Left            =   5280
         TabIndex        =   205
         Top             =   4200
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   17
         Left            =   6360
         TabIndex        =   204
         Top             =   4200
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "16"
         Height          =   255
         Index           =   16
         Left            =   120
         TabIndex        =   203
         Top             =   3960
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "10%以下歪率確認"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   16
         Left            =   480
         TabIndex        =   202
         Top             =   3960
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   16
         Left            =   5280
         TabIndex        =   201
         Top             =   3960
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   16
         Left            =   6360
         TabIndex        =   200
         Top             =   3960
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "15"
         Height          =   255
         Index           =   15
         Left            =   120
         TabIndex        =   199
         Top             =   3720
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー最大出力測定"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   15
         Left            =   480
         TabIndex        =   198
         Top             =   3720
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   15
         Left            =   5280
         TabIndex        =   197
         Top             =   3720
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   15
         Left            =   6360
         TabIndex        =   196
         Top             =   3720
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "14"
         Height          =   255
         Index           =   14
         Left            =   120
         TabIndex        =   195
         Top             =   3480
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー高域f特測定"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   14
         Left            =   480
         TabIndex        =   194
         Top             =   3480
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   14
         Left            =   5280
         TabIndex        =   193
         Top             =   3480
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   14
         Left            =   6360
         TabIndex        =   192
         Top             =   3480
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "13"
         Height          =   255
         Index           =   13
         Left            =   120
         TabIndex        =   191
         Top             =   3240
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー低域f特測定"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   13
         Left            =   480
         TabIndex        =   190
         Top             =   3240
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   13
         Left            =   5280
         TabIndex        =   189
         Top             =   3240
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   13
         Left            =   6360
         TabIndex        =   188
         Top             =   3240
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "12"
         Height          =   255
         Index           =   12
         Left            =   120
         TabIndex        =   187
         Top             =   3000
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー歪率測定"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   12
         Left            =   480
         TabIndex        =   186
         Top             =   3000
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   12
         Left            =   5280
         TabIndex        =   185
         Top             =   3000
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   12
         Left            =   6360
         TabIndex        =   184
         Top             =   3000
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "11"
         Height          =   255
         Index           =   11
         Left            =   120
         TabIndex        =   183
         Top             =   2760
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカーS/N測定"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   11
         Left            =   480
         TabIndex        =   182
         Top             =   2760
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   11
         Left            =   5280
         TabIndex        =   181
         Top             =   2760
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   11
         Left            =   6360
         TabIndex        =   180
         Top             =   2760
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "10"
         Height          =   255
         Index           =   10
         Left            =   120
         TabIndex        =   179
         Top             =   2520
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "SP ANP動作時電流測定"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   10
         Left            =   480
         TabIndex        =   178
         Top             =   2520
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   10
         Left            =   5280
         TabIndex        =   177
         Top             =   2520
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   10
         Left            =   6360
         TabIndex        =   176
         Top             =   2520
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "9"
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   175
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー出力レベル確認"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   9
         Left            =   480
         TabIndex        =   174
         Top             =   2280
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   5280
         TabIndex        =   173
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   6360
         TabIndex        =   172
         Top             =   2280
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "8"
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   171
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Audio Test Start"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   8
         Left            =   480
         TabIndex        =   170
         Top             =   2040
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   5280
         TabIndex        =   169
         Top             =   2040
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   6360
         TabIndex        =   168
         Top             =   2040
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "7"
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   167
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "MIMOSA Version Check"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   480
         TabIndex        =   166
         Top             =   1800
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   7
         Left            =   5280
         TabIndex        =   165
         Top             =   1800
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   7
         Left            =   6360
         TabIndex        =   164
         Top             =   1800
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "6"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   163
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VDD_DSP1"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   480
         TabIndex        =   162
         Top             =   1560
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   6
         Left            =   5280
         TabIndex        =   161
         Top             =   1560
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   6
         Left            =   6360
         TabIndex        =   160
         Top             =   1560
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "5"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   159
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VCORE"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   480
         TabIndex        =   158
         Top             =   1320
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   5280
         TabIndex        =   157
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   6360
         TabIndex        =   156
         Top             =   1320
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "4"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   155
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VDD_IO1"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   480
         TabIndex        =   154
         Top             =   1080
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   4
         Left            =   5280
         TabIndex        =   153
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   4
         Left            =   6360
         TabIndex        =   152
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "3"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   151
         Top             =   840
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VUPDDC"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   480
         TabIndex        =   150
         Top             =   840
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   3
         Left            =   5280
         TabIndex        =   149
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   3
         Left            =   6360
         TabIndex        =   148
         Top             =   840
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   147
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VUNREG"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   480
         TabIndex        =   146
         Top             =   600
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   2
         Left            =   5280
         TabIndex        =   145
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H000000FF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NG"
         Height          =   255
         Index           =   2
         Left            =   6360
         TabIndex        =   144
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   60
         Top             =   60
         Width           =   375
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Itme"
         Height          =   255
         Index           =   0
         Left            =   480
         TabIndex        =   59
         Top             =   60
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Measure"
         Height          =   255
         Index           =   0
         Left            =   5280
         TabIndex        =   58
         Top             =   60
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Judge"
         Height          =   255
         Index           =   0
         Left            =   6360
         TabIndex        =   57
         Top             =   60
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         Height          =   255
         Index           =   1
         Left            =   6360
         TabIndex        =   56
         Top             =   345
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         Height          =   255
         Index           =   1
         Left            =   5280
         TabIndex        =   55
         Top             =   345
         Width           =   1095
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "START"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   270
         Index           =   1
         Left            =   480
         TabIndex        =   54
         Top             =   330
         Width           =   2655
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         Height          =   270
         Index           =   1
         Left            =   120
         TabIndex        =   53
         Top             =   330
         Width           =   375
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   9495
      Index           =   1
      Left            =   7560
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   7
      Top             =   720
      Width           =   7335
      Begin VB.PictureBox Picture3 
         Height          =   1215
         Left            =   120
         ScaleHeight     =   1155
         ScaleWidth      =   7035
         TabIndex        =   10
         Top             =   8280
         Width           =   7095
         Begin VB.TextBox INFdisplay 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            ForeColor       =   &H00000000&
            Height          =   1095
            HideSelection   =   0   'False
            Left            =   -15
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            TabIndex        =   11
            Top             =   -15
            Width           =   7095
         End
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   70
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   353
         Top             =   8010
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   70
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   352
         Top             =   8010
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   69
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   351
         Top             =   7770
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   69
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   350
         Top             =   7770
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   68
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   349
         Top             =   7530
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   68
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   348
         Top             =   7530
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   67
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   347
         Top             =   7290
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   67
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   346
         Top             =   7290
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   66
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   345
         Top             =   7050
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   66
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   344
         Top             =   7050
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   65
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   343
         Top             =   6810
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   65
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   342
         Top             =   6810
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   64
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   341
         Top             =   6570
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   64
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   340
         Top             =   6570
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   63
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   339
         Top             =   6330
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   63
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   338
         Top             =   6330
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   62
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   337
         Top             =   6090
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   62
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   336
         Top             =   6090
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   61
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   335
         Top             =   5850
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   61
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   334
         Top             =   5850
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   60
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   333
         Top             =   5610
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   60
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   332
         Top             =   5610
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   59
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   331
         Top             =   5370
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   59
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   330
         Top             =   5370
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   58
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   329
         Top             =   5130
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   58
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   328
         Top             =   5130
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   57
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   327
         Top             =   4890
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   57
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   326
         Top             =   4890
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   56
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   325
         Top             =   4650
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   56
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   324
         Top             =   4650
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   55
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   323
         Top             =   4410
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   55
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   322
         Top             =   4410
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   54
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   321
         Top             =   4170
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   54
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   320
         Top             =   4170
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   53
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   319
         Top             =   3930
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   53
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   318
         Top             =   3930
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   52
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   317
         Top             =   3690
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   52
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   316
         Top             =   3690
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   51
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   315
         Top             =   3450
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   51
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   314
         Top             =   3450
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   50
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   313
         Top             =   3210
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   50
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   312
         Top             =   3210
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   49
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   311
         Top             =   2970
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   49
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   310
         Top             =   2970
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   48
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   309
         Top             =   2730
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   48
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   308
         Top             =   2730
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   47
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   307
         Top             =   2490
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   47
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   306
         Top             =   2490
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   46
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   305
         Top             =   2250
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   46
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   304
         Top             =   2250
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   45
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   303
         Top             =   2010
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   45
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   302
         Top             =   2010
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   44
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   301
         Top             =   1770
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   44
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   300
         Top             =   1770
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   43
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   299
         Top             =   1530
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   43
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   298
         Top             =   1530
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   42
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   297
         Top             =   1290
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   42
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   296
         Top             =   1290
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   41
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   295
         Top             =   1050
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   41
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   294
         Top             =   1050
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   40
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   293
         Top             =   810
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   40
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   292
         Top             =   810
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   39
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   291
         Top             =   570
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   39
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   290
         Top             =   570
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   38
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   289
         Top             =   330
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   38
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   288
         Top             =   330
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   71
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   19
         Top             =   8280
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   71
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   18
         Top             =   8280
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   72
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   17
         Top             =   8520
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   72
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   16
         Top             =   8520
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   73
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   15
         Top             =   8760
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   73
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   14
         Top             =   8760
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   74
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   13
         Top             =   9000
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   74
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   12
         Top             =   9000
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   75
         Left            =   4200
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   9
         Text            =   "Low"
         Top             =   45
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   2  'Center
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   75
         Left            =   3120
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   8
         Text            =   "Hi"
         Top             =   45
         Width           =   1095
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "70"
         Height          =   255
         Index           =   70
         Left            =   120
         TabIndex        =   485
         Top             =   8010
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   70
         Left            =   480
         TabIndex        =   484
         Top             =   8010
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   70
         Left            =   5280
         TabIndex        =   483
         Top             =   8010
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   70
         Left            =   6360
         TabIndex        =   482
         Top             =   8010
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "69"
         Height          =   255
         Index           =   69
         Left            =   120
         TabIndex        =   481
         Top             =   7770
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   69
         Left            =   480
         TabIndex        =   480
         Top             =   7770
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   69
         Left            =   5280
         TabIndex        =   479
         Top             =   7770
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   69
         Left            =   6360
         TabIndex        =   478
         Top             =   7770
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "68"
         Height          =   255
         Index           =   68
         Left            =   120
         TabIndex        =   477
         Top             =   7530
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   68
         Left            =   480
         TabIndex        =   476
         Top             =   7530
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   68
         Left            =   5280
         TabIndex        =   475
         Top             =   7530
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   68
         Left            =   6360
         TabIndex        =   474
         Top             =   7530
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "67"
         Height          =   255
         Index           =   67
         Left            =   120
         TabIndex        =   473
         Top             =   7290
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   67
         Left            =   480
         TabIndex        =   472
         Top             =   7290
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   67
         Left            =   5280
         TabIndex        =   471
         Top             =   7290
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   67
         Left            =   6360
         TabIndex        =   470
         Top             =   7290
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "66"
         Height          =   255
         Index           =   66
         Left            =   120
         TabIndex        =   469
         Top             =   7050
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   66
         Left            =   480
         TabIndex        =   468
         Top             =   7050
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   66
         Left            =   5280
         TabIndex        =   467
         Top             =   7050
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   66
         Left            =   6360
         TabIndex        =   466
         Top             =   7050
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "65"
         Height          =   255
         Index           =   65
         Left            =   120
         TabIndex        =   465
         Top             =   6810
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   65
         Left            =   480
         TabIndex        =   464
         Top             =   6810
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   65
         Left            =   5280
         TabIndex        =   463
         Top             =   6810
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   65
         Left            =   6360
         TabIndex        =   462
         Top             =   6810
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "64"
         Height          =   255
         Index           =   64
         Left            =   120
         TabIndex        =   461
         Top             =   6570
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   64
         Left            =   480
         TabIndex        =   460
         Top             =   6570
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   64
         Left            =   5280
         TabIndex        =   459
         Top             =   6570
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   64
         Left            =   6360
         TabIndex        =   458
         Top             =   6570
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "63"
         Height          =   255
         Index           =   63
         Left            =   120
         TabIndex        =   457
         Top             =   6330
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   63
         Left            =   480
         TabIndex        =   456
         Top             =   6330
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   63
         Left            =   5280
         TabIndex        =   455
         Top             =   6330
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   63
         Left            =   6360
         TabIndex        =   454
         Top             =   6330
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "62"
         Height          =   255
         Index           =   62
         Left            =   120
         TabIndex        =   453
         Top             =   6090
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   62
         Left            =   480
         TabIndex        =   452
         Top             =   6090
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   62
         Left            =   5280
         TabIndex        =   451
         Top             =   6090
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   62
         Left            =   6360
         TabIndex        =   450
         Top             =   6090
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "61"
         Height          =   255
         Index           =   61
         Left            =   120
         TabIndex        =   449
         Top             =   5850
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   61
         Left            =   480
         TabIndex        =   448
         Top             =   5850
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   61
         Left            =   5280
         TabIndex        =   447
         Top             =   5850
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   61
         Left            =   6360
         TabIndex        =   446
         Top             =   5850
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "60"
         Height          =   255
         Index           =   60
         Left            =   120
         TabIndex        =   445
         Top             =   5610
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   60
         Left            =   480
         TabIndex        =   444
         Top             =   5610
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   60
         Left            =   5280
         TabIndex        =   443
         Top             =   5610
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   60
         Left            =   6360
         TabIndex        =   442
         Top             =   5610
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "59"
         Height          =   255
         Index           =   59
         Left            =   120
         TabIndex        =   441
         Top             =   5370
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   59
         Left            =   480
         TabIndex        =   440
         Top             =   5370
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   59
         Left            =   5280
         TabIndex        =   439
         Top             =   5370
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   59
         Left            =   6360
         TabIndex        =   438
         Top             =   5370
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "58"
         Height          =   255
         Index           =   58
         Left            =   120
         TabIndex        =   437
         Top             =   5130
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   58
         Left            =   480
         TabIndex        =   436
         Top             =   5130
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   58
         Left            =   5280
         TabIndex        =   435
         Top             =   5130
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   58
         Left            =   6360
         TabIndex        =   434
         Top             =   5130
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "57"
         Height          =   255
         Index           =   57
         Left            =   120
         TabIndex        =   433
         Top             =   4890
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   57
         Left            =   480
         TabIndex        =   432
         Top             =   4890
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   57
         Left            =   5280
         TabIndex        =   431
         Top             =   4890
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   57
         Left            =   6360
         TabIndex        =   430
         Top             =   4890
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "56"
         Height          =   255
         Index           =   56
         Left            =   120
         TabIndex        =   429
         Top             =   4650
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   56
         Left            =   480
         TabIndex        =   428
         Top             =   4650
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   56
         Left            =   5280
         TabIndex        =   427
         Top             =   4650
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   56
         Left            =   6360
         TabIndex        =   426
         Top             =   4650
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "55"
         Height          =   255
         Index           =   55
         Left            =   120
         TabIndex        =   425
         Top             =   4410
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   55
         Left            =   480
         TabIndex        =   424
         Top             =   4410
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   55
         Left            =   5280
         TabIndex        =   423
         Top             =   4410
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   55
         Left            =   6360
         TabIndex        =   422
         Top             =   4410
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "54"
         Height          =   255
         Index           =   54
         Left            =   120
         TabIndex        =   421
         Top             =   4170
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   54
         Left            =   480
         TabIndex        =   420
         Top             =   4170
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   54
         Left            =   5280
         TabIndex        =   419
         Top             =   4170
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   54
         Left            =   6360
         TabIndex        =   418
         Top             =   4170
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "53"
         Height          =   255
         Index           =   53
         Left            =   120
         TabIndex        =   417
         Top             =   3930
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   53
         Left            =   480
         TabIndex        =   416
         Top             =   3930
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   53
         Left            =   5280
         TabIndex        =   415
         Top             =   3930
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   53
         Left            =   6360
         TabIndex        =   414
         Top             =   3930
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "52"
         Height          =   255
         Index           =   52
         Left            =   120
         TabIndex        =   413
         Top             =   3690
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   52
         Left            =   480
         TabIndex        =   412
         Top             =   3690
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   52
         Left            =   5280
         TabIndex        =   411
         Top             =   3690
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   52
         Left            =   6360
         TabIndex        =   410
         Top             =   3690
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "51"
         Height          =   255
         Index           =   51
         Left            =   120
         TabIndex        =   409
         Top             =   3450
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   51
         Left            =   480
         TabIndex        =   408
         Top             =   3450
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   51
         Left            =   5280
         TabIndex        =   407
         Top             =   3450
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   51
         Left            =   6360
         TabIndex        =   406
         Top             =   3450
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "50"
         Height          =   255
         Index           =   50
         Left            =   120
         TabIndex        =   405
         Top             =   3210
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   50
         Left            =   480
         TabIndex        =   404
         Top             =   3210
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   50
         Left            =   5280
         TabIndex        =   403
         Top             =   3210
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   50
         Left            =   6360
         TabIndex        =   402
         Top             =   3210
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "49"
         Height          =   255
         Index           =   49
         Left            =   120
         TabIndex        =   401
         Top             =   2970
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   49
         Left            =   480
         TabIndex        =   400
         Top             =   2970
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   49
         Left            =   5280
         TabIndex        =   399
         Top             =   2970
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   49
         Left            =   6360
         TabIndex        =   398
         Top             =   2970
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "48"
         Height          =   255
         Index           =   48
         Left            =   120
         TabIndex        =   397
         Top             =   2730
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   48
         Left            =   480
         TabIndex        =   396
         Top             =   2730
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   48
         Left            =   5280
         TabIndex        =   395
         Top             =   2730
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   48
         Left            =   6360
         TabIndex        =   394
         Top             =   2730
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "47"
         Height          =   255
         Index           =   47
         Left            =   120
         TabIndex        =   393
         Top             =   2490
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   47
         Left            =   480
         TabIndex        =   392
         Top             =   2490
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   47
         Left            =   5280
         TabIndex        =   391
         Top             =   2490
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   47
         Left            =   6360
         TabIndex        =   390
         Top             =   2490
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "46"
         Height          =   255
         Index           =   46
         Left            =   120
         TabIndex        =   389
         Top             =   2250
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   46
         Left            =   480
         TabIndex        =   388
         Top             =   2250
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   46
         Left            =   5280
         TabIndex        =   387
         Top             =   2250
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   46
         Left            =   6360
         TabIndex        =   386
         Top             =   2250
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "45"
         Height          =   255
         Index           =   45
         Left            =   120
         TabIndex        =   385
         Top             =   2010
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   45
         Left            =   480
         TabIndex        =   384
         Top             =   2010
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   45
         Left            =   5280
         TabIndex        =   383
         Top             =   2010
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   45
         Left            =   6360
         TabIndex        =   382
         Top             =   2010
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "44"
         Height          =   255
         Index           =   44
         Left            =   120
         TabIndex        =   381
         Top             =   1770
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   44
         Left            =   480
         TabIndex        =   380
         Top             =   1770
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   44
         Left            =   5280
         TabIndex        =   379
         Top             =   1770
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   44
         Left            =   6360
         TabIndex        =   378
         Top             =   1770
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "43"
         Height          =   255
         Index           =   43
         Left            =   120
         TabIndex        =   377
         Top             =   1530
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   43
         Left            =   480
         TabIndex        =   376
         Top             =   1530
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   43
         Left            =   5280
         TabIndex        =   375
         Top             =   1530
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   43
         Left            =   6360
         TabIndex        =   374
         Top             =   1530
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "42"
         Height          =   255
         Index           =   42
         Left            =   120
         TabIndex        =   373
         Top             =   1290
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   42
         Left            =   480
         TabIndex        =   372
         Top             =   1290
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   42
         Left            =   5280
         TabIndex        =   371
         Top             =   1290
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   42
         Left            =   6360
         TabIndex        =   370
         Top             =   1290
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "41"
         Height          =   255
         Index           =   41
         Left            =   120
         TabIndex        =   369
         Top             =   1050
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   41
         Left            =   480
         TabIndex        =   368
         Top             =   1050
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   41
         Left            =   5280
         TabIndex        =   367
         Top             =   1050
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   41
         Left            =   6360
         TabIndex        =   366
         Top             =   1050
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "40"
         Height          =   255
         Index           =   40
         Left            =   120
         TabIndex        =   365
         Top             =   810
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   40
         Left            =   480
         TabIndex        =   364
         Top             =   810
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   40
         Left            =   5280
         TabIndex        =   363
         Top             =   810
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   40
         Left            =   6360
         TabIndex        =   362
         Top             =   810
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "39"
         Height          =   255
         Index           =   39
         Left            =   120
         TabIndex        =   361
         Top             =   570
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   39
         Left            =   480
         TabIndex        =   360
         Top             =   570
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   39
         Left            =   5280
         TabIndex        =   359
         Top             =   570
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   39
         Left            =   6360
         TabIndex        =   358
         Top             =   570
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "38"
         Height          =   255
         Index           =   38
         Left            =   120
         TabIndex        =   357
         Top             =   330
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "END"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   38
         Left            =   480
         TabIndex        =   356
         Top             =   330
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   38
         Left            =   5280
         TabIndex        =   355
         Top             =   330
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   38
         Left            =   6360
         TabIndex        =   354
         Top             =   330
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   71
         Left            =   6360
         TabIndex        =   39
         Top             =   8280
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   71
         Left            =   5280
         TabIndex        =   38
         Top             =   8280
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   71
         Left            =   480
         TabIndex        =   37
         Top             =   8280
         Width           =   2655
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "71"
         Height          =   255
         Index           =   71
         Left            =   120
         TabIndex        =   36
         Top             =   8280
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   72
         Left            =   6360
         TabIndex        =   35
         Top             =   8520
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   72
         Left            =   5280
         TabIndex        =   34
         Top             =   8520
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   72
         Left            =   480
         TabIndex        =   33
         Top             =   8520
         Width           =   2655
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "72"
         Height          =   255
         Index           =   72
         Left            =   120
         TabIndex        =   32
         Top             =   8520
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   73
         Left            =   6360
         TabIndex        =   31
         Top             =   8760
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   73
         Left            =   5280
         TabIndex        =   30
         Top             =   8760
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   73
         Left            =   480
         TabIndex        =   29
         Top             =   8760
         Width           =   2655
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "73"
         Height          =   255
         Index           =   73
         Left            =   120
         TabIndex        =   28
         Top             =   8760
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   74
         Left            =   6360
         TabIndex        =   27
         Top             =   9000
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   74
         Left            =   5280
         TabIndex        =   26
         Top             =   9000
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   74
         Left            =   480
         TabIndex        =   25
         Top             =   9000
         Width           =   2655
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "74"
         Height          =   255
         Index           =   74
         Left            =   120
         TabIndex        =   24
         Top             =   9000
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Judge"
         Height          =   255
         Index           =   75
         Left            =   6360
         TabIndex        =   23
         Top             =   45
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Measure"
         Height          =   255
         Index           =   75
         Left            =   5280
         TabIndex        =   22
         Top             =   45
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Itme"
         Height          =   270
         Index           =   75
         Left            =   480
         TabIndex        =   21
         Top             =   45
         Width           =   2655
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   270
         Index           =   75
         Left            =   120
         TabIndex        =   20
         Top             =   45
         Width           =   375
      End
   End
   Begin VB.PictureBox Picture2 
      AutoRedraw      =   -1  'True
      Height          =   9495
      Index           =   1
      Left            =   7560
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   40
      Top             =   720
      Visible         =   0   'False
      Width           =   7335
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   480
         TabIndex        =   966
         Top             =   8955
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   3000
         TabIndex        =   965
         Top             =   8955
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   4200
         TabIndex        =   964
         Top             =   8955
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   6000
         TabIndex        =   963
         Top             =   8955
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   6720
         TabIndex        =   962
         Top             =   8955
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   961
         Top             =   8955
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   480
         TabIndex        =   960
         Top             =   8715
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   3000
         TabIndex        =   959
         Top             =   8715
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   4200
         TabIndex        =   958
         Top             =   8715
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   6000
         TabIndex        =   957
         Top             =   8715
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   6720
         TabIndex        =   956
         Top             =   8715
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   955
         Top             =   8715
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   480
         TabIndex        =   954
         Top             =   8475
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   3000
         TabIndex        =   953
         Top             =   8475
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   4200
         TabIndex        =   952
         Top             =   8475
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   6000
         TabIndex        =   951
         Top             =   8475
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   6720
         TabIndex        =   950
         Top             =   8475
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   949
         Top             =   8475
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   480
         TabIndex        =   948
         Top             =   8235
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   3000
         TabIndex        =   947
         Top             =   8235
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   4200
         TabIndex        =   946
         Top             =   8235
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   6000
         TabIndex        =   945
         Top             =   8235
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   6720
         TabIndex        =   944
         Top             =   8235
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   943
         Top             =   8235
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   480
         TabIndex        =   942
         Top             =   7995
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   3000
         TabIndex        =   941
         Top             =   7995
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   4200
         TabIndex        =   940
         Top             =   7995
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   6000
         TabIndex        =   939
         Top             =   7995
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   6720
         TabIndex        =   938
         Top             =   7995
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   937
         Top             =   7995
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   480
         TabIndex        =   936
         Top             =   7755
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   3000
         TabIndex        =   935
         Top             =   7755
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   4200
         TabIndex        =   934
         Top             =   7755
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   6000
         TabIndex        =   933
         Top             =   7755
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   6720
         TabIndex        =   932
         Top             =   7755
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   931
         Top             =   7755
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   480
         TabIndex        =   930
         Top             =   7515
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   3000
         TabIndex        =   929
         Top             =   7515
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   4200
         TabIndex        =   928
         Top             =   7515
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   6000
         TabIndex        =   927
         Top             =   7515
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   6720
         TabIndex        =   926
         Top             =   7515
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   925
         Top             =   7515
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   480
         TabIndex        =   924
         Top             =   7275
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   3000
         TabIndex        =   923
         Top             =   7275
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   4200
         TabIndex        =   922
         Top             =   7275
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   6000
         TabIndex        =   921
         Top             =   7275
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   6720
         TabIndex        =   920
         Top             =   7275
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   919
         Top             =   7275
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   480
         TabIndex        =   918
         Top             =   7035
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   3000
         TabIndex        =   917
         Top             =   7035
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   4200
         TabIndex        =   916
         Top             =   7035
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   6000
         TabIndex        =   915
         Top             =   7035
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   6720
         TabIndex        =   914
         Top             =   7035
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   913
         Top             =   7035
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   480
         TabIndex        =   912
         Top             =   6795
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   3000
         TabIndex        =   911
         Top             =   6795
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   4200
         TabIndex        =   910
         Top             =   6795
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   6000
         TabIndex        =   909
         Top             =   6795
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   6720
         TabIndex        =   908
         Top             =   6795
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   907
         Top             =   6795
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   480
         TabIndex        =   906
         Top             =   6555
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   3000
         TabIndex        =   905
         Top             =   6555
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   4200
         TabIndex        =   904
         Top             =   6555
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   6000
         TabIndex        =   903
         Top             =   6555
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   6720
         TabIndex        =   902
         Top             =   6555
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   901
         Top             =   6555
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   480
         TabIndex        =   900
         Top             =   6315
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   3000
         TabIndex        =   899
         Top             =   6315
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   4200
         TabIndex        =   898
         Top             =   6315
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   6000
         TabIndex        =   897
         Top             =   6315
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   6720
         TabIndex        =   896
         Top             =   6315
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   895
         Top             =   6315
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   480
         TabIndex        =   894
         Top             =   6075
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   3000
         TabIndex        =   893
         Top             =   6075
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   4200
         TabIndex        =   892
         Top             =   6075
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   6000
         TabIndex        =   891
         Top             =   6075
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   6720
         TabIndex        =   890
         Top             =   6075
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   889
         Top             =   6075
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   480
         TabIndex        =   888
         Top             =   5835
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   3000
         TabIndex        =   887
         Top             =   5835
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   4200
         TabIndex        =   886
         Top             =   5835
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   6000
         TabIndex        =   885
         Top             =   5835
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   6720
         TabIndex        =   884
         Top             =   5835
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   883
         Top             =   5835
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   480
         TabIndex        =   882
         Top             =   5595
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   3000
         TabIndex        =   881
         Top             =   5595
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   4200
         TabIndex        =   880
         Top             =   5595
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   6000
         TabIndex        =   879
         Top             =   5595
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   6720
         TabIndex        =   878
         Top             =   5595
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   877
         Top             =   5595
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   480
         TabIndex        =   876
         Top             =   5355
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   3000
         TabIndex        =   875
         Top             =   5355
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   4200
         TabIndex        =   874
         Top             =   5355
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   6000
         TabIndex        =   873
         Top             =   5355
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   6720
         TabIndex        =   872
         Top             =   5355
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   871
         Top             =   5355
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   480
         TabIndex        =   870
         Top             =   5115
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   3000
         TabIndex        =   869
         Top             =   5115
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   4200
         TabIndex        =   868
         Top             =   5115
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   6000
         TabIndex        =   867
         Top             =   5115
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   6720
         TabIndex        =   866
         Top             =   5115
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   865
         Top             =   5115
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   480
         TabIndex        =   864
         Top             =   4875
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   3000
         TabIndex        =   863
         Top             =   4875
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   4200
         TabIndex        =   862
         Top             =   4875
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   6000
         TabIndex        =   861
         Top             =   4875
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   6720
         TabIndex        =   860
         Top             =   4875
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   859
         Top             =   4875
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   480
         TabIndex        =   858
         Top             =   4635
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   3000
         TabIndex        =   857
         Top             =   4635
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   4200
         TabIndex        =   856
         Top             =   4635
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   6000
         TabIndex        =   855
         Top             =   4635
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   6720
         TabIndex        =   854
         Top             =   4635
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   853
         Top             =   4635
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   480
         TabIndex        =   852
         Top             =   4395
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   3000
         TabIndex        =   851
         Top             =   4395
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   4200
         TabIndex        =   850
         Top             =   4395
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   6000
         TabIndex        =   849
         Top             =   4395
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   6720
         TabIndex        =   848
         Top             =   4395
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   847
         Top             =   4395
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   480
         TabIndex        =   846
         Top             =   4155
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   3000
         TabIndex        =   845
         Top             =   4155
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   4200
         TabIndex        =   844
         Top             =   4155
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   6000
         TabIndex        =   843
         Top             =   4155
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   6720
         TabIndex        =   842
         Top             =   4155
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   841
         Top             =   4155
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   480
         TabIndex        =   840
         Top             =   3915
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   3000
         TabIndex        =   839
         Top             =   3915
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   4200
         TabIndex        =   838
         Top             =   3915
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   6000
         TabIndex        =   837
         Top             =   3915
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   6720
         TabIndex        =   836
         Top             =   3915
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   835
         Top             =   3915
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   480
         TabIndex        =   834
         Top             =   3675
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   3000
         TabIndex        =   833
         Top             =   3675
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   4200
         TabIndex        =   832
         Top             =   3675
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   6000
         TabIndex        =   831
         Top             =   3675
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   6720
         TabIndex        =   830
         Top             =   3675
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   829
         Top             =   3675
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   480
         TabIndex        =   828
         Top             =   3435
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   3000
         TabIndex        =   827
         Top             =   3435
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   4200
         TabIndex        =   826
         Top             =   3435
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   6000
         TabIndex        =   825
         Top             =   3435
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   6720
         TabIndex        =   824
         Top             =   3435
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   823
         Top             =   3435
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   480
         TabIndex        =   822
         Top             =   3195
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   3000
         TabIndex        =   821
         Top             =   3195
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   4200
         TabIndex        =   820
         Top             =   3195
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   6000
         TabIndex        =   819
         Top             =   3195
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   6720
         TabIndex        =   818
         Top             =   3195
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   817
         Top             =   3195
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   480
         TabIndex        =   816
         Top             =   2955
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   3000
         TabIndex        =   815
         Top             =   2955
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   4200
         TabIndex        =   814
         Top             =   2955
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   6000
         TabIndex        =   813
         Top             =   2955
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   6720
         TabIndex        =   812
         Top             =   2955
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   811
         Top             =   2955
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   480
         TabIndex        =   810
         Top             =   2715
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   3000
         TabIndex        =   809
         Top             =   2715
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   4200
         TabIndex        =   808
         Top             =   2715
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   6000
         TabIndex        =   807
         Top             =   2715
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   6720
         TabIndex        =   806
         Top             =   2715
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   805
         Top             =   2715
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   480
         TabIndex        =   804
         Top             =   2475
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   3000
         TabIndex        =   803
         Top             =   2475
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   4200
         TabIndex        =   802
         Top             =   2475
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   6000
         TabIndex        =   801
         Top             =   2475
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   6720
         TabIndex        =   800
         Top             =   2475
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   799
         Top             =   2475
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   480
         TabIndex        =   798
         Top             =   2235
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   3000
         TabIndex        =   797
         Top             =   2235
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   4200
         TabIndex        =   796
         Top             =   2235
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   6000
         TabIndex        =   795
         Top             =   2235
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   6720
         TabIndex        =   794
         Top             =   2235
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   793
         Top             =   2235
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   480
         TabIndex        =   792
         Top             =   1995
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   3000
         TabIndex        =   791
         Top             =   1995
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   4200
         TabIndex        =   790
         Top             =   1995
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   6000
         TabIndex        =   789
         Top             =   1995
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   6720
         TabIndex        =   788
         Top             =   1995
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   787
         Top             =   1995
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   480
         TabIndex        =   786
         Top             =   1755
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   3000
         TabIndex        =   785
         Top             =   1755
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   4200
         TabIndex        =   784
         Top             =   1755
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   6000
         TabIndex        =   783
         Top             =   1755
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   6720
         TabIndex        =   782
         Top             =   1755
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   781
         Top             =   1755
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   480
         TabIndex        =   780
         Top             =   1515
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   3000
         TabIndex        =   779
         Top             =   1515
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   4200
         TabIndex        =   778
         Top             =   1515
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   6000
         TabIndex        =   777
         Top             =   1515
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   6720
         TabIndex        =   776
         Top             =   1515
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   775
         Top             =   1515
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   480
         TabIndex        =   774
         Top             =   1275
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   3000
         TabIndex        =   773
         Top             =   1275
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   4200
         TabIndex        =   772
         Top             =   1275
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   6000
         TabIndex        =   771
         Top             =   1275
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   6720
         TabIndex        =   770
         Top             =   1275
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   769
         Top             =   1275
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   480
         TabIndex        =   768
         Top             =   1035
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   3000
         TabIndex        =   767
         Top             =   1035
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   4200
         TabIndex        =   766
         Top             =   1035
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   6000
         TabIndex        =   765
         Top             =   1035
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   6720
         TabIndex        =   764
         Top             =   1035
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   763
         Top             =   1035
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   480
         TabIndex        =   762
         Top             =   795
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   3000
         TabIndex        =   761
         Top             =   795
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   4200
         TabIndex        =   760
         Top             =   795
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   6000
         TabIndex        =   759
         Top             =   795
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   6720
         TabIndex        =   758
         Top             =   795
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   757
         Top             =   795
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   480
         TabIndex        =   756
         Top             =   555
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   3000
         TabIndex        =   755
         Top             =   555
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   4200
         TabIndex        =   754
         Top             =   555
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   6000
         TabIndex        =   753
         Top             =   555
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   6720
         TabIndex        =   752
         Top             =   555
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   751
         Top             =   555
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   480
         TabIndex        =   750
         Top             =   315
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   3000
         TabIndex        =   749
         Top             =   315
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   4200
         TabIndex        =   748
         Top             =   315
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   6000
         TabIndex        =   747
         Top             =   315
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   6720
         TabIndex        =   746
         Top             =   315
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   745
         Top             =   315
         Width           =   735
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   5280
         Locked          =   -1  'True
         TabIndex        =   46
         Text            =   "RY"
         Top             =   45
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   6720
         Locked          =   -1  'True
         TabIndex        =   45
         Text            =   "PO"
         Top             =   45
         Width           =   495
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   6000
         Locked          =   -1  'True
         TabIndex        =   44
         Text            =   "Wtime"
         Top             =   45
         Width           =   735
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   4200
         Locked          =   -1  'True
         TabIndex        =   43
         Text            =   "RS232"
         Top             =   45
         Width           =   1095
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   3000
         Locked          =   -1  'True
         TabIndex        =   42
         Text            =   "M.METER"
         Top             =   45
         Width           =   1215
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   480
         Locked          =   -1  'True
         TabIndex        =   41
         Text            =   "AUDIO SG"
         Top             =   45
         Width           =   2535
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "74"
         Height          =   255
         Index           =   74
         Left            =   120
         TabIndex        =   1003
         Top             =   8955
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "73"
         Height          =   255
         Index           =   73
         Left            =   120
         TabIndex        =   1002
         Top             =   8715
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "72"
         Height          =   255
         Index           =   72
         Left            =   120
         TabIndex        =   1001
         Top             =   8475
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "71"
         Height          =   255
         Index           =   71
         Left            =   120
         TabIndex        =   1000
         Top             =   8235
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "70"
         Height          =   255
         Index           =   70
         Left            =   120
         TabIndex        =   999
         Top             =   7995
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "69"
         Height          =   255
         Index           =   69
         Left            =   120
         TabIndex        =   998
         Top             =   7755
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "68"
         Height          =   255
         Index           =   68
         Left            =   120
         TabIndex        =   997
         Top             =   7515
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "67"
         Height          =   255
         Index           =   67
         Left            =   120
         TabIndex        =   996
         Top             =   7275
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "66"
         Height          =   255
         Index           =   66
         Left            =   120
         TabIndex        =   995
         Top             =   7035
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "65"
         Height          =   255
         Index           =   65
         Left            =   120
         TabIndex        =   994
         Top             =   6795
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "64"
         Height          =   255
         Index           =   64
         Left            =   120
         TabIndex        =   993
         Top             =   6555
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "63"
         Height          =   255
         Index           =   63
         Left            =   120
         TabIndex        =   992
         Top             =   6315
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "62"
         Height          =   255
         Index           =   62
         Left            =   120
         TabIndex        =   991
         Top             =   6075
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "61"
         Height          =   255
         Index           =   61
         Left            =   120
         TabIndex        =   990
         Top             =   5835
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "60"
         Height          =   255
         Index           =   60
         Left            =   120
         TabIndex        =   989
         Top             =   5595
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "59"
         Height          =   255
         Index           =   59
         Left            =   120
         TabIndex        =   988
         Top             =   5355
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "58"
         Height          =   255
         Index           =   58
         Left            =   120
         TabIndex        =   987
         Top             =   5115
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "57"
         Height          =   255
         Index           =   57
         Left            =   120
         TabIndex        =   986
         Top             =   4875
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "56"
         Height          =   255
         Index           =   56
         Left            =   120
         TabIndex        =   985
         Top             =   4635
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "55"
         Height          =   255
         Index           =   55
         Left            =   120
         TabIndex        =   984
         Top             =   4395
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "54"
         Height          =   255
         Index           =   54
         Left            =   120
         TabIndex        =   983
         Top             =   4155
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "53"
         Height          =   255
         Index           =   53
         Left            =   120
         TabIndex        =   982
         Top             =   3915
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "52"
         Height          =   255
         Index           =   52
         Left            =   120
         TabIndex        =   981
         Top             =   3675
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "51"
         Height          =   255
         Index           =   51
         Left            =   120
         TabIndex        =   980
         Top             =   3435
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "50"
         Height          =   255
         Index           =   50
         Left            =   120
         TabIndex        =   979
         Top             =   3195
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "49"
         Height          =   255
         Index           =   49
         Left            =   120
         TabIndex        =   978
         Top             =   2955
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "48"
         Height          =   255
         Index           =   48
         Left            =   120
         TabIndex        =   977
         Top             =   2715
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "47"
         Height          =   255
         Index           =   47
         Left            =   120
         TabIndex        =   976
         Top             =   2475
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "46"
         Height          =   255
         Index           =   46
         Left            =   120
         TabIndex        =   975
         Top             =   2235
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "45"
         Height          =   255
         Index           =   45
         Left            =   120
         TabIndex        =   974
         Top             =   1995
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "44"
         Height          =   255
         Index           =   44
         Left            =   120
         TabIndex        =   973
         Top             =   1755
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "43"
         Height          =   255
         Index           =   43
         Left            =   120
         TabIndex        =   972
         Top             =   1515
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "42"
         Height          =   255
         Index           =   42
         Left            =   120
         TabIndex        =   971
         Top             =   1275
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "41"
         Height          =   255
         Index           =   41
         Left            =   120
         TabIndex        =   970
         Top             =   1035
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "40"
         Height          =   255
         Index           =   40
         Left            =   120
         TabIndex        =   969
         Top             =   795
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "39"
         Height          =   255
         Index           =   39
         Left            =   120
         TabIndex        =   968
         Top             =   555
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "38"
         Height          =   255
         Index           =   38
         Left            =   120
         TabIndex        =   967
         Top             =   315
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   270
         Index           =   75
         Left            =   120
         TabIndex        =   47
         Top             =   45
         Width           =   375
      End
   End
   Begin VB.PictureBox Picture2 
      AutoRedraw      =   -1  'True
      Height          =   9495
      Index           =   0
      Left            =   0
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   61
      Top             =   720
      Visible         =   0   'False
      Width           =   7335
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   3000
         TabIndex        =   707
         Top             =   8970
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   3000
         TabIndex        =   706
         Top             =   8730
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   3000
         TabIndex        =   705
         Top             =   8490
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   3000
         TabIndex        =   704
         Top             =   8250
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   3000
         TabIndex        =   703
         Top             =   8010
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   3000
         TabIndex        =   702
         Top             =   7770
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   3000
         TabIndex        =   701
         Top             =   7530
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   3000
         TabIndex        =   700
         Top             =   7290
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   3000
         TabIndex        =   699
         Top             =   7050
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   3000
         TabIndex        =   698
         Top             =   6810
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   3000
         TabIndex        =   697
         Top             =   6570
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   3000
         TabIndex        =   696
         Top             =   6330
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   3000
         TabIndex        =   695
         Top             =   6090
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   3000
         TabIndex        =   694
         Top             =   5850
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   3000
         TabIndex        =   693
         Top             =   5610
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   3000
         TabIndex        =   692
         Top             =   5370
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   3000
         TabIndex        =   691
         Top             =   5130
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   3000
         TabIndex        =   690
         Top             =   4890
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   3000
         TabIndex        =   689
         Top             =   4650
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   3000
         TabIndex        =   688
         Top             =   4410
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   3000
         TabIndex        =   687
         Top             =   4170
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   3000
         TabIndex        =   686
         Top             =   3930
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   3000
         TabIndex        =   685
         Top             =   3690
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   3000
         TabIndex        =   684
         Top             =   3450
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   3000
         TabIndex        =   683
         Top             =   3210
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   3000
         TabIndex        =   682
         Top             =   2970
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   3000
         TabIndex        =   681
         Top             =   2730
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   3000
         TabIndex        =   680
         Top             =   2490
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   3000
         TabIndex        =   679
         Top             =   2250
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   3000
         TabIndex        =   678
         Top             =   2010
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   3000
         TabIndex        =   677
         Top             =   1770
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   3000
         TabIndex        =   676
         Top             =   1530
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   3000
         TabIndex        =   675
         Top             =   1290
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   3000
         TabIndex        =   674
         Top             =   1050
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   3000
         TabIndex        =   673
         Top             =   810
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   3000
         TabIndex        =   672
         Top             =   570
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   3000
         TabIndex        =   671
         Top             =   330
         Width           =   1215
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   480
         TabIndex        =   670
         Top             =   8970
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   4200
         TabIndex        =   669
         Top             =   8970
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   6000
         TabIndex        =   668
         Top             =   8970
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   6720
         TabIndex        =   667
         Top             =   8970
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   666
         Top             =   8970
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   480
         TabIndex        =   665
         Top             =   8730
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   4200
         TabIndex        =   664
         Top             =   8730
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   6000
         TabIndex        =   663
         Top             =   8730
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   6720
         TabIndex        =   662
         Top             =   8730
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   661
         Top             =   8730
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   480
         TabIndex        =   660
         Top             =   8490
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   4200
         TabIndex        =   659
         Top             =   8490
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   6000
         TabIndex        =   658
         Top             =   8490
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   6720
         TabIndex        =   657
         Top             =   8490
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   656
         Top             =   8490
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   480
         TabIndex        =   655
         Top             =   8250
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   4200
         TabIndex        =   654
         Top             =   8250
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   6000
         TabIndex        =   653
         Top             =   8250
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   6720
         TabIndex        =   652
         Top             =   8250
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   651
         Top             =   8250
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   480
         TabIndex        =   650
         Top             =   8010
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   4200
         TabIndex        =   649
         Top             =   8010
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   6000
         TabIndex        =   648
         Top             =   8010
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   6720
         TabIndex        =   647
         Top             =   8010
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   646
         Top             =   8010
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   480
         TabIndex        =   645
         Top             =   7770
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   4200
         TabIndex        =   644
         Top             =   7770
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   6000
         TabIndex        =   643
         Top             =   7770
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   6720
         TabIndex        =   642
         Top             =   7770
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   641
         Top             =   7770
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   480
         TabIndex        =   640
         Top             =   7530
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   4200
         TabIndex        =   639
         Top             =   7530
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   6000
         TabIndex        =   638
         Top             =   7530
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   6720
         TabIndex        =   637
         Top             =   7530
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   636
         Top             =   7530
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   480
         TabIndex        =   635
         Top             =   7290
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   4200
         TabIndex        =   634
         Top             =   7290
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   6000
         TabIndex        =   633
         Top             =   7290
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   6720
         TabIndex        =   632
         Top             =   7290
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   631
         Top             =   7290
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   480
         TabIndex        =   630
         Top             =   7050
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   4200
         TabIndex        =   629
         Top             =   7050
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   6000
         TabIndex        =   628
         Top             =   7050
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   6720
         TabIndex        =   627
         Top             =   7050
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   626
         Top             =   7050
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   480
         TabIndex        =   625
         Top             =   6810
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   4200
         TabIndex        =   624
         Top             =   6810
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   6000
         TabIndex        =   623
         Top             =   6810
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   6720
         TabIndex        =   622
         Top             =   6810
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   621
         Top             =   6810
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   480
         TabIndex        =   620
         Top             =   6570
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   4200
         TabIndex        =   619
         Top             =   6570
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   6000
         TabIndex        =   618
         Top             =   6570
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   6720
         TabIndex        =   617
         Top             =   6570
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   616
         Top             =   6570
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   480
         TabIndex        =   615
         Top             =   6330
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   4200
         TabIndex        =   614
         Top             =   6330
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   6000
         TabIndex        =   613
         Top             =   6330
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   6720
         TabIndex        =   612
         Top             =   6330
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   611
         Top             =   6330
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   480
         TabIndex        =   610
         Top             =   6090
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   4200
         TabIndex        =   609
         Top             =   6090
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   6000
         TabIndex        =   608
         Top             =   6090
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   6720
         TabIndex        =   607
         Top             =   6090
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   606
         Top             =   6090
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   480
         TabIndex        =   605
         Top             =   5850
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   4200
         TabIndex        =   604
         Top             =   5850
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   6000
         TabIndex        =   603
         Top             =   5850
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   6720
         TabIndex        =   602
         Top             =   5850
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   601
         Top             =   5850
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   480
         TabIndex        =   600
         Top             =   5610
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   4200
         TabIndex        =   599
         Top             =   5610
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   6000
         TabIndex        =   598
         Top             =   5610
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   6720
         TabIndex        =   597
         Top             =   5610
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   596
         Top             =   5610
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   480
         TabIndex        =   595
         Top             =   5370
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   4200
         TabIndex        =   594
         Top             =   5370
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   6000
         TabIndex        =   593
         Top             =   5370
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   6720
         TabIndex        =   592
         Top             =   5370
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   591
         Top             =   5370
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   480
         TabIndex        =   590
         Top             =   5130
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   4200
         TabIndex        =   589
         Top             =   5130
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   6000
         TabIndex        =   588
         Top             =   5130
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   6720
         TabIndex        =   587
         Top             =   5130
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   586
         Top             =   5130
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   480
         TabIndex        =   585
         Top             =   4890
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   4200
         TabIndex        =   584
         Top             =   4890
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   6000
         TabIndex        =   583
         Top             =   4890
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   6720
         TabIndex        =   582
         Top             =   4890
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   581
         Top             =   4890
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   480
         TabIndex        =   580
         Top             =   4650
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   4200
         TabIndex        =   579
         Top             =   4650
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   6000
         TabIndex        =   578
         Top             =   4650
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   6720
         TabIndex        =   577
         Top             =   4650
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   576
         Top             =   4650
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   480
         TabIndex        =   575
         Top             =   4410
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   4200
         TabIndex        =   574
         Top             =   4410
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   6000
         TabIndex        =   573
         Top             =   4410
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   6720
         TabIndex        =   572
         Top             =   4410
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   571
         Top             =   4410
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   480
         TabIndex        =   570
         Top             =   4170
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   4200
         TabIndex        =   569
         Top             =   4170
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   6000
         TabIndex        =   568
         Top             =   4170
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   6720
         TabIndex        =   567
         Top             =   4170
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   566
         Top             =   4170
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   480
         TabIndex        =   565
         Top             =   3930
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   4200
         TabIndex        =   564
         Top             =   3930
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   6000
         TabIndex        =   563
         Top             =   3930
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   6720
         TabIndex        =   562
         Top             =   3930
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   561
         Top             =   3930
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   480
         TabIndex        =   560
         Top             =   3690
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   4200
         TabIndex        =   559
         Top             =   3690
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   6000
         TabIndex        =   558
         Top             =   3690
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   6720
         TabIndex        =   557
         Top             =   3690
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   556
         Top             =   3690
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   480
         TabIndex        =   555
         Top             =   3450
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   4200
         TabIndex        =   554
         Top             =   3450
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   6000
         TabIndex        =   553
         Top             =   3450
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   6720
         TabIndex        =   552
         Top             =   3450
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   551
         Top             =   3450
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   480
         TabIndex        =   550
         Top             =   3210
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   4200
         TabIndex        =   549
         Top             =   3210
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   6000
         TabIndex        =   548
         Top             =   3210
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   6720
         TabIndex        =   547
         Top             =   3210
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   546
         Top             =   3210
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   480
         TabIndex        =   545
         Top             =   2970
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   4200
         TabIndex        =   544
         Top             =   2970
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   6000
         TabIndex        =   543
         Top             =   2970
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   6720
         TabIndex        =   542
         Top             =   2970
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   541
         Top             =   2970
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   480
         TabIndex        =   540
         Top             =   2730
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   4200
         TabIndex        =   539
         Top             =   2730
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   6000
         TabIndex        =   538
         Top             =   2730
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   6720
         TabIndex        =   537
         Top             =   2730
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   536
         Top             =   2730
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   480
         TabIndex        =   535
         Top             =   2490
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   4200
         TabIndex        =   534
         Top             =   2490
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   6000
         TabIndex        =   533
         Top             =   2490
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   6720
         TabIndex        =   532
         Top             =   2490
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   531
         Top             =   2490
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   480
         TabIndex        =   530
         Top             =   2250
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   4200
         TabIndex        =   529
         Top             =   2250
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   6000
         TabIndex        =   528
         Top             =   2250
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   6720
         TabIndex        =   527
         Top             =   2250
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   526
         Top             =   2250
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   480
         TabIndex        =   525
         Top             =   2010
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   4200
         TabIndex        =   524
         Top             =   2010
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   6000
         TabIndex        =   523
         Top             =   2010
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   6720
         TabIndex        =   522
         Top             =   2010
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   521
         Top             =   2010
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   480
         TabIndex        =   520
         Top             =   1770
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   4200
         TabIndex        =   519
         Top             =   1770
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   6000
         TabIndex        =   518
         Top             =   1770
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   6720
         TabIndex        =   517
         Top             =   1770
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   516
         Top             =   1770
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   480
         TabIndex        =   515
         Top             =   1530
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   4200
         TabIndex        =   514
         Top             =   1530
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   6000
         TabIndex        =   513
         Top             =   1530
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   6720
         TabIndex        =   512
         Top             =   1530
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   511
         Top             =   1530
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   480
         TabIndex        =   510
         Top             =   1290
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   4200
         TabIndex        =   509
         Top             =   1290
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   6000
         TabIndex        =   508
         Top             =   1290
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   6720
         TabIndex        =   507
         Top             =   1290
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   506
         Top             =   1290
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   480
         TabIndex        =   505
         Top             =   1050
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   4200
         TabIndex        =   504
         Top             =   1050
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   6000
         TabIndex        =   503
         Top             =   1050
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   6720
         TabIndex        =   502
         Top             =   1050
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   501
         Top             =   1050
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   480
         TabIndex        =   500
         Top             =   810
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   4200
         TabIndex        =   499
         Top             =   810
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   6000
         TabIndex        =   498
         Top             =   810
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   6720
         TabIndex        =   497
         Top             =   810
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   496
         Top             =   810
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   480
         TabIndex        =   495
         Top             =   570
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   4200
         TabIndex        =   494
         Top             =   570
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   6000
         TabIndex        =   493
         Top             =   570
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   6720
         TabIndex        =   492
         Top             =   570
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   491
         Top             =   570
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   480
         TabIndex        =   490
         Top             =   330
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   4200
         TabIndex        =   489
         Top             =   330
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   6000
         TabIndex        =   488
         Top             =   330
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   6720
         TabIndex        =   487
         Top             =   330
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   486
         Top             =   330
         Width           =   735
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   5280
         Locked          =   -1  'True
         TabIndex        =   67
         Text            =   "RY"
         Top             =   60
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   6720
         Locked          =   -1  'True
         TabIndex        =   66
         Text            =   "PO"
         Top             =   60
         Width           =   495
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   6000
         Locked          =   -1  'True
         TabIndex        =   65
         Text            =   "Wtime"
         Top             =   60
         Width           =   735
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   4200
         Locked          =   -1  'True
         TabIndex        =   64
         Text            =   "RS232"
         Top             =   60
         Width           =   1095
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   480
         Locked          =   -1  'True
         TabIndex        =   63
         Text            =   "AUDIO SG"
         Top             =   60
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   3000
         Locked          =   -1  'True
         TabIndex        =   62
         Text            =   "M.METER"
         Top             =   60
         Width           =   1215
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "37"
         Height          =   255
         Index           =   37
         Left            =   120
         TabIndex        =   744
         Top             =   8970
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "36"
         Height          =   255
         Index           =   36
         Left            =   120
         TabIndex        =   743
         Top             =   8730
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "35"
         Height          =   255
         Index           =   35
         Left            =   120
         TabIndex        =   742
         Top             =   8490
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "34"
         Height          =   255
         Index           =   34
         Left            =   120
         TabIndex        =   741
         Top             =   8250
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "33"
         Height          =   255
         Index           =   33
         Left            =   120
         TabIndex        =   740
         Top             =   8010
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "32"
         Height          =   255
         Index           =   32
         Left            =   120
         TabIndex        =   739
         Top             =   7770
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "31"
         Height          =   255
         Index           =   31
         Left            =   120
         TabIndex        =   738
         Top             =   7530
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "30"
         Height          =   255
         Index           =   30
         Left            =   120
         TabIndex        =   737
         Top             =   7290
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "29"
         Height          =   255
         Index           =   29
         Left            =   120
         TabIndex        =   736
         Top             =   7050
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "28"
         Height          =   255
         Index           =   28
         Left            =   120
         TabIndex        =   735
         Top             =   6810
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "27"
         Height          =   255
         Index           =   27
         Left            =   120
         TabIndex        =   734
         Top             =   6570
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "26"
         Height          =   255
         Index           =   26
         Left            =   120
         TabIndex        =   733
         Top             =   6330
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "25"
         Height          =   255
         Index           =   25
         Left            =   120
         TabIndex        =   732
         Top             =   6090
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "24"
         Height          =   255
         Index           =   24
         Left            =   120
         TabIndex        =   731
         Top             =   5850
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "23"
         Height          =   255
         Index           =   23
         Left            =   120
         TabIndex        =   730
         Top             =   5610
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "22"
         Height          =   255
         Index           =   22
         Left            =   120
         TabIndex        =   729
         Top             =   5370
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "21"
         Height          =   255
         Index           =   21
         Left            =   120
         TabIndex        =   728
         Top             =   5130
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "20"
         Height          =   255
         Index           =   20
         Left            =   120
         TabIndex        =   727
         Top             =   4890
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "19"
         Height          =   255
         Index           =   19
         Left            =   120
         TabIndex        =   726
         Top             =   4650
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "18"
         Height          =   255
         Index           =   18
         Left            =   120
         TabIndex        =   725
         Top             =   4410
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "17"
         Height          =   255
         Index           =   17
         Left            =   120
         TabIndex        =   724
         Top             =   4170
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "16"
         Height          =   255
         Index           =   16
         Left            =   120
         TabIndex        =   723
         Top             =   3930
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "15"
         Height          =   255
         Index           =   15
         Left            =   120
         TabIndex        =   722
         Top             =   3690
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "14"
         Height          =   255
         Index           =   14
         Left            =   120
         TabIndex        =   721
         Top             =   3450
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "13"
         Height          =   255
         Index           =   13
         Left            =   120
         TabIndex        =   720
         Top             =   3210
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "12"
         Height          =   255
         Index           =   12
         Left            =   120
         TabIndex        =   719
         Top             =   2970
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "11"
         Height          =   255
         Index           =   11
         Left            =   120
         TabIndex        =   718
         Top             =   2730
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "10"
         Height          =   255
         Index           =   10
         Left            =   120
         TabIndex        =   717
         Top             =   2490
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "9"
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   716
         Top             =   2250
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "8"
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   715
         Top             =   2010
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "7"
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   714
         Top             =   1770
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "6"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   713
         Top             =   1530
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "5"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   712
         Top             =   1290
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "4"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   711
         Top             =   1050
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "3"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   710
         Top             =   810
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   709
         Top             =   570
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   708
         Top             =   330
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   68
         Top             =   60
         Width           =   375
      End
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   6675
      Top             =   2415
   End
   Begin RichTextLib.RichTextBox INFdisplay3 
      Height          =   1125
      Left            =   7710
      TabIndex        =   1004
      Top             =   9045
      Width           =   7050
      _ExtentX        =   12435
      _ExtentY        =   1984
      _Version        =   393217
      Enabled         =   -1  'True
      TextRTF         =   $"ICX2362.frx":0000
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "ICX0412 MOUNT CHECK PROGRAM(FF)"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   18
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   420
      Left            =   4320
      TabIndex        =   70
      Top             =   15
      Width           =   6105
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "作成：香港十和田生产技术课"
      Height          =   180
      Left            =   6750
      TabIndex        =   69
      Top             =   465
      Width           =   2340
   End
End
Attribute VB_Name = "ICX2361"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click()
If Manual = 1 Then
Manual = 0
Command1.Caption = "自动"
Else
Manual = 1
Command1.Caption = "手动"
End If
End Sub

Private Sub Command2_Click() '编辑
Dim PASSWORDSET As String
Dim PASSWORDERR As String
PASSWORDSET = InputBox("请输入密码", "密码框")
If PASSWORDSET = "" Then
UNLOCKED
Else
PASSWORDERR = MsgBox("对不起,密码错误", vbInformation + vbRetryCancel, "取消")
If PASSWORDERR = vbRetry Then Call Command2_Click
End If
End Sub

Private Sub Command3_Click() '保存setting
Dim RST As Integer
LOCKED
RST = MsgBox("以前的数据将被覆盖，是否继续", vbInformation + vbOKCancel, "注意！")
If RST = vbCancel Then Exit Sub
Open App.Path & "\Setting" For Output As #1 '测试数据save
For i = 1 To Stepmax
If i > 70 Then
 Write #1, ICX2362.Meano(i - 70), ICX2362.Itme(i - 70).Caption, ICX2362.Hi(i - 70), ICX2362.Low(i - 70), ICX2362.Asg(i - 70), _
 ICX2362.Mmeter(i - 70), ICX2362.Rs232send(i - 70), ICX2362.Ry(i - 70), ICX2362.Wtime(i - 70), ICX2362.Po(i - 70)
Else
  Write #1, ICX2361.Meano(i), ICX2361.Itme(i).Caption, ICX2361.Hi(i), ICX2361.Low(i), ICX2361.Asg(i), ICX2361.Mmeter(i), _
  ICX2361.Rs232send(i), ICX2361.Ry(i), ICX2361.Wtime(i), ICX2361.Po(i)
  End If
  Next i
Write #1, Time$, Date$
   Close #1
   Call DataLoad
End Sub

Private Sub Command4_Click() '条件设定
If ICX2361.Command4.Caption = "条件设定" Then
ICX2361.Command4.Caption = "返回"
ICX2361.Picture1(1).ZOrder 0
ICX2361.Picture1(0).ZOrder 0
ICX2361.Refresh
ICX2361.Command3.Enabled = False
Else
ICX2361.Command4.Caption = "条件设定"
ICX2361.Picture2(1).ZOrder 0
ICX2361.Picture2(0).ZOrder 0
ICX2361.Command3.Enabled = True
End If
End Sub

Private Sub Command5_Click()
Unload Me
End Sub

Private Sub command6_Click()
If Saveinf = 1 Then
Saveinf = 0
Command6.Caption = "DATA"
Command6.BackColor = &H8000000F
Else
Saveinf = 1
Command6.Caption = "SAVE"
Command6.BackColor = &H80FF&
End If
End Sub





Private Sub Command7_Click(Index As Integer)
Select Case Index
Case 0
HideShow.Visible = False
Case 1
HideShow.Visible = True
HideShow.ZOrder 0
End Select

End Sub

Private Sub Form_Activate()
If TESTrem = 0 Then
TESTrem = 1
Call TESTstart
End If
End Sub

Private Sub Form_Deactivate()
'Stopinf = 1
End Sub

Private Sub Form_Load()
If App.PrevInstance = True Then
MsgBox "程序已经打开"
End
End If
'TESTrem = 0
DoEvents
ICX2362.Show
Call Resetting2
ICX2362.Visible = False
PageNo = 1
AUDIOadr = 7
 R64Adr = 3
GPibini    'GPIB初始化
DIOINIT   'io初始化
IOini 'io输出初始化
If IOread = 1 Then
Sleep (500)
Call IOwrite(4, &H2)
Sleep (1000)
Call IOwrite(4, 0)
End If
SokuteikiInt  '测量仪初始化
MSComm1.PortOpen = True '打开端口
MSComm1.RThreshold = 1
Stepmax = 52
Resetting    '屏幕初始化
command6_Click  '保存数据
'    '取得任务栏的句柄
'    hWnd1 = FindWindow("Shell_TrayWnd", "")
'    '隐藏任务栏
'    Call SetWindowPos(hWnd1, 0, 0, 0, 0, 0, &H80)
    INFdisplay.Text = "ICX0412 MOUNT CHECK PROGRAM(FF)"
    Call DataLoad
Call LOCKED
Stopinf = 0
ICX2361.Picture1(1).Visible = True
ICX2361.Picture1(0).Visible = True
ICX2361.Picture2(1).Visible = True
ICX2361.Picture2(0).Visible = True
ICX2362.Picture1(1).Visible = True
ICX2362.Picture1(0).Visible = True
ICX2362.Picture2(1).Visible = True
ICX2362.Picture2(0).Visible = True

End Sub
Public Sub SokuteikiInt()

'万用表
a$ = "F1,R5,PR2"
Call GPIBwr(R64Adr, a$)
'ASG 3
a$ = "FR1KZAP-50DBMM3LOGAUHPF0LP0"
Call GPIBwr(AUDIOadr, a$)


End Sub
Public Sub GPibini()
'R6852ADRESS
    R64Adr = ildev(0, 3, 0, T10s, 1, 0)
    If (ibsta And EERR) Then
        ErrMsg = "Unable to open device" & Chr(13) & "ibsta = &H" & _
        Chr(13) & Hex(ibsta) & "iberr = " & iberr
        MsgBox ErrMsg, vbCritical, "Error"
        End
    End If
    ilclr R64Adr
    If (ibsta And EERR) Then
        Call GPIBCleanup("Unable to clear 万用表")
    End If
AUDIOadr = ildev(0, 7, 0, T10s, 1, 0)
    If (ibsta And EERR) Then
        ErrMsg = "Unable to open device" & Chr(13) & "ibsta = &H" & _
        Chr(13) & Hex(ibsta) & "iberr = " & iberr
        MsgBox ErrMsg, vbCritical, "Error"
        End
    End If
    ilclr AUDIOadr
    If (ibsta And EERR) Then
        Call GPIBCleanup("Unable to clear 音频分析仪")
    End If
End Sub
Public Sub Closedevice()
PIODIO_DriverClose
ilonl AUDIOadr, 0
ilonl R64Adr, 0
End
End Sub

Public Sub IOini()
Call IOwrite(0, 0)
Call IOwrite(1, 0)
Call IOwrite(2, 0)
Call IOwrite(4, 0)
Call IOwrite(5, 0)
End Sub

Public Function IOread()
Dim IObyte As Integer
IObyte = PIODIO_InputByte(wBaseAddr + &HD0)
IObyte = IObyte Xor &HFF
IOread = IObyte
End Function
Public Function IOwrite(port As Long, IObcd As Integer)
Select Case port
 Case 0
   PIODIO_OutputByte (wBaseAddr + &HC0), IObcd
 Case 1
   PIODIO_OutputByte (wBaseAddr + &HC4), IObcd
 Case 2
   PIODIO_OutputByte (wBaseAddr + &HC8), IObcd
  Case 4
   PIODIO_OutputByte (wBaseAddr + &HD4), IObcd
 Case 5
   PIODIO_OutputByte (wBaseAddr + &HD8), IObcd
 End Select
End Function


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
Public Function GPread(adr)
Dim ValueStr As String * 32
Dim RecvLen As Long
    ' Receives data from a specified device.
    ilrd adr, ValueStr, Len(ValueStr)
    If (ibsta And EERR) Then
            Select Case adr
    Case AUDIOadr
        Call GPIBCleanup("Unable to write to 音频分析仪")
    Case R64Adr
        Call GPIBCleanup("Unable to write to 万用表")
    Case Else
        Call GPIBCleanup("Unable to write to device未知")
    End Select
    End If
    GPread = Val(ValueStr)
End Function
Public Function GPread1(adr) 'interface gpib

Dim RecvLen As Long
    ' Receives data from a specified device.
    RecvLen = 32
    OutpDevAdrsTbl(0) = adr
    OutpDevAdrsTbl(1) = -1
  nRet = PciGpibExMastRecvData(nBoardNo, OutpDevAdrsTbl(0), RecvLen, RecvBuffer, 0)
    If nRet Then
    Call DsplyErrMessage(nRet)
        Select Case adrrs
    Case 7
        Call GPIBCleanup("Unable to write to 音频分析仪")
    Case 3
        Call GPIBCleanup("Unable to write to 万用表")
    Case Else
        Call GPIBCleanup("Unable to write to device未知")
    End Select
    Unload Me
    End
    End If
  ' Displays the data receive.

 tmp! = Val(RecvBuffer)
 GPread1 = tmp!
End Function

Public Sub GPIBwr(adrrs As Integer, CMD As String)
    Dim nRet As Long
    Dim szData As String
    Dim szSG As String
    Dim nLen As Long
    '
    szSG = CMD
     ' Sends the command for universal source.
    szData = StrConv(szSG, vbFromUnicode)
    nLen = LenB(szData)
    szData = StrConv(szData, vbUnicode)
      ilwrt adrrs, CMD, nLen
    If (ibsta And EERR) Then
    Select Case adrrs
    Case AUDIOadr
        Call GPIBCleanup("Unable to write to 音频分析仪")
    Case R64Adr
        Call GPIBCleanup("Unable to write to 万用表")
    Case Else
        Call GPIBCleanup("Unable to write to device未知")
    End Select
    End If

End Sub
Public Sub GPIBwr1(adrrs As Integer, CMD As String) '4304
    Dim nRet As Long
    Dim szData As String
    Dim szSG As String
    Dim nLen As Long
    
    ' Specifies the device address table.
    OutpDevAdrsTbl(0) = adrrs
    OutpDevAdrsTbl(1) = -1
    szSG = CMD
   
    ' Sends the command for universal source.
    szData = StrConv(szSG, vbFromUnicode)
    nLen = LenB(szData)
    szData = StrConv(szData, vbUnicode)
   nRet = PciGpibExMastSendData(nBoardNo, OutpDevAdrsTbl(0), nLen, szData, 0)
  ' Sleep (50)
      If nRet Then
    Select Case adrrs
    Case 7
        Call GPIBCleanup("Unable to write to 音频分析仪")
    Case 3
        Call GPIBCleanup("Unable to write to 万用表")
    Case Else
        Call GPIBCleanup("Unable to write to device未知")
    End Select
    Unload Me
        End
  End If

End Sub
Public Sub Sswpress()
Do
DoEvents  '循环等待期间其他事件响应ON/OFF
Sleep (20)
IOin = IOread
IOin = IOin And 1
'MSComm1.PortOpen = False
Loop Until IOin = 1
End Sub

Public Sub WAITtime(No As Integer)
DoEvents
Dim ii As Long
Dim jj As Long
ii = GetTickCount()
If No = 0 Then
'条件设定WAITTIME
DoEvents
If Val(Cdata(Stepitme, 5)) <= 0 Then Exit Sub
 If Stepitme <= 70 Then
 ICX2361.WaitMAX.Max = Val(Cdata(Stepitme, 5))
 ICX2361.WaitMAX.Min = 0
Else
 ICX2362.WaitMAX.Max = Val(Cdata(Stepitme, 5))
 ICX2362.WaitMAX.Min = 0
End If
Do Until (jj - ii) >= Cdata(Stepitme, 5)
AAA = jj - ii
   jj = GetTickCount()
   If AAA > 0 Then
   If Stepitme <= 70 Then
   ICX2361.WaitMAX.value = AAA
   Else
   ICX2362.WaitMAX.value = AAA
   End If
   End If
       DoEvents
IOREADvalue = IOread
If IOREADvalue = 7 And Manual = 1 Then
Exit Sub
End If
Loop
   If Stepitme <= 70 Then
 ICX2361.WaitMAX.value = Val(Cdata(Stepitme, 5))
 Else
 ICX2362.WaitMAX.value = Val(Cdata(Stepitme, 5))
 End If
 
Else
'内部WAITTIME
DoEvents
 If Stepitme <= 70 Then
ICX2361.WaitMAX.Max = No
ICX2361.WaitMAX.Min = 0
Else
ICX2362.WaitMAX.Max = No
ICX2362.WaitMAX.Min = 0
End If
Do Until (jj - ii) >= No
AAA = jj - ii
   jj = GetTickCount()
   If AAA > 0 Then
    If Stepitme <= 70 Then
   ICX2361.WaitMAX.value = AAA
   Else
   ICX2362.WaitMAX.value = AAA
   End If
   End If
    DoEvents
    IOREADvalue = IOread
If IOREADvalue = 7 And Manual = 1 Then
Exit Sub
End If
Loop
If Stepitme <= 70 Then
ICX2361.WaitMAX.value = No
Else
ICX2362.WaitMAX.value = No
End If

End If
End Sub

Public Sub Rs232TX(Txt As String)
Dim OUTString As String
MSComm1.OutBufferCount = 0
MSComm1.InBufferCount = 0
OUTString = Trim(Txt)
MSComm1.Output = OUTString & Chr$(13)
End Sub

Public Function Rs232RX() As String
'Dim INString As Variant
'INString = MSComm1.Input
'Sleep (20)
'INString = INString & MSComm1.Input
'INString = Replace(INString, Chr(13), "")
'INString = Replace(INString, Chr(10), "")
'INString = Replace(INString, vbCrLf, "")
'INString = Replace(INString, vbLf, "")
'INString = Replace(INString, vbCr, "")
'INString = Replace(INString, " ", "")
'Rs232RX = INString
'If Stepitme > 70 Then
'ICX2362.INFdisplay.Text = INString
'Else
'ICX2361.INFdisplay.Text = INString
'ICX2361.INFdisplay3.Text = INString
'ICX2361.INFdisplay3.ZOrder 0
'End If
Rs232RX = MSComm1_OnComm2
End Function
Private Sub Mscomm1Open(ByVal No As Integer)
On Error GoTo Exit1
If No = 1 Then
 If MSComm1.PortOpen = False Then MSComm1.PortOpen = True
Else
 If MSComm1.PortOpen = True Then MSComm1.PortOpen = False
End If
Exit Sub
Exit1:
INFdisplay.Text = "com" & MSComm1.CommPort & " open error"
End Sub
Private Function MSComm1_OnComm2()
If MSComm1.PortOpen = False Then
Call Mscomm1Open(1)
End If
If MSComm1.PortOpen = False Then Exit Function
MSComm1.InputMode = comInputModeText
Dim Bar_Input() As Variant
Dim Bar_Code As Variant
Dim i As Integer
Dim Count As Integer
MSComm1.InputLen = 1
Count = 0
Bar_Code = ""
While MSComm1.InBufferCount > 0 And Count < 300
ReDim Preserve Bar_Input(Count + 1)
Bar_Input(Count) = MSComm1.Input
Count = Count + 1
Wend
MSComm1.InputLen = MSComm1.InBufferCount
Ret = MSComm1.Input
If Count <> 0 Then
For i = 0 To Count
Bar_Code = Bar_Code & Bar_Input(i)
Next i
End If
'MsgBox Asc(Bar_Input(i))
Bar_Code = Replace(Bar_Code, Chr(13), "")
Bar_Code = Replace(Bar_Code, Chr(10), "")
Bar_Code = Replace(Bar_Code, vbCrLf, "")
Bar_Code = Replace(Bar_Code, vbLf, "")
Bar_Code = Replace(Bar_Code, vbCr, "")
Bar_Code = Replace(Bar_Code, Chr(0), "")
MSComm1_OnComm2 = Bar_Code
If Stepitme > 70 Then
ICX2362.INFdisplay.Text = Bar_Code
Else
ICX2361.INFdisplay.Text = Bar_Code
If ICX2361.INFdisplay.Text <> "OK" And ICX2361.INFdisplay.Text <> "NG" Then
INFdisplay3.Visible = True
ICX2361.INFdisplay3.Text = Bar_Code
ICX2361.INFdisplay3.ZOrder 0
End If
End If
End Function
Public Sub Rs232TX2(OUTString As String)
Dim OUTString_1 As String * 1
Dim iii As Integer
MSComm1.InBufferCount = 0
MSComm1.OutBufferCount = 0
OUTString = Trim(OUTString)
For iii = 1 To Len(OUTString)
OUTString_1 = Mid$(OUTString, iii, 1)
MSComm1.Output = OUTString_1
Sleep 10
Next iii
'OUTString = "test " & UCase$(Trim(Rs232send(Stepitme).Text)) & Chr$(13)
Sleep 10
MSComm1.Output = Chr$(13)
End Sub

Public Sub ACon()
Call IOwrite(2, &H0)
Sleep (100)
Call IOwrite(2, &H4)
Call IOwrite(0, &H1)
Sleep (1000)
Call IOwrite(1, &H1)
Sleep (1000)
Call IOwrite(1, &H0)
Sleep (2500)
End Sub

Public Sub CDATAsetting()
Dim GPIBERdata As String
Dim i As Integer
Dim Ret As Integer
Dim RS232Ft(9) As String
Dim ERRnum As Integer

If Sdata(Stepitme, 1) = "START" Then
Call IOwrite(4, 0) 'pin up
Prot_4 = 1
Call IOwrite(4, Prot_4) 'pin up
DoEvents
Sleep (100)
Call ACon
End If
'If Sdata(Stepitme, 1) = "START" Then
'DoEvents
'Sleep (1500)
'End If
Select Case Stepitme
Case 48
Call IOwrite(0, &H0)
Sleep 300
Call ACon
End Select
a$ = UCase$(Trim(Cdata(Stepitme, 4)))
Prot_0 = Val("&H" + Left$(a$, 2))
Prot_1 = Val("&H" + Mid(a$, 3, 2))
Prot_2 = Val("&H" + Mid$(a$, 5, 2))
'Prot_5 = Val("&H" + Right(a$, 2))
'Call IOwrite(5, Prot_5)
Call IOwrite(0, Prot_0)
Call IOwrite(1, Prot_1)
Call IOwrite(2, Prot_2)
If Cdata(Stepitme, 3) <> "" Then
ERRnext:
MMn = ""
RS232Ft(0) = Trim(Cdata(Stepitme, 3))
    RI = InStr(1, RS232Ft(0), ",")
    If RI = 0 Then
    Call Rs232TX2(RS232Ft(0))
                        If Stepitme = 3 Or Stepitme = 44 Then
                        DoEvents
                         Call WAITtime(2000)
                        End If
                    If Stepitme = 9 Then
                        Call WAITtime(5000)
                     End If
                    Sleep (800)
                    MMn = Trim(Rs232RX)
                    RI = InStr(1, MMn, RS232Ft(0))
'                    If Stepitme = 17 And Stepitme = 18 Then
'                    Gg$ = Trim(Low(Stepitme).Text)
'                    RI = InStr(1, MMn, Gg$)
'                    End If
                    
                    If RI = 0 And ERRnum < 2 Then
                    ERRnum = ERRnum + 1
                    GoTo ERRnext
                    End If
    Else
        For i = 0 To 9
        RI = InStr(1, RS232Ft(0), ",")
            If RI <> 0 Then
            RS232Ft(i + 1) = Mid(RS232Ft(0), 1, RI - 1)
            RS232Ft(0) = Mid(RS232Ft(0), RI + 1, Len(RS232Ft(0)) - RI)
            Call Rs232TX2(RS232Ft(i + 1))
            
            Else
                    Call Rs232TX2(RS232Ft(0))
                        If Stepitme = 3 Or Stepitme = 44 Then
                        DoEvents
                         Call WAITtime(2000)
                        End If
                    If Stepitme = 9 Then
                        Call WAITtime(5000)
                     End If
                    Sleep (800)
                    MMn = Trim(Rs232RX)
                    RI = InStr(1, MMn, RS232Ft(0))
'                    If Stepitme = 16 Then
'                    RI = InStr(1, MMn, Trim(Rs232send(Stepitme).Text))
'                    End If
                    If RI = 0 And ERRnum < 2 Then
                    ERRnum = ERRnum + 1
                    GoTo ERRnext
                    Exit For
                    End If
            Exit For
            End If
'                    If Stepitme = 8 And Stepitme = 7 Then
'                    Sleep (2000)
'                    End If
                    Sleep (800)
                    MMn = Trim(Rs232RX)
                    RI = InStr(1, MMn, RS232Ft(i + 1))
'                    If Stepitme = 16 Or Stepitme = 17 Then
'                    RI = InStr(1, MMn, "ICX-236")
'                    End If
                    If RI = 0 And ERRnum < 2 Then
                    ERRnum = ERRnum + 1
                    GoTo ERRnext
                    Exit For
                    End If
'   If Stepitme = 8 Then
'                    Sleep (2000)
'                    End If
                  Sleep (300)
        Next
        End If
End If
'If Stepitme = 27 Then
'Call WAITtime(1200)
'Call IOwrite(2, &HE)
''Call WAITtime(1000)
'End If

If Stepitme = 46 Then
Call WAITtime(1200)
Call IOwrite(2, &H15)
'Call WAITtime(1000)
End If
'If Stepitme = 49 Then
'Call WAITtime(1500)
'Call IOwrite(2, &H15)
'Call WAITtime(1000)
'End If
If Cdata(Stepitme, 1) <> "" Then
GPIBERdata = UCase$(Trim(Cdata(Stepitme, 1)))
Call GPIBwr(AUDIOadr, GPIBERdata)
End If

If Cdata(Stepitme, 2) <> "" Then
GPIBERdata = UCase$(Trim(Cdata(Stepitme, 2)))
Call GPIBwr(R64Adr, GPIBERdata)
End If

If Val(Cdata(Stepitme, 5)) > 0 Then
Call WAITtime(0)
End If
End Sub
Public Sub CDATAsetting2()
Dim GPIBERdata As String
Dim i As Integer
Dim Ret As Integer
Dim RS232Ft(9) As String
Dim ERRnum As Integer
Dim Stepitme_pri As Integer
'If PageNo = 2 Then
'Stepitme = Stepitme - 81
'End If
If Itme(Stepitme).Caption = "START" Then
Call IOwrite(4, 0) 'pin up
Prot_4 = 1
Call IOwrite(4, Prot_4) 'pin up
MSComm1.OutBufferCount = 0
MSComm1.InBufferCount = 0
Sleep (300)
End If
'If Itme(Stepitme).Caption = "START" Then
'Sleep (1500)
'End If
'Select Case Stepitme
'Case 68
'Call IOwrite(4, 5) 'pin up
'Case 13
'Call IOwrite(4, 3) 'pin up
'Case 51
'Call IOwrite(4, 1) 'pin up
'End Select

a$ = UCase$(Trim(Cdata(i, 4)))
Prot_0 = Val("&H" + Left$(a$, 2))
Prot_1 = Val("&H" + Mid(a$, 3, 2))
Prot_2 = Val("&H" + Mid$(a$, 5, 2))
Prot_5 = Val("&H" + Right(a$, 2))
Call IOwrite(5, Prot_5)
Call IOwrite(0, Prot_0)
Call IOwrite(1, Prot_1)
Call IOwrite(2, Prot_2)
If Rs232send(Stepitme).Text <> "" Then

ERRnext:
MMn = ""
RS232Ft(0) = Trim(Cdata(i, 3))
    RI = InStr(1, RS232Ft(0), ",")
    If RI = 0 Then
    Call Rs232TX2(RS232Ft(0))
                    If Stepitme = 1 Then
                    Sleep (1000)
                    End If
                    Sleep (500)
                    MMn = Trim(Rs232RX)
                    RI = InStr(1, MMn, RS232Ft(0))
                    If Stepitme = 21 And Stepitme = 22 Then
                    Gg$ = Trim(Sdata(i, 3))
                    RI = InStr(1, MMn, Gg$)
                    End If
                    
                    If RI = 0 And ERRnum < 2 Then
                    ERRnum = ERRnum + 1
                    GoTo ERRnext
                    End If
    Else
        For i = 0 To 9
        RI = InStr(1, RS232Ft(0), ",")
            If RI <> 0 Then
            RS232Ft(i + 1) = Mid(RS232Ft(0), 1, RI - 1)
            RS232Ft(0) = Mid(RS232Ft(0), RI + 1, Len(RS232Ft(0)) - RI)
            Call Rs232TX2(RS232Ft(i + 1))
            
            Else
                    Call Rs232TX2(RS232Ft(0))
'                    If Stepitme = 8 And Stepitme = 7 Then
'                    Sleep (2000)
'                    End If
                    Sleep (500)
                    MMn = Trim(Rs232RX)
                    RI = InStr(1, MMn, RS232Ft(0))
'                    If Stepitme = 16 Then
'                    RI = InStr(1, MMn, Trim(Rs232send(Stepitme).Text))
'                    End If
                    If RI = 0 And ERRnum < 2 Then
                    ERRnum = ERRnum + 1
                    GoTo ERRnext
                    Exit For
                    End If
            Exit For
            End If
'                    If Stepitme = 8 And Stepitme = 7 Then
'                    Sleep (2000)
'                    End If
                    Sleep (500)
                    MMn = Trim(Rs232RX)
                    RI = InStr(1, MMn, RS232Ft(i + 1))
'                    If Stepitme = 16 Or Stepitme = 17 Then
'                    RI = InStr(1, MMn, "ICX-236")
'                    End If
                    If RI = 0 And ERRnum < 2 Then
                    ERRnum = ERRnum + 1
                    GoTo ERRnext
                    Exit For
                    End If
'   If Stepitme = 8 Then
'                    Sleep (2000)
'                    End If
                  Sleep (300)
        Next
        End If
End If
If Cdata(i, 1) <> "" Then
GPIBERdata = UCase$(Trim(Cdata(i, 1)))
Call GPIBwr(AUDIOadr, GPIBERdata)
End If

If Cdata(i, 2) <> "" Then
GPIBERdata = UCase$(Trim(Cdata(i, 2)))
Call GPIBwr(R64Adr, GPIBERdata)
End If




If Val(Cdata(i, 5)) > 0 Then
Call WAITtime(0)
End If
'If PageNo = 2 Then
'Stepitme = Stepitme + 81
'End If
End Sub
'Public Function Testmode(OF As Boolean) As Boolean
'If OF = True Then
'Prot_4 = 98
'Call IOwrite(4, Prot_4) 'test mode
'Call IOwrite(0, 2)
'Sleep (2000)
'Prot_4 = 66
'Call IOwrite(4, Prot_4)
'End If
'If OF = False Then
'Call IOwrite(4, &H2)
'Sleep (500)
'Call IOwrite(4, &H42)
'End If
'End Function

Public Sub Mea()
Dim Po3 As Integer
Dim Hidata As Double
Dim Lowdata As Double
'On Error Resume Next
Hidata = Val(Sdata(Stepitme, 2))
Lowdata = Val(Sdata(Stepitme, 3))
Po3 = Val(Cdata(Stepitme, 6))
'Dim er01 As Integer
'Dim RETval As String
'RETval = "OK"
'If Stepitme = 64 Then
'GoTo Next2323
'End If
'er01 = 0
'Next23201:
'If Rs232send(Stepitme).Text <> "" And Po3 <> 3 Then
'MM$ = Rs232RX
'Measure(Stepitme).Caption = MM$
'    If InStr(1, MM$, RETval) = 0 Then
'    er01 = er01 + 1
'          If er01 = 2 Then
'            Judge(Stepitme).Caption = "232NG"
'            Judge(Stepitme).BackColor = &HFF
'            NGflag = 1
'          Exit Sub
'          End If
'               Call Rs232TX
'        If Val(Wtime(Stepitme).Text) > 0 Then
'        Call WAITtime(0)
'        End If
'    GoTo Next23201
'    End If
'End If
'Next2323:
Select Case Po3
Case 0
If Stepitme <= 70 Then
ICX2361.Measure(Stepitme).Caption = "PASS"
Else
ICX2362.Measure(Stepitme - 70).Caption = "PASS"
End If
Case 1
If Stepitme = 50 Then
Sleep (30)
Avg = 0
Avg = GPread(R64Adr)
For i = 1 To 9
Sleep (100)
Avg = Avg + GPread(R64Adr)
Next i
Meavalue(Stepitme) = Avg / 10
Else

Meavalue(Stepitme) = GPread(R64Adr)
End If

STEPstep
If Cdata(Stepitme, 2) = "F5,R6,PR2" Then Meavalue(Stepitme) = Meavalue(Stepitme) * 1000
If Cdata(Stepitme, 2) = "F5,R5,PR2" Then
Meavalue(Stepitme) = (Meavalue(Stepitme) * 1000)
End If
If Stepitme <= 70 Then
ICX2361.Measure(Stepitme).Caption = Format$(Meavalue(Stepitme), "#0.00")
Else
ICX2362.Measure(Stepitme - 70).Caption = Format$(Meavalue(Stepitme), "#0.00")
End If
    If Meavalue(Stepitme) >= Lowdata And Meavalue(Stepitme) <= Hidata Then
    If Stepitme <= 70 Then
     ICX2361.Judge(Stepitme).Caption = "OK"
     ICX2361.Judge(Stepitme).BackColor = &HFF00&
    Else
         ICX2362.Judge(Stepitme - 70).Caption = "OK"
     ICX2362.Judge(Stepitme - 70).BackColor = &HFF00&
    End If
    Else
    If Stepitme <= 70 Then
     ICX2361.Judge(Stepitme).Caption = "NG"
     ICX2361.Judge(Stepitme).BackColor = &HFF
     Else
          ICX2362.Judge(Stepitme - 70).Caption = "NG"
     ICX2362.Judge(Stepitme - 70).BackColor = &HFF
     End If
     NGflag = 1
    End If
 Case 2
 If Stepitme <> 26 Then
 Meavalue(Stepitme) = GPread(AUDIOadr)
 End If
STEPstep
If Stepitme <= 70 Then
ICX2361.Measure(Stepitme).Caption = Format$(Meavalue(Stepitme), "#0.00")
Else
ICX2362.Measure(Stepitme - 70).Caption = Format$(Meavalue(Stepitme), "#0.00")
End If
If (Meavalue(Stepitme) < Lowdata) Or (Meavalue(Stepitme) > Hidata) Then
Call GPIBwr(AUDIOadr, "AU")
Sleep 1000
Meavalue(Stepitme) = GPread(AUDIOadr)
STEPstep
If Stepitme <= 70 Then
ICX2361.Measure(Stepitme).Caption = Format$(Meavalue(Stepitme), "#0.00")
Else
ICX2362.Measure(Stepitme - 70).Caption = Format$(Meavalue(Stepitme), "#0.00")
End If
End If
If Meavalue(Stepitme) >= Lowdata And Meavalue(Stepitme) <= Hidata Then
 If Stepitme <= 70 Then
     ICX2361.Judge(Stepitme).Caption = "OK"
     ICX2361.Judge(Stepitme).BackColor = &HFF00&
     Else
         ICX2362.Judge(Stepitme - 70).Caption = "OK"
     ICX2362.Judge(Stepitme - 70).BackColor = &HFF00&
     End If
    Else
     If Stepitme <= 70 Then
      ICX2361.Judge(Stepitme).Caption = "NG"
      ICX2361.Judge(Stepitme).BackColor = &HFF
     Else
           ICX2362.Judge(Stepitme - 70).Caption = "NG"
      ICX2362.Judge(Stepitme - 70).BackColor = &HFF
     End If
     NGflag = 1
    End If
Case 3
Dim HH232 As Long

Dim LL232 As Long
MM$ = MMn
NN$ = Trim(Sdata(Stepitme, 3))
ICX2361.Measure(Stepitme).Caption = MM$
Select Case Stepitme
Case 100

Ret = InStr(1, MMn, ":")

If Ret <> 0 Then
If Stepitme <= 70 Then
ICX2361.Measure(Stepitme).Caption = Mid(MMn, Ret + 1, 2)
Else
ICX2362.Measure(Stepitme - 70).Caption = Mid(MMn, Ret + 1, 2)
End If

Meavalue(Stepitme) = Trim(Mid(MMn, Ret + 1, 2))
End If
HH232 = Val("&H" & Trim(Sdata(Stepitme, 2)))
If HH232 = 0 Then HH232 = 1000
LL232 = Val("&H" & Trim(Sdata(Stepitme, 3)))
    If HH232 >= Val("&h" & Meavalue(Stepitme)) And Val("&h" & Meavalue(Stepitme)) >= LL232 Then
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "OK"
    ICX2361.Judge(Stepitme).BackColor = &HFF00&
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "OK"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF00&
    End If
    Else
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "NG"
    ICX2361.Judge(Stepitme).BackColor = &HFF
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "NG"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF
    End If
    NGflag = 1
    End If
Case 28, 43

Ret = InStr(1, MMn, ">")
If Stepitme = 28 And MMn <> "" Then MM$ = Mid(MMn, Ret + 1, 4)
If Stepitme = 28 And MM$ <> "" Then MM$ = Left(MM$, 4)
If Stepitme = 43 And MM$ <> "" Then MM$ = Mid(MMn, Ret + 1, 4)
If Stepitme = 43 And MM$ <> "" Then MM$ = Left(MM$, 2)
'If Ret <> 0 Then
'If Stepitme <= 70 Then
'ICX2361.Measure(Stepitme).Caption = Mid(MMn, Ret + 5, 4)
'Else
'ICX2362.Measure(Stepitme - 70).Caption = Mid(MMn, Ret + 5, 4)
'End If
'
Meavalue(Stepitme) = MM$ 'Trim(Mid(MMn, Ret + 5, 4))
ICX2361.Measure(Stepitme).Caption = MM$
'End If
HH232 = Val("&H" & Trim(Sdata(Stepitme, 2)))
If HH232 = 0 Then HH232 = 1000
LL232 = Val("&H" & Trim(Sdata(Stepitme, 3)))
    If HH232 >= Val("&h" & Meavalue(Stepitme)) And Val("&h" & Meavalue(Stepitme)) >= LL232 Then
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "OK"
    ICX2361.Judge(Stepitme).BackColor = &HFF00&
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "OK"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF00&
    End If
    Else
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "NG"
    ICX2361.Judge(Stepitme).BackColor = &HFF
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "NG"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF
    End If
    NGflag = 1
    End If
Case 3, 9, 10, 11, 12, 14, 23, 41, 44
          Ret = InStr(1, MMn, NN$)
          If Ret <> 0 Then
          If Stepitme <= 70 Then
          ICX2361.Measure(Stepitme).Caption = Trim(Mid(MMn, Ret, Len(NN$)))
          Else
          ICX2362.Measure(Stepitme - 70).Caption = Trim(Mid(MMn, Ret, Len(NN$)))
          End If
          
          Meavalue(Stepitme) = Trim(Mid(MMn, Ret, Len(NN$)))
          End If
    If InStr(1, MM$, NN$) <> 0 Then
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "OK"
    ICX2361.Judge(Stepitme).BackColor = &HFF00&
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "OK"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF00&
    End If
    Else
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "NG"
    ICX2361.Judge(Stepitme).BackColor = &HFF
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "NG"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF
    End If
    NGflag = 1
    End If
   Case 23
    If InStr(1, UCase(MM$), "18") <> 0 Then
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "19"
    ICX2361.Judge(Stepitme).BackColor = &HFF00&
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "19"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF00&
    End If
    Else
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "NG"
    ICX2361.Judge(Stepitme).BackColor = &HFF
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "NG"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF
    End If
    NGflag = 1
    End If
    Case 41
    If InStr(1, UCase(MM$), "18") <> 0 Then
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "19"
    ICX2361.Judge(Stepitme).BackColor = &HFF00&
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "19"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF00&
    End If
    Else
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "NG"
    ICX2361.Judge(Stepitme).BackColor = &HFF
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "NG"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF
    End If
    NGflag = 1
    End If
 
 

Case Else
    If InStr(1, UCase(MM$), "OK") <> 0 Then
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "OK"
    ICX2361.Judge(Stepitme).BackColor = &HFF00&
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "OK"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF00&
    End If
    Else
    If Stepitme <= 70 Then
    ICX2361.Judge(Stepitme).Caption = "NG"
    ICX2361.Judge(Stepitme).BackColor = &HFF
    Else
        ICX2362.Judge(Stepitme - 70).Caption = "NG"
    ICX2362.Judge(Stepitme - 70).BackColor = &HFF
    End If
    NGflag = 1
    End If
End Select
End Select
End Sub



Public Sub OKNGdisplay()
Picture3.ZOrder 0
INFdisplay.ZOrder 0
INFdisplay3.Visible = False
WaitMAX.Visible = False
Dim i As Integer
For i = 0 To Stepmax
If i <= 70 Then
If ICX2361.Judge(i).Caption = "NG" Or ICX2361.Judge(i).Caption = "232NG" Then
NGflag = 1
End If
Else
If ICX2362.Judge(i - 70).Caption = "NG" Or ICX2362.Judge(i - 70).Caption = "232NG" Then
NGflag = 1
End If
End If
Next i

If NGflag = 0 Then
'If Stepitme > 70 Then
ICX2362.INFdisplay.Alignment = 2
ICX2362.INFdisplay.Font.Size = 30
ICX2362.INFdisplay.ForeColor = H00FF0000&
ICX2362.INFdisplay.Text = "OK"
ICX2362.INFdisplay.BackColor = &HFF00&
'Else
ICX2361.INFdisplay.Alignment = 2
ICX2361.INFdisplay.Font.Size = 30
ICX2361.INFdisplay.ForeColor = H00FF0000&
ICX2361.INFdisplay.Text = "OK"
ICX2361.INFdisplay.BackColor = &HFF00&
'End If
Call IOwrite(4, &H0)
 Sleep (600)
Call IOwrite(3, &H4)
'Sleep 800
'Call IOwrite(4, 1)
Sleep 1000
Call IOwrite(4, 0)
If Saveinf = 1 Then DATAsave
'DATAsave
Else
'If Stepitme > 70 Then
ICX2362.INFdisplay.Alignment = 2
ICX2362.INFdisplay.Font.Size = 30
ICX2362.INFdisplay.Text = "NG"
ICX2362.INFdisplay.BackColor = &HFF
'Else
ICX2361.INFdisplay.Alignment = 2
ICX2361.INFdisplay.Font.Size = 30
ICX2361.INFdisplay.Text = "NG"
ICX2361.INFdisplay.BackColor = &HFF
'End If
Call IOwrite(4, &H1)
 Sleep (500)
    Do
    
    DoEvents  '循环等待期间其他事件响应ON/OFF
           Call IOwrite(4, 1)
            Sleep 100
            Call IOwrite(4, &H3)
            Sleep 100
            Call IOwrite(4, 1)
    Loop Until (IOread And 4) = 4
Call IOwrite(4, 0)
    Do
    DoEvents  '循环等待期间其他事件响应ON/OFF
    Sleep (10)
    Loop Until IOread = 0
End If
End Sub


Public Sub Maintest()
Dim Err02 As Integer
Dim Avg As Single
DoEvents
For Stepitme = 1 To Stepmax
If Stepitme = 71 Then
Call Page_command_Click
End If
If Stepitme = 1 Then
PageNo = 2
ICX2362.Visible = False
ICX2361.Visible = True
ICX2361.ZOrder 0
End If
'If Stepitme = 2 Then Stepitme = 45
'Stepitme = 45
NGflag = 0
TIPsub
Err02 = 0
Errstep02:
        If Stopinf = 1 Then
        Do
        Loop Until Stopinf = 0
        End If
DoEvents
        If (IOread And 4) = 4 Then
        Call IOini
        NGflag = 1
        Exit For
        End If
CDATAsetting
Mea
''ng Retest
If NGflag = 1 Then
Err02 = Err02 + 1
If Err02 <= 1 Then
NGflag = 0
GoTo Errstep02
End If
End If
If Manual = 0 And NGflag = 1 Then Exit For
If Manual = 1 Then Sswpress
Next Stepitme
'okng
OKNGdisplay
End Sub
Public Sub TIPsub()
'Select Case Stepitme
'Case 20
'      Call IOwrite(4, &H4A)
'    Case 50
'Call IOwrite(4, &H42)
'Case 55
'    Call IOwrite(4, &H4A)
'Case 57
'Call IOwrite(4, &H42)
'    End Select
End Sub
Public Sub TESTstart()
Next1:
Do
DoEvents  '循环等待期间其他事件响应ON/OFF
    Do
    DoEvents  '循环等待期间其他事件响应ON/OFF
    Sleep (10)
    Loop Until IOread = 0
    Do
    DoEvents  '循环等待期间其他事件响应ON/OFF
     Sleep (10)
    Loop Until IOread = 8
    Call IOwrite(4, 1)
        Do
    DoEvents  '循环等待期间其他事件响应ON/OFF
     Sleep (10)
     If (IOread And 4) = 4 Then
         Call IOwrite(4, 0)
     GoTo Next1
     End If
    Loop Until IOread = 2
    DoEvents
        Sleep 1000
        Resetting
        PageNo = 1
        Maintest
Loop
End Sub


Public Sub STEPstep()
Select Case Stepitme

Case 26
Meavalue(Stepitme) = Val(Meavalue(24)) - Val(Meavalue(25))
'Case 19
'Meavalue(Stepitme) = Val(Stepitme) - Val(Meavalue(28))
'Case 33
'Meavalue(Stepitme) = Val(Meavalue(32)) - Val(Meavalue(31))

Case 18
Meavalue(Stepitme) = Meavalue(15) - Meavalue(Stepitme)
Case 19
Meavalue(Stepitme) = Meavalue(Stepitme) - Meavalue(15)
Case 20
Meavalue(Stepitme) = Meavalue(Stepitme) - Meavalue(15)
Case 31
Meavalue(Stepitme) = Meavalue(24) - Meavalue(Stepitme)
Case 32
Meavalue(Stepitme) = Meavalue(25) - Meavalue(Stepitme)
'Case 30
'Meavalue(Stepitme) = Meavalue(24) - Meavalue(Stepitme)
''Case 45
''Meavalue(Stepitme) = Meavalue(36) - Meavalue(Stepitme)
''Case 46
''Meavalue(Stepitme) = Meavalue(37) - Meavalue(Stepitme)
''Case 42
''meavalue(Stepitme) = meavalue(35) - meavalue(Stepitme)
''Case 43
''meavalue(Stepitme) = meavalue(36) - meavalue(Stepitme)
'Case 35
'Meavalue(Stepitme) = Meavalue(Stepitme) - Meavalue(11)
'Case 36
'Meavalue(Stepitme) = Meavalue(Stepitme) - Meavalue(11)
Case 51
Meavalue(Stepitme) = Val(Meavalue(Stepitme)) * 1000
Case 35
Meavalue(Stepitme) = Meavalue(Stepitme) - Meavalue(24)
Case 36
Meavalue(Stepitme) = Meavalue(Stepitme) - Meavalue(25)
Case 37
Meavalue(Stepitme) = Meavalue(Stepitme) - Meavalue(24)
Case 38
Meavalue(Stepitme) = Meavalue(Stepitme) - Meavalue(25)
End Select
End Sub

Private Sub Form_Unload(Cancel As Integer)
Call IOini
Sleep (500)
If IOread = 1 Then
Call IOwrite(4, &H40)
Sleep (1000)
Call IOwrite(4, 0)
End If
'    '取得任务栏的句柄
'    MSComm1.PortOpen = False
'    hWnd1 = FindWindow("Shell_TrayWnd", "")
'    '显示任务栏
'    Call SetWindowPos(hWnd1, 0, 0, 0, 0, 0, &H40)
Closedevice
End
End Sub

Private Sub IOCHECKER_Click()
Stopinf = 1
Sleep (500)
FORM2.Show
End Sub

Private Sub Meano_DblClick(Index As Integer)
Stepitme = Index

Call CDATAsetting

Call Mea

End Sub

Private Sub Page_command_Click()
'If PageNo = 1 And Stepmax > 70 Then
'PageNo = 2
ICX2361.Visible = False
ICX2362.Visible = True
ICX2362.ZOrder 0
'Else
'PageNo = 1
'ICX2361.Visible = True
'ICX2362.Visible = False
'ICX2361.ZOrder 0
'End If
End Sub
