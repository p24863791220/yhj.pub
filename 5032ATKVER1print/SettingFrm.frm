VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form SettingFrm 
   Caption         =   "EBX5032"
   ClientHeight    =   8490
   ClientLeft      =   165
   ClientTop       =   555
   ClientWidth     =   11880
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   10.5
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "SettingFrm.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   8490
   ScaleWidth      =   11880
   StartUpPosition =   3  '窗口缺省
   WindowState     =   2  'Maximized
   Begin VB.TextBox DISPLAYokng 
      Alignment       =   2  'Center
      BackColor       =   &H80000008&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   72
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   3525
      Left            =   105
      MultiLine       =   -1  'True
      TabIndex        =   175
      Text            =   "SettingFrm.frx":08CA
      Top             =   4845
      Width           =   11895
   End
   Begin VB.ComboBox ControlCombo 
      Height          =   330
      ItemData        =   "SettingFrm.frx":08D0
      Left            =   7605
      List            =   "SettingFrm.frx":08DA
      Style           =   2  'Dropdown List
      TabIndex        =   185
      Top             =   0
      Width           =   1110
   End
   Begin VB.CommandButton mem_check_Command 
      Caption         =   "mem_check_Command"
      Height          =   615
      Left            =   3855
      Style           =   1  'Graphical
      TabIndex        =   184
      Top             =   2370
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.CommandButton mem_write_Command 
      Caption         =   "mem_write_Command"
      Height          =   615
      Left            =   3855
      Style           =   1  'Graphical
      TabIndex        =   183
      Top             =   1515
      Visible         =   0   'False
      Width           =   4095
   End
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
      Left            =   8325
      TabIndex        =   182
      Top             =   2370
      Width           =   3450
   End
   Begin VB.CommandButton Atk_Command 
      Caption         =   "ATK_Command"
      Height          =   615
      Left            =   8370
      Style           =   1  'Graphical
      TabIndex        =   181
      Top             =   1530
      Width           =   3420
   End
   Begin VB.TextBox FileTime 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   1665
      Left            =   1455
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   179
      TabStop         =   0   'False
      Top             =   3075
      Width           =   10545
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   2520
      Top             =   -30
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   0   'False
      RThreshold      =   1
      BaudRate        =   115200
   End
   Begin VB.Timer Timer1 
      Interval        =   20
      Left            =   1815
      Top             =   60
   End
   Begin VB.CommandButton backCommand 
      Caption         =   "返回"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3960
      TabIndex        =   174
      Top             =   3600
      Visible         =   0   'False
      Width           =   3180
   End
   Begin VB.TextBox WAITText 
      Alignment       =   1  'Right Justify
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   375
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   173
      Text            =   "2000"
      Top             =   1080
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.TextBox LOADCABText 
      Alignment       =   2  'Center
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   375
      Index           =   2
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   172
      Top             =   1080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox LOADCABText 
      Alignment       =   2  'Center
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   375
      Index           =   1
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   171
      Text            =   "OFF"
      Top             =   1080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox timeText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   10920
      TabIndex        =   164
      Text            =   "50000ms"
      Top             =   240
      Width           =   975
   End
   Begin VB.TextBox NGText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   9840
      TabIndex        =   170
      Text            =   "0"
      Top             =   240
      Width           =   1095
   End
   Begin VB.TextBox OKText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   8760
      TabIndex        =   169
      Text            =   "0"
      Top             =   240
      Width           =   1095
   End
   Begin MSComCtl2.UpDown UpDown1 
      Height          =   735
      Left            =   1215
      TabIndex        =   168
      Top             =   0
      Width           =   255
      _ExtentX        =   423
      _ExtentY        =   1296
      _Version        =   393216
      Value           =   1
      BuddyControl    =   "STEPNOText"
      BuddyDispid     =   196638
      OrigLeft        =   1080
      OrigTop         =   240
      OrigRight       =   1320
      OrigBottom      =   735
      Max             =   99
      Min             =   1
      SyncBuddy       =   -1  'True
      BuddyProperty   =   0
      Enabled         =   0   'False
   End
   Begin VB.CommandButton exitCommand 
      Caption         =   "退出程序"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      TabIndex        =   163
      Top             =   2400
      Width           =   3585
   End
   Begin VB.CommandButton debugCommand 
      Caption         =   "结果确认"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3960
      TabIndex        =   162
      Top             =   3360
      Visible         =   0   'False
      Width           =   3180
   End
   Begin VB.CommandButton pioCommand 
      Caption         =   "PIO"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      TabIndex        =   161
      Top             =   1560
      Width           =   3570
   End
   Begin VB.CommandButton Datasave 
      Caption         =   "DATA"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3480
      Style           =   1  'Graphical
      TabIndex        =   160
      Top             =   3720
      Visible         =   0   'False
      Width           =   3180
   End
   Begin VB.CommandButton autoCommand 
      Caption         =   "自动"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5040
      TabIndex        =   159
      Top             =   3360
      Width           =   3180
   End
   Begin VB.TextBox ITMEText 
      BackColor       =   &H00C0FFFF&
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   15.75
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   495
      Left            =   120
      TabIndex        =   158
      Text            =   "RV303调整"
      Top             =   840
      Width           =   3255
   End
   Begin MSComctlLib.ProgressBar WAITBar 
      Height          =   255
      Left            =   3360
      TabIndex        =   157
      Top             =   3120
      Visible         =   0   'False
      Width           =   8535
      _ExtentX        =   15055
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   16
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   156
      Text            =   " "
      Top             =   5640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   16
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   155
      Text            =   " "
      Top             =   5400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   16
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   154
      Text            =   " "
      Top             =   5160
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   16
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   153
      Text            =   "DC VC"
      Top             =   4920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   15
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   152
      Text            =   " "
      Top             =   5640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   15
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   151
      Text            =   " "
      Top             =   5400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   15
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   150
      Text            =   " "
      Top             =   5160
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   15
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   149
      Text            =   "BATT V"
      Top             =   4920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   14
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   148
      Text            =   " "
      Top             =   5640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   14
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   147
      Text            =   " "
      Top             =   5400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   14
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   146
      Text            =   " "
      Top             =   5160
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   14
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   145
      Text            =   "GVCC"
      Top             =   4920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   13
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   144
      Text            =   "1000"
      Top             =   5640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   13
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   143
      Text            =   "1000"
      Top             =   5400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   13
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   142
      Text            =   "1000"
      Top             =   5160
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   13
      Left            =   8040
      TabIndex        =   141
      Text            =   "VGP"
      Top             =   4920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   12
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   140
      Text            =   "1000"
      Top             =   5640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   12
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   139
      Text            =   "1000"
      Top             =   5400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   12
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   138
      Text            =   "1000"
      Top             =   5160
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   12
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   137
      Text            =   "VPOS"
      Top             =   4920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   11
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   136
      Text            =   "1000"
      Top             =   5640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   11
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   135
      Text            =   "1000"
      Top             =   5400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   11
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   134
      Text            =   "1000"
      Top             =   5160
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      IMEMode         =   3  'DISABLE
      Index           =   11
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   133
      Text            =   "GVSS"
      Top             =   4920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   10
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   132
      Text            =   "1000"
      Top             =   5640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   10
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   131
      Text            =   "1000"
      Top             =   5400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   10
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   130
      Text            =   "1000"
      Top             =   5160
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   10
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   129
      Text            =   "GVDD"
      Top             =   4920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   9
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   128
      Text            =   "1000"
      Top             =   5640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   9
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   127
      Text            =   "1000"
      Top             =   5400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   9
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   126
      Text            =   "1000"
      Top             =   5160
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   9
      Left            =   4200
      TabIndex        =   125
      Text            =   "VNEG"
      Top             =   4920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   8
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   124
      Text            =   "1000"
      Top             =   4320
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   8
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   123
      Text            =   "1000"
      Top             =   4080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   8
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   122
      Text            =   "1000"
      Top             =   3840
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   8
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   121
      Text            =   "VDD"
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   7
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   120
      Text            =   "1000"
      Top             =   4320
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   7
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   119
      Text            =   "1000"
      Top             =   4080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   7
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   118
      Text            =   "1000"
      Top             =   3840
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   7
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   117
      Text            =   "V1"
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   6
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   116
      Text            =   "1000"
      Top             =   4320
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   6
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   115
      Text            =   "1000"
      Top             =   4080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   6
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   114
      Text            =   "1000"
      Top             =   3840
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   6
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   113
      Text            =   "PLL"
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   5
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   112
      Text            =   "1000"
      Top             =   4320
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   5
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   111
      Text            =   "1000"
      Top             =   4080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   5
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   110
      Text            =   "1000"
      Top             =   3840
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   5
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   109
      Text            =   "LDO1"
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   4
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   108
      Text            =   "1000"
      Top             =   4320
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   4
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   107
      Text            =   "1000"
      Top             =   4080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   4
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   106
      Text            =   "1000"
      Top             =   3840
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   4
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   105
      Text            =   "V29"
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   3
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   104
      Text            =   "1000"
      Top             =   4320
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   3
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   103
      Text            =   "1000"
      Top             =   4080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   3
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   102
      Text            =   "1000"
      Top             =   3840
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   3
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   101
      Text            =   "V18"
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   2
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   100
      Text            =   "1000"
      Top             =   4320
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   2
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   99
      Text            =   "1000"
      Top             =   4080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   2
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   98
      Text            =   "1000"
      Top             =   3840
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   2
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   97
      Text            =   "QVCC"
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHLOText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   1
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   96
      Text            =   "1000"
      Top             =   4320
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHMeaText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   1
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   95
      Text            =   "1000"
      Top             =   4080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHHIText 
      Alignment       =   1  'Right Justify
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   270
      Index           =   1
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   94
      Text            =   "1000"
      Top             =   3840
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox CHITMEText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   1
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   93
      Text            =   "电流mA"
      Top             =   3600
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   16
      Left            =   10920
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   84
      Text            =   "0"
      Top             =   2880
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   15
      Left            =   9960
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   83
      Text            =   "0"
      Top             =   2880
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   14
      Left            =   9000
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   82
      Text            =   "0"
      Top             =   2880
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   13
      Left            =   8040
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   81
      Text            =   "0"
      Top             =   2880
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   12
      Left            =   7080
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   80
      Text            =   "0"
      Top             =   2880
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   11
      Left            =   6120
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   79
      Text            =   "0"
      Top             =   2880
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   10
      Left            =   5160
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   78
      Text            =   "0"
      Top             =   2880
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   9
      Left            =   4200
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   77
      Text            =   "0"
      Top             =   2880
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   8
      Left            =   10920
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   76
      Text            =   "0"
      Top             =   2040
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   7
      Left            =   9960
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   75
      Text            =   "0"
      Top             =   2040
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   6
      Left            =   9000
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   74
      Text            =   "0"
      Top             =   2040
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   5
      Left            =   8040
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   73
      Text            =   "0"
      Top             =   2040
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   4
      Left            =   7080
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   72
      Text            =   "0"
      Top             =   2040
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   3
      Left            =   6120
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   71
      Text            =   "0"
      Top             =   2040
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   2
      Left            =   5160
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   70
      Text            =   "0"
      Top             =   2040
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWSETText 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   1
      Left            =   4200
      Locked          =   -1  'True
      MaxLength       =   1
      TabIndex        =   69
      Text            =   "0"
      Top             =   2040
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   16
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   68
      Text            =   " "
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   15
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   67
      Text            =   " "
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   14
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   66
      Text            =   " "
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   13
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   65
      Text            =   " "
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   12
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   64
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   11
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   63
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   10
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   62
      Text            =   "4.2V SW"
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   9
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   61
      Text            =   "4.25V SW"
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   8
      Left            =   10920
      Locked          =   -1  'True
      TabIndex        =   60
      Text            =   "3.8V SW"
      Top             =   1800
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   7
      Left            =   9960
      Locked          =   -1  'True
      TabIndex        =   59
      Text            =   "2.8V SW"
      Top             =   1800
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   6
      Left            =   9000
      Locked          =   -1  'True
      TabIndex        =   58
      Text            =   "1Ko SW"
      Top             =   1800
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   5
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   57
      Text            =   "1Ko SW"
      Top             =   1800
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   4
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   56
      Text            =   "BATA IN"
      Top             =   1800
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   3
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   55
      Text            =   "CHARGE SW"
      Top             =   1800
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   2
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   54
      Text            =   "5.2VDC"
      Top             =   1800
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox SWText 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   275
      Index           =   1
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   53
      Text            =   "VBUS"
      Top             =   1800
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox LOADVALEText 
      Alignment       =   2  'Center
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   375
      Index           =   2
      Left            =   8040
      Locked          =   -1  'True
      TabIndex        =   46
      Top             =   1080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox LOADMODEText 
      Alignment       =   2  'Center
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   375
      Index           =   2
      Left            =   7080
      Locked          =   -1  'True
      TabIndex        =   47
      Top             =   1080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox LOADVALEText 
      Alignment       =   2  'Center
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   375
      Index           =   1
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   45
      Top             =   1080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox LOADMODEText 
      Alignment       =   2  'Center
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   375
      Index           =   1
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   44
      Top             =   1080
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox ACINText 
      Alignment       =   2  'Center
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   375
      Left            =   3360
      Locked          =   -1  'True
      TabIndex        =   43
      Text            =   "100"
      Top             =   1080
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox STEPNOText 
      Alignment       =   2  'Center
      BackColor       =   &H0080C0FF&
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
      Height          =   495
      Left            =   120
      TabIndex        =   42
      Text            =   "1"
      Top             =   240
      Width           =   1095
   End
   Begin VB.PictureBox Pic1 
      BackColor       =   &H80000007&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      Left            =   555
      ScaleHeight     =   2475
      ScaleWidth      =   11715
      TabIndex        =   38
      Top             =   8625
      Visible         =   0   'False
      Width           =   11775
      Begin VB.Shape S3 
         BorderColor     =   &H00FFFFFF&
         FillColor       =   &H0000FFFF&
         FillStyle       =   0  'Solid
         Height          =   735
         Left            =   6480
         Shape           =   3  'Circle
         Top             =   1320
         Width           =   360
      End
      Begin VB.Line L1 
         BorderColor     =   &H0000FFFF&
         BorderWidth     =   2
         X1              =   6660
         X2              =   6660
         Y1              =   1515
         Y2              =   2340
      End
      Begin VB.Label Lab2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   21.75
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   495
         Left            =   4800
         TabIndex        =   177
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label Lab1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "F="
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   21.75
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   435
         Left            =   2040
         TabIndex        =   176
         Top             =   360
         Width           =   1680
      End
      Begin VB.Shape S2 
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         FillColor       =   &H0000FF00&
         FillStyle       =   0  'Solid
         Height          =   735
         Left            =   3870
         Top             =   1740
         Width           =   4335
      End
      Begin VB.Shape S1 
         FillColor       =   &H00FF8080&
         FillStyle       =   0  'Solid
         Height          =   735
         Left            =   0
         Top             =   1740
         Width           =   11715
      End
   End
   Begin VB.TextBox QinBao 
      Height          =   3465
      Left            =   90
      MultiLine       =   -1  'True
      TabIndex        =   186
      Top             =   4860
      Width           =   11790
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "烧录文件　修改时间："
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   660
      Left            =   120
      TabIndex        =   180
      Top             =   3120
      Width           =   1290
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "量产VER1.0"
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
      Left            =   6840
      TabIndex        =   178
      Top             =   510
      Width           =   1200
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "测试时间"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   55
      Left            =   10920
      TabIndex        =   165
      Top             =   0
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "NG台数"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   57
      Left            =   9840
      TabIndex        =   167
      Top             =   0
      Width           =   1095
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK台数"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   56
      Left            =   8760
      TabIndex        =   166
      Top             =   0
      Width           =   1095
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Low "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   54
      Left            =   3360
      TabIndex        =   92
      Top             =   5640
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mea"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   53
      Left            =   3360
      TabIndex        =   91
      Top             =   5400
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Hi "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   52
      Left            =   3360
      TabIndex        =   90
      Top             =   5160
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Itme  "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   51
      Left            =   3360
      TabIndex        =   89
      Top             =   4920
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Low"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   49
      Left            =   3360
      TabIndex        =   88
      Top             =   4320
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mea "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   48
      Left            =   3360
      TabIndex        =   87
      Top             =   4080
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Hi"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   46
      Left            =   3360
      TabIndex        =   86
      Top             =   3840
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Itme "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   45
      Left            =   3360
      TabIndex        =   85
      Top             =   3600
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " 设定值"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   42
      Left            =   3360
      TabIndex        =   48
      Top             =   2880
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " 设定值"
      BeginProperty Font 
         Name            =   "MS Gothic"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   41
      Left            =   3360
      TabIndex        =   41
      Top             =   2040
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " 项目"
      BeginProperty Font 
         Name            =   "MS Mincho"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   40
      Left            =   3360
      TabIndex        =   40
      Top             =   1800
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   38
      Left            =   10920
      TabIndex        =   37
      Top             =   2400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   37
      Left            =   9960
      TabIndex        =   36
      Top             =   2400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   36
      Left            =   9000
      TabIndex        =   35
      Top             =   2400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   35
      Left            =   8040
      TabIndex        =   34
      Top             =   2400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW12"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   34
      Left            =   7080
      TabIndex        =   33
      Top             =   2400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW11"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   33
      Left            =   6120
      TabIndex        =   32
      Top             =   2400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW10"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   32
      Left            =   5160
      TabIndex        =   31
      Top             =   2400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW9"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   31
      Left            =   4200
      TabIndex        =   30
      Top             =   2400
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW8"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   30
      Left            =   10920
      TabIndex        =   29
      Top             =   1560
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW7"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   29
      Left            =   9960
      TabIndex        =   28
      Top             =   1560
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW6"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   28
      Left            =   9000
      TabIndex        =   27
      Top             =   1560
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW5"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   27
      Left            =   8040
      TabIndex        =   26
      Top             =   1560
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW4"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   26
      Left            =   7080
      TabIndex        =   25
      Top             =   1560
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   25
      Left            =   5160
      TabIndex        =   24
      Top             =   1560
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW3"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   6120
      TabIndex        =   23
      Top             =   1560
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SW1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   4200
      TabIndex        =   22
      Top             =   1560
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH8"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   24
      Left            =   10920
      TabIndex        =   21
      Top             =   3360
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH7"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   23
      Left            =   9960
      TabIndex        =   20
      Top             =   3360
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH6"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   22
      Left            =   9000
      TabIndex        =   19
      Top             =   3360
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH5"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   21
      Left            =   8040
      TabIndex        =   18
      Top             =   3360
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH4"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   20
      Left            =   7080
      TabIndex        =   17
      Top             =   3360
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH3"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   19
      Left            =   6120
      TabIndex        =   16
      Top             =   3360
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   10
      Left            =   5160
      TabIndex        =   15
      Top             =   3360
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   9
      Left            =   4200
      TabIndex        =   14
      Top             =   3360
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH9"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   18
      Left            =   4200
      TabIndex        =   13
      Top             =   4680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH10"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   17
      Left            =   5160
      TabIndex        =   12
      Top             =   4680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH11"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   16
      Left            =   6120
      TabIndex        =   11
      Top             =   4680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH12"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   15
      Left            =   7080
      TabIndex        =   10
      Top             =   4680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH13"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   14
      Left            =   8040
      TabIndex        =   9
      Top             =   4680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH14"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   13
      Left            =   9000
      TabIndex        =   8
      Top             =   4680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH15"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   12
      Left            =   9960
      TabIndex        =   7
      Top             =   4680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CH16"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   11
      Left            =   10920
      TabIndex        =   6
      Top             =   4680
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "等待时间"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   8
      Left            =   9960
      TabIndex        =   5
      Top             =   840
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "备用"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   6
      Left            =   7080
      TabIndex        =   4
      Top             =   840
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "备用"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   5
      Left            =   4200
      TabIndex        =   3
      Top             =   840
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H80000008&
      Caption         =   "STEPNO"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   1095
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "EBX5032 ATK"
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   26.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   495
      Index           =   0
      Left            =   2085
      TabIndex        =   0
      Top             =   120
      Width           =   5295
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CHno"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   47
      Left            =   3360
      TabIndex        =   51
      Top             =   3360
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "CHno "
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   50
      Left            =   3360
      TabIndex        =   52
      Top             =   4680
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SWno"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   39
      Left            =   3360
      TabIndex        =   39
      Top             =   1560
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "备用"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   4
      Left            =   3360
      TabIndex        =   2
      Top             =   840
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " 项目"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   43
      Left            =   3360
      TabIndex        =   49
      Top             =   2640
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " SWno"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   44
      Left            =   3360
      TabIndex        =   50
      Top             =   2400
      Visible         =   0   'False
      Width           =   855
   End
