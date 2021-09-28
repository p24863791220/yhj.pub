VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form EBX5009_1 
   Caption         =   "PRS-650 SheJian PROGRAM"
   ClientHeight    =   8340
   ClientLeft      =   60
   ClientTop       =   240
   ClientWidth     =   11880
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   556
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   792
   StartUpPosition =   2  '屏幕中心
   WindowState     =   2  'Maximized
   Begin VB.TextBox TipText 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1065
      Locked          =   -1  'True
      TabIndex        =   526
      Text            =   "Tips"
      Top             =   6780
      Width           =   10575
   End
   Begin VB.CommandButton TotalCommand 
      Caption         =   "TotalResult"
      Height          =   390
      Left            =   5430
      TabIndex        =   525
      TabStop         =   0   'False
      Top             =   7965
      Width           =   1140
   End
   Begin VB.TextBox Hi 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   0
      Left            =   8070
      Locked          =   -1  'True
      MaxLength       =   6
      TabIndex        =   460
      Text            =   "Hi"
      Top             =   330
      Width           =   600
   End
   Begin VB.TextBox Po 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   0
      Left            =   7785
      Locked          =   -1  'True
      TabIndex        =   458
      Text            =   "PO"
      Top             =   330
      Width           =   300
   End
   Begin VB.TextBox Wtime 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   0
      Left            =   6930
      Locked          =   -1  'True
      TabIndex        =   457
      Text            =   "WAIT"
      Top             =   330
      Width           =   850
   End
   Begin VB.TextBox INFdisplay 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   855
      Left            =   2355
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   96
      Top             =   7095
      Width           =   9285
   End
   Begin VB.TextBox NG_Text 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   360
      Left            =   5640
      Locked          =   -1  'True
      TabIndex        =   490
      Text            =   "NG QTY"
      Top             =   7965
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.TextBox OK_Text 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   360
      Left            =   4845
      Locked          =   -1  'True
      TabIndex        =   489
      Text            =   "OK QTY"
      Top             =   7965
      Visible         =   0   'False
      Width           =   570
   End
   Begin VB.TextBox Rs232send 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   0
      Left            =   4440
      Locked          =   -1  'True
      TabIndex        =   462
      Text            =   "RS232 Command"
      Top             =   330
      Width           =   2505
   End
   Begin VB.TextBox Low 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFC0&
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   0
      Left            =   8670
      Locked          =   -1  'True
      MaxLength       =   6
      TabIndex        =   461
      Text            =   "Low"
      Top             =   330
      Width           =   1485
   End
   Begin VB.TextBox Ry 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   0
      Left            =   6960
      Locked          =   -1  'True
      TabIndex        =   459
      Text            =   "RY"
      Top             =   330
      Visible         =   0   'False
      Width           =   850
   End
   Begin VB.TextBox AudioSet_text 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   0
      Left            =   2940
      Locked          =   -1  'True
      TabIndex        =   456
      Text            =   "AUDIO SET"
      Top             =   330
      Width           =   1500
   End
   Begin VB.TextBox Step_text 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Index           =   0
      Left            =   720
      Locked          =   -1  'True
      TabIndex        =   455
      Text            =   "STEP DESCRIPTION"
      Top             =   330
      Width           =   2200
   End
   Begin VB.Timer Timer1 
      Interval        =   20
      Left            =   15
      Top             =   0
   End
   Begin VB.CommandButton Page_command 
      Caption         =   "Page2"
      Height          =   375
      Index           =   1
      Left            =   8775
      Style           =   1  'Graphical
      TabIndex        =   209
      TabStop         =   0   'False
      Top             =   7965
      Width           =   720
   End
   Begin VB.CommandButton Page_command 
      Caption         =   "Page1"
      Height          =   375
      Index           =   0
      Left            =   7995
      Style           =   1  'Graphical
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   7965
      Width           =   690
   End
   Begin VB.CommandButton Command1 
      Caption         =   "AutoTest"
      Enabled         =   0   'False
      Height          =   375
      Left            =   330
      TabIndex        =   5
      Top             =   7965
      Width           =   1050
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit"
      Height          =   375
      Left            =   1425
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   7965
      Width           =   870
   End
   Begin VB.CommandButton Command3 
      Caption         =   "ConditionSave"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2340
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   7965
      Width           =   1305
   End
   Begin VB.CommandButton Command5 
      Caption         =   "EXIT"
      Height          =   375
      Left            =   10725
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   7965
      Width           =   930
   End
   Begin VB.CommandButton Command6 
      Caption         =   "TestDataSave"
      Height          =   375
      Left            =   6600
      Style           =   1  'Graphical
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   7965
      Width           =   1335
   End
   Begin VB.CommandButton IOCHECKER 
      Caption         =   "IOCHECKER"
      Enabled         =   0   'False
      Height          =   375
      Left            =   9555
      Style           =   1  'Graphical
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   7965
      Width           =   1095
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   735
      Top             =   -45
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   3
      DTREnable       =   -1  'True
      BaudRate        =   115200
   End
   Begin MSComctlLib.ProgressBar WaitMAX 
      Height          =   255
      Left            =   315
      TabIndex        =   95
      Top             =   6525
      Width           =   11325
      _ExtentX        =   19976
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.PictureBox Picture1 
      Height          =   5940
      Index           =   1
      Left            =   330
      ScaleHeight     =   5880
      ScaleWidth      =   11250
      TabIndex        =   221
      Top             =   585
      Width           =   11310
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   23
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   497
         Top             =   0
         Width           =   1470
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   23
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   496
         Top             =   0
         Width           =   600
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   23
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   495
         Top             =   0
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   23
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   494
         Top             =   0
         Width           =   300
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   24
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   481
         Top             =   270
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   24
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   480
         Top             =   270
         Width           =   850
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   24
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   478
         Top             =   270
         Width           =   1470
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   24
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   477
         Top             =   270
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   45
         Left            =   7770
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   429
         Top             =   6090
         Visible         =   0   'False
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   45
         Left            =   8370
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   428
         Top             =   6090
         Visible         =   0   'False
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   45
         Left            =   6630
         Locked          =   -1  'True
         TabIndex        =   426
         Top             =   6075
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   45
         Left            =   7485
         Locked          =   -1  'True
         TabIndex        =   425
         Top             =   6090
         Visible         =   0   'False
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   44
         Left            =   7770
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   419
         Top             =   5835
         Visible         =   0   'False
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   44
         Left            =   8370
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   418
         Top             =   5835
         Visible         =   0   'False
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   44
         Left            =   6615
         Locked          =   -1  'True
         TabIndex        =   416
         Top             =   5835
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   44
         Left            =   7485
         Locked          =   -1  'True
         TabIndex        =   415
         Top             =   5835
         Visible         =   0   'False
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   43
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   409
         Top             =   5520
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   43
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   408
         Top             =   5520
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   43
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   406
         Top             =   5520
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   43
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   405
         Top             =   5520
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   42
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   399
         Top             =   5250
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   42
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   398
         Top             =   5250
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   42
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   396
         Top             =   5250
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   42
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   395
         Top             =   5250
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   41
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   389
         Top             =   4965
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   41
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   388
         Top             =   4965
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   41
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   386
         Top             =   4965
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   41
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   385
         Top             =   4965
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   40
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   379
         Top             =   4680
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   40
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   378
         Top             =   4680
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   40
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   376
         Top             =   4680
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   40
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   375
         Top             =   4680
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   39
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   369
         Top             =   4395
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   39
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   368
         Top             =   4395
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   39
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   366
         Top             =   4395
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   39
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   365
         Top             =   4395
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   38
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   359
         Top             =   4110
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   38
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   358
         Top             =   4110
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   38
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   356
         Top             =   4110
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   38
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   355
         Top             =   4110
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   37
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   349
         Top             =   3825
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   37
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   348
         Top             =   3825
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   37
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   346
         Top             =   3825
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   37
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   345
         Top             =   3825
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   36
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   339
         Top             =   3540
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   36
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   338
         Top             =   3540
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   36
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   336
         Top             =   3540
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   36
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   335
         Top             =   3540
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   35
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   329
         Top             =   3240
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   35
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   328
         Top             =   3240
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   35
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   326
         Top             =   3240
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   35
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   325
         Top             =   3240
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   34
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   319
         Top             =   2955
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   34
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   318
         Top             =   2955
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   34
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   316
         Top             =   2955
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   34
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   315
         Top             =   2955
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   33
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   309
         Top             =   2670
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   33
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   308
         Top             =   2670
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   33
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   306
         Top             =   2670
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   33
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   305
         Top             =   2670
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   32
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   299
         Top             =   2400
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   32
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   298
         Top             =   2400
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   32
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   296
         Top             =   2400
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   32
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   295
         Top             =   2400
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   31
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   289
         Top             =   2130
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   31
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   288
         Top             =   2130
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   31
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   286
         Top             =   2130
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   31
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   285
         Top             =   2130
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   30
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   279
         Top             =   1860
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   30
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   278
         Top             =   1860
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   30
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   276
         Top             =   1860
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   30
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   275
         Top             =   1860
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   29
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   269
         Top             =   1590
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   29
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   268
         Top             =   1590
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   29
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   266
         Top             =   1590
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   29
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   265
         Top             =   1590
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   28
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   259
         Top             =   1320
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   28
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   258
         Top             =   1320
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   28
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   256
         Top             =   1320
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   28
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   255
         Top             =   1320
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   27
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   249
         Top             =   1050
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   27
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   248
         Top             =   1050
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   27
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   246
         Top             =   1050
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   27
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   245
         Top             =   1050
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   26
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   239
         Top             =   795
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   26
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   238
         Top             =   795
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   26
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   236
         Top             =   795
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   26
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   235
         Top             =   795
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   25
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   229
         Top             =   540
         Width           =   600
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   25
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   228
         Top             =   540
         Width           =   1470
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   25
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   226
         Top             =   540
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   25
         Left            =   7455
         Locked          =   -1  'True
         TabIndex        =   225
         Top             =   540
         Width           =   300
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   23
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   498
         Top             =   0
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   23
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   492
         Top             =   0
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   23
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   491
         Top             =   0
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   24
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   484
         Top             =   270
         Width           =   2200
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   24
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   483
         Top             =   270
         Width           =   1500
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   24
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   479
         Top             =   270
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   45
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   427
         Top             =   6090
         Visible         =   0   'False
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   45
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   423
         Top             =   6090
         Visible         =   0   'False
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   45
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   422
         Top             =   6090
         Visible         =   0   'False
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   44
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   417
         Top             =   5835
         Visible         =   0   'False
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   44
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   413
         Top             =   5835
         Visible         =   0   'False
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   44
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   412
         Top             =   5835
         Visible         =   0   'False
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   43
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   407
         Top             =   5520
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   43
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   403
         Top             =   5520
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   43
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   402
         Top             =   5520
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   42
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   397
         Top             =   5250
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   42
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   393
         Top             =   5250
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   42
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   392
         Top             =   5250
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   41
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   387
         Top             =   4965
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   41
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   383
         Top             =   4965
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   41
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   382
         Top             =   4965
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   40
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   377
         Top             =   4680
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   40
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   373
         Top             =   4680
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   40
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   372
         Top             =   4680
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   39
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   367
         Top             =   4395
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   39
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   363
         Top             =   4395
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   39
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   362
         Top             =   4395
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   38
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   357
         Top             =   4110
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   38
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   353
         Top             =   4110
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   38
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   352
         Top             =   4110
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   37
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   347
         Top             =   3825
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   37
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   343
         Top             =   3825
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   37
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   342
         Top             =   3825
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   36
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   337
         Top             =   3540
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   36
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   333
         Top             =   3540
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   36
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   332
         Top             =   3540
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   35
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   327
         Top             =   3240
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   35
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   323
         Top             =   3240
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   35
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   322
         Top             =   3240
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   34
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   317
         Top             =   2955
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   34
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   313
         Top             =   2955
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   34
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   312
         Top             =   2955
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   33
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   307
         Top             =   2670
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   33
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   303
         Top             =   2670
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   33
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   302
         Top             =   2670
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   32
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   297
         Top             =   2400
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   32
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   293
         Top             =   2400
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   32
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   292
         Top             =   2400
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   31
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   287
         Top             =   2130
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   31
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   283
         Top             =   2130
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   31
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   282
         Top             =   2130
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   30
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   277
         Top             =   1860
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   30
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   273
         Top             =   1860
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   30
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   272
         Top             =   1860
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   29
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   267
         Top             =   1590
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   29
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   263
         Top             =   1590
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   29
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   262
         Top             =   1590
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   28
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   257
         Top             =   1320
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   28
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   253
         Top             =   1320
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   28
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   252
         Top             =   1320
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   27
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   247
         Top             =   1050
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   27
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   243
         Top             =   1050
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   27
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   242
         Top             =   1050
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   26
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   237
         Top             =   795
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   26
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   233
         Top             =   795
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   26
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   232
         Top             =   795
         Width           =   2200
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   25
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   227
         Top             =   540
         Width           =   2530
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   25
         Left            =   2580
         Locked          =   -1  'True
         TabIndex        =   223
         Top             =   540
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   25
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   222
         Top             =   540
         Width           =   2200
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   25
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   224
         Top             =   540
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   26
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   234
         Top             =   795
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   27
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   244
         Top             =   1050
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   28
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   254
         Top             =   1320
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   29
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   264
         Top             =   1590
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   30
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   274
         Top             =   1860
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   31
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   284
         Top             =   2130
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   32
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   294
         Top             =   2400
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   33
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   304
         Top             =   2670
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   34
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   314
         Top             =   2955
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   35
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   324
         Top             =   3240
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   36
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   334
         Top             =   3540
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   37
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   344
         Top             =   3825
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   38
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   354
         Top             =   4110
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   39
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   364
         Top             =   4395
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   40
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   374
         Top             =   4680
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   41
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   384
         Top             =   4965
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   42
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   394
         Top             =   5250
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   43
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   404
         Top             =   5520
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   44
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   414
         Top             =   5835
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   45
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   424
         Top             =   6090
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   24
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   482
         Top             =   270
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   23
         Left            =   6570
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   493
         Top             =   0
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   23
         Left            =   10650
         TabIndex        =   501
         Top             =   0
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   23
         Left            =   9795
         TabIndex        =   500
         Top             =   0
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "23"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   23
         Left            =   0
         TabIndex        =   499
         Top             =   0
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   24
         Left            =   10650
         TabIndex        =   487
         Top             =   270
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   24
         Left            =   9795
         TabIndex        =   486
         Top             =   270
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   24
         Left            =   0
         TabIndex        =   485
         Top             =   270
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   45
         Left            =   0
         TabIndex        =   453
         Top             =   6090
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   44
         Left            =   0
         TabIndex        =   452
         Top             =   5820
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   43
         Left            =   0
         TabIndex        =   451
         Top             =   5520
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   42
         Left            =   0
         TabIndex        =   450
         Top             =   5250
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   41
         Left            =   0
         TabIndex        =   449
         Top             =   4965
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   40
         Left            =   0
         TabIndex        =   448
         Top             =   4680
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   39
         Left            =   0
         TabIndex        =   447
         Top             =   4395
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   38
         Left            =   0
         TabIndex        =   446
         Top             =   4110
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   37
         Left            =   0
         TabIndex        =   445
         Top             =   3825
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   36
         Left            =   0
         TabIndex        =   444
         Top             =   3540
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   35
         Left            =   0
         TabIndex        =   443
         Top             =   3240
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   34
         Left            =   0
         TabIndex        =   442
         Top             =   2955
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   33
         Left            =   0
         TabIndex        =   441
         Top             =   2670
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   32
         Left            =   0
         TabIndex        =   440
         Top             =   2400
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   31
         Left            =   0
         TabIndex        =   439
         Top             =   2130
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   30
         Left            =   0
         TabIndex        =   438
         Top             =   1860
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   29
         Left            =   0
         TabIndex        =   437
         Top             =   1590
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   28
         Left            =   0
         TabIndex        =   436
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   27
         Left            =   0
         TabIndex        =   435
         Top             =   1050
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   26
         Left            =   0
         TabIndex        =   434
         Top             =   795
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   25
         Left            =   0
         TabIndex        =   433
         Top             =   540
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   46
         Left            =   11640
         TabIndex        =   432
         Top             =   0
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   45
         Left            =   9795
         TabIndex        =   431
         Top             =   6090
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   45
         Left            =   10650
         TabIndex        =   430
         Top             =   6090
         Visible         =   0   'False
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   44
         Left            =   9795
         TabIndex        =   421
         Top             =   5835
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   44
         Left            =   10650
         TabIndex        =   420
         Top             =   5850
         Visible         =   0   'False
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   43
         Left            =   9795
         TabIndex        =   411
         Top             =   5520
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   43
         Left            =   10650
         TabIndex        =   410
         Top             =   5520
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   42
         Left            =   9795
         TabIndex        =   401
         Top             =   5250
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   42
         Left            =   10650
         TabIndex        =   400
         Top             =   5250
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   41
         Left            =   9795
         TabIndex        =   391
         Top             =   4965
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   41
         Left            =   10650
         TabIndex        =   390
         Top             =   4965
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   40
         Left            =   9795
         TabIndex        =   381
         Top             =   4680
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   40
         Left            =   10650
         TabIndex        =   380
         Top             =   4680
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   39
         Left            =   9795
         TabIndex        =   371
         Top             =   4395
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   39
         Left            =   10650
         TabIndex        =   370
         Top             =   4395
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   38
         Left            =   9795
         TabIndex        =   361
         Top             =   4110
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   38
         Left            =   10650
         TabIndex        =   360
         Top             =   4110
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   37
         Left            =   9795
         TabIndex        =   351
         Top             =   3825
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   37
         Left            =   10650
         TabIndex        =   350
         Top             =   3825
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   36
         Left            =   9795
         TabIndex        =   341
         Top             =   3540
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   36
         Left            =   10650
         TabIndex        =   340
         Top             =   3540
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   35
         Left            =   9795
         TabIndex        =   331
         Top             =   3240
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   35
         Left            =   10650
         TabIndex        =   330
         Top             =   3240
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   34
         Left            =   9795
         TabIndex        =   321
         Top             =   2955
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   34
         Left            =   10650
         TabIndex        =   320
         Top             =   2955
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   33
         Left            =   9795
         TabIndex        =   311
         Top             =   2670
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   33
         Left            =   10650
         TabIndex        =   310
         Top             =   2670
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   32
         Left            =   9795
         TabIndex        =   301
         Top             =   2400
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   32
         Left            =   10650
         TabIndex        =   300
         Top             =   2400
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   31
         Left            =   9795
         TabIndex        =   291
         Top             =   2130
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   31
         Left            =   10650
         TabIndex        =   290
         Top             =   2130
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   30
         Left            =   9795
         TabIndex        =   281
         Top             =   1860
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   30
         Left            =   10650
         TabIndex        =   280
         Top             =   1860
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   29
         Left            =   9795
         TabIndex        =   271
         Top             =   1590
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   29
         Left            =   10650
         TabIndex        =   270
         Top             =   1590
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   28
         Left            =   9795
         TabIndex        =   261
         Top             =   1320
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   28
         Left            =   10650
         TabIndex        =   260
         Top             =   1320
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   27
         Left            =   9795
         TabIndex        =   251
         Top             =   1050
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   27
         Left            =   10650
         TabIndex        =   250
         Top             =   1050
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   26
         Left            =   9795
         TabIndex        =   241
         Top             =   795
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   26
         Left            =   10650
         TabIndex        =   240
         Top             =   795
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   25
         Left            =   9795
         TabIndex        =   231
         Top             =   540
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   25
         Left            =   10650
         TabIndex        =   230
         Top             =   540
         Width           =   600
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   5955
      Index           =   0
      Left            =   315
      ScaleHeight     =   5895
      ScaleWidth      =   11265
      TabIndex        =   6
      Top             =   585
      Width           =   11325
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   21
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   512
         Top             =   5355
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   21
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   511
         Top             =   5355
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   22
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   509
         Top             =   5625
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   22
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   508
         Top             =   5625
         Width           =   850
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   22
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   507
         Top             =   5625
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   21
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   505
         Top             =   5355
         Width           =   600
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   470
         Text            =   "PO"
         Top             =   -15
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   469
         Text            =   "WAIT"
         Top             =   -15
         Width           =   850
      End
      Begin VB.TextBox Hi 
         Alignment       =   2  'Center
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   7725
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   466
         Text            =   "Hi"
         Top             =   -15
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   4
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   216
         Top             =   795
         Width           =   600
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   4
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   214
         Top             =   795
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   4
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   213
         Top             =   795
         Width           =   300
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   16
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   185
         Top             =   4035
         Width           =   600
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   16
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   184
         Top             =   4035
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   16
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   183
         Top             =   4035
         Width           =   300
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   2
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   163
         Top             =   255
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   2
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   162
         Top             =   255
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   159
         Top             =   525
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   158
         Top             =   525
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   5
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   155
         Top             =   1065
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   5
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   154
         Top             =   1065
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   6
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   151
         Top             =   1335
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   6
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   150
         Top             =   1335
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   7
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   147
         Top             =   1605
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   7
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   146
         Top             =   1605
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   8
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   143
         Top             =   1875
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   8
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   142
         Top             =   1875
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   9
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   139
         Top             =   2145
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   9
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   138
         Top             =   2145
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   10
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   135
         Top             =   2415
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   10
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   134
         Top             =   2415
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   11
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   131
         Top             =   2685
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   11
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   130
         Top             =   2685
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   12
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   127
         Top             =   2955
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   12
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   126
         Top             =   2955
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   13
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   123
         Top             =   3225
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   13
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   122
         Top             =   3225
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   14
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   119
         Top             =   3495
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   14
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   118
         Top             =   3495
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   15
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   115
         Top             =   3765
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   15
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   114
         Top             =   3765
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   17
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   111
         Top             =   4305
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   17
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   110
         Top             =   4305
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   18
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   107
         Top             =   4575
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   18
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   106
         Top             =   4575
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   103
         Top             =   4845
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   102
         Top             =   4845
         Width           =   850
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   20
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   99
         Top             =   5115
         Width           =   300
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   20
         Left            =   6585
         Locked          =   -1  'True
         TabIndex        =   98
         Top             =   5115
         Width           =   850
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   20
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   43
         Top             =   5115
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   41
         Top             =   4845
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   18
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   39
         Top             =   4575
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   17
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   37
         Top             =   4305
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   15
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   35
         Top             =   3765
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   14
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   33
         Top             =   3495
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   13
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   31
         Top             =   3225
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   12
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   29
         Top             =   2955
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   11
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   27
         Top             =   2685
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   10
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   25
         Top             =   2415
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   9
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   23
         Top             =   2145
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   8
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   21
         Top             =   1875
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   7
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   19
         Top             =   1605
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   6
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   17
         Top             =   1335
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   5
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   15
         Top             =   1065
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   13
         Top             =   525
         Width           =   600
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   2
         Left            =   7740
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   11
         Top             =   255
         Width           =   600
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   22
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   517
         Top             =   5625
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   21
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   516
         Top             =   5355
         Width           =   2200
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   22
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   515
         Top             =   5625
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   21
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   514
         Top             =   5355
         Width           =   1500
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   21
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   513
         Top             =   5355
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   22
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   510
         Top             =   5625
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   22
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   506
         Top             =   5625
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   21
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   504
         Top             =   5355
         Width           =   1470
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   22
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   503
         Top             =   5625
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   21
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   502
         Top             =   5355
         Width           =   2530
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   473
         Text            =   "STEP DESCRIPTION"
         Top             =   -15
         Width           =   2200
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   472
         Text            =   "AUDIO SET"
         Top             =   -15
         Width           =   1500
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   6615
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   471
         Text            =   "RY"
         Top             =   -15
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   468
         Text            =   "Linux Command"
         Top             =   -15
         Width           =   2530
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   1
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   467
         Text            =   "Low"
         Top             =   -15
         Width           =   1470
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   16
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   454
         Top             =   4035
         Width           =   2530
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   4
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   217
         Top             =   795
         Width           =   1470
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   4
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   212
         Top             =   795
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   4
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   211
         Top             =   795
         Width           =   1500
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   4
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   210
         Top             =   795
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   20
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   208
         Top             =   5115
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   207
         Top             =   4845
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   18
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   206
         Top             =   4575
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   17
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   205
         Top             =   4305
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   15
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   204
         Top             =   3765
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   14
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   203
         Top             =   3495
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   13
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   202
         Top             =   3225
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   12
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   201
         Top             =   2955
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   11
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   200
         Top             =   2685
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   10
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   199
         Top             =   2415
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   9
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   198
         Top             =   2145
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   8
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   197
         Top             =   1875
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   7
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   196
         Top             =   1605
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   6
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   195
         Top             =   1335
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   5
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   194
         Top             =   1065
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   193
         Top             =   525
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   2
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   192
         Top             =   255
         Width           =   2200
      End
      Begin VB.TextBox Step_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   16
         Left            =   390
         Locked          =   -1  'True
         TabIndex        =   191
         Top             =   4035
         Width           =   2200
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   16
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   190
         Top             =   4035
         Width           =   1500
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   16
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   186
         Top             =   4035
         Width           =   1470
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   16
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   182
         Top             =   4035
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   20
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   181
         Top             =   5115
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   180
         Top             =   4845
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   18
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   179
         Top             =   4575
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   17
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   178
         Top             =   4305
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   15
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   177
         Top             =   3765
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   14
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   176
         Top             =   3495
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   13
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   175
         Top             =   3225
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   12
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   174
         Top             =   2955
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   11
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   173
         Top             =   2685
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   10
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   172
         Top             =   2415
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   9
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   171
         Top             =   2145
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   8
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   170
         Top             =   1875
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   7
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   169
         Top             =   1605
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   6
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   168
         Top             =   1335
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   5
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   167
         Top             =   1065
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   166
         Top             =   525
         Width           =   1500
      End
      Begin VB.TextBox AudioSet_text 
         Alignment       =   1  'Right Justify
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   2
         Left            =   2595
         Locked          =   -1  'True
         TabIndex        =   165
         Top             =   255
         Width           =   1500
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   2
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   164
         Top             =   255
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   160
         Top             =   525
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   5
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   156
         Top             =   1065
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   6
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   152
         Top             =   1335
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   7
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   148
         Top             =   1605
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   8
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   144
         Top             =   1875
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   9
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   140
         Top             =   2145
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   10
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   136
         Top             =   2415
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   11
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   132
         Top             =   2685
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   12
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   128
         Top             =   2955
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   13
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   124
         Top             =   3225
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   14
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   120
         Top             =   3495
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   15
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   116
         Top             =   3765
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   17
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   112
         Top             =   4305
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   18
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   108
         Top             =   4575
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   104
         Top             =   4845
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   20
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   100
         Top             =   5115
         Visible         =   0   'False
         Width           =   850
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   20
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   42
         Top             =   5115
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   40
         Top             =   4845
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   18
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   38
         Top             =   4575
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   17
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   36
         Top             =   4305
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   15
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   34
         Top             =   3765
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   14
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   32
         Top             =   3495
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   13
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   30
         Top             =   3225
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   12
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   28
         Top             =   2955
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   11
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   26
         Top             =   2685
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   10
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   24
         Top             =   2415
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   9
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   22
         Top             =   2145
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   8
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   20
         Top             =   1875
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   7
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   18
         Top             =   1605
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   6
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   16
         Top             =   1335
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   5
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   14
         Top             =   1065
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   12
         Top             =   525
         Width           =   1470
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   2
         Left            =   8340
         Locked          =   -1  'True
         TabIndex        =   10
         Top             =   255
         Width           =   1470
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   20
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   97
         Top             =   5115
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   101
         Top             =   4845
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   18
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   105
         Top             =   4575
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   17
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   109
         Top             =   4305
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   15
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   113
         Top             =   3765
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   14
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   117
         Top             =   3495
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   13
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   121
         Top             =   3225
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   12
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   125
         Top             =   2955
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   11
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   129
         Top             =   2685
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   10
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   133
         Top             =   2415
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   9
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   137
         Top             =   2145
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   8
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   141
         Top             =   1875
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   7
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   145
         Top             =   1605
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   6
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   149
         Top             =   1335
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   5
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   153
         Top             =   1065
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   3
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   157
         Top             =   525
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   2
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   161
         Top             =   255
         Width           =   2530
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   4
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   215
         Top             =   795
         Width           =   2530
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "22"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   22
         Left            =   15
         TabIndex        =   523
         Top             =   5625
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   22
         Left            =   9795
         TabIndex        =   522
         Top             =   5625
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   22
         Left            =   10650
         TabIndex        =   521
         Top             =   5625
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "21"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   21
         Left            =   15
         TabIndex        =   520
         Top             =   5355
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   21
         Left            =   9795
         TabIndex        =   519
         Top             =   5355
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   21
         Left            =   10650
         TabIndex        =   518
         Top             =   5355
         Width           =   600
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Judge"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   10650
         TabIndex        =   476
         Top             =   0
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Measure"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   9795
         TabIndex        =   475
         Top             =   -15
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO."
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   15
         TabIndex        =   474
         Top             =   -15
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   10650
         TabIndex        =   220
         Top             =   795
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   9795
         TabIndex        =   219
         Top             =   795
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   15
         TabIndex        =   218
         Top             =   795
         Width           =   375
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   16
         Left            =   10650
         TabIndex        =   189
         Top             =   4035
         Width           =   600
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   16
         Left            =   9795
         TabIndex        =   188
         Top             =   4035
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "16"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   16
         Left            =   15
         TabIndex        =   187
         Top             =   4035
         Width           =   375
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "20"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   20
         Left            =   15
         TabIndex        =   94
         Top             =   5115
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   20
         Left            =   9795
         TabIndex        =   93
         Top             =   5115
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   20
         Left            =   10650
         TabIndex        =   92
         Top             =   5115
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "19"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   15
         TabIndex        =   91
         Top             =   4845
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   9795
         TabIndex        =   90
         Top             =   4845
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Index           =   19
         Left            =   10650
         TabIndex        =   89
         Top             =   4845
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "18"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   18
         Left            =   15
         TabIndex        =   88
         Top             =   4575
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   18
         Left            =   9795
         TabIndex        =   87
         Top             =   4575
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   18
         Left            =   10650
         TabIndex        =   86
         Top             =   4575
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "17"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   17
         Left            =   15
         TabIndex        =   85
         Top             =   4305
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   17
         Left            =   9795
         TabIndex        =   84
         Top             =   4305
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   17
         Left            =   10650
         TabIndex        =   83
         Top             =   4305
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "15"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   15
         Left            =   15
         TabIndex        =   82
         Top             =   3765
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   15
         Left            =   9795
         TabIndex        =   81
         Top             =   3765
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   15
         Left            =   10650
         TabIndex        =   80
         Top             =   3765
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "14"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   14
         Left            =   15
         TabIndex        =   79
         Top             =   3495
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   14
         Left            =   9795
         TabIndex        =   78
         Top             =   3495
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   14
         Left            =   10650
         TabIndex        =   77
         Top             =   3495
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "13"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   13
         Left            =   15
         TabIndex        =   76
         Top             =   3225
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   13
         Left            =   9795
         TabIndex        =   75
         Top             =   3225
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   13
         Left            =   10650
         TabIndex        =   74
         Top             =   3225
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "12"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   12
         Left            =   15
         TabIndex        =   73
         Top             =   2955
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   12
         Left            =   9795
         TabIndex        =   72
         Top             =   2955
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   12
         Left            =   10650
         TabIndex        =   71
         Top             =   2955
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "11"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   11
         Left            =   15
         TabIndex        =   70
         Top             =   2685
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   11
         Left            =   9795
         TabIndex        =   69
         Top             =   2685
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   11
         Left            =   10650
         TabIndex        =   68
         Top             =   2685
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "10"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   10
         Left            =   15
         TabIndex        =   67
         Top             =   2415
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   10
         Left            =   9795
         TabIndex        =   66
         Top             =   2415
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   10
         Left            =   10650
         TabIndex        =   65
         Top             =   2415
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "9"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   9
         Left            =   15
         TabIndex        =   64
         Top             =   2145
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   9
         Left            =   9795
         TabIndex        =   63
         Top             =   2145
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   9
         Left            =   10650
         TabIndex        =   62
         Top             =   2145
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "8"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   8
         Left            =   15
         TabIndex        =   61
         Top             =   1875
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   8
         Left            =   9795
         TabIndex        =   60
         Top             =   1875
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   8
         Left            =   10650
         TabIndex        =   59
         Top             =   1875
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "7"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   15
         TabIndex        =   58
         Top             =   1605
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   9795
         TabIndex        =   57
         Top             =   1605
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   10650
         TabIndex        =   56
         Top             =   1605
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   15
         TabIndex        =   55
         Top             =   1335
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   9795
         TabIndex        =   54
         Top             =   1335
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   10650
         TabIndex        =   53
         Top             =   1335
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   15
         TabIndex        =   52
         Top             =   1065
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   9795
         TabIndex        =   51
         Top             =   1065
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   10650
         TabIndex        =   50
         Top             =   1065
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   15
         TabIndex        =   49
         Top             =   525
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   9795
         TabIndex        =   48
         Top             =   525
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   10650
         TabIndex        =   47
         Top             =   525
         Width           =   600
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   15
         TabIndex        =   46
         Top             =   255
         Width           =   375
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   9795
         TabIndex        =   45
         Top             =   255
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H000000FF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NG"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   10650
         TabIndex        =   44
         Top             =   255
         Width           =   600
      End
   End
   Begin VB.TextBox TotalText 
      Height          =   5940
      Left            =   360
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   524
      Top             =   600
      Visible         =   0   'False
      Width           =   11250
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Result："
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   24
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   465
      TabIndex        =   528
      Top             =   7305
      Width           =   1830
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Tips："
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
      Left            =   345
      TabIndex        =   527
      Top             =   6810
      Width           =   795
   End
   Begin VB.Label Time_Label 
      AutoSize        =   -1  'True
      Caption         =   "test time"
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
      Left            =   3690
      TabIndex        =   488
      Top             =   7965
      Width           =   1080
   End
   Begin VB.Label Judge 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Judge"
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   11010
      TabIndex        =   465
      Top             =   330
      Width           =   615
   End
   Begin VB.Label Measure 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Measure"
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   10170
      TabIndex        =   464
      Top             =   330
      Width           =   825
   End
   Begin VB.Label Meano 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "NO."
      BeginProperty Font 
         Name            =   "新宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   360
      TabIndex        =   463
      Top             =   330
      Width           =   375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "EBX-5032 SheJian ET1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   345
      Left            =   3930
      TabIndex        =   8
      Top             =   -15
      Width           =   3360
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "作成：香港十和田生产技术课"
      Height          =   180
      Left            =   8760
      TabIndex        =   7
      Top             =   90
      Width           =   2340
   End
