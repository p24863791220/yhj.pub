VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form RomCheck5013 
   Caption         =   "5013 RomCheck"
   ClientHeight    =   8595
   ClientLeft      =   1650
   ClientTop       =   1335
   ClientWidth     =   11880
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   573
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   792
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
   Begin VB.CommandButton Quit_Command 
      Caption         =   "Quit"
      Height          =   390
      Left            =   8430
      TabIndex        =   60
      Top             =   5925
      Width           =   2085
   End
   Begin VB.CommandButton Edit_Command 
      Caption         =   "Edit"
      Height          =   390
      Left            =   2865
      TabIndex        =   59
      Top             =   5940
      Width           =   1185
   End
   Begin VB.CommandButton Auto_Command 
      Caption         =   "Auto"
      Height          =   405
      Left            =   1185
      TabIndex        =   58
      Top             =   5925
      Width           =   1275
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   360
      Left            =   1200
      TabIndex        =   57
      Top             =   5520
      Width           =   9300
      _ExtentX        =   16404
      _ExtentY        =   635
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "10"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   10
      Left            =   1185
      TabIndex        =   55
      Top             =   5085
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   10
      Left            =   2100
      TabIndex        =   54
      Top             =   5085
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   10
      Left            =   6330
      TabIndex        =   53
      Top             =   5085
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   10
      Left            =   7860
      TabIndex        =   52
      Top             =   5085
      Width           =   1380
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "9"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   9
      Left            =   1185
      TabIndex        =   50
      Top             =   4665
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   9
      Left            =   2100
      TabIndex        =   49
      Top             =   4665
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   9
      Left            =   6330
      TabIndex        =   48
      Top             =   4665
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   9
      Left            =   7860
      TabIndex        =   47
      Top             =   4665
      Width           =   1380
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "8"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   8
      Left            =   1185
      TabIndex        =   45
      Top             =   4245
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   8
      Left            =   2100
      TabIndex        =   44
      Top             =   4245
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   8
      Left            =   6330
      TabIndex        =   43
      Top             =   4245
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   8
      Left            =   7860
      TabIndex        =   42
      Top             =   4245
      Width           =   1380
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2040
      Left            =   1185
      TabIndex        =   41
      Text            =   "Text1"
      Top             =   6345
      Width           =   9330
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "7"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   7
      Left            =   1185
      TabIndex        =   39
      Top             =   3825
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   7
      Left            =   2100
      TabIndex        =   38
      Top             =   3825
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   7
      Left            =   6330
      TabIndex        =   37
      Top             =   3825
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   6
      Left            =   7860
      TabIndex        =   36
      Top             =   3825
      Width           =   1380
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "6"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   6
      Left            =   1185
      TabIndex        =   34
      Top             =   3405
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   6
      Left            =   2100
      TabIndex        =   33
      Top             =   3405
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   6
      Left            =   6330
      TabIndex        =   32
      Top             =   3405
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   5
      Left            =   7860
      TabIndex        =   31
      Top             =   3405
      Width           =   1380
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "5"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   5
      Left            =   1185
      TabIndex        =   29
      Top             =   3000
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   5
      Left            =   2100
      TabIndex        =   28
      Top             =   3000
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   5
      Left            =   6330
      TabIndex        =   27
      Top             =   3000
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   4
      Left            =   7860
      TabIndex        =   26
      Top             =   3000
      Width           =   1380
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "4"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   4
      Left            =   1185
      TabIndex        =   24
      Top             =   2580
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   4
      Left            =   2100
      TabIndex        =   23
      Top             =   2580
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   4
      Left            =   6330
      TabIndex        =   22
      Top             =   2580
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   3
      Left            =   7860
      TabIndex        =   21
      Top             =   2580
      Width           =   1380
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "3"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   3
      Left            =   1185
      TabIndex        =   19
      Top             =   2160
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   3
      Left            =   2100
      TabIndex        =   18
      Top             =   2160
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   3
      Left            =   6330
      TabIndex        =   17
      Top             =   2160
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   2
      Left            =   7860
      TabIndex        =   16
      Top             =   2160
      Width           =   1380
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "2"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   2
      Left            =   1185
      TabIndex        =   14
      Top             =   1755
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   2
      Left            =   2100
      TabIndex        =   13
      Top             =   1755
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   2
      Left            =   6330
      TabIndex        =   12
      Top             =   1755
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   1
      Left            =   7860
      TabIndex        =   11
      Top             =   1755
      Width           =   1380
   End
   Begin VB.CommandButton Step_command 
      Caption         =   "1"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   1
      Left            =   1185
      TabIndex        =   9
      Top             =   1335
      Width           =   885
   End
   Begin VB.TextBox Command_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   1
      Left            =   2100
      TabIndex        =   8
      Top             =   1335
      Width           =   4200
   End
   Begin VB.TextBox Wtime_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Index           =   1
      Left            =   6330
      TabIndex        =   7
      Top             =   1335
      Width           =   1515
   End
   Begin VB.TextBox Tout_text 
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   0
      Left            =   7860
      TabIndex        =   6
      Top             =   1335
      Width           =   1380
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   10
      Left            =   9255
      TabIndex        =   56
      Top             =   5085
      Width           =   1245
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   9
      Left            =   9255
      TabIndex        =   51
      Top             =   4665
      Width           =   1245
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   8
      Left            =   9255
      TabIndex        =   46
      Top             =   4245
      Width           =   1245
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   7
      Left            =   9255
      TabIndex        =   40
      Top             =   3825
      Width           =   1245
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   6
      Left            =   9255
      TabIndex        =   35
      Top             =   3405
      Width           =   1245
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   5
      Left            =   9255
      TabIndex        =   30
      Top             =   3000
      Width           =   1245
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   4
      Left            =   9255
      TabIndex        =   25
      Top             =   2580
      Width           =   1245
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   3
      Left            =   9255
      TabIndex        =   20
      Top             =   2160
      Width           =   1245
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   2
      Left            =   9255
      TabIndex        =   15
      Top             =   1755
      Width           =   1245
   End
   Begin VB.Label Result_label 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Index           =   1
      Left            =   9255
      TabIndex        =   10
      Top             =   1335
      Width           =   1245
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "TimeOut"
      BeginProperty Font 
         Name            =   "Ó×Ô²"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7875
      TabIndex        =   5
      Top             =   810
      Width           =   1365
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "WaitTime"
      BeginProperty Font 
         Name            =   "Ó×Ô²"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6345
      TabIndex        =   4
      Top             =   810
      Width           =   1500
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Command"
      BeginProperty Font 
         Name            =   "Ó×Ô²"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   2115
      TabIndex        =   3
      Top             =   825
      Width           =   4185
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Result"
      BeginProperty Font 
         Name            =   "Ó×Ô²"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   9255
      TabIndex        =   2
      Top             =   810
      Width           =   1245
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Step"
      BeginProperty Font 
         Name            =   "Ó×Ô²"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   1200
      TabIndex        =   1
      Top             =   825
      Width           =   885
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "5013 RomCheck FF"
      BeginProperty Font 
         Name            =   "ËÎÌå"
         Size            =   21.75
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   4425
      TabIndex        =   0
      Top             =   165
      Width           =   3840
   End
End
Attribute VB_Name = "RomCheck5013"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Unload(Cancel As Integer)

End
End Sub

Private Sub Quit_Command_Click()
Unload Me
End Sub