End
Attribute VB_Name = "SettingFrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
 '''-------------------------------------------------------------------------------------------
'''-------------------------------------------------------------------------------------------
'*                    APS226电调程序      作成：香港十和田生产技术
'*
'* Ver 1.0        量产用程序新规作成       用EPP2用程序修改作成                    2006.08.09
'* Ver 1.1        量产10日后，各种误判定对策完成，程序变更                         2006.08.21
'*                STEP25-9,STEP23-9,STEP20-8
'*                STEP12 后重测试追加
'*              * 测定器GPIB通信NG检出
'*                PH烧损对策，程序开始方法变更
'*              －－－－－－－－－－－－－－－－－
'*Ver 1.2        12V端子不良检出，12V端子与12V机板电压差项目追加，程序变更         2006.08.28
'*               STEP6 5V电流测试追加，先测电流后测电压变更                        孟英武
'*VER1.0         5013电流电压新规作成，                                            2007-6-12
'*232 DMM
'---------------------------------------------------------------------------------------------
'---------------------------------------------------------------------------------------------
Dim SetIn As Integer

Dim Ngnum As Integer
Dim R64Rang As Integer    '万用表档位
Dim Manal As Integer    '手动自动标记 Manal＝1为手动
Dim Plz(2) As Integer '电子负荷地址，12v-21, 5v-20
Dim R64Adr As Integer '5,万用表地址
Dim AVRAdr As Integer '8
Dim H3332Adr As Integer '10
Dim IOEnabled As Integer '0 治具开关读取允许 1 禁止
Dim Iodata As Integer
Dim Ioindata As Integer
Dim Eloadstr(3) As String '电子负荷设定
Dim szData1 As String     'AVR设定OLD值
Dim SWdata(17) As Integer 'sw设定用变量
Dim TestTime(1) As Long
Dim Save As Integer
'''''''''''''''''''''''''''''''''''''''
Dim LOGstring   As String 'FPGA状况显示文本
Dim Hhwnd As Long         'fpga窗口句柄0
Dim NgtestTotal As Integer
Dim ROM_IMAGEFile As String
Dim MEMORY_init As String
Dim DOWNLOAD_file As String
Dim g_strINIPath As String 'SCAN 配置文件路径
Private Declare Function GetPrivateProfileString _
  Lib "kernel32" Alias "GetPrivateProfileStringA" _
  (ByVal lpApplicationName As String, _
  ByVal lpKeyName As Any, _
  ByVal lpDefault As String, _
  ByVal lpReturnedString As String, _
  ByVal nSize As Long, _
  ByVal lpFileName As String) As Long

 Private Declare Function WritePrivateProfileString Lib "kernel32" _
   Alias "WritePrivateProfileStringA" _
  (ByVal lpApplicationName As String, ByVal lpKeyName As Any, _
   ByVal lpString As Any, ByVal lpFileName As String) As Long
   Public Sub OptionKeyWrite(ByVal Hhwnd_pri As Long, ByVal Key_pri As String)
                SetForegroundWindow (Hhwnd_pri)
                Sleep (50)
                SetActiveWindow Hhwnd_pri
                Sleep (50)
                 ShowWindow Hhwnd_pri, 5
                 
                 Sleep (50)
                SendKeys Key_pri, 100 'LOAD
                Sleep (50)
   End Sub
   Public Sub KeyWrite()
                SetForegroundWindow (Hhwnd)
                Sleep (50)
                SetActiveWindow Hhwnd
                Sleep (50)
                 ShowWindow Hhwnd, 5
                 
                 Sleep (500)
                SendKeys "%" & "F", 100 'LOAD
                Sleep (100)
                SendKeys "1", 100
                Sleep (100)
                
                
                 Sleep (500)
                SendKeys "%" & "T", 100 'WRITE
                Sleep (100)
                SendKeys "w", 100
                Sleep (100)
   End Sub
   
Private Sub Atk_Command_Click()
    Dim Ret As Long
    Dim DoCount As Long
    Dim Xx_PRI As Long
    Dim Yy_pri As Long
       Dim hWndDesk As Long
   hWndDesk = GetDesktopWindow()
    NGflag = 0
    Atk_Command.BackColor = &H8000000F

    DISPLAYokng.BackColor = vbBlack
    DISPLAYokng.Text = ""
            If CheckApplicationIsRun("AtkTest02.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im AtkTest02.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            If CheckApplicationIsRun("AtkTest02.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im AtkTest02.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
    FileTime.Text = ""
    Call Getini_set
    
    If NGflag = 1 Then
    Exit Sub
    End If
    Call ACinonoff("1")
    Sleep (500)
 Ret = ShellExecute(hWndDesk, "open", "C:\Program Files\MKM\AtkTest02\AtkTest02.exe", "AtkTest02.ini", "C:\Program Files\MKM\AtkTest02\", 5)
'    Ret = Shell("C:\Program Files\MKM\AtkTest02\AtkTest02.ini", vbNormalFocus)
'     Call Shell("rundll32.exe shell32.dll,OpenAs_RunDLL " & "C:\Program Files\MKM\AtkTest02\AtkTest02.ini", vbNormalFocus)

   If Ret > 0 Then
   Else
   NGflag = 1
   Exit Sub
   End If
    Do
        DoEvents
        Sleep 100
        DoCount = DoCount + 1
                Hhwnd = FindWindow(vbNullString, "AtkTest02 - [AtkLog1]")
                If Hhwnd = 0 Then
                Hhwnd = FindWindow(vbNullString, "AtkTest02 - [AtkTest02.ini]")
                End If
    Loop Until Hhwnd <> 0 Or DoCount > 30
    If DoCount > 30 Then
        MsgBox "AtkTest02 OPEN FILE ERROR"
        Exit Sub
    End If
If Hhwnd > 0 Then 'WRITE
                    ATK_ResultText = 0
                    ATK_WriteButton = 0
                    EnumChildWindows Hhwnd, AddressOf EnumChildProcATK, ByVal 0&
                    '按键发送
                    Call KeyWrite
'                Xx_PRI = GetTickCount
'            Do
'            DoEvents
'            Sleep (20)
'            Loop Until GetTickCount - Xx_PRI > 8000 ' WAIT
'                    Call KeyWrite
                   '检测烧录状态
                   Xx_PRI = GetTickCount
                Do
                DoEvents
                Sleep (50)
                SendMSG ("getlog")
                LOGstring = Replace(Trim(LOGstring), Chr(0), "")
                DISPLAYokng.Text = Trim$(LOGstring)
                DISPLAYokng.SelStart = Len(LOGstring)
                If InStr(1, LOGstring, "time =", vbTextCompare) > 0 And InStr(1, LOGstring, "success", vbTextCompare) > 0 And InStr(1, LOGstring, "test write - stop", vbTextCompare) > 0 Then
                Exit Do
                End If
                If LOGstring = "" And Yy_pri > 8000 Then
                Exit Do
                End If
                Hhwnd = FindWindow(vbNullString, "AtkTest02 - [AtkLog1]")
                If Hhwnd = 0 Then
                Hhwnd = FindWindow(vbNullString, "AtkTest02 - [AtkTest02.ini]")
                End If
                If Hhwnd <= 0 Then Exit Do
                Yy_pri = GetTickCount() - Xx_PRI
                    If (IOread And 2) = 2 Or SetIn = 0 Then '检测到复位 后 退出

                        NGflag = 1
                        SetIn = 0
                        Exit Do
                    End If
                Loop Until Yy_pri > 1500000
Else
                NGflag = 0
End If
    Call ACinonoff("0") ' SHUT DOWN
    If Yy_pri > 300000 Then
        If InStr(1, LOGstring, "success", vbTextCompare) > 0 And InStr(1, LOGstring, "test write - stop", vbTextCompare) > 0 Then 'ok check
            NGflag = 0
            Else
            NGflag = 1
        End If
    End If
'OKNG DISPLAY
If Yy_pri < 300000 Or SetIn = 0 Or NGflag = 1 Then
NGflag = 1
Atk_Command.BackColor = vbRed
Else
Atk_Command.BackColor = vbGreen
Sleep (3000)
End If

'关闭窗口 CLOSE WINDOW
            If CheckApplicationIsRun("AtkTest02.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im AtkTest02.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            If CheckApplicationIsRun("AtkTest02.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im AtkTest02.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
End Sub
Public Sub Nosave(Optional ByVal WinName As String)
Dim Hhwnd_pri As String
                Hhwnd_pri = FindWindow(vbNullString, WinName)
                If Hhwnd_pri <> 0 Then
                EnumChildWindows Hhwnd_pri, AddressOf EnumChildProc, ByVal 0&
                    If No_Pub <> 0 Then
                    MsgRet = SendMessage(No_Pub, BM_CLICK, 0&, ByVal 0&)  'BM_CLICK
                    End If
                End If
End Sub
Private Sub backCommand_Click()
    IOEnabled = 0
    UpDown1.Enabled = False
    backCommand.Enabled = False

    DISPLAYini
End Sub


Private Sub Control_Command_Click()
If Control_Command.Caption = "开始" Then
Control_Command.Caption = "停止"
Else
Control_Command.Caption = "开始"
End If
End Sub


Private Sub ControlCombo_Click()
If ControlCombo.Text <> ControlOld Then
    If UCase(InputBox("请输入密码！")) = "AA" Then
    ControlOld = ControlCombo.Text
    If ControlOld = "IO" Then
    Call DIOINIT
    End If
    SaveSet
    Else
    ControlCombo.Text = ControlOld
    End If
End If
End Sub
Public Sub SaveSet()
SaveSetting "EBX5032", "ATK", "CONTROLTYPE", ControlOld
End Sub
Public Sub GetSet()
Dim RETS As String
    RETS = GetSetting("EBX5032", "ATK", "CONTROLTYPE")
If RETS <> "" Then
    ControlOld = RETS
    ControlCombo.Text = ControlOld
    Else
    ControlOld = "PRINT"
    ControlCombo.Text = ControlOld
End If
End Sub
Private Sub debugCommand_Click()
    UpDown1.Max = Stepmax
    IOEnabled = 1
    UpDown1.Enabled = True
    Label1(0).Caption = "电调测试结果确认"
    ITMEText.Text = "用鼠标选择STEPNO"
    backCommand.Enabled = True
End Sub



Private Sub DISPLAYokng_DblClick()
QinBao.ZOrder 0
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    ch = Chr(KeyAscii)
    Select Case ch
        Case "m", "M"
            autoCommand_Click
        Case "G", "g"
            IOin = 1
            Iodata = 9
            Ioindata = 0
    End Select
    If KeyAscii = 27 Then exitCommand_Click
    If KeyAscii > 49 Then IOin = 4
End Sub
Private Sub Form_Activate()
    '显示及画面初始化
    Datasave_Click
    DISPLAYini
    OKText.Text = 0
    NGText.Text = 0
    Datasave_Click
End Sub

Private Sub Form_Load()
  If App.PrevInstance Then
  MsgBox "程序已经运行", vbOKOnly, "注意"
       
        Unload Me
    End If
    Stepmax = 15
    POmax = 16
    Call GetSet
'    GPibini 'gpib初始化
If ControlOld = "IO" Then
    DIOINIT 'io初始化
End If
    IOini
    EBX5032Out_Click
    SetIn = 0
    LOADcondition 'from load后，条件规格读入

    Datasave_Click
    
    Getini_set
    
 End Sub
Public Sub FileCheck(FileNuJin As String)
Dim fso As New FileSystemObject, drv As Drive, Fol As Folder, Fil As File
Dim i As Integer
        If fso.FileExists(FileNuJin) = True Then
        Set Fil = fso.GetFile(FileNuJin)
        FileTime.Text = FileTime.Text & Chr(10) & Chr(13) & FileNuJin & " " & Fil.DateLastModified & " " & Fil.Size & "字节" & Chr(13)
        Else
        MsgBox FileNuJin & "文件不存在！"
        NGflag = 1
        End
        End If
End Sub
Public Sub Getini_set()
Dim strINIPath As String
Dim Ret As Integer
Dim str1 As String * 1024
Dim str2 As String * 255
Dim str3 As String * 255
Dim iInitialCount As String * 255
Dim iCountLength As String * 255

g_strINIPath = "C:\Program Files\MKM\AtkTest02\" & "AtkTest02.ini"

Ret = GetPrivateProfileString("FILE_PATH", "ROM_IMAGE", "C:", str1, 1024, g_strINIPath)

Ret = GetPrivateProfileString("CONFIG", "MEMORY_INIT", "MemoryInit.ini", str2, 255, g_strINIPath)

Ret = GetPrivateProfileString("CONFIG", "DOWNLOAD_FILE", "DownloadFile.ini", str3, 255, g_strINIPath)

ROM_IMAGEFile = Replace(Trim(str1), Chr(0), "")

MEMORY_init = "C:\Program Files\MKM\config\" & Replace(Trim(str2), Chr(0), "")

DOWNLOAD_file = ROM_IMAGEFile & "\" & Replace(Trim(str3), Chr(0), "")

    Call FileCheck(DOWNLOAD_file)
    
    Call FileCheck(MEMORY_init)
End Sub

Private Sub Form_Unload(Cancel As Integer)
SaveSet
    Closedevice
            If CheckApplicationIsRun("AtkTest02.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im AtkTest02.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            If CheckApplicationIsRun("AtkTest02.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im AtkTest02.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            
            If CheckApplicationIsRun("ADSToolkit_std.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im ADSToolkit_std.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            If CheckApplicationIsRun("ADSToolkit_std.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im ADSToolkit_std.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
If MSComm1.PortOpen = True Then MSComm1.PortOpen = False
    End
End Sub





Private Sub mem_check_Command_Click()
        mem_check_Command.BackColor = vbGreen
        mem_check_Command.Visible = False
        Exit Sub
Dim Ret As Long
    Dim DoCount As Long
    Dim Xx_PRI As Long
    Dim Yy_pri As Long
       Dim hWndDesk As Long
   hWndDesk = GetDesktopWindow()
   mem_check_Command.BackColor = &H8000000F
    NGflag = 0
    DISPLAYokng.BackColor = vbBlack
    DISPLAYokng.ForeColor = vbWhite
    DISPLAYokng.Font.Size = 12
    DISPLAYokng.Text = ""
    If MSComm1.PortOpen = False Then MSComm1.PortOpen = True
    Call ACinonoff("memcheck")
                Xx_PRI = GetTickCount
                Do
                DoEvents
                Sleep (20)
                Call MSComm1_OnComm2
                Yy_pri = GetTickCount - Xx_PRI
                
                Loop Until InStr(1, DISPLAYokng, "MMU On/Off", vbTextCompare) > 0 Or Yy_pri > 6000
          
If InStr(1, DISPLAYokng.Text, "MMU On/Off", vbTextCompare) > 0 Then
        Sleep (20)
        DISPLAYokng = ""
    Rs232TX2 ("1")
                Xx_PRI = GetTickCount
                Do
                DoEvents
                Sleep (20)
                Call MSComm1_OnComm2
                Yy_pri = GetTickCount - Xx_PRI
                Loop Until InStr(1, DISPLAYokng, "7. Check", vbTextCompare) > 0 Or Yy_pri > 6000
                
    Sleep (20)
    DISPLAYokng = ""
    Rs232TX2 ("6")
                    Xx_PRI = GetTickCount
                Do
                DoEvents
                Sleep (90)
                DISPLAYokng.Text = ""
                Call MSComm1_OnComm2
                Yy_pri = GetTickCount - Xx_PRI
                Loop Until InStr(1, DISPLAYokng, "OK", vbTextCompare) > 0 Or Yy_pri > 150000
Else
NGflag = 1
End If
'OKNG DISPLAY
If InStr(1, DISPLAYokng, "OK", vbTextCompare) <= 0 Or NGflag = 1 Then
        NGflag = 1
        mem_check_Command.BackColor = vbRed
Else
        mem_check_Command.BackColor = vbGreen
End If

Call IOwrite(2, 0)
Call IOwrite(3, 0)
Call IOwrite(4, 0)
Sleep (1000)
End Sub

Private Sub mem_write_Command_Click()
        mem_write_Command.BackColor = vbGreen
        mem_write_Command.Visible = False
        Exit Sub
 Dim Ret As Long
    Dim DoCount As Long
    Dim Xx_PRI As Long
    Dim Yy_pri As Long
       Dim hWndDesk As Long
   hWndDesk = GetDesktopWindow()
   mem_write_Command.BackColor = &H8000000F
           Atk_Command.BackColor = &H8000000F
              mem_check_Command.BackColor = &H8000000F
    NGflag = 0
    DISPLAYokng.BackColor = vbWhite
    DISPLAYokng.Text = ""
            If CheckApplicationIsRun("ADSToolkit_std.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im ADSToolkit_std.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            If CheckApplicationIsRun("ADSToolkit_std.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im ADSToolkit_std.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
    Call ACinonoff("memwrite")
 Ret = ShellExecute(hWndDesk, "open", "C:\Program Files\freescale\AdvancedToolKit-STD\ADSToolkit_std.exe", 0&, "C:\Program Files\freescale\AdvancedToolKit-STD\", 5)
'    Ret = Shell("C:\Program Files\MKM\AtkTest02\AtkTest02.ini", vbNormalFocus)
'     Call Shell("rundll32.exe shell32.dll,OpenAs_RunDLL " & "C:\Program Files\MKM\AtkTest02\AtkTest02.ini", vbNormalFocus)

   If Ret > 0 Then
   Else
   NGflag = 1
   Exit Sub
   End If
    Do
        DoEvents
        Sleep 100
        DoCount = DoCount + 1
                Hhwnd = FindWindow(vbNullString, "Advanced Toolkit Configuration   Version: 1.61 for Sony Reader")
                If Hhwnd = 0 Then
                Hhwnd = FindWindow(vbNullString, "Advanced Toolkit Configuration   Version: 1.61 for Sony Reader")
                End If
    Loop Until Hhwnd <> 0 Or DoCount > 10
    If DoCount > 10 Then
        MsgBox "Advanced Toolkit OPEN  ERROR"
        Exit Sub
    End If
                    'go button
                    Next_pub = 0
                    Go_pub = 0
                    Program_pub = 0
                        FlashMMC_pub = 0
                        Flash_Tool_pub = 0
                        ProgramSe_pub = 0
                        Browse_pub = 0
                        WriteResult_pub = 0
                    EnumChildWindows Hhwnd, AddressOf EnumChildProcmemwrite, ByVal 0&
            SendMessageTimeout Next_pub, BM_CLICK, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
              '检测烧录状态 flash tool select
              Sleep (20)
                     Next_pub = 0
                    Go_pub = 0
                    Program_pub = 0
                        FlashMMC_pub = 0
                        Flash_Tool_pub = 0
                        ProgramSe_pub = 0
                        Browse_pub = 0
                        WriteResult_pub = 0
                Hhwnd = FindWindow(vbNullString, "Select Advanced toolkits")
                
                EnumChildWindows Hhwnd, AddressOf EnumChildProcmemwrite, ByVal 0&
                SendMessageTimeout Flash_Tool_pub, BM_CLICK, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
                SendMessageTimeout Go_pub, BM_CLICK, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
                'program SET
                    Sleep (200)
                    Next_pub = 0
                    Go_pub = 0
                    Program_pub = 0
                    Program2_pub = 0
                        FlashMMC_pub = 0
                        Flash_Tool_pub = 0
                        ProgramSe_pub = 0
                        Browse_pub = 0
                        WriteResult_pub = 0
                        Ox_pub = 0
                        Oy_pub = 0
                Hhwnd = FindWindow(vbNullString, "Advanced Toolkit (Flash Tool) for Sony Reader")
                EnumChildWindows Hhwnd, AddressOf EnumChildProcmemwrite, ByVal 0&
                SendMessageTimeout Flash_Tool_pub, BM_CLICK, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
                SendMessageTimeout Program_pub, BM_CLICK, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
                Ret = SendMessage(FlashMMC_pub, &H14D, 0&, "MMC")
                LOGstring = "C:\Documents and Settings\Admin\桌面\IMX31EBX_nb_iplmemchk_DDR_1GX1.bin"
                MsgRet = SendMessage(Browse_pub, WM_SETTEXT, 255, LOGstring)
                LOGstring = "00000000"
                MsgRet = SendMessage(Ox_pub, WM_SETTEXT, 255, LOGstring)
                LOGstring = "unknown"
                MsgRet = SendMessage(Oy_pub, WM_SETTEXT, 255, LOGstring)
                'PROGRAM list
                    Sleep (20)
                     Next_pub = 0
                    Go_pub = 0
                    Program_pub = 0
                    Program2_pub = 0
                        FlashMMC_pub = 0
                        Flash_Tool_pub = 0
                        ProgramSe_pub = 0
                        Browse_pub = 0
                        WriteResult_pub = 0
                        Ox_pub = 0
                        Oy_pub = 0
                EnumChildWindows Hhwnd, AddressOf EnumChildProcmemwrite, ByVal 0&
                'program run
                SendMessageTimeout Program2_pub, BM_CLICK, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
                
                   Xx_PRI = GetTickCount
                Do
                DoEvents
                Sleep (20) '
                LOGstring = ""
                LOGstring = Space$(255)
                MsgRet = SendMessage(WriteResult_pub, WM_GETTEXT, 255, LOGstring)
                Yy_pri = GetTickCount - Xx_PRI
                Loop Until InStr(1, LOGstring, "Flash program successful!", vbTextCompare) > 0 Or Yy_pri > 16000
          

'OKNG DISPLAY
If InStr(1, LOGstring, "Flash program successful!", vbTextCompare) <= 0 Then
        NGflag = 1
        mem_write_Command.BackColor = vbRed
        DISPLAYokng.Font.Size = 88
        QinBao.Text = DISPLAYokng.Text
        DISPLAYokng.Text = "NG"
        DISPLAYokng.BackColor = vbRed
Else
        mem_write_Command.BackColor = vbGreen
        Sleep (500)
End If

'关闭窗口 CLOSE WINDOW
            If CheckApplicationIsRun("ADSToolkit_std.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im ADSToolkit_std.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            If CheckApplicationIsRun("ADSToolkit_std.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im ADSToolkit_std.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
End Sub


Private Sub MSComm1_OnComm2()
On Error Resume Next
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
MSComm1.InputLen = InBufferCount
Ret = MSComm1.Input
For i = 0 To Count
DISPLAYokng.Text = DISPLAYokng.Text & Bar_Input(i)
Bar_Code = Bar_Code & Bar_Input(i)
Next i
'MsgBox Asc(Left(Str(Trim(Bar_Code)), 1))
'Bar_Code = Replace(Str(Trim(Bar_Code)), Chr(13), "")
'Bar_Code = Replace(Str(Trim(Bar_Code)), Chr(10), "")
'Bar_Code = Replace(Str(Trim(Bar_Code)), " ", "")
'Bar_Code = Replace(Str(Trim(Bar_Code)), Left(Str(Trim(Bar_Code)), 1), "")
'If Trim(Bar_Code) <> "" Then
'DISPLAYokng.Text = DISPLAYokng.Text & Str(Trim(Bar_Code))
DISPLAYokng.SelStart = Len(DISPLAYokng.Text)
'End If
End Sub





Private Sub pioCommand_Click()
PrintForm1.Show
End Sub

Private Sub Datasave_Click()
If Save = 1 Then
Save = 0
Datasave.Caption = "DATA"
Datasave.BackColor = &H8000000F
Else
Save = 1
Datasave.Caption = "保存"
Datasave.BackColor = &H80FF&
End If
End Sub


Private Sub QinBao_DblClick()
DISPLAYokng.ZOrder 0
End Sub

Private Sub Timer1_Timer() '治具开关读取
Timer1.Enabled = False
   If (IOread And 4) = 4 And (IOread And 8) <> 8 Then
   SetIn = 0
   End If
   If (IOread And 4) <> 4 And (IOread And 8) = 8 Then
   SetIn = 1
   End If
Select Case SetIn
Case 0
    If (IOread And 1) = 1 Then
            SetIn = 1
        EBX5032Run_Click
        If NGflag = 0 And Control_Command.Caption <> "停止" Then '进入到位后开始测试
            TestTime(0) = GetTickCount()
            Call mem_write_Command_Click
            If NGflag = 1 Then mem_write_Command_Click
            If NGflag = 0 Then
            Call mem_check_Command_Click
            If NGflag = 1 Then mem_check_Command_Click
            If NGflag = 0 Then Call Atk_Command_Click           '测试
            End If
             OKNGdisplay
            TestTime(1) = GetTickCount()
            If Manal = 0 Then
                timeText.Text = TestTime(1) - TestTime(0)
                timeText.Text = timeText.Text & "ms"
            Else
                timeText.Text = "0"
            End If
        End If
    End If
Case 1
    If (IOread And 2) = 2 Then
        EBX5032Out_Click
        SetIn = 0
    End If
End Select
Timer1.Enabled = True
End Sub
''*************************************************************************************************
''
''MAIN TEST
''*************************************************************************************************
Public Sub MainTEST()

Dim Hhwnd2 As Long
Start1:
    DISPLAYini
    IOini
    For Stepitme = 1 To Stepmax
        Ngnum = 0
    Select Case Stepitme
    Case 1
        NgtestTotal = 0
    Case 12
        NgtestTotal = 4
    Case Else
        NgtestTotal = 2
    End Select
        If (IOread And 4) = 4 Then ' '测试过程中RESET,
            NGflag = 1
            Exit For
        End If

        ''--------------------------------------------------------------------'step特殊设定
If Stepitme = 1 Then ACinonoff (1)
NGres:
        ''---------------------------------------------------------------------条件设定前
        
        Conditionsetting '条件设定
        Measure          '测量判定
        If Stepitme = 1 And NGflag = 0 Then
        Call Write5016
        Sleep (20)
        Hhwnd2 = FindWindow(vbNullString, "EBX-5016 - Flash Development Toolkit   (Unsupported Freeware Version)") 'Wait For Script
        If Hhwnd2 <> 0 Then
                Sleep (2000)
                Hhwnd2 = FindWindow(vbNullString, "EBX-5016 - Flash Development Toolkit   (Unsupported Freeware Version)") 'Wait For Script
                If Hhwnd2 <> 0 Then NGflag = 1
        End If
'            If CheckApplicationIsRun("fdt.exe") = True Then 'Explorer.exe为你要结束的进程名字
'            Sleep (2000)
'            If CheckApplicationIsRun("fdt.exe") = True Then 'Explorer.exe为你要结束的进程名字
'            Shell "taskkill /im fdt.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
''            NGflag = 1
'            Sleep (20)
'            End If
'            End If
            If CheckApplicationIsRun("fdt.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im fdt.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
'            NGflag = 1
            Sleep (20)
            End If
        End If
        '----------------------------------------------------------------------测量判定后
If NGflag = 1 And Ngnum <= NgtestTotal Then
    If Stepitme = 1 Then
            If CheckApplicationIsRun("fdt.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im fdt.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            If CheckApplicationIsRun("fdt.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im fdt.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
    End If
        If Ngnum = 3 And Stepitme = 12 Then
        Call IOwrite(1, 0)
        Call IOwrite(2, 0)
        Sleep (300)
        End If
Ngnum = Ngnum + 1
NGflag = 0
GoTo NGres
End If
        '第一,二步NG重测试
        If NGflag = 1 And (Stepitme = 2 Or Stepitme = 1) And Retest1 < 1 Then
        Retest1 = 1 + Retest1
'        NGflag = 0
'        GoTo Start1
        Exit For
        End If
    '------------------------------------------------------------------------------------------
'    TESTdisplay

  '---------------------------------------------------------------------------------------------
 If NGflag = 1 And Manal = 0 Then Exit For
 If Manal = 1 Then Call Sswpress
Next Stepitme

OKNGdisplay
BZon
ACinonoff (0) '关闭电源
End Sub
Public Sub Write5016()
Dim Ret As Long
Dim Hhwnd2 As Long
Dim DoCount As Integer
Hhwnd2 = FindWindow(vbNullString, "EBX-5016 - Flash Development Toolkit   (Unsupported Freeware Version)") 'Wait For Script
If Hhwnd2 <> 0 Then
Ret = SendMessage(Hhwnd2, WM_CLOSE, 0&, ByVal 0&)
Sleep (200)
    If Ret <> 0 Then
    Ret = SendMessage(Hhwnd2, WM_CLOSE, 0&, ByVal 0&)
    Sleep (200)
    End If
    If Ret <> 0 Then
    NGflag = 1
    Exit Sub
    End If
End If
Hhwnd2 = 0
Ret = 0
            Hhwnd = ShellExecute(0&, "open", "C:\work\subcpu\script\EBX-5016_script_config_file.w4f", 0&, 0&, 3)
'Ret = Shell("C:\work\subcpu\script\EBX-5016_script_config_file.w4f", 3)
'    Do
'        DoEvents
'        Sleep 100
'        DoCount = DoCount + 1
'        Hhwnd2 = FindWindow(vbNullString, "EBX-5016 - Flash Development Toolkit   (Unsupported Freeware Version)") 'Wait For Script
'    Loop Until Hhwnd2 <> 0 Or DoCount > 10
    If Hhwnd = 0 Then
    NGflag = 1
    Else
    Xx = GetTickCount()
    Do
    Sleep (20)
    DoEvents
    Hhwnd2 = FindWindow(vbNullString, "Select USB Device")
        Loop Until GetTickCount() - Xx > 5000 Or Hhwnd2 <> 0
    End If
    
    If Hhwnd2 <> 0 Then
    EnumChildWindows Hhwnd2, AddressOf EnumChildProc, ByVal 0&
    If Ok_pub <> 0 Then
     Ret = ShowWindow(Hhwnd, 3)
    MsgRet = SendMessage(Ok_pub, BM_CLICK, 0&, ByVal 0&)  'BM_CLICK
    End If
    End If
    
    
        If Hhwnd = 0 Then
    NGflag = 1
    Else
    Xx = GetTickCount()
    Do
'    Hhwnd2 = FindWindow(vbNullString, "Flash Development Toolkit") 'Wait For Script
'    If Hhwnd2 <> 0 Then
'    Ret = SendMessage(Hhwnd2, WM_CLOSE, 0&, ByVal 0&)
'    Sleep (20)
'    End If
    Sleep (20)
    DoEvents
    Hhwnd2 = FindWindow(vbNullString, "Select USB Device")
        If Hhwnd2 <> 0 Then
    EnumChildWindows Hhwnd2, AddressOf EnumChildProc, ByVal 0&
    If Ok_pub <> 0 Then
     Ret = ShowWindow(Hhwnd, 3)
    MsgRet = SendMessage(Ok_pub, BM_CLICK, 0&, ByVal 0&)  'BM_CLICK
    End If
    End If
        Hhwnd2 = FindWindow(vbNullString, "EBX-5016 - Flash Development Toolkit   (Unsupported Freeware Version)") 'Wait For Script
        If Hhwnd2 <= 0 Then
        Sleep (20)
         Hhwnd2 = FindWindow(vbNullString, "EBX-5016 - Flash Development Toolkit   (Unsupported Freeware Version)") 'Wait For Script
        If Hhwnd2 <= 0 Then
        Exit Do
        End If
        End If
        Loop Until GetTickCount() - Xx > 26000
    End If
End Sub
Public Sub Conditionsetting() 'step 条件设定
'    Eloadset'负荷设定
'    Avrset'电源设定
    SWset
Select Case Stepitme 'STEP8机板电源ON

Case 12

End Select
    DISPLAYset1


    Wtime '条件设定后等待时间
    DISPLAYset2
 
'If Stepitme = 12 Then
'     ShowWindow Hhwnd, 3
'    Me.WindowState = 1
'    Wtime '条件设定后等待时间
'      SendMSG ("RUN_click")   'FPGA_write
'      Writer_mea
'       Me.WindowState = 2
'       Me.SetFocus
'    ShowWindow Hhwnd, 2
'      End If

End Sub
Public Sub Wtime()
    Dim ii As Long
    Dim jj As Long
    Dim InstrRet As Long
    WAITBar.value = 0
    WAITBar.Max = Val(SETTINGdata(Stepitme, 21)) + 1 '时间设定0
    ii = GetTickCount()
    '条件设定WAITTIME
    Do Until (jj - ii) >= Val(SETTINGdata(Stepitme, 21))
        jj = GetTickCount()
        DoEvents  '等待期间其他事件响应ON/OFF
        
        
     If (jj - ii) > WAITBar.Max Then Exit Do
        WAITBar.value = (jj - ii)
    Loop
End Sub

Public Sub Measure() '测试
''''------------------------------------------------------------------------------------
    For Po = 1 To POmax
        If NGflag = 1 And Manal = 0 Then Exit For

        'If Val(CHLOText(Po)) + Val(CHHIText(Po)) <> 0 Then'上下限赋值
        If (Val(SETTINGdata(Stepitme, 20 + Po * 2)) <> 0) Or (Val(SETTINGdata(Stepitme, 21 + Po * 2)) <> 0) Then
            Select Case Po
                Case 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15, 16  '电压测量
                    Vmea
                    Judgex
                Case 1
                    Amea
                    Judgex