End
Attribute VB_Name = "EBX5009_1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim OK_Number As String
Dim NG_Number As String
Dim ErrMsg As String
Dim KeyPub As Integer
Dim SetIn As Integer

Private Sub Clear_Command_Click()
'    Dim Cmd$
'    Cmd$ = COMMANDPROMPT & " /c ssh " & ProductIp & " -l " & "root" & " dd if=/dev/zero of=/dev/ttyS0 count=1" & " > " & RESFILE$ & " 2>&1"
'    INFdisplay = Cmd$
'    CmdRet = Shell(Cmd$, vbMinimizedFocus)
'    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
End Sub

Private Sub Command1_Click() '手动自动测试
If Manual = 1 Then
Manual = 0
EBX5009_1.Command1.Caption = "AutoTest"
Else
Manual = 1
EBX5009_1.Command1.Caption = "ManualTest"
End If
End Sub

Private Sub Command2_Click() '编辑
Dialog.Show
End Sub

Private Sub Command3_Click() '保存setting
Ret = MsgBox("以前的数据将被覆盖，是否继续", vbInformation + vbOKCancel, "注意！")
If Ret = vbCancel Then Exit Sub
Call ResettingALL(True, "myself", &H8000000F)
Call DataSave
End Sub

Private Sub Command4_Click()
'Dim lExitCode As Long   '追加
'    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
'
'        On Error GoTo Err:
'        AppActivate COMMANDPROMPT
'        DoEvents
'        SendKeys ("{ENTER}")
'        DoEvents
''        Ret = GetExitCodeProcess(hProcess, lExitCode)
'
'Err:

