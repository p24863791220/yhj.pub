VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form ICX2362 
   Caption         =   "ICX266 MOUNT CHECK PROGRAM"
   ClientHeight    =   3825
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5265
   LinkTopic       =   "Form1"
   ScaleHeight     =   3825
   ScaleWidth      =   5265
   StartUpPosition =   2  '屏幕中心
   WindowState     =   2  'Maximized
   Begin VB.CommandButton Command4 
      Caption         =   "条件设定"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   525
      Left            =   3465
      TabIndex        =   480
      Top             =   10335
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "第一页"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   5475
      TabIndex        =   66
      Top             =   10320
      Width           =   1875
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
      Index           =   1
      Left            =   7560
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   0
      Top             =   720
      Width           =   7335
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   70
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   132
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
         TabIndex        =   131
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
         TabIndex        =   130
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
         TabIndex        =   129
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
         TabIndex        =   128
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
         TabIndex        =   127
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
         TabIndex        =   126
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
         TabIndex        =   125
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
         TabIndex        =   124
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
         TabIndex        =   123
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
         TabIndex        =   122
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
         TabIndex        =   121
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
         TabIndex        =   120
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
         TabIndex        =   119
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
         TabIndex        =   118
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
         TabIndex        =   117
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
         TabIndex        =   116
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
         TabIndex        =   115
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
         TabIndex        =   114
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
         TabIndex        =   113
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
         TabIndex        =   112
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
         TabIndex        =   111
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
         TabIndex        =   110
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
         TabIndex        =   109
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
         TabIndex        =   108
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
         TabIndex        =   107
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
         TabIndex        =   106
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
         TabIndex        =   105
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
         TabIndex        =   104
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
         TabIndex        =   103
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
         TabIndex        =   102
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
         TabIndex        =   101
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
         TabIndex        =   100
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
         TabIndex        =   99
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
         TabIndex        =   98
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
         TabIndex        =   97
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
         TabIndex        =   96
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
         TabIndex        =   95
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
         TabIndex        =   94
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
         TabIndex        =   93
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
         TabIndex        =   92
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
         TabIndex        =   91
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
         TabIndex        =   90
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
         TabIndex        =   89
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
         TabIndex        =   88
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
         TabIndex        =   87
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
         TabIndex        =   86
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
         TabIndex        =   85
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
         TabIndex        =   84
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
         TabIndex        =   83
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
         TabIndex        =   82
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
         TabIndex        =   81
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
         TabIndex        =   80
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
         TabIndex        =   79
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
         TabIndex        =   78
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
         TabIndex        =   77
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
         TabIndex        =   76
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
         TabIndex        =   75
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
         TabIndex        =   74
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
         TabIndex        =   73
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
         TabIndex        =   72
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
         TabIndex        =   71
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
         TabIndex        =   70
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
         TabIndex        =   69
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
         TabIndex        =   68
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
         TabIndex        =   67
         Top             =   330
         Width           =   1095
      End
      Begin VB.PictureBox Picture3 
         Height          =   1215
         Left            =   120
         ScaleHeight     =   1155
         ScaleWidth      =   7035
         TabIndex        =   3
         Top             =   8280
         Width           =   7095
         Begin MSComctlLib.ProgressBar WaitMAX 
            Height          =   315
            Left            =   0
            TabIndex        =   4
            Top             =   900
            Width           =   7215
            _ExtentX        =   12726
            _ExtentY        =   556
            _Version        =   393216
            Appearance      =   1
         End
         Begin VB.TextBox INFdisplay 
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00000000&
            Height          =   1095
            Left            =   0
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            TabIndex        =   5
            Top             =   -30
            Width           =   7095
         End
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   71
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   13
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
         TabIndex        =   12
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
         TabIndex        =   11
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
         TabIndex        =   10
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
         TabIndex        =   9
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
         TabIndex        =   8
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
         TabIndex        =   7
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
         TabIndex        =   6
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
         TabIndex        =   2
         Text            =   "Low"
         Top             =   60
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
         TabIndex        =   1
         Text            =   "Hi"
         Top             =   60
         Width           =   1095
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "70"
         Height          =   255
         Index           =   70
         Left            =   120
         TabIndex        =   264
         Top             =   8010
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   70
         Left            =   480
         TabIndex        =   263
         Top             =   8010
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   70
         Left            =   5280
         TabIndex        =   262
         Top             =   8010
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   70
         Left            =   6360
         TabIndex        =   261
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
         TabIndex        =   260
         Top             =   7770
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   69
         Left            =   480
         TabIndex        =   259
         Top             =   7770
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   69
         Left            =   5280
         TabIndex        =   258
         Top             =   7770
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   69
         Left            =   6360
         TabIndex        =   257
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
         TabIndex        =   256
         Top             =   7530
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   68
         Left            =   480
         TabIndex        =   255
         Top             =   7530
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   68
         Left            =   5280
         TabIndex        =   254
         Top             =   7530
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   68
         Left            =   6360
         TabIndex        =   253
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
         TabIndex        =   252
         Top             =   7290
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   67
         Left            =   480
         TabIndex        =   251
         Top             =   7290
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   67
         Left            =   5280
         TabIndex        =   250
         Top             =   7290
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   67
         Left            =   6360
         TabIndex        =   249
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
         TabIndex        =   248
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
         TabIndex        =   247
         Top             =   7050
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   66
         Left            =   5280
         TabIndex        =   246
         Top             =   7050
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   66
         Left            =   6360
         TabIndex        =   245
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
         TabIndex        =   244
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
         TabIndex        =   243
         Top             =   6810
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   65
         Left            =   5280
         TabIndex        =   242
         Top             =   6810
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   65
         Left            =   6360
         TabIndex        =   241
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
         TabIndex        =   240
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
         TabIndex        =   239
         Top             =   6570
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   64
         Left            =   5280
         TabIndex        =   238
         Top             =   6570
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   64
         Left            =   6360
         TabIndex        =   237
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
         TabIndex        =   236
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
         TabIndex        =   235
         Top             =   6330
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   63
         Left            =   5280
         TabIndex        =   234
         Top             =   6330
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   63
         Left            =   6360
         TabIndex        =   233
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
         TabIndex        =   232
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
         TabIndex        =   231
         Top             =   6090
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   62
         Left            =   5280
         TabIndex        =   230
         Top             =   6090
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   62
         Left            =   6360
         TabIndex        =   229
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
         TabIndex        =   228
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
         TabIndex        =   227
         Top             =   5850
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   61
         Left            =   5280
         TabIndex        =   226
         Top             =   5850
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   61
         Left            =   6360
         TabIndex        =   225
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
         TabIndex        =   224
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
         TabIndex        =   223
         Top             =   5610
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   60
         Left            =   5280
         TabIndex        =   222
         Top             =   5610
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   60
         Left            =   6360
         TabIndex        =   221
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
         TabIndex        =   220
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
         TabIndex        =   219
         Top             =   5370
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   59
         Left            =   5280
         TabIndex        =   218
         Top             =   5370
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   59
         Left            =   6360
         TabIndex        =   217
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
         TabIndex        =   216
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
         TabIndex        =   215
         Top             =   5130
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   58
         Left            =   5280
         TabIndex        =   214
         Top             =   5130
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   58
         Left            =   6360
         TabIndex        =   213
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
         TabIndex        =   212
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
         TabIndex        =   211
         Top             =   4890
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   57
         Left            =   5280
         TabIndex        =   210
         Top             =   4890
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   57
         Left            =   6360
         TabIndex        =   209
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
         TabIndex        =   208
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
         TabIndex        =   207
         Top             =   4650
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   56
         Left            =   5280
         TabIndex        =   206
         Top             =   4650
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   56
         Left            =   6360
         TabIndex        =   205
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
         TabIndex        =   204
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
         TabIndex        =   203
         Top             =   4410
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   55
         Left            =   5280
         TabIndex        =   202
         Top             =   4410
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   55
         Left            =   6360
         TabIndex        =   201
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
         TabIndex        =   200
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
         TabIndex        =   199
         Top             =   4170
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   54
         Left            =   5280
         TabIndex        =   198
         Top             =   4170
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   54
         Left            =   6360
         TabIndex        =   197
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
         TabIndex        =   196
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
         TabIndex        =   195
         Top             =   3930
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   53
         Left            =   5280
         TabIndex        =   194
         Top             =   3930
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   53
         Left            =   6360
         TabIndex        =   193
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
         TabIndex        =   192
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
         TabIndex        =   191
         Top             =   3690
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   52
         Left            =   5280
         TabIndex        =   190
         Top             =   3690
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   52
         Left            =   6360
         TabIndex        =   189
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
         TabIndex        =   188
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
         TabIndex        =   187
         Top             =   3450
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   51
         Left            =   5280
         TabIndex        =   186
         Top             =   3450
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   51
         Left            =   6360
         TabIndex        =   185
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
         TabIndex        =   184
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
         TabIndex        =   183
         Top             =   3210
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   50
         Left            =   5280
         TabIndex        =   182
         Top             =   3210
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   50
         Left            =   6360
         TabIndex        =   181
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
         TabIndex        =   180
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
         TabIndex        =   179
         Top             =   2970
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   49
         Left            =   5280
         TabIndex        =   178
         Top             =   2970
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   49
         Left            =   6360
         TabIndex        =   177
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
         TabIndex        =   176
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
         TabIndex        =   175
         Top             =   2730
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   48
         Left            =   5280
         TabIndex        =   174
         Top             =   2730
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   48
         Left            =   6360
         TabIndex        =   173
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
         TabIndex        =   172
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
         TabIndex        =   171
         Top             =   2490
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   47
         Left            =   5280
         TabIndex        =   170
         Top             =   2490
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   47
         Left            =   6360
         TabIndex        =   169
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
         TabIndex        =   168
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
         TabIndex        =   167
         Top             =   2250
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   46
         Left            =   5280
         TabIndex        =   166
         Top             =   2250
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   46
         Left            =   6360
         TabIndex        =   165
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
         TabIndex        =   164
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
         TabIndex        =   163
         Top             =   2010
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   45
         Left            =   5280
         TabIndex        =   162
         Top             =   2010
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   45
         Left            =   6360
         TabIndex        =   161
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
         TabIndex        =   160
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
         TabIndex        =   159
         Top             =   1770
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   44
         Left            =   5280
         TabIndex        =   158
         Top             =   1770
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   44
         Left            =   6360
         TabIndex        =   157
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
         TabIndex        =   156
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
         TabIndex        =   155
         Top             =   1530
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   43
         Left            =   5280
         TabIndex        =   154
         Top             =   1530
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   43
         Left            =   6360
         TabIndex        =   153
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
         TabIndex        =   152
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
         TabIndex        =   151
         Top             =   1290
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   42
         Left            =   5280
         TabIndex        =   150
         Top             =   1290
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   42
         Left            =   6360
         TabIndex        =   149
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
         TabIndex        =   148
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
         TabIndex        =   147
         Top             =   1050
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   41
         Left            =   5280
         TabIndex        =   146
         Top             =   1050
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   41
         Left            =   6360
         TabIndex        =   145
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
         TabIndex        =   144
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
         TabIndex        =   143
         Top             =   810
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   40
         Left            =   5280
         TabIndex        =   142
         Top             =   810
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   40
         Left            =   6360
         TabIndex        =   141
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
         TabIndex        =   140
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
         TabIndex        =   139
         Top             =   570
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   39
         Left            =   5280
         TabIndex        =   138
         Top             =   570
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   39
         Left            =   6360
         TabIndex        =   137
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
         TabIndex        =   136
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
         TabIndex        =   135
         Top             =   330
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   38
         Left            =   5280
         TabIndex        =   134
         Top             =   330
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   38
         Left            =   6360
         TabIndex        =   133
         Top             =   330
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   71
         Left            =   6360
         TabIndex        =   33
         Top             =   8280
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   71
         Left            =   5280
         TabIndex        =   32
         Top             =   8280
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   71
         Left            =   480
         TabIndex        =   31
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
         TabIndex        =   30
         Top             =   8280
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   72
         Left            =   6360
         TabIndex        =   29
         Top             =   8520
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   72
         Left            =   5280
         TabIndex        =   28
         Top             =   8520
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   72
         Left            =   480
         TabIndex        =   27
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
         TabIndex        =   26
         Top             =   8520
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   73
         Left            =   6360
         TabIndex        =   25
         Top             =   8760
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   73
         Left            =   5280
         TabIndex        =   24
         Top             =   8760
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   73
         Left            =   480
         TabIndex        =   23
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
         TabIndex        =   22
         Top             =   8760
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   74
         Left            =   6360
         TabIndex        =   21
         Top             =   9000
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   74
         Left            =   5280
         TabIndex        =   20
         Top             =   9000
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   74
         Left            =   480
         TabIndex        =   19
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
         TabIndex        =   18
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
         TabIndex        =   17
         Top             =   120
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Measure"
         Height          =   255
         Index           =   75
         Left            =   5280
         TabIndex        =   16
         Top             =   60
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Itme"
         Height          =   255
         Index           =   75
         Left            =   480
         TabIndex        =   15
         Top             =   60
         Width           =   2655
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   255
         Index           =   75
         Left            =   120
         TabIndex        =   14
         Top             =   60
         Width           =   375
      End
   End
   Begin VB.PictureBox Picture2 
      Height          =   9495
      Index           =   1
      Left            =   7560
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   34
      Top             =   720
      Visible         =   0   'False
      Width           =   7335
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   480
         TabIndex        =   961
         Top             =   8970
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   3000
         TabIndex        =   960
         Top             =   8970
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   4200
         TabIndex        =   959
         Top             =   8970
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   6000
         TabIndex        =   958
         Top             =   8970
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   6720
         TabIndex        =   957
         Top             =   8970
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   956
         Top             =   8970
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   480
         TabIndex        =   955
         Top             =   8730
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   3000
         TabIndex        =   954
         Top             =   8730
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   4200
         TabIndex        =   953
         Top             =   8730
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   6000
         TabIndex        =   952
         Top             =   8730
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   6720
         TabIndex        =   951
         Top             =   8730
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   950
         Top             =   8730
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   480
         TabIndex        =   949
         Top             =   8490
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   3000
         TabIndex        =   948
         Top             =   8490
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   4200
         TabIndex        =   947
         Top             =   8490
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   6000
         TabIndex        =   946
         Top             =   8490
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   6720
         TabIndex        =   945
         Top             =   8490
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   944
         Top             =   8490
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   480
         TabIndex        =   943
         Top             =   8250
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   3000
         TabIndex        =   942
         Top             =   8250
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   4200
         TabIndex        =   941
         Top             =   8250
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   6000
         TabIndex        =   940
         Top             =   8250
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   6720
         TabIndex        =   939
         Top             =   8250
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   938
         Top             =   8250
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   480
         TabIndex        =   937
         Top             =   8010
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   3000
         TabIndex        =   936
         Top             =   8010
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   4200
         TabIndex        =   935
         Top             =   8010
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   6000
         TabIndex        =   934
         Top             =   8010
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   6720
         TabIndex        =   933
         Top             =   8010
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   932
         Top             =   8010
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   480
         TabIndex        =   931
         Top             =   7770
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   3000
         TabIndex        =   930
         Top             =   7770
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   4200
         TabIndex        =   929
         Top             =   7770
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   6000
         TabIndex        =   928
         Top             =   7770
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   6720
         TabIndex        =   927
         Top             =   7770
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   926
         Top             =   7770
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   480
         TabIndex        =   925
         Top             =   7530
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   3000
         TabIndex        =   924
         Top             =   7530
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   4200
         TabIndex        =   923
         Top             =   7530
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   6000
         TabIndex        =   922
         Top             =   7530
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   6720
         TabIndex        =   921
         Top             =   7530
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   920
         Top             =   7530
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   480
         TabIndex        =   919
         Top             =   7290
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   3000
         TabIndex        =   918
         Top             =   7290
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   4200
         TabIndex        =   917
         Top             =   7290
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   6000
         TabIndex        =   916
         Top             =   7290
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   6720
         TabIndex        =   915
         Top             =   7290
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   914
         Top             =   7290
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   480
         TabIndex        =   913
         Top             =   7050
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   3000
         TabIndex        =   912
         Top             =   7050
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   4200
         TabIndex        =   911
         Top             =   7050
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   6000
         TabIndex        =   910
         Top             =   7050
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   6720
         TabIndex        =   909
         Top             =   7050
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   908
         Top             =   7050
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   480
         TabIndex        =   907
         Top             =   6810
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   3000
         TabIndex        =   906
         Top             =   6810
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   4200
         TabIndex        =   905
         Top             =   6810
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   6000
         TabIndex        =   904
         Top             =   6810
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   6720
         TabIndex        =   903
         Top             =   6810
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   902
         Top             =   6810
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   480
         TabIndex        =   901
         Top             =   6570
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   3000
         TabIndex        =   900
         Top             =   6570
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   4200
         TabIndex        =   899
         Top             =   6570
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   6000
         TabIndex        =   898
         Top             =   6570
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   6720
         TabIndex        =   897
         Top             =   6570
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   896
         Top             =   6570
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   480
         TabIndex        =   895
         Top             =   6330
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   3000
         TabIndex        =   894
         Top             =   6330
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   4200
         TabIndex        =   893
         Top             =   6330
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   6000
         TabIndex        =   892
         Top             =   6330
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   6720
         TabIndex        =   891
         Top             =   6330
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   890
         Top             =   6330
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   480
         TabIndex        =   889
         Top             =   6090
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   3000
         TabIndex        =   888
         Top             =   6090
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   4200
         TabIndex        =   887
         Top             =   6090
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   6000
         TabIndex        =   886
         Top             =   6090
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   6720
         TabIndex        =   885
         Top             =   6090
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   884
         Top             =   6090
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   480
         TabIndex        =   883
         Top             =   5850
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   3000
         TabIndex        =   882
         Top             =   5850
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   4200
         TabIndex        =   881
         Top             =   5850
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   6000
         TabIndex        =   880
         Top             =   5850
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   6720
         TabIndex        =   879
         Top             =   5850
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   878
         Top             =   5850
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   480
         TabIndex        =   877
         Top             =   5610
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   3000
         TabIndex        =   876
         Top             =   5610
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   4200
         TabIndex        =   875
         Top             =   5610
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   6000
         TabIndex        =   874
         Top             =   5610
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   6720
         TabIndex        =   873
         Top             =   5610
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   872
         Top             =   5610
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   480
         TabIndex        =   871
         Top             =   5370
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   3000
         TabIndex        =   870
         Top             =   5370
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   4200
         TabIndex        =   869
         Top             =   5370
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   6000
         TabIndex        =   868
         Top             =   5370
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   6720
         TabIndex        =   867
         Top             =   5370
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   866
         Top             =   5370
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   480
         TabIndex        =   865
         Top             =   5130
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   3000
         TabIndex        =   864
         Top             =   5130
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   4200
         TabIndex        =   863
         Top             =   5130
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   6000
         TabIndex        =   862
         Top             =   5130
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   6720
         TabIndex        =   861
         Top             =   5130
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   860
         Top             =   5130
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   480
         TabIndex        =   859
         Top             =   4890
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   3000
         TabIndex        =   858
         Top             =   4890
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   4200
         TabIndex        =   857
         Top             =   4890
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   6000
         TabIndex        =   856
         Top             =   4890
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   6720
         TabIndex        =   855
         Top             =   4890
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   854
         Top             =   4890
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   480
         TabIndex        =   853
         Top             =   4650
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   3000
         TabIndex        =   852
         Top             =   4650
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   4200
         TabIndex        =   851
         Top             =   4650
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   6000
         TabIndex        =   850
         Top             =   4650
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   6720
         TabIndex        =   849
         Top             =   4650
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   848
         Top             =   4650
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   480
         TabIndex        =   847
         Top             =   4410
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   3000
         TabIndex        =   846
         Top             =   4410
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   4200
         TabIndex        =   845
         Top             =   4410
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   6000
         TabIndex        =   844
         Top             =   4410
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   6720
         TabIndex        =   843
         Top             =   4410
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   842
         Top             =   4410
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   480
         TabIndex        =   841
         Top             =   4170
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   3000
         TabIndex        =   840
         Top             =   4170
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   4200
         TabIndex        =   839
         Top             =   4170
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   6000
         TabIndex        =   838
         Top             =   4170
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   6720
         TabIndex        =   837
         Top             =   4170
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   836
         Top             =   4170
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   480
         TabIndex        =   835
         Top             =   3930
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   3000
         TabIndex        =   834
         Top             =   3930
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   4200
         TabIndex        =   833
         Top             =   3930
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   6000
         TabIndex        =   832
         Top             =   3930
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   6720
         TabIndex        =   831
         Top             =   3930
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   830
         Top             =   3930
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   480
         TabIndex        =   829
         Top             =   3690
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   3000
         TabIndex        =   828
         Top             =   3690
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   4200
         TabIndex        =   827
         Top             =   3690
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   6000
         TabIndex        =   826
         Top             =   3690
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   6720
         TabIndex        =   825
         Top             =   3690
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   824
         Top             =   3690
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   480
         TabIndex        =   823
         Top             =   3450
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   3000
         TabIndex        =   822
         Top             =   3450
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   4200
         TabIndex        =   821
         Top             =   3450
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   6000
         TabIndex        =   820
         Top             =   3450
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   6720
         TabIndex        =   819
         Top             =   3450
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   818
         Top             =   3450
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   480
         TabIndex        =   817
         Top             =   3210
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   3000
         TabIndex        =   816
         Top             =   3210
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   4200
         TabIndex        =   815
         Top             =   3210
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   6000
         TabIndex        =   814
         Top             =   3210
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   6720
         TabIndex        =   813
         Top             =   3210
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   812
         Top             =   3210
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   480
         TabIndex        =   811
         Top             =   2970
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   3000
         TabIndex        =   810
         Top             =   2970
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   4200
         TabIndex        =   809
         Top             =   2970
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   6000
         TabIndex        =   808
         Top             =   2970
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   6720
         TabIndex        =   807
         Top             =   2970
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   806
         Top             =   2970
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   480
         TabIndex        =   805
         Top             =   2730
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   3000
         TabIndex        =   804
         Top             =   2730
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   4200
         TabIndex        =   803
         Top             =   2730
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   6000
         TabIndex        =   802
         Top             =   2730
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   6720
         TabIndex        =   801
         Top             =   2730
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   800
         Top             =   2730
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   480
         TabIndex        =   799
         Top             =   2490
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   3000
         TabIndex        =   798
         Top             =   2490
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   4200
         TabIndex        =   797
         Top             =   2490
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   6000
         TabIndex        =   796
         Top             =   2490
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   6720
         TabIndex        =   795
         Top             =   2490
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   794
         Top             =   2490
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   480
         TabIndex        =   793
         Top             =   2250
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   3000
         TabIndex        =   792
         Top             =   2250
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   4200
         TabIndex        =   791
         Top             =   2250
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   6000
         TabIndex        =   790
         Top             =   2250
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   6720
         TabIndex        =   789
         Top             =   2250
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   788
         Top             =   2250
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   480
         TabIndex        =   787
         Top             =   2010
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   3000
         TabIndex        =   786
         Top             =   2010
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   4200
         TabIndex        =   785
         Top             =   2010
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   6000
         TabIndex        =   784
         Top             =   2010
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   6720
         TabIndex        =   783
         Top             =   2010
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   782
         Top             =   2010
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   480
         TabIndex        =   781
         Top             =   1770
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   3000
         TabIndex        =   780
         Top             =   1770
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   4200
         TabIndex        =   779
         Top             =   1770
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   6000
         TabIndex        =   778
         Top             =   1770
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   6720
         TabIndex        =   777
         Top             =   1770
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   776
         Top             =   1770
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   480
         TabIndex        =   775
         Top             =   1530
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   3000
         TabIndex        =   774
         Top             =   1530
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   4200
         TabIndex        =   773
         Top             =   1530
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   6000
         TabIndex        =   772
         Top             =   1530
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   6720
         TabIndex        =   771
         Top             =   1530
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   770
         Top             =   1530
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   480
         TabIndex        =   769
         Top             =   1290
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   3000
         TabIndex        =   768
         Top             =   1290
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   4200
         TabIndex        =   767
         Top             =   1290
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   6000
         TabIndex        =   766
         Top             =   1290
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   6720
         TabIndex        =   765
         Top             =   1290
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   764
         Top             =   1290
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   480
         TabIndex        =   763
         Top             =   1050
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   3000
         TabIndex        =   762
         Top             =   1050
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   4200
         TabIndex        =   761
         Top             =   1050
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   6000
         TabIndex        =   760
         Top             =   1050
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   6720
         TabIndex        =   759
         Top             =   1050
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   758
         Top             =   1050
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   480
         TabIndex        =   757
         Top             =   810
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   3000
         TabIndex        =   756
         Top             =   810
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   4200
         TabIndex        =   755
         Top             =   810
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   6000
         TabIndex        =   754
         Top             =   810
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   6720
         TabIndex        =   753
         Top             =   810
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   752
         Top             =   810
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   480
         TabIndex        =   751
         Top             =   570
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   3000
         TabIndex        =   750
         Top             =   570
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   4200
         TabIndex        =   749
         Top             =   570
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   6000
         TabIndex        =   748
         Top             =   570
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   6720
         TabIndex        =   747
         Top             =   570
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   746
         Top             =   570
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   480
         TabIndex        =   745
         Top             =   330
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   3000
         TabIndex        =   744
         Top             =   330
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   4200
         TabIndex        =   743
         Top             =   330
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   6000
         TabIndex        =   742
         Top             =   330
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   6720
         TabIndex        =   741
         Top             =   330
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   740
         Top             =   330
         Width           =   735
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   5280
         Locked          =   -1  'True
         TabIndex        =   40
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
         TabIndex        =   39
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
         TabIndex        =   38
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
         TabIndex        =   37
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
         TabIndex        =   36
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
         TabIndex        =   35
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
         TabIndex        =   998
         Top             =   8970
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "73"
         Height          =   255
         Index           =   73
         Left            =   120
         TabIndex        =   997
         Top             =   8730
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "72"
         Height          =   255
         Index           =   72
         Left            =   120
         TabIndex        =   996
         Top             =   8490
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "71"
         Height          =   255
         Index           =   71
         Left            =   120
         TabIndex        =   995
         Top             =   8250
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "70"
         Height          =   255
         Index           =   70
         Left            =   120
         TabIndex        =   994
         Top             =   8010
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "69"
         Height          =   255
         Index           =   69
         Left            =   120
         TabIndex        =   993
         Top             =   7770
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "68"
         Height          =   255
         Index           =   68
         Left            =   120
         TabIndex        =   992
         Top             =   7530
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "67"
         Height          =   255
         Index           =   67
         Left            =   120
         TabIndex        =   991
         Top             =   7290
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "66"
         Height          =   255
         Index           =   66
         Left            =   120
         TabIndex        =   990
         Top             =   7050
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "65"
         Height          =   255
         Index           =   65
         Left            =   120
         TabIndex        =   989
         Top             =   6810
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "64"
         Height          =   255
         Index           =   64
         Left            =   120
         TabIndex        =   988
         Top             =   6570
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "63"
         Height          =   255
         Index           =   63
         Left            =   120
         TabIndex        =   987
         Top             =   6330
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "62"
         Height          =   255
         Index           =   62
         Left            =   120
         TabIndex        =   986
         Top             =   6090
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "61"
         Height          =   255
         Index           =   61
         Left            =   120
         TabIndex        =   985
         Top             =   5850
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "60"
         Height          =   255
         Index           =   60
         Left            =   120
         TabIndex        =   984
         Top             =   5610
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "59"
         Height          =   255
         Index           =   59
         Left            =   120
         TabIndex        =   983
         Top             =   5370
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "58"
         Height          =   255
         Index           =   58
         Left            =   120
         TabIndex        =   982
         Top             =   5130
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "57"
         Height          =   255
         Index           =   57
         Left            =   120
         TabIndex        =   981
         Top             =   4890
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "56"
         Height          =   255
         Index           =   56
         Left            =   120
         TabIndex        =   980
         Top             =   4650
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "55"
         Height          =   255
         Index           =   55
         Left            =   120
         TabIndex        =   979
         Top             =   4410
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "54"
         Height          =   255
         Index           =   54
         Left            =   120
         TabIndex        =   978
         Top             =   4170
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "53"
         Height          =   255
         Index           =   53
         Left            =   120
         TabIndex        =   977
         Top             =   3930
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "52"
         Height          =   255
         Index           =   52
         Left            =   120
         TabIndex        =   976
         Top             =   3690
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "51"
         Height          =   255
         Index           =   51
         Left            =   120
         TabIndex        =   975
         Top             =   3450
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "50"
         Height          =   255
         Index           =   50
         Left            =   120
         TabIndex        =   974
         Top             =   3210
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "49"
         Height          =   255
         Index           =   49
         Left            =   120
         TabIndex        =   973
         Top             =   2970
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "48"
         Height          =   255
         Index           =   48
         Left            =   120
         TabIndex        =   972
         Top             =   2730
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "47"
         Height          =   255
         Index           =   47
         Left            =   120
         TabIndex        =   971
         Top             =   2490
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "46"
         Height          =   255
         Index           =   46
         Left            =   120
         TabIndex        =   970
         Top             =   2250
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "45"
         Height          =   255
         Index           =   45
         Left            =   120
         TabIndex        =   969
         Top             =   2010
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "44"
         Height          =   255
         Index           =   44
         Left            =   120
         TabIndex        =   968
         Top             =   1770
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "43"
         Height          =   255
         Index           =   43
         Left            =   120
         TabIndex        =   967
         Top             =   1530
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "42"
         Height          =   255
         Index           =   42
         Left            =   120
         TabIndex        =   966
         Top             =   1290
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "41"
         Height          =   255
         Index           =   41
         Left            =   120
         TabIndex        =   965
         Top             =   1050
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "40"
         Height          =   255
         Index           =   40
         Left            =   120
         TabIndex        =   964
         Top             =   810
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "39"
         Height          =   255
         Index           =   39
         Left            =   120
         TabIndex        =   963
         Top             =   570
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "38"
         Height          =   255
         Index           =   38
         Left            =   120
         TabIndex        =   962
         Top             =   330
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   270
         Index           =   75
         Left            =   120
         TabIndex        =   41
         Top             =   45
         Width           =   375
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   9495
      Index           =   0
      Left            =   0
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   42
      Top             =   720
      Width           =   7335
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   37
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   336
         Top             =   8970
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   37
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   335
         Top             =   8970
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   36
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   334
         Top             =   8730
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   36
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   333
         Top             =   8730
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   35
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   332
         Top             =   8490
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   35
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   331
         Top             =   8490
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   34
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   330
         Top             =   8250
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   34
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   329
         Top             =   8250
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   33
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   328
         Top             =   8010
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   33
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   327
         Top             =   8010
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   32
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   326
         Top             =   7770
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   32
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   325
         Top             =   7770
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   31
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   324
         Top             =   7530
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   31
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   323
         Top             =   7530
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   30
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   322
         Top             =   7290
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   30
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   321
         Top             =   7290
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   29
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   320
         Top             =   7050
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   29
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   319
         Top             =   7050
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   28
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   318
         Top             =   6810
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   28
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   317
         Top             =   6810
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   27
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   316
         Top             =   6570
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   27
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   315
         Top             =   6570
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   26
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   314
         Top             =   6330
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   26
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   313
         Top             =   6330
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   25
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   312
         Top             =   6090
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   25
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   311
         Top             =   6090
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   24
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   310
         Top             =   5850
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   24
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   309
         Top             =   5850
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   23
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   308
         Top             =   5610
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   23
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   307
         Top             =   5610
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   22
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   306
         Top             =   5370
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   22
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   305
         Top             =   5370
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   21
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   304
         Top             =   5130
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   21
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   303
         Top             =   5130
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   20
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   302
         Top             =   4890
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   20
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   301
         Top             =   4890
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   19
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   300
         Top             =   4650
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   19
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   299
         Top             =   4650
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   18
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   298
         Top             =   4410
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   18
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   297
         Top             =   4410
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   17
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   296
         Top             =   4170
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   17
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   295
         Top             =   4170
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   16
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   294
         Top             =   3930
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   16
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   293
         Top             =   3930
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   15
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   292
         Top             =   3690
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   15
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   291
         Top             =   3690
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   14
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   290
         Top             =   3450
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   14
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   289
         Top             =   3450
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   13
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   288
         Top             =   3210
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   13
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   287
         Top             =   3210
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   12
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   286
         Top             =   2970
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   12
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   285
         Top             =   2970
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   11
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   284
         Top             =   2730
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   11
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   283
         Top             =   2730
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   10
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   282
         Top             =   2490
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   10
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   281
         Top             =   2490
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   9
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   280
         Top             =   2250
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   9
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   279
         Top             =   2250
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   8
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   278
         Top             =   2010
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   8
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   277
         Top             =   2010
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   7
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   276
         Top             =   1770
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   7
         Left            =   4200
         MaxLength       =   7
         TabIndex        =   275
         Top             =   1770
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   6
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   274
         Top             =   1530
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   6
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   273
         Top             =   1530
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   5
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   272
         Top             =   1290
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   5
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   271
         Top             =   1290
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   4
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   270
         Top             =   1050
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   4
         Left            =   4200
         TabIndex        =   269
         Top             =   1050
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   3
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   268
         Top             =   810
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   3
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   267
         Top             =   810
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   2
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   266
         Top             =   570
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   2
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   265
         Top             =   570
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
         TabIndex        =   46
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
         TabIndex        =   45
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
         TabIndex        =   44
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
         TabIndex        =   43
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
         TabIndex        =   479
         Top             =   8970
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
         TabIndex        =   478
         Top             =   8970
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   37
         Left            =   5280
         TabIndex        =   477
         Top             =   8970
         Width           =   1095
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "36"
         Height          =   255
         Index           =   36
         Left            =   120
         TabIndex        =   476
         Top             =   8730
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
         TabIndex        =   475
         Top             =   8730
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   36
         Left            =   5280
         TabIndex        =   474
         Top             =   8730
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   36
         Left            =   6360
         TabIndex        =   473
         Top             =   8730
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "35"
         Height          =   255
         Index           =   35
         Left            =   120
         TabIndex        =   472
         Top             =   8490
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
         TabIndex        =   471
         Top             =   8490
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   35
         Left            =   5280
         TabIndex        =   470
         Top             =   8490
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   35
         Left            =   6360
         TabIndex        =   469
         Top             =   8490
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "34"
         Height          =   255
         Index           =   34
         Left            =   120
         TabIndex        =   468
         Top             =   8250
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
         TabIndex        =   467
         Top             =   8250
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   34
         Left            =   5280
         TabIndex        =   466
         Top             =   8250
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   34
         Left            =   6360
         TabIndex        =   465
         Top             =   8250
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "33"
         Height          =   255
         Index           =   33
         Left            =   120
         TabIndex        =   464
         Top             =   8010
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
         TabIndex        =   463
         Top             =   8010
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   33
         Left            =   5280
         TabIndex        =   462
         Top             =   8010
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   33
         Left            =   6360
         TabIndex        =   461
         Top             =   8010
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "32"
         Height          =   255
         Index           =   32
         Left            =   120
         TabIndex        =   460
         Top             =   7770
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
         TabIndex        =   459
         Top             =   7770
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   32
         Left            =   5280
         TabIndex        =   458
         Top             =   7770
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   32
         Left            =   6360
         TabIndex        =   457
         Top             =   7770
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "31"
         Height          =   255
         Index           =   31
         Left            =   120
         TabIndex        =   456
         Top             =   7530
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
         TabIndex        =   455
         Top             =   7530
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   31
         Left            =   5280
         TabIndex        =   454
         Top             =   7530
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   31
         Left            =   6360
         TabIndex        =   453
         Top             =   7530
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "30"
         Height          =   255
         Index           =   30
         Left            =   120
         TabIndex        =   452
         Top             =   7290
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
         TabIndex        =   451
         Top             =   7290
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   30
         Left            =   5280
         TabIndex        =   450
         Top             =   7290
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   30
         Left            =   6360
         TabIndex        =   449
         Top             =   7290
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "29"
         Height          =   255
         Index           =   29
         Left            =   120
         TabIndex        =   448
         Top             =   7050
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
         TabIndex        =   447
         Top             =   7050
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   29
         Left            =   5280
         TabIndex        =   446
         Top             =   7050
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   29
         Left            =   6360
         TabIndex        =   445
         Top             =   7050
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "28"
         Height          =   255
         Index           =   28
         Left            =   120
         TabIndex        =   444
         Top             =   6810
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
         TabIndex        =   443
         Top             =   6810
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   28
         Left            =   5280
         TabIndex        =   442
         Top             =   6810
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   28
         Left            =   6360
         TabIndex        =   441
         Top             =   6810
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "27"
         Height          =   255
         Index           =   27
         Left            =   120
         TabIndex        =   440
         Top             =   6570
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
         TabIndex        =   439
         Top             =   6570
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   27
         Left            =   5280
         TabIndex        =   438
         Top             =   6570
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   27
         Left            =   6360
         TabIndex        =   437
         Top             =   6570
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "26"
         Height          =   255
         Index           =   26
         Left            =   120
         TabIndex        =   436
         Top             =   6330
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
         TabIndex        =   435
         Top             =   6330
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   26
         Left            =   5280
         TabIndex        =   434
         Top             =   6330
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   26
         Left            =   6360
         TabIndex        =   433
         Top             =   6330
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "25"
         Height          =   255
         Index           =   25
         Left            =   120
         TabIndex        =   432
         Top             =   6090
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
         TabIndex        =   431
         Top             =   6090
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   25
         Left            =   5280
         TabIndex        =   430
         Top             =   6090
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   25
         Left            =   6360
         TabIndex        =   429
         Top             =   6090
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "24"
         Height          =   255
         Index           =   24
         Left            =   120
         TabIndex        =   428
         Top             =   5850
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
         TabIndex        =   427
         Top             =   5850
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   24
         Left            =   5280
         TabIndex        =   426
         Top             =   5850
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   24
         Left            =   6360
         TabIndex        =   425
         Top             =   5850
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "23"
         Height          =   255
         Index           =   23
         Left            =   120
         TabIndex        =   424
         Top             =   5610
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
         TabIndex        =   423
         Top             =   5610
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   23
         Left            =   5280
         TabIndex        =   422
         Top             =   5610
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   23
         Left            =   6360
         TabIndex        =   421
         Top             =   5610
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "22"
         Height          =   255
         Index           =   22
         Left            =   120
         TabIndex        =   420
         Top             =   5370
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
         TabIndex        =   419
         Top             =   5370
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   22
         Left            =   5280
         TabIndex        =   418
         Top             =   5370
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   22
         Left            =   6360
         TabIndex        =   417
         Top             =   5370
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "21"
         Height          =   255
         Index           =   21
         Left            =   120
         TabIndex        =   416
         Top             =   5130
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
         TabIndex        =   415
         Top             =   5130
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   21
         Left            =   5280
         TabIndex        =   414
         Top             =   5130
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   21
         Left            =   6360
         TabIndex        =   413
         Top             =   5130
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "20"
         Height          =   255
         Index           =   20
         Left            =   120
         TabIndex        =   412
         Top             =   4890
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
         TabIndex        =   411
         Top             =   4890
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   20
         Left            =   5280
         TabIndex        =   410
         Top             =   4890
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   20
         Left            =   6360
         TabIndex        =   409
         Top             =   4890
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "19"
         Height          =   255
         Index           =   19
         Left            =   120
         TabIndex        =   408
         Top             =   4650
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
         TabIndex        =   407
         Top             =   4650
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   19
         Left            =   5280
         TabIndex        =   406
         Top             =   4650
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   19
         Left            =   6360
         TabIndex        =   405
         Top             =   4650
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "18"
         Height          =   255
         Index           =   18
         Left            =   120
         TabIndex        =   404
         Top             =   4410
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
         TabIndex        =   403
         Top             =   4410
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   18
         Left            =   5280
         TabIndex        =   402
         Top             =   4410
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   18
         Left            =   6360
         TabIndex        =   401
         Top             =   4410
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "17"
         Height          =   255
         Index           =   17
         Left            =   120
         TabIndex        =   400
         Top             =   4170
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
         TabIndex        =   399
         Top             =   4170
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   17
         Left            =   5280
         TabIndex        =   398
         Top             =   4170
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   17
         Left            =   6360
         TabIndex        =   397
         Top             =   4170
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "16"
         Height          =   255
         Index           =   16
         Left            =   120
         TabIndex        =   396
         Top             =   3930
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
         TabIndex        =   395
         Top             =   3930
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   16
         Left            =   5280
         TabIndex        =   394
         Top             =   3930
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   16
         Left            =   6360
         TabIndex        =   393
         Top             =   3930
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "15"
         Height          =   255
         Index           =   15
         Left            =   120
         TabIndex        =   392
         Top             =   3690
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
         TabIndex        =   391
         Top             =   3690
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   15
         Left            =   5280
         TabIndex        =   390
         Top             =   3690
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   15
         Left            =   6360
         TabIndex        =   389
         Top             =   3690
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "14"
         Height          =   255
         Index           =   14
         Left            =   120
         TabIndex        =   388
         Top             =   3450
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
         TabIndex        =   387
         Top             =   3450
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   14
         Left            =   5280
         TabIndex        =   386
         Top             =   3450
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   14
         Left            =   6360
         TabIndex        =   385
         Top             =   3450
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "13"
         Height          =   255
         Index           =   13
         Left            =   120
         TabIndex        =   384
         Top             =   3210
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
         TabIndex        =   383
         Top             =   3210
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   13
         Left            =   5280
         TabIndex        =   382
         Top             =   3210
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   13
         Left            =   6360
         TabIndex        =   381
         Top             =   3210
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "12"
         Height          =   255
         Index           =   12
         Left            =   120
         TabIndex        =   380
         Top             =   2970
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
         TabIndex        =   379
         Top             =   2970
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   12
         Left            =   5280
         TabIndex        =   378
         Top             =   2970
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   12
         Left            =   6360
         TabIndex        =   377
         Top             =   2970
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "11"
         Height          =   255
         Index           =   11
         Left            =   120
         TabIndex        =   376
         Top             =   2730
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
         TabIndex        =   375
         Top             =   2730
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   11
         Left            =   5280
         TabIndex        =   374
         Top             =   2730
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   11
         Left            =   6360
         TabIndex        =   373
         Top             =   2730
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "10"
         Height          =   255
         Index           =   10
         Left            =   120
         TabIndex        =   372
         Top             =   2490
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
         TabIndex        =   371
         Top             =   2490
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   10
         Left            =   5280
         TabIndex        =   370
         Top             =   2490
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   10
         Left            =   6360
         TabIndex        =   369
         Top             =   2490
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "9"
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   368
         Top             =   2250
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
         TabIndex        =   367
         Top             =   2250
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   5280
         TabIndex        =   366
         Top             =   2250
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   6360
         TabIndex        =   365
         Top             =   2250
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "8"
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   364
         Top             =   2010
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
         TabIndex        =   363
         Top             =   2010
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   5280
         TabIndex        =   362
         Top             =   2010
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   6360
         TabIndex        =   361
         Top             =   2010
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "7"
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   360
         Top             =   1770
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
         TabIndex        =   359
         Top             =   1770
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   7
         Left            =   5280
         TabIndex        =   358
         Top             =   1770
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   7
         Left            =   6360
         TabIndex        =   357
         Top             =   1770
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "6"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   356
         Top             =   1530
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
         TabIndex        =   355
         Top             =   1530
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   6
         Left            =   5280
         TabIndex        =   354
         Top             =   1530
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   6
         Left            =   6360
         TabIndex        =   353
         Top             =   1530
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "5"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   352
         Top             =   1290
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
         TabIndex        =   351
         Top             =   1290
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   5280
         TabIndex        =   350
         Top             =   1290
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   6360
         TabIndex        =   349
         Top             =   1290
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "4"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   348
         Top             =   1050
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
         TabIndex        =   347
         Top             =   1050
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   4
         Left            =   5280
         TabIndex        =   346
         Top             =   1050
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   4
         Left            =   6360
         TabIndex        =   345
         Top             =   1050
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "3"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   344
         Top             =   810
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
         TabIndex        =   343
         Top             =   810
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   3
         Left            =   5280
         TabIndex        =   342
         Top             =   810
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   3
         Left            =   6360
         TabIndex        =   341
         Top             =   810
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   340
         Top             =   570
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
         TabIndex        =   339
         Top             =   570
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   2
         Left            =   5280
         TabIndex        =   338
         Top             =   570
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
         TabIndex        =   337
         Top             =   570
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   255
         Index           =   0
         Left            =   105
         TabIndex        =   55
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
         TabIndex        =   54
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
         TabIndex        =   53
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
         TabIndex        =   52
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
         TabIndex        =   51
         Top             =   330
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         Height          =   255
         Index           =   1
         Left            =   5280
         TabIndex        =   50
         Top             =   330
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
         Height          =   255
         Index           =   1
         Left            =   480
         TabIndex        =   49
         Top             =   330
         Width           =   2655
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   48
         Top             =   330
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   37
         Left            =   6360
         TabIndex        =   47
         Top             =   8985
         Width           =   855
      End
   End
   Begin VB.PictureBox Picture2 
      Height          =   9495
      Index           =   0
      Left            =   0
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   56
      Top             =   720
      Visible         =   0   'False
      Width           =   7335
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   3000
         TabIndex        =   702
         Top             =   8970
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   3000
         TabIndex        =   701
         Top             =   8730
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   3000
         TabIndex        =   700
         Top             =   8490
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   3000
         TabIndex        =   699
         Top             =   8250
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   3000
         TabIndex        =   698
         Top             =   8010
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   3000
         TabIndex        =   697
         Top             =   7770
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   3000
         TabIndex        =   696
         Top             =   7530
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   3000
         TabIndex        =   695
         Top             =   7290
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   3000
         TabIndex        =   694
         Top             =   7050
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   3000
         TabIndex        =   693
         Top             =   6810
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   3000
         TabIndex        =   692
         Top             =   6570
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   3000
         TabIndex        =   691
         Top             =   6330
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   3000
         TabIndex        =   690
         Top             =   6090
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   3000
         TabIndex        =   689
         Top             =   5850
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   3000
         TabIndex        =   688
         Top             =   5610
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   3000
         TabIndex        =   687
         Top             =   5370
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   3000
         TabIndex        =   686
         Top             =   5130
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   3000
         TabIndex        =   685
         Top             =   4890
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   3000
         TabIndex        =   684
         Top             =   4650
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   3000
         TabIndex        =   683
         Top             =   4410
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   3000
         TabIndex        =   682
         Top             =   4170
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   3000
         TabIndex        =   681
         Top             =   3930
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   3000
         TabIndex        =   680
         Top             =   3690
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   3000
         TabIndex        =   679
         Top             =   3450
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   3000
         TabIndex        =   678
         Top             =   3210
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   3000
         TabIndex        =   677
         Top             =   2970
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   3000
         TabIndex        =   676
         Top             =   2730
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   3000
         TabIndex        =   675
         Top             =   2490
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   3000
         TabIndex        =   674
         Top             =   2250
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   3000
         TabIndex        =   673
         Top             =   2010
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   3000
         TabIndex        =   672
         Top             =   1770
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   3000
         TabIndex        =   671
         Top             =   1530
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   3000
         TabIndex        =   670
         Top             =   1290
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   3000
         TabIndex        =   669
         Top             =   1050
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   3000
         TabIndex        =   668
         Top             =   810
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   3000
         TabIndex        =   667
         Top             =   570
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   3000
         TabIndex        =   666
         Top             =   330
         Width           =   1215
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   480
         TabIndex        =   665
         Top             =   8970
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   4200
         TabIndex        =   664
         Top             =   8970
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   6000
         TabIndex        =   663
         Top             =   8970
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   6720
         TabIndex        =   662
         Top             =   8970
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   661
         Top             =   8970
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   480
         TabIndex        =   660
         Top             =   8730
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   4200
         TabIndex        =   659
         Top             =   8730
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   6000
         TabIndex        =   658
         Top             =   8730
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   6720
         TabIndex        =   657
         Top             =   8730
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   656
         Top             =   8730
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   480
         TabIndex        =   655
         Top             =   8490
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   4200
         TabIndex        =   654
         Top             =   8490
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   6000
         TabIndex        =   653
         Top             =   8490
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   6720
         TabIndex        =   652
         Top             =   8490
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   651
         Top             =   8490
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   480
         TabIndex        =   650
         Top             =   8250
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   4200
         TabIndex        =   649
         Top             =   8250
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   6000
         TabIndex        =   648
         Top             =   8250
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   6720
         TabIndex        =   647
         Top             =   8250
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   646
         Top             =   8250
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   480
         TabIndex        =   645
         Top             =   8010
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   4200
         TabIndex        =   644
         Top             =   8010
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   6000
         TabIndex        =   643
         Top             =   8010
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   6720
         TabIndex        =   642
         Top             =   8010
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   641
         Top             =   8010
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   480
         TabIndex        =   640
         Top             =   7770
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   4200
         TabIndex        =   639
         Top             =   7770
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   6000
         TabIndex        =   638
         Top             =   7770
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   6720
         TabIndex        =   637
         Top             =   7770
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   636
         Top             =   7770
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   480
         TabIndex        =   635
         Top             =   7530
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   4200
         TabIndex        =   634
         Top             =   7530
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   6000
         TabIndex        =   633
         Top             =   7530
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   6720
         TabIndex        =   632
         Top             =   7530
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   631
         Top             =   7530
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   480
         TabIndex        =   630
         Top             =   7290
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   4200
         TabIndex        =   629
         Top             =   7290
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   6000
         TabIndex        =   628
         Top             =   7290
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   6720
         TabIndex        =   627
         Top             =   7290
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   626
         Top             =   7290
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   480
         TabIndex        =   625
         Top             =   7050
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   4200
         TabIndex        =   624
         Top             =   7050
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   6000
         TabIndex        =   623
         Top             =   7050
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   6720
         TabIndex        =   622
         Top             =   7050
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   621
         Top             =   7050
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   480
         TabIndex        =   620
         Top             =   6810
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   4200
         TabIndex        =   619
         Top             =   6810
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   6000
         TabIndex        =   618
         Top             =   6810
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   6720
         TabIndex        =   617
         Top             =   6810
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   616
         Top             =   6810
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   480
         TabIndex        =   615
         Top             =   6570
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   4200
         TabIndex        =   614
         Top             =   6570
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   6000
         TabIndex        =   613
         Top             =   6570
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   6720
         TabIndex        =   612
         Top             =   6570
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   611
         Top             =   6570
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   480
         TabIndex        =   610
         Top             =   6330
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   4200
         TabIndex        =   609
         Top             =   6330
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   6000
         TabIndex        =   608
         Top             =   6330
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   6720
         TabIndex        =   607
         Top             =   6330
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   606
         Top             =   6330
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   480
         TabIndex        =   605
         Top             =   6090
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   4200
         TabIndex        =   604
         Top             =   6090
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   6000
         TabIndex        =   603
         Top             =   6090
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   6720
         TabIndex        =   602
         Top             =   6090
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   601
         Top             =   6090
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   480
         TabIndex        =   600
         Top             =   5850
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   4200
         TabIndex        =   599
         Top             =   5850
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   6000
         TabIndex        =   598
         Top             =   5850
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   6720
         TabIndex        =   597
         Top             =   5850
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   596
         Top             =   5850
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   480
         TabIndex        =   595
         Top             =   5610
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   4200
         TabIndex        =   594
         Top             =   5610
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   6000
         TabIndex        =   593
         Top             =   5610
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   6720
         TabIndex        =   592
         Top             =   5610
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   591
         Top             =   5610
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   480
         TabIndex        =   590
         Top             =   5370
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   4200
         TabIndex        =   589
         Top             =   5370
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   6000
         TabIndex        =   588
         Top             =   5370
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   6720
         TabIndex        =   587
         Top             =   5370
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   586
         Top             =   5370
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   480
         TabIndex        =   585
         Top             =   5130
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   4200
         TabIndex        =   584
         Top             =   5130
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   6000
         TabIndex        =   583
         Top             =   5130
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   6720
         TabIndex        =   582
         Top             =   5130
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   581
         Top             =   5130
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   480
         TabIndex        =   580
         Top             =   4890
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   4200
         TabIndex        =   579
         Top             =   4890
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   6000
         TabIndex        =   578
         Top             =   4890
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   6720
         TabIndex        =   577
         Top             =   4890
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   576
         Top             =   4890
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   480
         TabIndex        =   575
         Top             =   4650
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   4200
         TabIndex        =   574
         Top             =   4650
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   6000
         TabIndex        =   573
         Top             =   4650
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   6720
         TabIndex        =   572
         Top             =   4650
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   571
         Top             =   4650
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   480
         TabIndex        =   570
         Top             =   4410
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   4200
         TabIndex        =   569
         Top             =   4410
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   6000
         TabIndex        =   568
         Top             =   4410
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   6720
         TabIndex        =   567
         Top             =   4410
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   566
         Top             =   4410
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   480
         TabIndex        =   565
         Top             =   4170
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   4200
         TabIndex        =   564
         Top             =   4170
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   6000
         TabIndex        =   563
         Top             =   4170
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   6720
         TabIndex        =   562
         Top             =   4170
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   561
         Top             =   4170
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   480
         TabIndex        =   560
         Top             =   3930
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   4200
         TabIndex        =   559
         Top             =   3930
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   6000
         TabIndex        =   558
         Top             =   3930
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   6720
         TabIndex        =   557
         Top             =   3930
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   556
         Top             =   3930
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   480
         TabIndex        =   555
         Top             =   3690
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   4200
         TabIndex        =   554
         Top             =   3690
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   6000
         TabIndex        =   553
         Top             =   3690
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   6720
         TabIndex        =   552
         Top             =   3690
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   551
         Top             =   3690
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   480
         TabIndex        =   550
         Top             =   3450
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   4200
         TabIndex        =   549
         Top             =   3450
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   6000
         TabIndex        =   548
         Top             =   3450
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   6720
         TabIndex        =   547
         Top             =   3450
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   546
         Top             =   3450
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   480
         TabIndex        =   545
         Top             =   3210
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   4200
         TabIndex        =   544
         Top             =   3210
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   6000
         TabIndex        =   543
         Top             =   3210
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   6720
         TabIndex        =   542
         Top             =   3210
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   541
         Top             =   3210
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   480
         TabIndex        =   540
         Top             =   2970
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   4200
         TabIndex        =   539
         Top             =   2970
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   6000
         TabIndex        =   538
         Top             =   2970
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   6720
         TabIndex        =   537
         Top             =   2970
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   536
         Top             =   2970
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   480
         TabIndex        =   535
         Top             =   2730
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   4200
         TabIndex        =   534
         Top             =   2730
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   6000
         TabIndex        =   533
         Top             =   2730
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   6720
         TabIndex        =   532
         Top             =   2730
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   531
         Top             =   2730
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   480
         TabIndex        =   530
         Top             =   2490
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   4200
         TabIndex        =   529
         Top             =   2490
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   6000
         TabIndex        =   528
         Top             =   2490
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   6720
         TabIndex        =   527
         Top             =   2490
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   526
         Top             =   2490
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   480
         TabIndex        =   525
         Top             =   2250
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   4200
         TabIndex        =   524
         Top             =   2250
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   6000
         TabIndex        =   523
         Top             =   2250
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   6720
         TabIndex        =   522
         Top             =   2250
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   521
         Top             =   2250
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   480
         TabIndex        =   520
         Top             =   2010
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   4200
         TabIndex        =   519
         Top             =   2010
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   6000
         TabIndex        =   518
         Top             =   2010
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   6720
         TabIndex        =   517
         Top             =   2010
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   516
         Top             =   2010
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   480
         TabIndex        =   515
         Top             =   1770
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   4200
         TabIndex        =   514
         Top             =   1770
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   6000
         TabIndex        =   513
         Top             =   1770
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   6720
         TabIndex        =   512
         Top             =   1770
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   511
         Top             =   1770
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   480
         TabIndex        =   510
         Top             =   1530
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   4200
         TabIndex        =   509
         Top             =   1530
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   6000
         TabIndex        =   508
         Top             =   1530
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   6720
         TabIndex        =   507
         Top             =   1530
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   506
         Top             =   1530
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   480
         TabIndex        =   505
         Top             =   1290
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   4200
         TabIndex        =   504
         Top             =   1290
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   6000
         TabIndex        =   503
         Top             =   1290
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   6720
         TabIndex        =   502
         Top             =   1290
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   501
         Top             =   1290
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   480
         TabIndex        =   500
         Top             =   1050
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   4200
         TabIndex        =   499
         Top             =   1050
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   6000
         TabIndex        =   498
         Top             =   1050
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   6720
         TabIndex        =   497
         Top             =   1050
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   496
         Top             =   1050
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   480
         TabIndex        =   495
         Top             =   810
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   4200
         TabIndex        =   494
         Top             =   810
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   6000
         TabIndex        =   493
         Top             =   810
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   6720
         TabIndex        =   492
         Top             =   810
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   491
         Top             =   810
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   480
         TabIndex        =   490
         Top             =   570
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   4200
         TabIndex        =   489
         Top             =   570
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   6000
         TabIndex        =   488
         Top             =   570
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   6720
         TabIndex        =   487
         Top             =   570
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   486
         Top             =   570
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   480
         TabIndex        =   485
         Top             =   330
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   4200
         TabIndex        =   484
         Top             =   330
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   6000
         TabIndex        =   483
         Top             =   330
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   6720
         TabIndex        =   482
         Top             =   330
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   5280
         MaxLength       =   8
         TabIndex        =   481
         Top             =   330
         Width           =   735
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   5280
         Locked          =   -1  'True
         TabIndex        =   62
         Text            =   "RY"
         Top             =   45
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   6720
         Locked          =   -1  'True
         TabIndex        =   61
         Text            =   "PO"
         Top             =   45
         Width           =   495
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   6000
         Locked          =   -1  'True
         TabIndex        =   60
         Text            =   "Wtime"
         Top             =   45
         Width           =   735
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   4200
         Locked          =   -1  'True
         TabIndex        =   59
         Text            =   "RS232"
         Top             =   45
         Width           =   1095
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   480
         Locked          =   -1  'True
         TabIndex        =   58
         Text            =   "AUDIO SG"
         Top             =   45
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   3000
         Locked          =   -1  'True
         TabIndex        =   57
         Text            =   "M.METER"
         Top             =   45
         Width           =   1215
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "37"
         Height          =   255
         Index           =   37
         Left            =   120
         TabIndex        =   739
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
         TabIndex        =   738
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
         TabIndex        =   737
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
         TabIndex        =   736
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
         TabIndex        =   735
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
         TabIndex        =   734
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
         TabIndex        =   733
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
         TabIndex        =   732
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
         TabIndex        =   731
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
         TabIndex        =   730
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
         TabIndex        =   729
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
         TabIndex        =   728
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
         TabIndex        =   727
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
         TabIndex        =   726
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
         TabIndex        =   725
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
         TabIndex        =   724
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
         TabIndex        =   723
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
         TabIndex        =   722
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
         TabIndex        =   721
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
         TabIndex        =   720
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
         TabIndex        =   719
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
         TabIndex        =   718
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
         TabIndex        =   717
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
         TabIndex        =   716
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
         TabIndex        =   715
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
         TabIndex        =   714
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
         TabIndex        =   713
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
         TabIndex        =   712
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
         TabIndex        =   711
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
         TabIndex        =   710
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
         TabIndex        =   709
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
         TabIndex        =   708
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
         TabIndex        =   707
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
         TabIndex        =   706
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
         TabIndex        =   705
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
         TabIndex        =   704
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
         TabIndex        =   703
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
         TabIndex        =   63
         Top             =   45
         Width           =   375
      End
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "ICX266 MOUNT CHECK PROGRAM EPP"
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
      Left            =   4530
      TabIndex        =   65
      Top             =   0
      Width           =   5910
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "作成：香港十和田生产技术课"
      Height          =   180
      Left            =   6495
      TabIndex        =   64
      Top             =   495
      Width           =   2340
   End
End
Attribute VB_Name = "ICX2362"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
ICX2362.Command4.Caption = "返回"
ICX2362.Picture1(1).ZOrder 0
ICX2362.Picture1(0).ZOrder 0
'PageNo = 1
ICX2361.Visible = True
ICX2362.Visible = False
ICX2361.ZOrder 0

End Sub

Private Sub Command4_Click()
If ICX2362.Command4.Caption = "条件设定" Then
ICX2362.Command4.Caption = "返回"
ICX2362.Picture1(1).ZOrder 0
ICX2362.Picture1(0).ZOrder 0
'Command3.Enabled = False
Else
ICX2362.Command4.Caption = "条件设定"
ICX2362.Picture2(1).ZOrder 0
ICX2362.Picture2(0).ZOrder 0
'Command3.Enabled = True
End If
End Sub