'                Case 15
'                   Xmea
'                   Judgex
            End Select
            
        End If
    Next Po
End Sub
Public Sub Xmea()
     meavalue(Stepitme, Po) = meavalue(Stepitme, 10) + meavalue(Stepitme, 11)
     CHMeaText(Po) = Format(meavalue(Stepitme, Po), "#0.00")
End Sub



'''''电压测试
Public Sub Vmea()
    Dim MULTrang As String
 
    Select Case Po
    
    Case 2, 3, 4, 5, 6, 7, 8, 9, 12, 14, 15, 16
        MULTrang = "F1,R5,PR2"
       
    Case 10, 11
        MULTrang = "F1,R6,PR2"
   
    End Select
    
    Call GPIBwr(R64Adr, MULTrang)
    
    Call Relaymap(Po)
'    Sleep (50)
    Call GPIBwr(R64Adr, "E")
     meavalue(Stepitme, Po) = GPread(R64Adr)
     CHMeaText(Po) = Format(meavalue(Stepitme, Po), "#0.00")
End Sub
'''''电流测试
Public Sub Amea()
Dim MULTrang As String
Select Case Stepitme
  Case 3, 5, 9
    MULTrang = "F1,R3,PR2"
    
  Case 6, 10
    MULTrang = "F1,R2,PR2"
    
    End Select
   Call GPIBwr(R64Adr, MULTrang)
    Call Relaymap(Po)