End Sub

Private Sub Command5_Click() '退出程序
Call ExitProgram
End Sub
Private Sub command6_Click() '测试数据保存与否
Call SelectSaveCommand
End Sub

Private Sub Control_Command_Click()
If Control_Command.Caption = "开始" Then
Control_Command.Caption = "停止"
Else
Control_Command.Caption = "开始"
End If
End Sub

Private Sub Form_Activate()

If TESTrem = 0 Then
TESTrem = 1 '防止重复初始化
GPibini    'GPIB初始化
'DIOINIT   'io初始化
'IOini 'io输出初始化
Page_command_Click (0)
    Call ResettingALL(True, "", &H8000000F)
    Call DataLoad
    Call SelectSaveCommand
    Manual = 1
    EBX5009_1.Command1.Caption = "ManualTest"
End If
End Sub
Private Sub GetItme(ControlName As String, FindStr As String)  '测量
''On Error GoTo Exit1
'                Select Case ControlName
'                Case "Lastepd"
'                    EBX5009_1.LastEpd.AddItem ""
'                    EBX5009_1.LastEpd.Text = ""
'                Case "Lastwriteflash"
'                    EBX5009_1.LastWriteflash.AddItem ""
'                    EBX5009_1.LastWriteflash.Text = ""
'                Case "external_Combo"
'                    EBX5009_1.external_Combo.Text = ""
'                End Select
'Dim s As String
'     If Dir("c:\result3.txt") <> "" Then
'      Dim fso As New FileSystemObject, txtfile, _
'  fil1 As File, ts As TextStream
'' Set txtfile = fso.CreateTextFile("c:\testfile.txt", True)
''  MsgBox "正在写入文件"    ' 写入一行。
'  Set fil1 = fso.GetFile("c:\result3.txt")
''  Set ts = fil1.OpenAsTextStream(ForWriting)
''  ts.Write "Hello World"
''  ts.Close    ' 读取文件的内容。
'    Set ts = fil1.OpenAsTextStream(ForReading)
'    Do
'        If ts.AtEndOfLine = False Then
'            s = ""
'            s = ts.ReadLine
'            If InStr(1, s, FindStr) > 0 Then
'                Select Case ControlName
'                Case "epd_combo"
''                    EBX5009_1.EPD_Combo.AddItem s
'                Case "writeflash_combo"
''                    EBX5009_1.WRITEFLASH_Combo.AddItem s
'                Case "Lastepd"
'                    EBX5009_1.LastEpd.AddItem s
'                    EBX5009_1.LastEpd.Text = s
'                Case "Lastwriteflash"
'                    EBX5009_1.LastWriteflash.AddItem s
'                    EBX5009_1.LastWriteflash.Text = s
'                Case "external_Combo"
'                    EBX5009_1.external_Combo.Text = external_Combo & " " & s
'                End Select
'            End If
'            Else
'            Exit Do
'        End If
'    Loop Until ts.AtEndOfLine = True
'End If
End Sub


Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = Asc(" ") Then
KeyPub = 1
KeyCode = 10
End If
End Sub