'    Sleep 100
    Call GPIBwr(R64Adr, "E")
     meavalue(Stepitme, Po) = GPread(R64Adr)
     meavalue(Stepitme, Po) = meavalue(Stepitme, Po) * 10.2
    CHMeaText(Po) = Format(meavalue(Stepitme, Po), "#0.00")
End Sub

Public Sub Judgex() ''规格判定
    Dim Lo As String
    Dim Hi As String
    'Lo = Val(SETTINGdata(Stepitme, 21 + Po))'上下限赋值
    'Hi = Val(SETTINGdata(Stepitme, 22 + Po))
    Lo = Format(CHLOText(Po), "#.##")
    Hi = Format(CHHIText(Po), "#.##")
    meavalue(Stepitme, Po) = Val(Format(meavalue(Stepitme, Po), "#.##"))
    If Val(meavalue(Stepitme, Po)) >= Val(Lo) And Val(meavalue(Stepitme, Po)) <= Val(Hi) Then
        CHMeaText(Po).BackColor = &HFF00&
    Else
        If Ngnum <= NgtestTotal Then
        CHMeaText(Po).BackColor = vbYellow
        Else
        CHMeaText(Po).BackColor = vbRed
        End If
        NGflag = 1
    End If
End Sub

Public Sub OKNGdisplay() '结果显示
If NGflag = 1 Then
    NGflag = 1
    DISPLAYokng.Font.Size = 88
    QinBao.Text = DISPLAYokng.Text
    DISPLAYokng.Text = "NG"
    NGText.Text = NGText.Text + 1
    DISPLAYokng.BackColor = vbRed
    Call BZon