Private Sub Form_Load()
If TESTrem = 1 Then Exit Sub
If App.PrevInstance = True Then
MsgBox "程序已经打开"
End
End If
TestPub = "NO TEST"
    TESTrem = 0 '防止重复执行activate
    R64Adr = 3
    AUDIOadr = 7 '音频分析仪地址
    Stepmax = 43 '测试步数,最大45步
    PageNo = 1 '当前页数
    PageMax = 2
'    MSComm1.PortOpen = True
End Sub
Private Sub SokuteikiInt()
Dim A$
'万用表R6451
A$ = "F1,R5,PR2"
Call GPIBwr(R64Adr, A$)
A$ = "H0" '
Call GPIBwr(R64Adr, A$)
A$ = "M1" '
Call GPIBwr(R64Adr, A$)
'音频分析仪
A$ = "FR1KZAP-20DMM3LOGAUHPF0LP0"
Call GPIBwr(AUDIOadr, A$)
End Sub
Private Sub GPibini()
On Error GoTo Exit1
        YiQistate = True
'R6852ADRESS
    R64Adr = ildev(0, 3, 0, T10s, 1, 0)
    If (ibsta And EERR) Then
        ErrMsg = "Unable to open device" & Chr(13) & "ibsta = &H" & _
        Chr(13) & Hex(ibsta) & "iberr = " & iberr
        If MsgBox("万用表打开失败!是否继续", vbYesNo) = vbNo Then End
        YiQistate = False
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
        If MsgBox("音频分析仪打开失败!是否继续", vbYesNo) = vbNo Then End
        YiQistate = False
    End If
    ilclr AUDIOadr
    If (ibsta And EERR) Then
        Call GPIBCleanup("Unable to clear 音频分析仪")
    End If
    Exit Sub
Exit1:
        If MsgBox("卡打开失败!是否继续", vbYesNo) = vbNo Then End
        YiQistate = False