Else
    DISPLAYokng.Font.Size = 88
    QinBao.Text = DISPLAYokng.Text
    DISPLAYokng.Text = "OK"
    DISPLAYokng.BackColor = vbGreen
    DISPLAYokng.ForeColor = vbYellow
    EBX5032Out_Click
    OKText.Text = OKText.Text + 1
    SetIn = 0
    Call IOwrite(2, 16)
End If
End Sub

Public Sub Avrset() '安定化电源设定机sw设定


End Sub

Public Sub ACinonoff(ByVal NO As String) 'ACONOFF继电器
Dim Xx_PRI As Long
    Select Case NO
        Case "1"
            '开机
            Call IOwrite(2, 8) 'SHORT
            Sleep (500)
            Call IOwrite(2, 9) 'POWER ON
            Sleep (2000)
            Call IOwrite(2, 13) 'RESET
            Sleep (1000)
            Call IOwrite(2, 9) 'POWER ON
            Sleep (1000)
            Call IOwrite(2, 11) 'OPEN
            Sleep (1000)
            Call IOwrite(2, 9) 'POWER ON
            Xx_PRI = GetTickCount
            Do
            DoEvents
            Sleep (20)
            Loop Until GetTickCount - Xx_PRI > 3000 ' WAIT
        Case "0"
            '关电
            Call IOwrite(2, 0)
        Case "memwrite"
                        '开机
            Call IOwrite(2, 0)
            Sleep (500)
            Call IOwrite(2, 8) 'usb
            Sleep (500)
            Call IOwrite(2, 9) 'POWER ON
            Sleep (500)
            Call IOwrite(2, 13) 'RESET
            Sleep (500)
            Call IOwrite(2, 9) 'POWER ON
            Sleep (500)
            Call IOwrite(2, 11) 'OPEN
            Sleep (1000)
            Call IOwrite(2, 9) 'POWER ON
            Xx_PRI = GetTickCount
            Do
            DoEvents
            Sleep (20)
            Loop Until GetTickCount - Xx_PRI > 3000 ' WAIT
        Case "memcheck"
                        '开机
            Call IOwrite(2, 0) '232
            Sleep (800)
            Call IOwrite(2, 1) 'POWER ON
            Sleep (800)
            Call IOwrite(2, 5) 'RESET
            Sleep (800)
            Call IOwrite(2, 1) 'POWER ON
            Sleep (800)
            Call IOwrite(2, 3) 'OPEN
            Sleep (1000)
            Call IOwrite(2, 1) 'POWER ON
            Xx_PRI = GetTickCount
            Do
            DoEvents
            Sleep (20)
            Loop Until GetTickCount - Xx_PRI > 3000 ' WAIT
    End Select
End Sub

Public Sub SWset()  'SW 开关设定
    Dim i As Integer
    For i = 1 To 8
        'SETTINGdata(Stepitme, 9)=SWSETText(1)=SW1
        If SETTINGdata(Stepitme, 8 + i) = "0" Then SWdata(i) = 0 Else SWdata(i) = 2 ^ (i - 1)
    Next i
    For i = 9 To 12    'sw 9－16设定，可变更
        If SETTINGdata(Stepitme, 8 + i) = "0" Then SWdata(i) = 0 Else SWdata(i) = 2 ^ (i - 9)
    Next i
    SWdata(0) = SWdata(1) Or SWdata(2) Or SWdata(3) Or SWdata(4) Or SWdata(5) Or SWdata(6) Or SWdata(7) Or SWdata(8)
    SWdata(17) = SWdata(9) Or SWdata(10) Or SWdata(11) Or SWdata(12)
'***********************************************************************
'If Stepitme = 5 Then '关闭全部电压输入开关，等待0.5~1秒。防止异常开机对策
'Call IOwrite(1, 0) 'SWdata(0) Or &HFC)
'Sleep (500)
'End If
'************************************************************************
    Call IOwrite(1, SWdata(0))
    Call IOwrite(2, SWdata(17))
End Sub

Public Sub Eloadset()    '电子负荷值设定