End Sub
Private Sub GPIBCleanup(Msg$)
Dim ErrorMnemonic
 ErrorMnemonic = Array("EDVR", "ECIC", "ENOL", "EADR", "EARG", _
                          "ESAC", "EABO", "ENEB", "EDMA", "", _
                          "EOIP", "ECAP", "EFSO", "", "EBUS", _
                          "ESTB", "ESRQ", "", "", "", "ETAB")

    ErrMsg$ = Msg$ & Chr(13) & "ibsta = &H" & Hex(ibsta) & Chr(13) _
              & "iberr = " & iberr & " <" & ErrorMnemonic(iberr) & ">"
    MsgBox ErrMsg$, vbCritical, "Error"
'    ilonl Dev%, 0
'    End
End Sub
Private Function GPread(adr)
        If YiQistate = False Then Exit Function
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
'Private Function GPread1(adr) 'interface gpib
'Dim nRet As Long
'Dim RecvLen As Long
'Dim tmp As String
'    ' Receives data from a specified device.
'    RecvLen = 32
'    OutpDevAdrsTbl(0) = adr
'    OutpDevAdrsTbl(1) = -1
'  nRet = PciGpibExMastRecvData(nBoardNo, OutpDevAdrsTbl(0), RecvLen, RecvBuffer, 0)
'    If nRet Then
'    Call DsplyErrMessage(nRet)
'        Select Case adr
'    Case 7
'        Call GPIBCleanup("Unable to write to 音频分析仪")
'    Case 3
'        Call GPIBCleanup("Unable to write to 万用表")
'    Case Else
'        Call GPIBCleanup("Unable to write to device未知")
'    End Select
'    Unload Me
'    End
'    End If
'  ' Displays the data receive.
' tmp = Val(RecvBuffer)
' GPread1 = tmp
'End Function

Private Sub GPIBwr(adrrs As Integer, Cmd As String)
        If YiQistate = False Then Exit Sub
    Dim nRet As Long
    Dim szData As String
    Dim szSG As String
    Dim nLen As Long
    '
    szSG = Cmd
     ' Sends the command for universal source.
    szData = StrConv(szSG, vbFromUnicode)
    nLen = LenB(szData)
    szData = StrConv(szData, vbUnicode)
      ilwrt adrrs, Cmd, nLen
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
'Private Sub GPIBwr1(adrrs As Integer, Cmd As String) '4304
'    Dim nRet As Long
'    Dim szData As String
'    Dim szSG As String
'    Dim nLen As Long
'
'    ' Specifies the device address table.
'    OutpDevAdrsTbl(0) = adrrs
'    OutpDevAdrsTbl(1) = -1
'    szSG = Cmd
'
'    ' Sends the command for universal source.
'    szData = StrConv(szSG, vbFromUnicode)
'    nLen = LenB(szData)
'    szData = StrConv(szData, vbUnicode)
'   nRet = PciGpibExMastSendData(nBoardNo, OutpDevAdrsTbl(0), nLen, szData, 0)
'  ' Sleep (50)
'      If nRet Then
'    Select Case adrrs
'    Case 7
'        Call GPIBCleanup("Unable to write to 音频分析仪")
'    Case 3
'        Call GPIBCleanup("Unable to write to 万用表")
'    Case Else
'        Call GPIBCleanup("Unable to write to device未知")
'    End Select
'    Unload Me
'        End
'  End If
'
'End Sub
Public Sub SswpressKey()
        KeyPub = 0
    Do
        DoEvents  '循环等待期间其他事件响应ON/OFF
        Sleep (20)
        If TestPub <> "TESTTING" Then TipText.Text = "压下空格键开始"
    Loop Until KeyPub = 1
                If TestPub <> "TESTTING" Then
                TipText.Text = "START"
                EBX5009_1.TotalText = ""
                '窗口初始化
                Call ResettingALL(True, "", &H8000000F)
                EBX5009_1.INFdisplay.Text = ""
                EBX5009_1.INFdisplay.BackColor = vbWhite
                EBX5009_1.WaitMAX.value = 0
                Maintest '主测试程序
                End If
End Sub

Public Sub WAITtime(No As Long)
DoEvents
Dim ii As Long
Dim jj As Long
Dim AAA As Long
ii = GetTickCount()
If No = 0 Then
'条件设定WAITTIME
DoEvents
If Val(TestCondition1(Stepitme).Wait) <= 0 Then Exit Sub
 WaitMAX.Max = Val(TestCondition1(Stepitme).Wait)
 WaitMAX.Min = 0
Do Until (jj - ii) >= TestCondition1(Stepitme).Wait
AAA = jj - ii
   jj = GetTickCount()
   If AAA > 0 Then
   WaitMAX.value = AAA
   End If
       DoEvents
'IOREADvalue = IOread
'If IOREADvalue >= 6 And Manual = 1 Then
'Exit Sub
'End If
If IOREAD = 7 Then
Exit Sub
End If
Loop
 WaitMAX.value = Val(TestCondition1(Stepitme).Wait)
Else
'内部WAITTIME
DoEvents
WaitMAX.Max = No
WaitMAX.Min = 0
Do Until (jj - ii) >= No
AAA = jj - ii
   jj = GetTickCount()
   If AAA > 0 Then
   WaitMAX.value = AAA
   End If
    DoEvents
'    IOREADvalue = IOread
'If IOREADvalue >= 6 And Manual = 1 Then
'Exit Sub
'End If
If IOREAD = 7 Then
Exit Sub
End If
Loop
WaitMAX.value = No
End If
End Sub