End Sub



Public Sub TESTdisplay() '提示显示
    Select Case Stepitme
'        Case 3
'            DISPLAYokng.Font.Size = 80
'            DISPLAYokng.Text = "波形确认"
'            DISPLAYokng.ForeColor = &HFFFF&
'
'            Sswpress
'            DISPLAYokng.Text = ""
'            DISPLAYokng.BackColor = &H8000000F
        Case 1
'        FPFAWRITE_Load
        Case 12
DISPLAYokng.Font.Size = 40
            DISPLAYokng.Text = "请按制品RESET"

'  Shape2.Visible = True

            Sswpress
            DISPLAYokng.Text = ""
            DISPLAYokng.BackColor = &H8000000F

    End Select
End Sub

Public Sub DISPLAYini() '显示画面清除
    Dim i As Integer
'    Label1(0).Caption = "5021VCHECK"
    STEPNOText.Text = 0
    ITMEText.Text = "按下START,测试开始"
    ACINText.Text = "OFF"
    LOADMODEText(1) = "OFF"
    LOADVALEText(1) = "OFF"
    LOADCABText(1) = "OFF"
    LOADMODEText(2) = "OFF"
    LOADVALEText(2) = "OFF"
    LOADCABText(2) = "OFF"
    For i = 1 To 12
        SWSETText(i) = 0
    Next i
    
    For i = 1 To 16
        CHMeaText(i) = ""
        CHLOText(i) = ""
        CHHIText(i) = ""
    Next i
    WAITText = 1000
    Retest1 = 0
    DISPLAYokng.BackColor = &H0&
    DISPLAYokng.ForeColor = &HFFFFFF
     DISPLAYokng.Text = ""
    SendMSG ("setlog")
End Sub

Public Sub DISPLAYset() '每步条件规格显示画面
    Dim i As Integer
    STEPNOText.Text = Stepitme
    ITMEText.Text = SETTINGdata(Stepitme, 1)
    ACINText.Text = SETTINGdata(Stepitme, 2)
    LOADMODEText(1) = SETTINGdata(Stepitme, 3)
    LOADVALEText(1) = SETTINGdata(Stepitme, 4)
    LOADCABText(1) = SETTINGdata(Stepitme, 5)
    LOADMODEText(2) = SETTINGdata(Stepitme, 6)
    LOADVALEText(2) = SETTINGdata(Stepitme, 7)
    LOADCABText(2) = SETTINGdata(Stepitme, 8)
    For i = 1 To 12
        SWSETText(i) = SETTINGdata(Stepitme, 8 + i)
    Next i
    WAITText = SETTINGdata(Stepitme, 21)
    '******************************************条件
    For i = 1 To POmax

        CHLOText(i) = SETTINGdata(Stepitme, 20 + i * 2)

        CHHIText(i) = SETTINGdata(Stepitme, 21 + i * 2)
        CHMeaText(i).BackColor = &HFFFFFF
        CHMeaText(i).Text = ""

    Next i
End Sub
Private Sub autoCommand_Click() '自动手动切换
    If autoCommand.Caption = "自动" Then
        autoCommand.Caption = "手动"
        Manal = 1
    Else
        autoCommand.Caption = "自动"
        Manal = 0
    End If
End Sub

Private Sub exitCommand_Click() '退出程序
    Hhwnd = FindWindow(vbNullString, "AtkTest02 - [AtkLog1]")
    If Hhwnd > 0 Then
            If CheckApplicationIsRun("AtkTest02.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im AtkTest02.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            If CheckApplicationIsRun("AtkTest02.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im AtkTest02.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
    End If
    
    Unload Me

End Sub

Public Sub LOADcondition() '条件规格数据读入参考条件数据list

    Open App.Path & "\条件规格V10.csv" For Input As #1 '数据load
    For j = 0 To Stepmax
        For i = 0 To 54
            Input #1, SETTINGdata(j, i)
        Next i
    Next j
    Close #1
End Sub



Public Sub GPibini() 'GPIB初始化
'    'R6451ADRESS
'    R64Adr = ildev(0, 3, 0, T10s, 1, 0)
'    If (ibsta And EERR) Then
'        ErrMsg = "Unable to open device" & Chr(13) & "ibsta = &H" & _
'                Chr(13) & Hex(ibsta) & "iberr = " & iberr
'        MsgBox ErrMsg, vbCritical, "Error"
'        End
'    End If
'    ilclr R64Adr
'    If (ibsta And EERR) Then
'        Call GPIBCleanup("Unable to clear device")
'    End If
End Sub
Public Sub Closedevice()
   PIODIO_DriverClose
''   ilonl R64Adr, 0
End Sub
Public Sub SokuteikiInt()

    '万用表R6451
    A$ = "Z,F1,R5,PR2"
    Call GPIBwr(R64Adr, A$)
    A$ = "H0" '
    Call GPIBwr(R64Adr, A$)
    A$ = "M1" '
    Call GPIBwr(R64Adr, A$)
End Sub
Public Sub Sswpress()
    Do
        IOin = IOread
        IOin = IOin And 3
        DoEvents  '循环等待期间其他事件响应ON/OFF
    Loop Until IOin > 0
    Do
        IOin = IOread
        IOin = IOin And 3
        DoEvents
    Loop Until IOin = 3
End Sub

Public Sub BZon()
    If NGflag = 0 Then
    Else
    Do
        Call IOwrite(2, &H20) 'BZ ON
        Sleep 100
        Call IOwrite(2, 0)
        Sleep 100
        IOin = IOread And 2
        DoEvents  '循环等待期间其他事件响应ON/OFF
    Loop Until IOin = 2
    NGflag = 0
    End If
        EBX5032Out_Click
        SetIn = 0
End Sub

Private Sub UpDown1_Change() '测试结果确认

    Dim i As Integer
    Stepitme = UpDown1.value
    STEPNOText.Text = Stepitme
    ITMEText.Text = SETTINGdata(Stepitme, 1)
    ACINText.Text = SETTINGdata(Stepitme, 2)
    LOADMODEText(1) = SETTINGdata(Stepitme, 3)
    LOADVALEText(1) = SETTINGdata(Stepitme, 4)
    LOADCABText(1) = SETTINGdata(Stepitme, 5)
    LOADMODEText(2) = SETTINGdata(Stepitme, 6)
    LOADVALEText(2) = SETTINGdata(Stepitme, 7)
    LOADCABText(2) = SETTINGdata(Stepitme, 8)
    For i = 1 To 12
        SWSETText(i) = SETTINGdata(Stepitme, 8 + i)
    Next i
    WAITText = SETTINGdata(Stepitme, 21)
    '******************************************条件
    For i = 1 To POmax
        CHLOText(i) = SETTINGdata(Stepitme, 20 + i * 2)

        CHHIText(i) = SETTINGdata(Stepitme, 21 + i * 2)
        If Val(SETTINGdata(Stepitme, 20 + i * 2)) + Val(SETTINGdata(Stepitme, 21 + i * 2)) = 0 Then
            CHMeaText(i).BackColor = &HFFFFFF
            CHMeaText(i).Text = ""
        Else
            If meavalue(Stepitme, i) < Val(CHLOText(i)) Or meavalue(Stepitme, i) > Val(CHHIText(i)) Then
                CHMeaText(i).BackColor = &HFF
                If i >= 10 Then
                    CHMeaText(i).Text = Format(meavalue(Stepitme, i), "#0.0")
                Else
                    CHMeaText(i).Text = Format(meavalue(Stepitme, i), "#0.000")
                End If

            Else
                CHMeaText(i).BackColor = &HFF00&

                If i >= 10 Then
                    CHMeaText(i).Text = Format(meavalue(Stepitme, i), "#0.0")
                Else
                    CHMeaText(i).Text = Format(meavalue(Stepitme, i), "#0.000")
                End If
            End If
        End If
    Next i
End Sub
Public Sub DISPLAYset1() '每步条件规格显示画面
    Dim i As Integer
    STEPNOText.Text = Stepitme
    ITMEText.Text = SETTINGdata(Stepitme, 1)
    ACINText.Text = SETTINGdata(Stepitme, 2)
    LOADMODEText(1) = SETTINGdata(Stepitme, 3)
    LOADVALEText(1) = SETTINGdata(Stepitme, 4)
    LOADCABText(1) = SETTINGdata(Stepitme, 5)
    LOADMODEText(2) = SETTINGdata(Stepitme, 6)
    LOADVALEText(2) = SETTINGdata(Stepitme, 7)
    LOADCABText(2) = SETTINGdata(Stepitme, 8)
    For i = 1 To 12
        SWSETText(i) = SETTINGdata(Stepitme, 8 + i)
    Next i
    WAITText = SETTINGdata(Stepitme, 21)

End Sub
Public Sub DISPLAYset2() '每步条件规格显示画面
    Dim i As Integer
    For i = 1 To POmax
        CHLOText(i) = SETTINGdata(Stepitme, 20 + i * 2)
        CHHIText(i) = SETTINGdata(Stepitme, 21 + i * 2)
        CHMeaText(i).BackColor = &HFFFFFF
        CHMeaText(i).Text = ""
    Next i
End Sub

'''****************************************************************************FPGA
Private Sub FPFAWRITE_Load()
'    Dim Ret As Long
'    Dim DoCount As Long
'
'    Ret = ShellExecute(0&, "open", "C:\work\subcpu\script\EBX-5016_script_config_file.w4f", 0&, 0&, 0)
'    Do
'        DoEvents
'        Sleep 1000
'        DoCount = DoCount + 1
'        Hhwnd = FindWindow(vbNullString, "EBX-5016-Flash Development Toolkit")
'    Loop Until Hhwnd <> 0 Or DoCount > 30
'    If DoCount > 30 Then
'        MsgBox "FPGA OPEN FILE ERROR"
'        Unload Me
'    End If
'    ShowWindow Hhwnd, 2
'    Me.Visible = True
'    Me.SetFocus
'    EnumChildWindows Hhwnd, AddressOf EnumChildProc, ByVal 0&
'    'T1 = R_TEXTHanld
'    'T2 = BottonHANLD
'   DISPLAYokng.BackColor = &H0
'   DISPLAYokng.Font.Size = 12
'   DISPLAYokng.ForeColor = &HFFFFFF

'    SendMSG ("getlog")
'
'    DISPLAYokng.Text = Trim$(LOGstring)
    
End Sub


Private Sub SendMSG(Msgdata As String)

Dim MsgRet

Select Case Msgdata

Case "setlog"
LOGstring = "REDEY START"
MsgRet = SendMessage(ATK_ResultText, WM_SETTEXT, 255, LOGstring)

Case "getlog"
LOGstring = Space$(24884)
MsgRet = SendMessage(ATK_ResultText, WM_GETTEXT, 24884, LOGstring)

Case "Closewindow"
MsgRet = SendMessage(Hhwnd, WM_CLOSE, 0, 0)

Case "RUN_click"
 MsgRet = SendMessage(BottonHANLD, BM_CLICK, 0&, ByVal 0&)  'BM_CLICK
End Select


End Sub

Private Sub Writer_mea()

            SendMSG ("getlog")
            DISPLAYokng.Text = Right$(Trim(LOGstring), 190)
            InstrRet = InStr(1, LOGstring, "Error", vbTextCompare)
            If InstrRet > 0 Then
                NGflag = 1
             
            End If
            InstrRet = InStr(1, LOGstring, "PROGRAM PASSED", vbTextCompare)
            If InstrRet > 0 Then Exit Sub
          
         NGflag = 1
End Sub
'Public Sub Rs232TX(OUTString As String)
'OUTString = Trim(OUTString)
'MSComm1.Output = OUTString & Chr$(13)
'End Sub
Public Sub Rs232TX2(OUTString As String)
Dim Ret As Long
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
Public Function Rs232RX()
Dim INString As String
BUFFER$ = MSComm1.Input
Rs232RX = BUFFER$
End Function
Public Sub GPIBwr(adrrs As Integer, cmd As String)
Dim RETstring As String
MSComm1.RTSEnable = True
Sleep (10)
Call Rs232TX2(cmd)
Sleep (20)
MSComm1.DTREnable = True
Sleep (10)
MSComm1.DTREnable = False
'Sleep (10)
RETstring = Rs232RX
'If InStr(1, RETstring, "=>") > 0 Then
'Else
'Stop
'End If
End Sub
Public Function GPread(adr)
Dim RETstring As String
MSComm1.RTSEnable = True
Sleep (10)
Call Rs232TX2("MD?")
Sleep (20)
MSComm1.DTREnable = True
Sleep (10)
MSComm1.DTREnable = False
'Sleep (10)
GPread = Val(Rs232RX)
End Function
'Public Sub GPIBwr(adrrs As Integer, cmd As String)
' Dim Rrr
'    ilwrt adrrs, cmd, Len(cmd)
'    If (ibsta And EERR) Then
'
'     If adrrs = R64Adr Then Rrr = MsgBox("万用表写入失败")
'     Unload Me
'     End
'    End If
'
'End Sub
'Public Function GPread(adr)
'    Dim ValueStr As String * 32
'    Dim RecvLen As Long
'    ' Receives data from a specified device.
'    ilrd adr, ValueStr, Len(ValueStr)
'    If (ibsta And EERR) Then
'        Call GPIBCleanup("Unable to read from device")
'    End If
'    GPread = Val(ValueStr)
'End Function