Private Sub Rs232TX2(OUTString As String)
If MSComm1.PortOpen = False Then
Call Mscomm1Open(1)
End If
Rs232TXctrlc
If MSComm1.PortOpen = False Then Exit Sub
MSComm1.InputMode = comInputModeText
Dim OUTString_1 As String * 1
Dim iii As Integer
MSComm1.InBufferCount = 0
MSComm1.OutBufferCount = 0
OUTString = Trim(OUTString)
For iii = 1 To Len(OUTString)
OUTString_1 = Mid$(OUTString, iii, 1)
MSComm1.Output = OUTString_1
Sleep 8
Next iii
'OUTString = "test " & UCase$(Trim(Rs232send(Stepitme).Text)) & Chr$(13)
Sleep 10
MSComm1.Output = Chr$(13)
End Sub
Private Sub Rs232TXctrlc()
If MSComm1.PortOpen = False Then
Call Mscomm1Open(1)
End If
If MSComm1.PortOpen = False Then Exit Sub
MSComm1.InputMode = comInputModeBinary
Dim Out03(0) As Byte
Out03(0) = 3
MSComm1.Output = Out03
Sleep 10
MSComm1.InputMode = comInputModeText
End Sub
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
Private Sub Rs232Open()
 Dim Ret As Long
    Dim DoCount As Long
    Dim Xx_PRI As Long
    Dim Yy_pri As Long
       Dim hWndDesk As Long
        hWndDesk = GetDesktopWindow()
            If CheckApplicationIsRun("ttermpro.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im ttermpro.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
            If CheckApplicationIsRun("ttermpro.exe") = True Then 'Explorer.exe为你要结束的进程名字
            Shell "taskkill /im ttermpro.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
            Sleep (20)
            End If
             ChDir ("C:\Program Files\TTERMPRO\")
             
 Ret = ShellExecute(hWndDesk, "open", "C:\Program Files\TTERMPRO\ttermpro.exe", "ttermpro.exe", "C:\Program Files\TTERMPRO\TERATERM.INI", 5)

' Ret = Shell("C:\Program Files\TTERMPRO\ttermpro.exe", vbNormalFocus)
   If Ret > 0 Then
   Else
   NGflag = 1
   Exit Sub
   End If
    Do
        DoEvents
        Sleep 100
        DoCount = DoCount + 1
                Hhwnd = FindWindow(vbNullString, "Tera Term - COM3 VT")
                If Hhwnd = 0 Then
                Hhwnd = FindWindow(vbNullString, "Tera Term - COM3 VT")
                End If
    Loop Until Hhwnd <> 0 Or DoCount > 10
    If DoCount > 10 Then
        MsgBox "Tera term OPEN  ERROR"
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
        EnumChildWindows Hhwnd, AddressOf EnumChildProcAudio, ByVal 0&
        SendMessageTimeout Next_pub, BM_CLICK, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
              If WriteResult_pub = 0 Then NGflag = 1
End Sub
Private Sub SendMSG(Msgdata As String)
Dim MsgRet
Select Case Msgdata
Case "setlog"
LogString = "REDEY START"
MsgRet = SendMessage(ATK_ResultText, WM_SETTEXT, 255, LogString)
Case "getlog"
LogString = Space$(14884)
MsgRet = SendMessage(WriteResult_pub, WM_GETTEXT, 14884, LogString)
INFdisplay.Text = LogString
Case "Closewindow"
MsgRet = SendMessage(Hhwnd, WM_CLOSE, 0, 0)
Case "RUN_click"
 MsgRet = SendMessage(BottonHANLD, BM_CLICK, 0&, ByVal 0&)  'BM_CLICK
End Select
End Sub
Private Sub CDATAsetting()
Dim GPIBERdata As String
Dim i As Integer
Dim Ret As Long
Dim Ret2 As Long
Dim A As String
    Dim Xx_PRI As Long
    Dim Yy_pri As Long
'LOGIN
 Select Case Step_text(Stepitme).Text
Case "LOGIN"
            Rs232TXctrlc
'            Sleep (20)
                INFdisplay = ""
                Xx_PRI = GetTickCount
                Do
                DoEvents
                Sleep (20)
                MSComm1_OnComm2
                Yy_pri = GetTickCount - Xx_PRI
                Loop Until InStr(1, Right(INFdisplay.Text, 20), "login:", vbTextCompare) > 0 Or Yy_pri > 2000 Or InStr(1, Right(INFdisplay.Text, 20), "ttyg", vbTextCompare) > 0
If InStr(1, Right(INFdisplay.Text, 20), "ttyg", vbTextCompare) <= 0 Then
            If InStr(1, INFdisplay, "login", vbTextCompare) <= 0 Then
           Rs232TX2 (Chr(13))
                INFdisplay = ""
                Xx_PRI = GetTickCount
                Do
                DoEvents
                Sleep (20)
                MSComm1_OnComm2
                Yy_pri = GetTickCount - Xx_PRI
                Loop Until InStr(1, Right(INFdisplay.Text, 20), "login:", vbTextCompare) > 0 Or Yy_pri > 2000 Or InStr(1, Right(INFdisplay.Text, 20), "ttyg", vbTextCompare) > 0
            End If
              If InStr(1, INFdisplay, "login:", vbTextCompare) <= 0 Then
             Rs232TX2 (Chr(13))
                INFdisplay = ""
                Xx_PRI = GetTickCount
                Do
                DoEvents
                Sleep (20)
                MSComm1_OnComm2
                Yy_pri = GetTickCount - Xx_PRI
                Loop Until InStr(1, Right(INFdisplay.Text, 20), "login:", vbTextCompare) > 0 Or Yy_pri > 2000 Or InStr(1, Right(INFdisplay.Text, 20), "ttyg", vbTextCompare) > 0
            End If
If InStr(1, Right(INFdisplay.Text, 20), "login:", vbTextCompare) > 0 Then

Rs232TX2 ("root" & Chr(13) & "root")

Else
NGflag = 1
Exit Sub
End If
                INFdisplay = ""
                Xx_PRI = GetTickCount
                Do
                DoEvents
                Sleep (20)
                MSComm1_OnComm2
                Yy_pri = GetTickCount - Xx_PRI
                Loop Until InStr(1, Right(INFdisplay.Text, 20), "ttyg", vbTextCompare) > 0 Or Yy_pri > 2000
End If
                MMn = INFdisplay.Text
End Select
'音频发送
If Trim(TestCondition1(Stepitme).AudioSet) <> "" Then
GPIBERdata = UCase$(Trim(TestCondition1(Stepitme).AudioSet))
Call GPIBwr(AUDIOadr, GPIBERdata)
End If
'key receive
If InStr(1, Step_text(Stepitme).Text, "Keyを", vbTextCompare) > 0 Then
                Call WAITtime(0)
                INFdisplay = ""
                Xx_PRI = GetTickCount
                    Do
                    DoEvents
                    Sleep (20)
                    MSComm1_OnComm2
                    Yy_pri = GetTickCount - Xx_PRI
                    If InStr(1, Right(INFdisplay, 20), "ttyg", vbTextCompare) > 0 Then Exit Do
                    Loop Until InStr(1, INFdisplay, TestCondition1(Stepitme).Low, vbTextCompare) > 0 Or Yy_pri > 20000
                MMn = INFdisplay.Text
End If
'延续测试
If Stepitme <> 1 And Trim(Rs232send(Stepitme).Text) = "" And Val(TestCondition1(Stepitme).Po) = 3 And InStr(1, Step_text(Stepitme).Text, "Keyを", vbTextCompare) <= 0 Then
                Call WAITtime(0)
                INFdisplay = ""
                Xx_PRI = GetTickCount
                    Do
                    DoEvents
                    Sleep (20)
                    MSComm1_OnComm2
                    Yy_pri = GetTickCount - Xx_PRI
                    If InStr(1, Right(INFdisplay, 20), "ttyg", vbTextCompare) > 0 Then Exit Do
                    Loop Until InStr(1, INFdisplay, TestCondition1(Stepitme).Low, vbTextCompare) > 0 Or Yy_pri > 20000
                MMn = INFdisplay.Text
End If
'RS232发送
If Trim(Rs232send(Stepitme).Text) <> "" And InStr(1, Step_text(Stepitme).Text, "Keyを", vbTextCompare) <= 0 Then
If Stepitme >= 3 And Stepitme <= 13 And Retest <> 0 And InStr(1, INFdisplay, TestCondition1(Stepitme).Low, vbTextCompare) > 0 Then Exit Sub
    Rs232TXctrlc
    Sleep (20)
'    Rs232TXctrlc
'        Sleep (20)
'        Rs232TX2 (Chr(13))
                INFdisplay = ""
                Xx_PRI = GetTickCount
                    Do
                    DoEvents
                    Sleep (20)
                    MSComm1_OnComm2
                    Yy_pri = GetTickCount - Xx_PRI
                    Loop Until InStr(1, Right(INFdisplay, 20), "ttyg", vbTextCompare) > 0 Or Yy_pri > 2000
                MMn = INFdisplay.Text

                If InStr(1, Right(INFdisplay, 20), "ttyg", vbTextCompare) > 0 Then
                    If InStr(1, Rs232send(Stepitme).Text, "set_rtc.sh", vbTextCompare) > 0 Then
                    Dim Year_pri As String
                    Dim Month_pri As String
                    Dim Day_pri As String
                    Dim Hour_pri As String
                    Dim Minute_pri As String
                    Dim Second_pri As String
                     Year_pri = Year(Now)
                     Month_pri = Month(Now)
                     If Len(Month_pri) = 1 Then Month_pri = "0" & Month_pri
       
                     Day_pri = Day(Now)
                                          If Len(Day_pri) = 1 Then Day_pri = "0" & Day_pri
                     Hour_pri = Hour(Now)
                                          If Len(Hour_pri) = 1 Then Hour_pri = "0" & Hour_pri
                     Minute_pri = Minute(Now)
                                          If Len(Minute_pri) = 1 Then Minute_pri = "0" & Minute_pri
                     Second_pri = Second(Now)
                                          If Len(Second_pri) = 1 Then Second_pri = "0" & Second_pri
                        Rs232TX2 ("set_rtc.sh " & Year_pri & "/" & Month_pri & "/" & Day_pri & " " & Hour_pri & ":" & Minute_pri & ":" & Second_pri)
                        Low(Stepitme + 1).Text = (Year_pri & "/" & Month_pri & "/" & Day_pri & " " & Hour_pri & ":" & Minute_pri & ":" & Second_pri)
                        TestCondition1(Stepitme + 1).Low = Low(Stepitme + 1).Text
                    Else
                        Rs232TX2 (Trim(Rs232send(Stepitme).Text))
                    End If
                If TestCondition1(Stepitme).Wait = 0 Then
                Call WAITtime(1000)
                Else
                Call WAITtime(0)
                End If
                INFdisplay = ""
                Xx_PRI = GetTickCount
                    Do
                    DoEvents
                    Sleep (20)
                    MSComm1_OnComm2
                    Yy_pri = GetTickCount - Xx_PRI
                    Loop Until InStr(1, INFdisplay, TestCondition1(Stepitme).Low, vbTextCompare) > 0 Or Yy_pri > 3000
                MMn = INFdisplay.Text
                End If
Else
                If TestCondition1(Stepitme).Wait = 0 Then
                Call WAITtime(1000)
                Else
                Call WAITtime(0)
                End If
End If
End Sub
   Public Sub KeyWrite(ByVal No As String)
'                SetForegroundWindow (Hhwnd)
'                Sleep (50)
'                SetActiveWindow Hhwnd
'                Sleep (50)
'                 ShowWindow Hhwnd, 5
'                 Sleep (50)
'                SendKeys No, 100 'LOAD
'                Sleep (50)
   End Sub
Public Sub KeyTest()
'Select Case Stepitme 'key
'Case 26
'Call IOwrite(3, Prot_3 Or 4)
'Sleep (500)
'Call IOwrite(3, Prot_3)
'Sleep (500)
'Case 27
'Call IOwrite(3, Prot_3 Or 2)
'Sleep (500)
'Call IOwrite(3, Prot_3)
'Sleep (500)
'Case 28
'Call IOwrite(2, Prot_3 Or 2)
'Sleep (500)
'Call IOwrite(2, Prot_3)
'Sleep (500)
'
'Case 29
'Call IOwrite(2, Prot_2 Or 1)
'Sleep (500)
'Call IOwrite(2, Prot_2)
'Sleep (500)
'Case 30
'Call IOwrite(1, Prot_1 Or 128)
'Sleep (500)
'Call IOwrite(1, Prot_1)
'Sleep (500)
'
'Case 31
'Call IOwrite(1, Prot_1 Or 64)
'Sleep (500)
'Call IOwrite(1, Prot_1)
'Sleep (500)
'Case 32
'Call IOwrite(3, Prot_3 Or 1)
'Sleep (500)
'Call IOwrite(3, Prot_3)
'Sleep (500)
'End Select
End Sub
Private Sub STEPstep()
Select Case Stepitme
Case 11
TestCondition1(Stepitme).TestVal = Val(TestCondition1(10).TestVal) - Val(TestCondition1(11).TestVal)
Case 13
TestCondition1(Stepitme).TestVal = Val(TestCondition1(12).TestVal) - Val(TestCondition1(13).TestVal)
'Case 14
'TestCondition1(Stepitme).TestVal = TestCondition1(Stepitme).TestVal - TestCondition1(9).TestVal
'Case 15
'TestCondition1(Stepitme).TestVal = TestCondition1(Stepitme).TestVal - TestCondition1(8).TestVal
'Case 16
'TestCondition1(Stepitme).TestVal = TestCondition1(Stepitme).TestVal - TestCondition1(9).TestVal
End Select
End Sub
Public Sub Mea()
Dim Po3 As Integer
Dim Hidata As String
Dim Lowdata As String
Dim MMn2 As String

Dim Check1 As String
Dim Check2 As String
Dim Check3 As String
Dim Check4 As String
Dim Check5 As String


Check1 = ""
Check2 = ""
Check3 = ""
Check4 = ""
Check5 = ""

Dim i As Integer
On Error Resume Next
Hidata = TestCondition1(Stepitme).Hi
Lowdata = TestCondition1(Stepitme).Low
Po3 = Val(TestCondition1(Stepitme).Po)
Select Case Po3
Case 0
Measure(Stepitme).Caption = "PASS"
Case 1
Call GPIBwr(R64Adr, "F5,R7,PR2")
TestCondition1(Stepitme).TestVal = GPread(R64Adr) * 1000
STEPstep
Measure(Stepitme).Caption = Format$(TestCondition1(Stepitme).TestVal, "#0.00")
    If Val(TestCondition1(Stepitme).TestVal) >= Lowdata And Val(TestCondition1(Stepitme).TestVal) <= Hidata Then
     Judge(Stepitme).Caption = "OK"
     Judge(Stepitme).BackColor = &HFF00&
     NGflag = 0
    Else
     Judge(Stepitme).Caption = "NG"
     Judge(Stepitme).BackColor = &HFF
     NGflag = 1
    End If
 Case 2
' If Stepitme <> 24 Or Stepitme <> 37 Then
 TestCondition1(Stepitme).TestVal = GPread(AUDIOadr)
' End If
STEPstep
Measure(Stepitme).Caption = Format$(TestCondition1(Stepitme).TestVal, "#0.00")
If Val((TestCondition1(Stepitme).TestVal) < Lowdata) Or Val((TestCondition1(Stepitme).TestVal) > Hidata) Then
Call GPIBwr(AUDIOadr, "AU")
WAITtime (1000)
TestCondition1(Stepitme).TestVal = GPread(AUDIOadr)
STEPstep
Measure(Stepitme).Caption = Format$(TestCondition1(Stepitme).TestVal, "#0.00")
End If
    If Val(TestCondition1(Stepitme).TestVal) >= Lowdata And Val(TestCondition1(Stepitme).TestVal) <= Hidata Then
     Judge(Stepitme).Caption = "OK"
     Judge(Stepitme).BackColor = &HFF00&
     NGflag = 0
    Else
     NGflag = 1
     Judge(Stepitme).Caption = "NG"
     Judge(Stepitme).BackColor = &HFF
    End If
Measure(Stepitme).Caption = Val(TestCondition1(Stepitme).TestVal)
Case 3
MMn2 = Lowdata
'MMn2 = "000003020604;;000206021c3c0200;;000003020604;;000003020604;;000003020604"
If InStr(1, MMn2, ";;", vbTextCompare) <= 0 Then
Check1 = MMn2
Else
    Check1 = Mid(MMn2, 1, InStr(1, MMn2, ";;", vbTextCompare) - 1)
    MMn2 = Mid(MMn2, InStr(1, MMn2, ";;", vbTextCompare) + 2, Len(MMn2) - InStr(1, MMn2, ";;", vbTextCompare))
    If InStr(1, MMn2, ";;", vbTextCompare) <= 0 Then
    Check2 = MMn2
    Else
        Check2 = Mid(MMn2, 1, InStr(1, MMn2, ";;", vbTextCompare) - 1)
        MMn2 = Mid(MMn2, InStr(1, MMn2, ";;", vbTextCompare) + 2, Len(MMn2) - InStr(1, MMn2, ";;", vbTextCompare))
        If InStr(1, MMn2, ";;", vbTextCompare) <= 0 Then
            Check3 = MMn2
        Else
                Check3 = Mid(MMn2, 1, InStr(1, MMn2, ";;", vbTextCompare) - 1)
                MMn2 = Mid(MMn2, InStr(1, MMn2, ";;", vbTextCompare) + 2, Len(MMn2) - InStr(1, MMn2, ";;", vbTextCompare))
                If InStr(1, MMn2, ";;", vbTextCompare) <= 0 Then
                    Check4 = MMn2
                Else
                    Check4 = Mid(MMn2, 1, InStr(1, MMn2, ";;", vbTextCompare) - 1)
                    MMn2 = Mid(MMn2, InStr(1, MMn2, ";;", vbTextCompare) + 2, Len(MMn2) - InStr(1, MMn2, ";;", vbTextCompare))
                        If InStr(1, MMn2, ";;", vbTextCompare) <= 0 Then
                        Check5 = MMn2
                        Else
                        MsgBox "超过设定最大值"
                        NGflag = 1
                        Exit Sub
                        End If
                End If
       End If
    End If
End If

Measure(Stepitme).Caption = MMn
        If InStr(1, Rs232send(Stepitme).Text, "get_rtc.sh", vbTextCompare) > 0 Then
            MMn2 = Mid(MMn, InStr(1, MMn, Year(Now), vbTextCompare), 19)
            If Minute(MMn2) >= Minute(TestCondition1(Stepitme).Low) Then
                If Minute(MMn2) = Minute(TestCondition1(Stepitme).Low) Then
                    If Second(MMn2) > Second(TestCondition1(Stepitme).Low) Then
                                Judge(Stepitme).Caption = "OK"
                    Judge(Stepitme).BackColor = &HFF00&
                    NGflag = 0
                    Else
                        NGflag = 1
        '                If Stepitme = 1 And Retest1 < 2 Then Exit Sub
                        Judge(Stepitme).Caption = "NG"
                        Judge(Stepitme).BackColor = &HFF
                    End If
                    Exit Sub
                End If
            Judge(Stepitme).Caption = "OK"
            Judge(Stepitme).BackColor = &HFF00&
            NGflag = 0
            Else
                NGflag = 1
'                If Stepitme = 1 And Retest1 < 2 Then Exit Sub
                Judge(Stepitme).Caption = "NG"
                Judge(Stepitme).BackColor = &HFF
            End If
            Exit Sub
        End If
Select Case Stepitme
Case Else

    If InStr(1, MMn, Check1) > 0 And InStr(1, MMn, Check2) > 0 And InStr(1, MMn, Check3) > 0 _
    And InStr(1, MMn, Check4) > 0 And InStr(1, MMn, Check5) > 0 Then
        Judge(Stepitme).Caption = "OK"
        Judge(Stepitme).BackColor = &HFF00&
        NGflag = 0
    Else
        NGflag = 1
'        If Stepitme = 1 And Retest1 < 2 Then Exit Sub
        Judge(Stepitme).Caption = "NG"
        Judge(Stepitme).BackColor = &HFF
    End If
End Select
End Select
End Sub
Private Sub OKNGdisplay()
'If MSComm1.PortOpen = True Then MSComm1.PortOpen = False
Dim i As Integer
    For i = 0 To Stepmax
    If Judge(i).BackColor = vbRed Then
    NGflag = 1
    Exit For
    End If
    Next i
If NGflag = 0 Then
    EBX5009_1.INFdisplay.Alignment = 2
    EBX5009_1.INFdisplay.Font.Size = 30
    EBX5009_1.INFdisplay.ForeColor = H00FF0000&
    EBX5009_1.INFdisplay.Text = "OK"
    EBX5009_1.INFdisplay.BackColor = &HFF00&
    If Saveinf = 1 Then TestDataSave
    OK_Text.Text = Val(OK_Text.Text) + 1
Else
    EBX5009_1.INFdisplay.Alignment = 2
    EBX5009_1.INFdisplay.Font.Size = 30
    EBX5009_1.INFdisplay.Text = "NG"
    EBX5009_1.INFdisplay.BackColor = &HFF
    If Saveinf = 1 Then TestDataSave
    NG_Text.Text = Val(NG_Text.Text) + 1
End If
TestPub = "No Test"
Mscomm1Open (0)
SswpressKey
End Sub
Public Sub BZon()
'Dim IOin As Integer
'If MSComm1.PortOpen = True Then MSComm1.PortOpen = False
'    If NGflag = 0 Then
'    Else
'    Do
'        Call IOwrite(5, &H80) 'BZ ON
'        Sleep 100
'        Call IOwrite(5, 0)
'        Sleep 100
'        IOin = IOREAD And 2
'        DoEvents  '循环等待期间其他事件响应ON/OFF
'    Loop Until IOin = 2
'    NGflag = 0
'    End If
'        IOCHECK5032.EBX5032Out_Click
'        SetIn = 0
'        ACinonoff (0)
'        TestPub = "NO TEST"
End Sub
Private Sub Maintest()
Dim Err02 As Integer '
Dim RetestNum As Integer
Dim Xx As Long
Dim Yy As Long
Dim Retest29 As Integer
Dim Retest30 As Integer
Dim Retest10 As Integer
Dim i As Integer
Dim RemRes_pri(100) As Integer
For i = 0 To 100
RemRes_pri(100) = 0
Next
EBX5009_1.INFdisplay.Font.Size = 12
Retest1 = 0
RetestAudio = 0
Retest29 = 0
Retest30 = 0
Retest10 = 0
Xx = GetTickCount()
Start1:
NGflag = 0
TestPub = "TESTTING"
For i = 0 To Stepmax
TestCondition1(i).TestVal = ""
Next i
'ProductID = Get_Number
For Stepitme = 1 To Stepmax
Retest = 0
'压键
If Manual = 1 And InStr(1, Step_text(Stepitme).Text, "Keyを", vbTextCompare) <= 0 And Val(TestCondition1(Stepitme).Wait) <> 0 Then
If Stepitme <> 1 And Stepitme <> 1 Then
TipText.Text = Low(Stepitme).Text & "  　压下空格键后开始确认"
                If InStr(1, Step_text(Stepitme).Text, "MS", vbTextCompare) > 0 Then
                    If InStr(1, Low(Stepitme).Text, "Done", vbTextCompare) > 0 Then
                    TipText.Text = "插入MS卡！"
                    Else
                    TipText.Text = "拨出MS卡！"
                    End If
                End If
                
                If InStr(1, Step_text(Stepitme).Text, "SD", vbTextCompare) > 0 Then
                    If InStr(1, Low(Stepitme).Text, "Done", vbTextCompare) > 0 Then
                    TipText.Text = "插入SD卡！"
                    Else
                    TipText.Text = "拨出SD卡！"
                    End If
                End If

SswpressKey
End If
Else
TipText.Text = Step_text(Stepitme).Text
            If InStr(1, Step_text(Stepitme).Text, "MS", vbTextCompare) > 0 Then
                If InStr(1, Low(Stepitme).Text, "Done", vbTextCompare) > 0 Then
                TipText.Text = "插入MS卡！"
                Else
                TipText.Text = "拨出MS卡！"
                End If
            End If
            
            If InStr(1, Step_text(Stepitme).Text, "SD", vbTextCompare) > 0 Then
                If InStr(1, Low(Stepitme).Text, "Done", vbTextCompare) > 0 Then
                TipText.Text = "插入SD卡！"
                Else
                TipText.Text = "拨出SD卡！"
                End If
            End If
End If
'重测次数设定
    Select Case Stepitme
    Case 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13
    RetestNum = 3
    Case Else
    RetestNum = 2
    End Select
'If Stepitme = 8 Then Stepitme = 22
Err02 = 0
'计算PAGENO
        If Stepitme > 22 Then
        Picture1(1).ZOrder 0
        Picture1(0).Visible = False
        Picture1(1).Visible = True
        Else
        Picture1(0).ZOrder 0
        Picture1(1).Visible = False
        Picture1(0).Visible = True
        End If
Errstep02:
CDATAsetting
If NGflag = 0 Then Mea
'ng Retest
If NGflag = 1 Then
    Err02 = Err02 + 1
        If Err02 <= RetestNum Then
            NGflag = 0
            GoTo Errstep02
        End If
End If
NGRetestPass:
If NGflag = 1 Then
RemRes_pri(Stepitme) = 1
Else
RemRes_pri(Stepitme) = 0
End If
If NGflag = 1 Then Exit For
Next Stepitme
'okng
For i = 0 To 100
If RemRes_pri(Stepitme) = 1 Then
NGflag = 1
Exit For
End If
Next i
Yy = GetTickCount() - Xx
Time_Label.Caption = Format(Yy / 1000, "#.##") & "S"
OKNGdisplay
''BZon
''    If NGflag = 0 Then
'''        IOCHECK5032.EBX5032Out_Click
'''        SetIn = 0
'''        ACinonoff (0)
'        TestPub = "NO TEST"
'    End If
End Sub
Private Sub ACinonoff(No As Integer) 'ACONOFF继电器
'    Select Case No
'    Case 1
'        Call IOwrite(3, 16)
'        Sleep (500)
'        Call IOwrite(3, 0)
'        Sleep (500)
'        Call IOwrite(3, 8)
'        Sleep (1000)
'        Call IOwrite(3, 0)
'        Sleep (500)
'    Case 0
'        Call IOwrite(4, 0)
'    Case 2
'        Call IOwrite(4, 64 + 1)
'        Sleep (500)
'    End Select
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
Call ExitProgram
End
End Sub

Private Sub IOCHECKER_Click() '继电器手动控制
Stopinf = 1 '停止标示
IOCHECK5032.Show
End Sub



Private Sub Kill_Command_Click()
'    Dim Cmd$
'    Cmd$ = COMMANDPROMPT & " /c ssh " & ProductIp & " -l " & "root" & " 10.0.1.1 100 skill -KILL -c subcpu.sh;skill -KILL -c subcpu" & " > " & RESFILE$ & " 2>&1"
'    INFdisplay = Cmd$
'    CmdRet = Shell(Cmd$, vbMinimizedFocus)
'    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
End Sub

Private Sub Label2_DblClick()
If StepTestPic.Visible = True Then
StepTestPic.Visible = False
Exit Sub
End If
If EBX5009_1.Command1.Caption = "ManualTest" Then
StepTestPic.Visible = True
StepTestPic.ZOrder 0
Else
StepTestPic.Visible = False
End If
End Sub


Private Sub Meano_Click(Index As Integer)
'PageNo = 1
'Set ebx5009_1 = EBX5009_1
'Stepitme = (PageNo - 1) * 25 + Index
'Call EBX5009_1.CDATAsetting
'Call EBX5009_1.Measure
'Call TestModule.Judge
End Sub



Private Sub MSComm1_OnComm()
INFdisplay.Alignment = 0
INFdisplay.FontSize = 12
'Sleep (10)
INFdisplay.Text = INFdisplay.Text & MSComm1.Input
End Sub
Private Sub MSComm1_OnComm2()
If MSComm1.PortOpen = False Then
Call Mscomm1Open(1)
End If
If MSComm1.PortOpen = False Then Exit Sub
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
MSComm1.InputLen = InBufferCount
Ret = MSComm1.Input
If Count <> 0 Then
For i = 0 To Count
INFdisplay.Text = INFdisplay.Text & Bar_Input(i)
TotalText.Text = TotalText.Text & Bar_Input(i)
Bar_Code = Bar_Code & Bar_Input(i)
Next i
INFdisplay.SelStart = Len(INFdisplay.Text)
TotalText.SelStart = Len(TotalText.Text)
End If

End Sub

Private Sub Page_command_Click(Index As Integer) '页面切换
If Index = 0 Then
Picture1(0).ZOrder 0
Picture1(1).Visible = False
Picture1(0).Visible = True
Else
Picture1(1).ZOrder 0
Picture1(0).Visible = False
Picture1(1).Visible = True
End If
End Sub

Public Sub ResettingALL(LockSelect As Boolean, Inival As String, Bgcolor As String) '界面初始化可选，界面锁定、解锁
Dim i As Integer
For i = 1 To 45
'form1 initalize
Meano(i).Caption = i  'no
Step_text(i).Locked = LockSelect 'step description
Hi(i).Locked = LockSelect 'high value
Low(i).Locked = LockSelect 'low value
AudioSet_text(i).Locked = LockSelect 'audioset condition
Rs232send(i).Locked = LockSelect 'Rs232 command
Ry(i).Locked = LockSelect 'relay board set
Wtime(i).Locked = LockSelect 'wait time set
Po(i).Locked = LockSelect 'test option
If Inival <> "myself" Then
Measure(i).BackColor = Bgcolor
Judge(i).BackColor = Bgcolor
Measure(i).Caption = ""
Judge(i).Caption = ""
End If
Next i
'four form command initalize
IOCHECKER.Enabled = Not (LockSelect)
Command3.Enabled = Not (LockSelect)
Picture1(0).ZOrder 0
OK_Text.Locked = LockSelect
NG_Text.Locked = LockSelect
OK_Text.Visible = Not (LockSelect)
NG_Text.Visible = Not (LockSelect)
End Sub
Public Sub SelectSaveCommand()
If Saveinf = 1 Then
Saveinf = 0
Command6.Caption = "TestDataNoSave"
Command6.BackColor = &H8000000F
Else
Saveinf = 1
Command6.Caption = "TestDataSave"
Command6.BackColor = &H80FF&
End If
End Sub

Public Sub ExitProgram() '退出程序
'Call DataSave
Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
If Ret <> 0 Then
SendMessage Ret, WM_CLOSE, 0&, ByVal 0&
Sleep (100)
End If
If Dir(RESFILE$) <> "" Then Kill RESFILE$
Call Closedevice
End
End Sub
Public Sub EditCommand() '编辑命令

End Sub

Public Sub DataSave() '条件设定数据保存

Dim RST As Integer
Dim i As Integer
Open App.Path & "\Setting" For Output As #2 '数据LOAD
For i = 1 To 45
    Write #2, i,
    Write #2, Step_text(i).Text,
    Write #2, AudioSet_text(i).Text,
    Write #2, Rs232send(i).Text,
    Write #2, Ry(i).Text,
    Write #2, Val(Wtime(i).Text),
    Write #2, Po(i).Text,
    Write #2, Hi(i).Text,
    Write #2, Low(i).Text
Next i
Write #2, ProductIp, EBX5009_1.OK_Text.Text, EBX5009_1.NG_Text.Text, Date, Time()
Close #2
   Call DataLoad
End Sub

Public Sub DataLoad() '条件设定数据装载
On Error Resume Next
Open App.Path & "\Setting" For Input As #2 '数据LOAD
For i = 1 To 45
Input #2, TestCondition1(i).No, TestCondition1(i).Stepdescription, TestCondition1(i).AudioSet, _
     TestCondition1(i).Rs232, TestCondition1(i).Ry, TestCondition1(i).Wait, TestCondition1(i).Po, _
     TestCondition1(i).Hi, TestCondition1(i).Low
'条件读入
     Meano(i).Caption = i
    Step_text(i).Text = TestCondition1(i).Stepdescription
    AudioSet_text(i).Text = TestCondition1(i).AudioSet
    Rs232send(i).Text = TestCondition1(i).Rs232
    Ry(i).Text = TestCondition1(i).Ry
    Wtime(i).Text = TestCondition1(i).Wait
    Po(i).Text = TestCondition1(i).Po
    Hi(i).Text = TestCondition1(i).Hi
    Low(i).Text = TestCondition1(i).Low
'工具提示
'    Meano(i).ToolTipText = TestCondition1(i).NO
    Step_text(i).ToolTipText = TestCondition1(i).Stepdescription
    AudioSet_text(i).ToolTipText = TestCondition1(i).AudioSet
    Rs232send(i).ToolTipText = TestCondition1(i).Rs232
    Ry(i).ToolTipText = TestCondition1(i).Ry
    Wtime(i).ToolTipText = TestCondition1(i).Wait
    Po(i).ToolTipText = TestCondition1(i).Po
    Hi(i).ToolTipText = TestCondition1(i).Hi
    Low(i).ToolTipText = TestCondition1(i).Low
Next i
Input #2, ProductIp, OK_Number, NG_Number
Close #2
Text1.Text = ProductIp
OK_Text.Text = OK_Number
NG_Text.Text = NG_Number
End Sub

Private Sub SEND_Command_Click(Index As Integer)
'IO动作
'    Prot_1 = Val("&H" + Left$(RY_Text(Index).Text, 2))
'    Prot_2 = Val("&H" + Mid(RY_Text(Index).Text, 3, 2))
'    Prot_3 = Val("&H" + Mid(RY_Text(Index).Text$, 5, 2))
'    Call IOwrite(3, Prot_3)
'    Call IOwrite(2, Prot_2)
'    Call IOwrite(1, Prot_1)
'    Call LinuxSendPri(Index)
End Sub
Private Sub LinuxSendPri(ByVal Index As Integer)
'On Error GoTo Exit1
'Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
'If Ret <> 0 Then
'Call Send_CTRL_C
'SendMessageTimeout Ret, WM_CLOSE, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
'Sleep (100)
'End If
'If Dir(RESFILE$) <> "" Then Kill RESFILE$
'Exit1:
'Sleep (300)
'Response = Exec_Test2(Order_Text(Index).Text, ProductIp, Index, 20000, strBuffer)
End Sub

Private Sub SSHD_Click()

'Dim lExitCode As Long   '追加
'    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
'
'        On Error GoTo Err:
'        AppActivate COMMANDPROMPT
'        DoEvents
'        SendKeys ("^(C)")
'        DoEvents
''        Ret = GetExitCodeProcess(hProcess, lExitCode)
'        Sleep (10)
'
'Err:

End Sub
Public Function Rs232InOut() As Boolean
'On Error GoTo Exit1:
'If TestPub = "TESTTING" Then Exit Function
'If MSComm1.PortOpen = True Then
'MSComm1.PortOpen = False
'Rs232InOut = True
'Else
' MSComm1.PortOpen = True
' If MSComm1.PortOpen = True Then Rs232InOut = True
'End If
'Exit Function
'Exit1:
'Rs232InOut = False
'SetIn = 0
End Function

Private Sub Timer1_Timer()
Timer1.Enabled = False
    TestPub = "No Test"
    SswpressKey
'Select Case SetIn
'Case 0
'    If TestPub = "No Test" Then
'        SetIn = 1
'                 Sleep 1000
'                '窗口初始化
'                Call ResettingALL(True, "", &H8000000F)
'                EBX5009_1.INFdisplay.Text = ""
'                EBX5009_1.INFdisplay.BackColor = vbWhite
'                EBX5009_1.WaitMAX.value = 0
'                Maintest '主测试程序
'    End If
'Case 1
'    If TestPub = "TESTTING" Then
'        SetIn = 0
'        TotalText.Text = ""
'    End If
'End Select
'Timer1.Enabled = True
End Sub

Private Sub TotalCommand_Click()
If TotalText.Visible = True Then
TotalText.Visible = False
Else
TotalText.Visible = True
TotalText.ZOrder 0
End If
End Sub
