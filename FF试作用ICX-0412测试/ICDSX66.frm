VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form ICX236 
   Caption         =   "ICX236 EPP2"
   ClientHeight    =   3825
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5265
   LinkTopic       =   "Form1"
   ScaleHeight     =   11115
   ScaleWidth      =   15240
   StartUpPosition =   3  '窗口缺省
   WindowState     =   2  'Maximized
   Begin VB.CommandButton IOCHECKER 
      Caption         =   "IOCHECKER"
      Enabled         =   0   'False
      Height          =   375
      Left            =   6360
      Style           =   1  'Graphical
      TabIndex        =   1003
      Top             =   10440
      Width           =   1095
   End
   Begin VB.CommandButton Command6 
      Caption         =   "DATA"
      Height          =   375
      Left            =   5280
      Style           =   1  'Graphical
      TabIndex        =   1002
      Top             =   10440
      Width           =   855
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   240
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.CommandButton Command5 
      Caption         =   "EXIT"
      Height          =   375
      Left            =   14280
      TabIndex        =   14
      Top             =   10440
      Width           =   855
   End
   Begin VB.CommandButton Command4 
      Caption         =   "条件设定"
      Height          =   375
      Left            =   3960
      TabIndex        =   13
      Top             =   10440
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "保存"
      Height          =   375
      Left            =   2760
      TabIndex        =   12
      Top             =   10440
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "编辑"
      Height          =   375
      Left            =   1560
      TabIndex        =   11
      Top             =   10440
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "自动"
      Height          =   375
      Left            =   360
      TabIndex        =   10
      Top             =   10440
      Width           =   855
   End
   Begin VB.PictureBox Picture1 
      Height          =   9495
      Index           =   1
      Left            =   7800
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   9
      Top             =   840
      Width           =   7335
      Begin VB.TextBox Hi 
         Alignment       =   2  'Center
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   75
         Left            =   3120
         Locked          =   -1  'True
         MaxLength       =   6
         TabIndex        =   995
         Text            =   "Hi"
         Top             =   120
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
         TabIndex        =   994
         Text            =   "Low"
         Top             =   120
         Width           =   1095
      End
      Begin VB.PictureBox Picture3 
         Height          =   1215
         Left            =   120
         ScaleHeight     =   1155
         ScaleWidth      =   7035
         TabIndex        =   993
         Top             =   8280
         Width           =   7095
         Begin MSComctlLib.ProgressBar WaitMAX 
            Height          =   255
            Left            =   0
            TabIndex        =   1000
            Top             =   960
            Width           =   7215
            _ExtentX        =   12726
            _ExtentY        =   450
            _Version        =   393216
            Appearance      =   1
         End
         Begin VB.TextBox INFdisplay 
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00000000&
            Height          =   1095
            Left            =   0
            MultiLine       =   -1  'True
            TabIndex        =   1001
            Top             =   0
            Width           =   7095
         End
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   74
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   988
         Top             =   9000
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   74
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   987
         Top             =   9000
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   73
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   982
         Top             =   8760
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   73
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   981
         Top             =   8760
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   72
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   976
         Top             =   8520
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   72
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   975
         Top             =   8520
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   71
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   970
         Top             =   8280
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   71
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   969
         Top             =   8280
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   70
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   964
         Top             =   8040
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   70
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   963
         Top             =   8040
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   69
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   958
         Top             =   7800
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   69
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   957
         Top             =   7800
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   68
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   952
         Top             =   7560
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   68
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   951
         Top             =   7560
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   67
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   946
         Top             =   7320
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   67
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   945
         Top             =   7320
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   66
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   940
         Top             =   7080
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   66
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   939
         Top             =   7080
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   65
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   934
         Top             =   6840
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   65
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   933
         Top             =   6840
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   64
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   928
         Top             =   6600
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   64
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   927
         Top             =   6600
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   63
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   922
         Top             =   6360
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   63
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   921
         Top             =   6360
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   62
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   916
         Top             =   6120
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   62
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   915
         Top             =   6120
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   61
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   910
         Top             =   5880
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   61
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   909
         Top             =   5880
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   60
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   904
         Top             =   5640
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   60
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   903
         Top             =   5640
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   59
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   898
         Top             =   5400
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   59
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   897
         Top             =   5400
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   58
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   892
         Top             =   5160
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   58
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   891
         Top             =   5160
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   57
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   886
         Top             =   4920
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   57
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   885
         Top             =   4920
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   56
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   880
         Top             =   4680
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   56
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   879
         Top             =   4680
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   55
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   874
         Top             =   4440
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   55
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   873
         Top             =   4440
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   54
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   868
         Top             =   4200
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   54
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   867
         Top             =   4200
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   53
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   862
         Top             =   3960
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   53
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   861
         Top             =   3960
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   52
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   856
         Top             =   3720
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   52
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   855
         Top             =   3720
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   51
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   850
         Top             =   3480
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   51
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   849
         Top             =   3480
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   50
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   844
         Top             =   3240
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   50
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   843
         Top             =   3240
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   49
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   838
         Top             =   3000
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   49
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   837
         Top             =   3000
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   48
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   832
         Top             =   2760
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   48
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   831
         Top             =   2760
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   47
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   826
         Top             =   2520
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   47
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   825
         Top             =   2520
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   46
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   820
         Top             =   2280
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   46
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   819
         Top             =   2280
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   45
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   814
         Top             =   2040
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   45
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   813
         Top             =   2040
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   44
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   808
         Top             =   1800
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   44
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   807
         Top             =   1800
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   43
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   802
         Top             =   1560
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   43
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   801
         Top             =   1560
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   42
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   796
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   42
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   795
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   41
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   790
         Top             =   1080
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   41
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   789
         Top             =   1080
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   40
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   784
         Top             =   840
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   40
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   783
         Top             =   840
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   39
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   778
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   39
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   777
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   38
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   772
         Top             =   360
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   38
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   771
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   255
         Index           =   75
         Left            =   120
         TabIndex        =   999
         Top             =   120
         Width           =   375
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Itme"
         Height          =   255
         Index           =   75
         Left            =   480
         TabIndex        =   998
         Top             =   120
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Measure"
         Height          =   255
         Index           =   75
         Left            =   5280
         TabIndex        =   997
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Judge"
         Height          =   255
         Index           =   75
         Left            =   6360
         TabIndex        =   996
         Top             =   120
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "74"
         Height          =   255
         Index           =   74
         Left            =   120
         TabIndex        =   992
         Top             =   9000
         Width           =   375
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   74
         Left            =   480
         TabIndex        =   991
         Top             =   9000
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   74
         Left            =   5280
         TabIndex        =   990
         Top             =   9000
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   74
         Left            =   6360
         TabIndex        =   989
         Top             =   9000
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "73"
         Height          =   255
         Index           =   73
         Left            =   120
         TabIndex        =   986
         Top             =   8760
         Width           =   375
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   73
         Left            =   480
         TabIndex        =   985
         Top             =   8760
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   73
         Left            =   5280
         TabIndex        =   984
         Top             =   8760
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   73
         Left            =   6360
         TabIndex        =   983
         Top             =   8760
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "72"
         Height          =   255
         Index           =   72
         Left            =   120
         TabIndex        =   980
         Top             =   8520
         Width           =   375
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   72
         Left            =   480
         TabIndex        =   979
         Top             =   8520
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   72
         Left            =   5280
         TabIndex        =   978
         Top             =   8520
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   72
         Left            =   6360
         TabIndex        =   977
         Top             =   8520
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "71"
         Height          =   255
         Index           =   71
         Left            =   120
         TabIndex        =   974
         Top             =   8280
         Width           =   375
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   71
         Left            =   480
         TabIndex        =   973
         Top             =   8280
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   71
         Left            =   5280
         TabIndex        =   972
         Top             =   8280
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   71
         Left            =   6360
         TabIndex        =   971
         Top             =   8280
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "70"
         Height          =   255
         Index           =   70
         Left            =   120
         TabIndex        =   968
         Top             =   8040
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   70
         Left            =   480
         TabIndex        =   967
         Top             =   8040
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   70
         Left            =   5280
         TabIndex        =   966
         Top             =   8040
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   70
         Left            =   6360
         TabIndex        =   965
         Top             =   8040
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "69"
         Height          =   255
         Index           =   69
         Left            =   120
         TabIndex        =   962
         Top             =   7800
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   69
         Left            =   480
         TabIndex        =   961
         Top             =   7800
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   69
         Left            =   5280
         TabIndex        =   960
         Top             =   7800
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   69
         Left            =   6360
         TabIndex        =   959
         Top             =   7800
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "68"
         Height          =   255
         Index           =   68
         Left            =   120
         TabIndex        =   956
         Top             =   7560
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   68
         Left            =   480
         TabIndex        =   955
         Top             =   7560
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   68
         Left            =   5280
         TabIndex        =   954
         Top             =   7560
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   68
         Left            =   6360
         TabIndex        =   953
         Top             =   7560
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "67"
         Height          =   255
         Index           =   67
         Left            =   120
         TabIndex        =   950
         Top             =   7320
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   67
         Left            =   480
         TabIndex        =   949
         Top             =   7320
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   67
         Left            =   5280
         TabIndex        =   948
         Top             =   7320
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   67
         Left            =   6360
         TabIndex        =   947
         Top             =   7320
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "66"
         Height          =   255
         Index           =   66
         Left            =   120
         TabIndex        =   944
         Top             =   7080
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   943
         Top             =   7080
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   66
         Left            =   5280
         TabIndex        =   942
         Top             =   7080
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   66
         Left            =   6360
         TabIndex        =   941
         Top             =   7080
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "65"
         Height          =   255
         Index           =   65
         Left            =   120
         TabIndex        =   938
         Top             =   6840
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   937
         Top             =   6840
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   65
         Left            =   5280
         TabIndex        =   936
         Top             =   6840
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   65
         Left            =   6360
         TabIndex        =   935
         Top             =   6840
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "64"
         Height          =   255
         Index           =   64
         Left            =   120
         TabIndex        =   932
         Top             =   6600
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   931
         Top             =   6600
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   64
         Left            =   5280
         TabIndex        =   930
         Top             =   6600
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   64
         Left            =   6360
         TabIndex        =   929
         Top             =   6600
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "63"
         Height          =   255
         Index           =   63
         Left            =   120
         TabIndex        =   926
         Top             =   6360
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   925
         Top             =   6360
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   63
         Left            =   5280
         TabIndex        =   924
         Top             =   6360
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   63
         Left            =   6360
         TabIndex        =   923
         Top             =   6360
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "62"
         Height          =   255
         Index           =   62
         Left            =   120
         TabIndex        =   920
         Top             =   6120
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   919
         Top             =   6120
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   62
         Left            =   5280
         TabIndex        =   918
         Top             =   6120
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   62
         Left            =   6360
         TabIndex        =   917
         Top             =   6120
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "61"
         Height          =   255
         Index           =   61
         Left            =   120
         TabIndex        =   914
         Top             =   5880
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   913
         Top             =   5880
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   61
         Left            =   5280
         TabIndex        =   912
         Top             =   5880
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   61
         Left            =   6360
         TabIndex        =   911
         Top             =   5880
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "60"
         Height          =   255
         Index           =   60
         Left            =   120
         TabIndex        =   908
         Top             =   5640
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   907
         Top             =   5640
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   60
         Left            =   5280
         TabIndex        =   906
         Top             =   5640
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   60
         Left            =   6360
         TabIndex        =   905
         Top             =   5640
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "59"
         Height          =   255
         Index           =   59
         Left            =   120
         TabIndex        =   902
         Top             =   5400
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   901
         Top             =   5400
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   59
         Left            =   5280
         TabIndex        =   900
         Top             =   5400
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   59
         Left            =   6360
         TabIndex        =   899
         Top             =   5400
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "58"
         Height          =   255
         Index           =   58
         Left            =   120
         TabIndex        =   896
         Top             =   5160
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   895
         Top             =   5160
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   58
         Left            =   5280
         TabIndex        =   894
         Top             =   5160
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   58
         Left            =   6360
         TabIndex        =   893
         Top             =   5160
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "57"
         Height          =   255
         Index           =   57
         Left            =   120
         TabIndex        =   890
         Top             =   4920
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   889
         Top             =   4920
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   57
         Left            =   5280
         TabIndex        =   888
         Top             =   4920
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   57
         Left            =   6360
         TabIndex        =   887
         Top             =   4920
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "56"
         Height          =   255
         Index           =   56
         Left            =   120
         TabIndex        =   884
         Top             =   4680
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   883
         Top             =   4680
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   56
         Left            =   5280
         TabIndex        =   882
         Top             =   4680
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   56
         Left            =   6360
         TabIndex        =   881
         Top             =   4680
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "55"
         Height          =   255
         Index           =   55
         Left            =   120
         TabIndex        =   878
         Top             =   4440
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   877
         Top             =   4440
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   55
         Left            =   5280
         TabIndex        =   876
         Top             =   4440
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   55
         Left            =   6360
         TabIndex        =   875
         Top             =   4440
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "54"
         Height          =   255
         Index           =   54
         Left            =   120
         TabIndex        =   872
         Top             =   4200
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   871
         Top             =   4200
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   54
         Left            =   5280
         TabIndex        =   870
         Top             =   4200
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   54
         Left            =   6360
         TabIndex        =   869
         Top             =   4200
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "53"
         Height          =   255
         Index           =   53
         Left            =   120
         TabIndex        =   866
         Top             =   3960
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   865
         Top             =   3960
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   53
         Left            =   5280
         TabIndex        =   864
         Top             =   3960
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   53
         Left            =   6360
         TabIndex        =   863
         Top             =   3960
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "52"
         Height          =   255
         Index           =   52
         Left            =   120
         TabIndex        =   860
         Top             =   3720
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   859
         Top             =   3720
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   52
         Left            =   5280
         TabIndex        =   858
         Top             =   3720
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   52
         Left            =   6360
         TabIndex        =   857
         Top             =   3720
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "51"
         Height          =   255
         Index           =   51
         Left            =   120
         TabIndex        =   854
         Top             =   3480
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   853
         Top             =   3480
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   51
         Left            =   5280
         TabIndex        =   852
         Top             =   3480
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   51
         Left            =   6360
         TabIndex        =   851
         Top             =   3480
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "50"
         Height          =   255
         Index           =   50
         Left            =   120
         TabIndex        =   848
         Top             =   3240
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   847
         Top             =   3240
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   50
         Left            =   5280
         TabIndex        =   846
         Top             =   3240
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   50
         Left            =   6360
         TabIndex        =   845
         Top             =   3240
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "49"
         Height          =   255
         Index           =   49
         Left            =   120
         TabIndex        =   842
         Top             =   3000
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   841
         Top             =   3000
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   49
         Left            =   5280
         TabIndex        =   840
         Top             =   3000
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   49
         Left            =   6360
         TabIndex        =   839
         Top             =   3000
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "48"
         Height          =   255
         Index           =   48
         Left            =   120
         TabIndex        =   836
         Top             =   2760
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   835
         Top             =   2760
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   48
         Left            =   5280
         TabIndex        =   834
         Top             =   2760
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   48
         Left            =   6360
         TabIndex        =   833
         Top             =   2760
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "47"
         Height          =   255
         Index           =   47
         Left            =   120
         TabIndex        =   830
         Top             =   2520
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   829
         Top             =   2520
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   47
         Left            =   5280
         TabIndex        =   828
         Top             =   2520
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   47
         Left            =   6360
         TabIndex        =   827
         Top             =   2520
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "46"
         Height          =   255
         Index           =   46
         Left            =   120
         TabIndex        =   824
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   823
         Top             =   2280
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   46
         Left            =   5280
         TabIndex        =   822
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   46
         Left            =   6360
         TabIndex        =   821
         Top             =   2280
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "45"
         Height          =   255
         Index           =   45
         Left            =   120
         TabIndex        =   818
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   817
         Top             =   2040
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   45
         Left            =   5280
         TabIndex        =   816
         Top             =   2040
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   45
         Left            =   6360
         TabIndex        =   815
         Top             =   2040
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "44"
         Height          =   255
         Index           =   44
         Left            =   120
         TabIndex        =   812
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   811
         Top             =   1800
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   44
         Left            =   5280
         TabIndex        =   810
         Top             =   1800
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   44
         Left            =   6360
         TabIndex        =   809
         Top             =   1800
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "43"
         Height          =   255
         Index           =   43
         Left            =   120
         TabIndex        =   806
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   805
         Top             =   1560
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   43
         Left            =   5280
         TabIndex        =   804
         Top             =   1560
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   43
         Left            =   6360
         TabIndex        =   803
         Top             =   1560
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "42"
         Height          =   255
         Index           =   42
         Left            =   120
         TabIndex        =   800
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   799
         Top             =   1320
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   42
         Left            =   5280
         TabIndex        =   798
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   42
         Left            =   6360
         TabIndex        =   797
         Top             =   1320
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "41"
         Height          =   255
         Index           =   41
         Left            =   120
         TabIndex        =   794
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   793
         Top             =   1080
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   41
         Left            =   5280
         TabIndex        =   792
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   41
         Left            =   6360
         TabIndex        =   791
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "40"
         Height          =   255
         Index           =   40
         Left            =   120
         TabIndex        =   788
         Top             =   840
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   787
         Top             =   840
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   40
         Left            =   5280
         TabIndex        =   786
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   40
         Left            =   6360
         TabIndex        =   785
         Top             =   840
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "39"
         Height          =   255
         Index           =   39
         Left            =   120
         TabIndex        =   782
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   781
         Top             =   600
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   39
         Left            =   5280
         TabIndex        =   780
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   39
         Left            =   6360
         TabIndex        =   779
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "38"
         Height          =   255
         Index           =   38
         Left            =   120
         TabIndex        =   776
         Top             =   360
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "END"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   775
         Top             =   360
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   38
         Left            =   5280
         TabIndex        =   774
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   38
         Left            =   6360
         TabIndex        =   773
         Top             =   360
         Width           =   855
      End
   End
   Begin VB.PictureBox Picture2 
      Height          =   9495
      Index           =   1
      Left            =   7800
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   15
      Top             =   840
      Visible         =   0   'False
      Width           =   7335
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   480
         TabIndex        =   280
         Top             =   9000
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   3000
         TabIndex        =   279
         Top             =   9000
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   4200
         TabIndex        =   278
         Top             =   9000
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   6000
         TabIndex        =   277
         Top             =   9000
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   6720
         TabIndex        =   276
         Top             =   9000
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   74
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   275
         Top             =   9000
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   480
         TabIndex        =   273
         Top             =   8760
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   3000
         TabIndex        =   272
         Top             =   8760
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   4200
         TabIndex        =   271
         Top             =   8760
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   6000
         TabIndex        =   270
         Top             =   8760
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   6720
         TabIndex        =   269
         Top             =   8760
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   73
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   268
         Top             =   8760
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   480
         TabIndex        =   266
         Top             =   8520
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   3000
         TabIndex        =   265
         Top             =   8520
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   4200
         TabIndex        =   264
         Top             =   8520
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   6000
         TabIndex        =   263
         Top             =   8520
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   6720
         TabIndex        =   262
         Top             =   8520
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   72
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   261
         Top             =   8520
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   480
         TabIndex        =   259
         Top             =   8280
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   3000
         TabIndex        =   258
         Top             =   8280
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   4200
         TabIndex        =   257
         Top             =   8280
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   6000
         TabIndex        =   256
         Top             =   8280
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   6720
         TabIndex        =   255
         Top             =   8280
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   71
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   254
         Top             =   8280
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   480
         TabIndex        =   252
         Top             =   8040
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   3000
         TabIndex        =   251
         Top             =   8040
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   4200
         TabIndex        =   250
         Top             =   8040
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   6000
         TabIndex        =   249
         Top             =   8040
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   6720
         TabIndex        =   248
         Top             =   8040
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   70
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   247
         Top             =   8040
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   480
         TabIndex        =   245
         Top             =   7800
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   3000
         TabIndex        =   244
         Top             =   7800
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   4200
         TabIndex        =   243
         Top             =   7800
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   6000
         TabIndex        =   242
         Top             =   7800
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   6720
         TabIndex        =   241
         Top             =   7800
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   69
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   240
         Top             =   7800
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   480
         TabIndex        =   238
         Top             =   7560
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   3000
         TabIndex        =   237
         Top             =   7560
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   4200
         TabIndex        =   236
         Top             =   7560
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   6000
         TabIndex        =   235
         Top             =   7560
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   6720
         TabIndex        =   234
         Top             =   7560
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   68
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   233
         Top             =   7560
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   480
         TabIndex        =   231
         Top             =   7320
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   3000
         TabIndex        =   230
         Top             =   7320
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   4200
         TabIndex        =   229
         Top             =   7320
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   6000
         TabIndex        =   228
         Top             =   7320
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   6720
         TabIndex        =   227
         Top             =   7320
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   67
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   226
         Top             =   7320
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   480
         TabIndex        =   224
         Top             =   7080
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   3000
         TabIndex        =   223
         Top             =   7080
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   4200
         TabIndex        =   222
         Top             =   7080
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   6000
         TabIndex        =   221
         Top             =   7080
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   6720
         TabIndex        =   220
         Top             =   7080
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   66
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   219
         Top             =   7080
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   480
         TabIndex        =   217
         Top             =   6840
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   3000
         TabIndex        =   216
         Top             =   6840
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   4200
         TabIndex        =   215
         Top             =   6840
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   6000
         TabIndex        =   214
         Top             =   6840
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   6720
         TabIndex        =   213
         Top             =   6840
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   65
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   212
         Top             =   6840
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   480
         TabIndex        =   210
         Top             =   6600
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   3000
         TabIndex        =   209
         Top             =   6600
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   4200
         TabIndex        =   208
         Top             =   6600
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   6000
         TabIndex        =   207
         Top             =   6600
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   6720
         TabIndex        =   206
         Top             =   6600
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   64
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   205
         Top             =   6600
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   480
         TabIndex        =   203
         Top             =   6360
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   3000
         TabIndex        =   202
         Top             =   6360
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   4200
         TabIndex        =   201
         Top             =   6360
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   6000
         TabIndex        =   200
         Top             =   6360
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   6720
         TabIndex        =   199
         Top             =   6360
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   63
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   198
         Top             =   6360
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   480
         TabIndex        =   196
         Top             =   6120
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   3000
         TabIndex        =   195
         Top             =   6120
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   4200
         TabIndex        =   194
         Top             =   6120
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   6000
         TabIndex        =   193
         Top             =   6120
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   6720
         TabIndex        =   192
         Top             =   6120
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   62
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   191
         Top             =   6120
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   480
         TabIndex        =   189
         Top             =   5880
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   3000
         TabIndex        =   188
         Top             =   5880
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   4200
         TabIndex        =   187
         Top             =   5880
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   6000
         TabIndex        =   186
         Top             =   5880
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   6720
         TabIndex        =   185
         Top             =   5880
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   61
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   184
         Top             =   5880
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   480
         TabIndex        =   182
         Top             =   5640
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   3000
         TabIndex        =   181
         Top             =   5640
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   4200
         TabIndex        =   180
         Top             =   5640
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   6000
         TabIndex        =   179
         Top             =   5640
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   6720
         TabIndex        =   178
         Top             =   5640
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   60
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   177
         Top             =   5640
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   480
         TabIndex        =   175
         Top             =   5400
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   3000
         TabIndex        =   174
         Top             =   5400
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   4200
         TabIndex        =   173
         Top             =   5400
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   6000
         TabIndex        =   172
         Top             =   5400
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   6720
         TabIndex        =   171
         Top             =   5400
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   59
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   170
         Top             =   5400
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   480
         TabIndex        =   168
         Top             =   5160
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   3000
         TabIndex        =   167
         Top             =   5160
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   4200
         TabIndex        =   166
         Top             =   5160
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   6000
         TabIndex        =   165
         Top             =   5160
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   6720
         TabIndex        =   164
         Top             =   5160
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   58
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   163
         Top             =   5160
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   480
         TabIndex        =   161
         Top             =   4920
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   3000
         TabIndex        =   160
         Top             =   4920
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   4200
         TabIndex        =   159
         Top             =   4920
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   6000
         TabIndex        =   158
         Top             =   4920
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   6720
         TabIndex        =   157
         Top             =   4920
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   57
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   156
         Top             =   4920
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   480
         TabIndex        =   154
         Top             =   4680
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   3000
         TabIndex        =   153
         Top             =   4680
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   4200
         TabIndex        =   152
         Top             =   4680
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   6000
         TabIndex        =   151
         Top             =   4680
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   6720
         TabIndex        =   150
         Top             =   4680
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   56
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   149
         Top             =   4680
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   480
         TabIndex        =   147
         Top             =   4440
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   3000
         TabIndex        =   146
         Top             =   4440
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   4200
         TabIndex        =   145
         Top             =   4440
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   6000
         TabIndex        =   144
         Top             =   4440
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   6720
         TabIndex        =   143
         Top             =   4440
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   55
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   142
         Top             =   4440
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   480
         TabIndex        =   140
         Top             =   4200
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   3000
         TabIndex        =   139
         Top             =   4200
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   4200
         TabIndex        =   138
         Top             =   4200
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   6000
         TabIndex        =   137
         Top             =   4200
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   6720
         TabIndex        =   136
         Top             =   4200
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   54
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   135
         Top             =   4200
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   480
         TabIndex        =   133
         Top             =   3960
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   3000
         TabIndex        =   132
         Top             =   3960
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   4200
         TabIndex        =   131
         Top             =   3960
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   6000
         TabIndex        =   130
         Top             =   3960
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   6720
         TabIndex        =   129
         Top             =   3960
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   53
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   128
         Top             =   3960
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   480
         TabIndex        =   126
         Top             =   3720
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   3000
         TabIndex        =   125
         Top             =   3720
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   4200
         TabIndex        =   124
         Top             =   3720
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   6000
         TabIndex        =   123
         Top             =   3720
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   6720
         TabIndex        =   122
         Top             =   3720
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   52
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   121
         Top             =   3720
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   480
         TabIndex        =   119
         Top             =   3480
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   3000
         TabIndex        =   118
         Top             =   3480
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   4200
         TabIndex        =   117
         Top             =   3480
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   6000
         TabIndex        =   116
         Top             =   3480
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   6720
         TabIndex        =   115
         Top             =   3480
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   51
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   114
         Top             =   3480
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   480
         TabIndex        =   112
         Top             =   3240
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   3000
         TabIndex        =   111
         Top             =   3240
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   4200
         TabIndex        =   110
         Top             =   3240
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   6000
         TabIndex        =   109
         Top             =   3240
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   6720
         TabIndex        =   108
         Top             =   3240
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   50
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   107
         Top             =   3240
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   480
         TabIndex        =   105
         Top             =   3000
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   3000
         TabIndex        =   104
         Top             =   3000
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   4200
         TabIndex        =   103
         Top             =   3000
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   6000
         TabIndex        =   102
         Top             =   3000
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   6720
         TabIndex        =   101
         Top             =   3000
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   49
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   100
         Top             =   3000
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   480
         TabIndex        =   98
         Top             =   2760
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   3000
         TabIndex        =   97
         Top             =   2760
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   4200
         TabIndex        =   96
         Top             =   2760
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   6000
         TabIndex        =   95
         Top             =   2760
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   6720
         TabIndex        =   94
         Top             =   2760
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   48
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   93
         Top             =   2760
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   480
         TabIndex        =   91
         Top             =   2520
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   3000
         TabIndex        =   90
         Top             =   2520
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   4200
         TabIndex        =   89
         Top             =   2520
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   6000
         TabIndex        =   88
         Top             =   2520
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   6720
         TabIndex        =   87
         Top             =   2520
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   47
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   86
         Top             =   2520
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   480
         TabIndex        =   84
         Top             =   2280
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   3000
         TabIndex        =   83
         Top             =   2280
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   4200
         TabIndex        =   82
         Top             =   2280
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   6000
         TabIndex        =   81
         Top             =   2280
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   6720
         TabIndex        =   80
         Top             =   2280
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   46
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   79
         Top             =   2280
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   480
         TabIndex        =   77
         Top             =   2040
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   3000
         TabIndex        =   76
         Top             =   2040
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   4200
         TabIndex        =   75
         Top             =   2040
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   6000
         TabIndex        =   74
         Top             =   2040
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   6720
         TabIndex        =   73
         Top             =   2040
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   45
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   72
         Top             =   2040
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   480
         TabIndex        =   70
         Top             =   1800
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   3000
         TabIndex        =   69
         Top             =   1800
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   4200
         TabIndex        =   68
         Top             =   1800
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   6000
         TabIndex        =   67
         Top             =   1800
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   6720
         TabIndex        =   66
         Top             =   1800
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   44
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   65
         Top             =   1800
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   480
         TabIndex        =   63
         Top             =   1560
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   3000
         TabIndex        =   62
         Top             =   1560
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   4200
         TabIndex        =   61
         Top             =   1560
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   6000
         TabIndex        =   60
         Top             =   1560
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   6720
         TabIndex        =   59
         Top             =   1560
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   43
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   58
         Top             =   1560
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   480
         TabIndex        =   56
         Top             =   1320
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   3000
         TabIndex        =   55
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   4200
         TabIndex        =   54
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   6000
         TabIndex        =   53
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   6720
         TabIndex        =   52
         Top             =   1320
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   42
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   51
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   480
         TabIndex        =   49
         Top             =   1080
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   3000
         TabIndex        =   48
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   4200
         TabIndex        =   47
         Top             =   1080
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   6000
         TabIndex        =   46
         Top             =   1080
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   6720
         TabIndex        =   45
         Top             =   1080
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   41
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   44
         Top             =   1080
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   480
         TabIndex        =   42
         Top             =   840
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   3000
         TabIndex        =   41
         Top             =   840
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   4200
         TabIndex        =   40
         Top             =   840
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   6000
         TabIndex        =   39
         Top             =   840
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   6720
         TabIndex        =   38
         Top             =   840
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   40
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   37
         Top             =   840
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   480
         TabIndex        =   35
         Top             =   600
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   3000
         TabIndex        =   34
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   4200
         TabIndex        =   33
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   6000
         TabIndex        =   32
         Top             =   600
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   6720
         TabIndex        =   31
         Top             =   600
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   39
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   30
         Top             =   600
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   480
         TabIndex        =   28
         Top             =   360
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   3000
         TabIndex        =   27
         Top             =   360
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   4200
         TabIndex        =   26
         Top             =   360
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   6000
         TabIndex        =   25
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   6720
         TabIndex        =   24
         Top             =   360
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   38
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   23
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   480
         Locked          =   -1  'True
         TabIndex        =   21
         Text            =   "AUDIO SG"
         Top             =   120
         Width           =   2535
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   3000
         Locked          =   -1  'True
         TabIndex        =   20
         Text            =   "M.METER"
         Top             =   120
         Width           =   1215
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   4200
         Locked          =   -1  'True
         TabIndex        =   19
         Text            =   "RS232"
         Top             =   120
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   6000
         Locked          =   -1  'True
         TabIndex        =   18
         Text            =   "Wtime"
         Top             =   120
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   6720
         Locked          =   -1  'True
         TabIndex        =   17
         Text            =   "PO"
         Top             =   120
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   75
         Left            =   5280
         Locked          =   -1  'True
         TabIndex        =   16
         Text            =   "RY"
         Top             =   120
         Width           =   735
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "74"
         Height          =   255
         Index           =   74
         Left            =   120
         TabIndex        =   281
         Top             =   9000
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "73"
         Height          =   255
         Index           =   73
         Left            =   120
         TabIndex        =   274
         Top             =   8760
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "72"
         Height          =   255
         Index           =   72
         Left            =   120
         TabIndex        =   267
         Top             =   8520
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "71"
         Height          =   255
         Index           =   71
         Left            =   120
         TabIndex        =   260
         Top             =   8280
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "70"
         Height          =   255
         Index           =   70
         Left            =   120
         TabIndex        =   253
         Top             =   8040
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "69"
         Height          =   255
         Index           =   69
         Left            =   120
         TabIndex        =   246
         Top             =   7800
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "68"
         Height          =   255
         Index           =   68
         Left            =   120
         TabIndex        =   239
         Top             =   7560
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "67"
         Height          =   255
         Index           =   67
         Left            =   120
         TabIndex        =   232
         Top             =   7320
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "66"
         Height          =   255
         Index           =   66
         Left            =   120
         TabIndex        =   225
         Top             =   7080
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "65"
         Height          =   255
         Index           =   65
         Left            =   120
         TabIndex        =   218
         Top             =   6840
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "64"
         Height          =   255
         Index           =   64
         Left            =   120
         TabIndex        =   211
         Top             =   6600
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "63"
         Height          =   255
         Index           =   63
         Left            =   120
         TabIndex        =   204
         Top             =   6360
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "62"
         Height          =   255
         Index           =   62
         Left            =   120
         TabIndex        =   197
         Top             =   6120
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "61"
         Height          =   255
         Index           =   61
         Left            =   120
         TabIndex        =   190
         Top             =   5880
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "60"
         Height          =   255
         Index           =   60
         Left            =   120
         TabIndex        =   183
         Top             =   5640
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "59"
         Height          =   255
         Index           =   59
         Left            =   120
         TabIndex        =   176
         Top             =   5400
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "58"
         Height          =   255
         Index           =   58
         Left            =   120
         TabIndex        =   169
         Top             =   5160
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "57"
         Height          =   255
         Index           =   57
         Left            =   120
         TabIndex        =   162
         Top             =   4920
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "56"
         Height          =   255
         Index           =   56
         Left            =   120
         TabIndex        =   155
         Top             =   4680
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "55"
         Height          =   255
         Index           =   55
         Left            =   120
         TabIndex        =   148
         Top             =   4440
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "54"
         Height          =   255
         Index           =   54
         Left            =   120
         TabIndex        =   141
         Top             =   4200
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "53"
         Height          =   255
         Index           =   53
         Left            =   120
         TabIndex        =   134
         Top             =   3960
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "52"
         Height          =   255
         Index           =   52
         Left            =   120
         TabIndex        =   127
         Top             =   3720
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "51"
         Height          =   255
         Index           =   51
         Left            =   120
         TabIndex        =   120
         Top             =   3480
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "50"
         Height          =   255
         Index           =   50
         Left            =   120
         TabIndex        =   113
         Top             =   3240
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "49"
         Height          =   255
         Index           =   49
         Left            =   120
         TabIndex        =   106
         Top             =   3000
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "48"
         Height          =   255
         Index           =   48
         Left            =   120
         TabIndex        =   99
         Top             =   2760
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "47"
         Height          =   255
         Index           =   47
         Left            =   120
         TabIndex        =   92
         Top             =   2520
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "46"
         Height          =   255
         Index           =   46
         Left            =   120
         TabIndex        =   85
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "45"
         Height          =   255
         Index           =   45
         Left            =   120
         TabIndex        =   78
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "44"
         Height          =   255
         Index           =   44
         Left            =   120
         TabIndex        =   71
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "43"
         Height          =   255
         Index           =   43
         Left            =   120
         TabIndex        =   64
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "42"
         Height          =   255
         Index           =   42
         Left            =   120
         TabIndex        =   57
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "41"
         Height          =   255
         Index           =   41
         Left            =   120
         TabIndex        =   50
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "40"
         Height          =   255
         Index           =   40
         Left            =   120
         TabIndex        =   43
         Top             =   840
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "39"
         Height          =   255
         Index           =   39
         Left            =   120
         TabIndex        =   36
         Top             =   600
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "38"
         Height          =   255
         Index           =   38
         Left            =   120
         TabIndex        =   29
         Top             =   360
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   255
         Index           =   75
         Left            =   120
         TabIndex        =   22
         Top             =   120
         Width           =   375
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   9495
      Index           =   0
      Left            =   240
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   2
      Top             =   840
      Width           =   7335
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   37
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   766
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
         TabIndex        =   765
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
         TabIndex        =   760
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
         TabIndex        =   759
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
         TabIndex        =   754
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
         TabIndex        =   753
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
         TabIndex        =   748
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
         TabIndex        =   747
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
         TabIndex        =   742
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
         TabIndex        =   741
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
         TabIndex        =   736
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
         TabIndex        =   735
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
         TabIndex        =   730
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
         TabIndex        =   729
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
         TabIndex        =   724
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
         TabIndex        =   723
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
         TabIndex        =   718
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
         TabIndex        =   717
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
         TabIndex        =   712
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
         TabIndex        =   711
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
         TabIndex        =   706
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
         TabIndex        =   705
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
         TabIndex        =   700
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
         TabIndex        =   699
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
         TabIndex        =   694
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
         TabIndex        =   693
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
         TabIndex        =   688
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
         TabIndex        =   687
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
         TabIndex        =   682
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
         TabIndex        =   681
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
         TabIndex        =   676
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
         TabIndex        =   675
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
         TabIndex        =   670
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
         TabIndex        =   669
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
         TabIndex        =   664
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
         TabIndex        =   663
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
         TabIndex        =   658
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
         TabIndex        =   657
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
         TabIndex        =   652
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
         TabIndex        =   651
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
         TabIndex        =   646
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
         TabIndex        =   645
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
         TabIndex        =   640
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
         TabIndex        =   639
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
         TabIndex        =   634
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
         TabIndex        =   633
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
         TabIndex        =   628
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
         TabIndex        =   627
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
         TabIndex        =   622
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
         TabIndex        =   621
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
         TabIndex        =   616
         Top             =   3000
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   12
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   615
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
         TabIndex        =   610
         Top             =   2760
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   11
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   609
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
         TabIndex        =   604
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
         TabIndex        =   603
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
         TabIndex        =   598
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
         TabIndex        =   597
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
         TabIndex        =   592
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
         TabIndex        =   591
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
         TabIndex        =   586
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
         TabIndex        =   585
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
         TabIndex        =   580
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
         TabIndex        =   579
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
         TabIndex        =   574
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
         TabIndex        =   573
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
         TabIndex        =   568
         Top             =   1080
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   4
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   567
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
         TabIndex        =   562
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
         TabIndex        =   561
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
         TabIndex        =   556
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
         TabIndex        =   555
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox Hi 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0FFFF&
         Height          =   270
         Index           =   1
         Left            =   3120
         MaxLength       =   6
         TabIndex        =   550
         Top             =   360
         Width           =   1095
      End
      Begin VB.TextBox Low 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         Height          =   270
         Index           =   1
         Left            =   4200
         MaxLength       =   6
         TabIndex        =   549
         Top             =   360
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
         TabIndex        =   6
         Text            =   "Low"
         Top             =   120
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
         TabIndex        =   5
         Text            =   "Hi"
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "37"
         Height          =   255
         Index           =   37
         Left            =   120
         TabIndex        =   770
         Top             =   9000
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ヘッドホン低域f特測定Rch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   769
         Top             =   9000
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   37
         Left            =   5280
         TabIndex        =   768
         Top             =   9000
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   37
         Left            =   6360
         TabIndex        =   767
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
         TabIndex        =   764
         Top             =   8760
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ヘッドホン低域f特測定Lch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   763
         Top             =   8760
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   36
         Left            =   5280
         TabIndex        =   762
         Top             =   8760
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   36
         Left            =   6360
         TabIndex        =   761
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
         TabIndex        =   758
         Top             =   8520
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INT_INヘッドホン歪率測定Rch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   757
         Top             =   8520
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   35
         Left            =   5280
         TabIndex        =   756
         Top             =   8520
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   35
         Left            =   6360
         TabIndex        =   755
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
         TabIndex        =   752
         Top             =   8280
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INT_INヘッドホン歪率測定Lch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   751
         Top             =   8280
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   34
         Left            =   5280
         TabIndex        =   750
         Top             =   8280
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   34
         Left            =   6360
         TabIndex        =   749
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
         TabIndex        =   746
         Top             =   8040
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INT_INヘッドホンS/N測定Rch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   745
         Top             =   8040
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   33
         Left            =   5280
         TabIndex        =   744
         Top             =   8040
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   33
         Left            =   6360
         TabIndex        =   743
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
         TabIndex        =   740
         Top             =   7800
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INT_INヘッドホンS/N測定Lch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   739
         Top             =   7800
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   32
         Left            =   5280
         TabIndex        =   738
         Top             =   7800
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   32
         Left            =   6360
         TabIndex        =   737
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
         TabIndex        =   734
         Top             =   7560
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "チャンネルバランス測定L-R"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   733
         Top             =   7560
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   31
         Left            =   5280
         TabIndex        =   732
         Top             =   7560
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   31
         Left            =   6360
         TabIndex        =   731
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
         TabIndex        =   728
         Top             =   7320
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "INTSTMICヘッドホン出力確認L"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   727
         Top             =   7320
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   30
         Left            =   5280
         TabIndex        =   726
         Top             =   7320
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   30
         Left            =   6360
         TabIndex        =   725
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
         TabIndex        =   722
         Top             =   7080
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ヘッドホン最大出力測定R"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   721
         Top             =   7080
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   29
         Left            =   5280
         TabIndex        =   720
         Top             =   7080
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   29
         Left            =   6360
         TabIndex        =   719
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
         TabIndex        =   716
         Top             =   6840
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ヘッドホン最大出力測定L"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   715
         Top             =   6840
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   28
         Left            =   5280
         TabIndex        =   714
         Top             =   6840
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   28
         Left            =   6360
         TabIndex        =   713
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
         TabIndex        =   710
         Top             =   6600
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホン高域f特測定Rch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   709
         Top             =   6600
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   27
         Left            =   5280
         TabIndex        =   708
         Top             =   6600
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   27
         Left            =   6360
         TabIndex        =   707
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
         TabIndex        =   704
         Top             =   6360
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXT_ヘッドホン高域f特測定Lch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   703
         Top             =   6360
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   26
         Left            =   5280
         TabIndex        =   702
         Top             =   6360
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   26
         Left            =   6360
         TabIndex        =   701
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
         TabIndex        =   698
         Top             =   6120
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホン低域f特測定Rch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   697
         Top             =   6120
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   25
         Left            =   5280
         TabIndex        =   696
         Top             =   6120
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   25
         Left            =   6360
         TabIndex        =   695
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
         TabIndex        =   692
         Top             =   5880
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホン低域f特測定Lch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   691
         Top             =   5880
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   24
         Left            =   5280
         TabIndex        =   690
         Top             =   5880
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   24
         Left            =   6360
         TabIndex        =   689
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
         TabIndex        =   686
         Top             =   5640
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXT_ヘッドホン歪率測定Rch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   685
         Top             =   5640
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   23
         Left            =   5280
         TabIndex        =   684
         Top             =   5640
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   23
         Left            =   6360
         TabIndex        =   683
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
         TabIndex        =   680
         Top             =   5400
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホン歪率測定Lch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   679
         Top             =   5400
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   22
         Left            =   5280
         TabIndex        =   678
         Top             =   5400
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   22
         Left            =   6360
         TabIndex        =   677
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
         TabIndex        =   674
         Top             =   5160
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホンS/N測定Rch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   673
         Top             =   5160
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   21
         Left            =   5280
         TabIndex        =   672
         Top             =   5160
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   21
         Left            =   6360
         TabIndex        =   671
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
         TabIndex        =   668
         Top             =   4920
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTヘッドホンS/N測定Lch"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   667
         Top             =   4920
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   20
         Left            =   5280
         TabIndex        =   666
         Top             =   4920
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   20
         Left            =   6360
         TabIndex        =   665
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
         TabIndex        =   662
         Top             =   4680
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTチャンネルバランス測定L-R"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   661
         Top             =   4680
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   19
         Left            =   5280
         TabIndex        =   660
         Top             =   4680
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   19
         Left            =   6360
         TabIndex        =   659
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
         TabIndex        =   656
         Top             =   4440
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "EXTSTMICヘッドホン出力確認L"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   655
         Top             =   4440
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   18
         Left            =   5280
         TabIndex        =   654
         Top             =   4440
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   18
         Left            =   6360
         TabIndex        =   653
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
         TabIndex        =   650
         Top             =   4200
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー実用最大出力測定"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   649
         Top             =   4200
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   17
         Left            =   5280
         TabIndex        =   648
         Top             =   4200
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   17
         Left            =   6360
         TabIndex        =   647
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
         TabIndex        =   644
         Top             =   3960
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "10%以下歪率確認"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   643
         Top             =   3960
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   16
         Left            =   5280
         TabIndex        =   642
         Top             =   3960
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   16
         Left            =   6360
         TabIndex        =   641
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
         TabIndex        =   638
         Top             =   3720
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー最大出力測定"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   637
         Top             =   3720
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   15
         Left            =   5280
         TabIndex        =   636
         Top             =   3720
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   15
         Left            =   6360
         TabIndex        =   635
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
         TabIndex        =   632
         Top             =   3480
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー高域f特測定"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   631
         Top             =   3480
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   14
         Left            =   5280
         TabIndex        =   630
         Top             =   3480
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   14
         Left            =   6360
         TabIndex        =   629
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
         TabIndex        =   626
         Top             =   3240
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー低域f特測定"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   625
         Top             =   3240
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   13
         Left            =   5280
         TabIndex        =   624
         Top             =   3240
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   13
         Left            =   6360
         TabIndex        =   623
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
         TabIndex        =   620
         Top             =   3000
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー歪率測定"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   619
         Top             =   3000
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   12
         Left            =   5280
         TabIndex        =   618
         Top             =   3000
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   12
         Left            =   6360
         TabIndex        =   617
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
         TabIndex        =   614
         Top             =   2760
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカーS/N測定"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   613
         Top             =   2760
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   11
         Left            =   5280
         TabIndex        =   612
         Top             =   2760
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   11
         Left            =   6360
         TabIndex        =   611
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
         TabIndex        =   608
         Top             =   2520
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "SP ANP動作時電流測定"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   607
         Top             =   2520
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   10
         Left            =   5280
         TabIndex        =   606
         Top             =   2520
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   10
         Left            =   6360
         TabIndex        =   605
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
         TabIndex        =   602
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "スピーカー出力レベル確認"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   601
         Top             =   2280
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   5280
         TabIndex        =   600
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   6360
         TabIndex        =   599
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
         TabIndex        =   596
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Audio Test Start"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   595
         Top             =   2040
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   5280
         TabIndex        =   594
         Top             =   2040
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   6360
         TabIndex        =   593
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
         TabIndex        =   590
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "MIMOSA Version Check"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   589
         Top             =   1800
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   7
         Left            =   5280
         TabIndex        =   588
         Top             =   1800
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   7
         Left            =   6360
         TabIndex        =   587
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
         TabIndex        =   584
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VDD_DSP1"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   583
         Top             =   1560
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   6
         Left            =   5280
         TabIndex        =   582
         Top             =   1560
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   6
         Left            =   6360
         TabIndex        =   581
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
         TabIndex        =   578
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VCORE"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   577
         Top             =   1320
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   5280
         TabIndex        =   576
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   6360
         TabIndex        =   575
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
         TabIndex        =   572
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VDD_IO1"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   571
         Top             =   1080
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   4
         Left            =   5280
         TabIndex        =   570
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   4
         Left            =   6360
         TabIndex        =   569
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
         TabIndex        =   566
         Top             =   840
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VUPDDC"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   565
         Top             =   840
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   3
         Left            =   5280
         TabIndex        =   564
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   3
         Left            =   6360
         TabIndex        =   563
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
         TabIndex        =   560
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Check VUNREG"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   559
         Top             =   600
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   2
         Left            =   5280
         TabIndex        =   558
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
         TabIndex        =   557
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   554
         Top             =   360
         Width           =   375
      End
      Begin VB.Label Itme 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "START"
         BeginProperty Font 
            Name            =   "Arial"
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
         TabIndex        =   553
         Top             =   360
         Width           =   2655
      End
      Begin VB.Label Measure 
         Alignment       =   1  'Right Justify
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2.50"
         Height          =   255
         Index           =   1
         Left            =   5280
         TabIndex        =   552
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BackColor       =   &H0000FF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         Height          =   255
         Index           =   1
         Left            =   6360
         TabIndex        =   551
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Judge 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Judge"
         Height          =   255
         Index           =   0
         Left            =   6360
         TabIndex        =   8
         Top             =   120
         Width           =   855
      End
      Begin VB.Label Measure 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Measure"
         Height          =   255
         Index           =   0
         Left            =   5280
         TabIndex        =   7
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label Itme 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Itme"
         Height          =   255
         Index           =   0
         Left            =   480
         TabIndex        =   4
         Top             =   120
         Width           =   2655
      End
      Begin VB.Label Meano 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   3
         Top             =   120
         Width           =   375
      End
   End
   Begin VB.PictureBox Picture2 
      Height          =   9495
      Index           =   0
      Left            =   240
      ScaleHeight     =   9435
      ScaleWidth      =   7275
      TabIndex        =   282
      Top             =   840
      Visible         =   0   'False
      Width           =   7335
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   3000
         TabIndex        =   287
         Top             =   9000
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   3000
         TabIndex        =   293
         Top             =   8760
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   3000
         TabIndex        =   299
         Top             =   8520
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   3000
         TabIndex        =   305
         Top             =   8280
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   3000
         TabIndex        =   311
         Top             =   8040
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   3000
         TabIndex        =   317
         Top             =   7800
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   3000
         TabIndex        =   323
         Top             =   7560
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   3000
         TabIndex        =   329
         Top             =   7320
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   3000
         TabIndex        =   335
         Top             =   7080
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   3000
         TabIndex        =   341
         Top             =   6840
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   3000
         TabIndex        =   347
         Top             =   6600
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   3000
         TabIndex        =   353
         Top             =   6360
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   3000
         TabIndex        =   359
         Top             =   6120
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   3000
         TabIndex        =   365
         Top             =   5880
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   3000
         TabIndex        =   371
         Top             =   5640
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   3000
         TabIndex        =   377
         Top             =   5400
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   3000
         TabIndex        =   383
         Top             =   5160
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   3000
         TabIndex        =   389
         Top             =   4920
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   3000
         TabIndex        =   395
         Top             =   4680
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   3000
         TabIndex        =   401
         Top             =   4440
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   3000
         TabIndex        =   407
         Top             =   4200
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   3000
         TabIndex        =   413
         Top             =   3960
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   3000
         TabIndex        =   419
         Top             =   3720
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   3000
         TabIndex        =   425
         Top             =   3480
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   3000
         TabIndex        =   431
         Top             =   3240
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   3000
         TabIndex        =   437
         Top             =   3000
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   3000
         TabIndex        =   443
         Top             =   2760
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   3000
         TabIndex        =   449
         Top             =   2520
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   3000
         TabIndex        =   455
         Top             =   2280
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   3000
         TabIndex        =   461
         Top             =   2040
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   3000
         TabIndex        =   467
         Top             =   1800
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   3000
         TabIndex        =   473
         Top             =   1560
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   3000
         TabIndex        =   479
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   3000
         TabIndex        =   485
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   3000
         TabIndex        =   491
         Top             =   840
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   3000
         TabIndex        =   497
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   3000
         TabIndex        =   503
         Top             =   360
         Width           =   1215
      End
      Begin VB.TextBox Mmeter 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   3000
         Locked          =   -1  'True
         TabIndex        =   509
         Text            =   "M.METER"
         Top             =   120
         Width           =   1215
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   480
         TabIndex        =   288
         Top             =   9000
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   4200
         TabIndex        =   286
         Top             =   9000
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   6000
         TabIndex        =   285
         Top             =   9000
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   6720
         TabIndex        =   284
         Top             =   9000
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   37
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   283
         Top             =   9000
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   480
         TabIndex        =   294
         Top             =   8760
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   4200
         TabIndex        =   292
         Top             =   8760
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   6000
         TabIndex        =   291
         Top             =   8760
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   6720
         TabIndex        =   290
         Top             =   8760
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   36
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   289
         Top             =   8760
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   480
         TabIndex        =   300
         Top             =   8520
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   4200
         TabIndex        =   298
         Top             =   8520
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   6000
         TabIndex        =   297
         Top             =   8520
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   6720
         TabIndex        =   296
         Top             =   8520
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   35
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   295
         Top             =   8520
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   480
         TabIndex        =   306
         Top             =   8280
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   4200
         TabIndex        =   304
         Top             =   8280
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   6000
         TabIndex        =   303
         Top             =   8280
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   6720
         TabIndex        =   302
         Top             =   8280
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   34
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   301
         Top             =   8280
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   480
         TabIndex        =   312
         Top             =   8040
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   4200
         TabIndex        =   310
         Top             =   8040
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   6000
         TabIndex        =   309
         Top             =   8040
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   6720
         TabIndex        =   308
         Top             =   8040
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   33
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   307
         Top             =   8040
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   480
         TabIndex        =   318
         Top             =   7800
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   4200
         TabIndex        =   316
         Top             =   7800
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   6000
         TabIndex        =   315
         Top             =   7800
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   6720
         TabIndex        =   314
         Top             =   7800
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   32
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   313
         Top             =   7800
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   480
         TabIndex        =   324
         Top             =   7560
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   4200
         TabIndex        =   322
         Top             =   7560
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   6000
         TabIndex        =   321
         Top             =   7560
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   6720
         TabIndex        =   320
         Top             =   7560
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   31
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   319
         Top             =   7560
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   480
         TabIndex        =   330
         Top             =   7320
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   4200
         TabIndex        =   328
         Top             =   7320
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   6000
         TabIndex        =   327
         Top             =   7320
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   6720
         TabIndex        =   326
         Top             =   7320
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   30
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   325
         Top             =   7320
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   480
         TabIndex        =   336
         Top             =   7080
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   4200
         TabIndex        =   334
         Top             =   7080
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   6000
         TabIndex        =   333
         Top             =   7080
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   6720
         TabIndex        =   332
         Top             =   7080
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   29
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   331
         Top             =   7080
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   480
         TabIndex        =   342
         Top             =   6840
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   4200
         TabIndex        =   340
         Top             =   6840
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   6000
         TabIndex        =   339
         Top             =   6840
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   6720
         TabIndex        =   338
         Top             =   6840
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   28
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   337
         Top             =   6840
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   480
         TabIndex        =   348
         Top             =   6600
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   4200
         TabIndex        =   346
         Top             =   6600
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   6000
         TabIndex        =   345
         Top             =   6600
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   6720
         TabIndex        =   344
         Top             =   6600
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   27
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   343
         Top             =   6600
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   480
         TabIndex        =   354
         Top             =   6360
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   4200
         TabIndex        =   352
         Top             =   6360
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   6000
         TabIndex        =   351
         Top             =   6360
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   6720
         TabIndex        =   350
         Top             =   6360
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   26
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   349
         Top             =   6360
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   480
         TabIndex        =   360
         Top             =   6120
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   4200
         TabIndex        =   358
         Top             =   6120
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   6000
         TabIndex        =   357
         Top             =   6120
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   6720
         TabIndex        =   356
         Top             =   6120
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   25
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   355
         Top             =   6120
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   480
         TabIndex        =   366
         Top             =   5880
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   4200
         TabIndex        =   364
         Top             =   5880
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   6000
         TabIndex        =   363
         Top             =   5880
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   6720
         TabIndex        =   362
         Top             =   5880
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   24
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   361
         Top             =   5880
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   480
         TabIndex        =   372
         Top             =   5640
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   4200
         TabIndex        =   370
         Top             =   5640
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   6000
         TabIndex        =   369
         Top             =   5640
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   6720
         TabIndex        =   368
         Top             =   5640
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   23
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   367
         Top             =   5640
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   480
         TabIndex        =   378
         Top             =   5400
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   4200
         TabIndex        =   376
         Top             =   5400
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   6000
         TabIndex        =   375
         Top             =   5400
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   6720
         TabIndex        =   374
         Top             =   5400
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   22
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   373
         Top             =   5400
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   480
         TabIndex        =   384
         Top             =   5160
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   4200
         TabIndex        =   382
         Top             =   5160
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   6000
         TabIndex        =   381
         Top             =   5160
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   6720
         TabIndex        =   380
         Top             =   5160
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   21
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   379
         Top             =   5160
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   480
         TabIndex        =   390
         Top             =   4920
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   4200
         TabIndex        =   388
         Top             =   4920
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   6000
         TabIndex        =   387
         Top             =   4920
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   6720
         TabIndex        =   386
         Top             =   4920
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   20
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   385
         Top             =   4920
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   480
         TabIndex        =   396
         Top             =   4680
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   4200
         TabIndex        =   394
         Top             =   4680
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   6000
         TabIndex        =   393
         Top             =   4680
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   6720
         TabIndex        =   392
         Top             =   4680
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   19
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   391
         Top             =   4680
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   480
         TabIndex        =   402
         Top             =   4440
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   4200
         TabIndex        =   400
         Top             =   4440
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   6000
         TabIndex        =   399
         Top             =   4440
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   6720
         TabIndex        =   398
         Top             =   4440
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   18
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   397
         Top             =   4440
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   480
         TabIndex        =   408
         Top             =   4200
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   4200
         TabIndex        =   406
         Top             =   4200
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   6000
         TabIndex        =   405
         Top             =   4200
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   6720
         TabIndex        =   404
         Top             =   4200
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   17
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   403
         Top             =   4200
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   480
         TabIndex        =   414
         Top             =   3960
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   4200
         TabIndex        =   412
         Top             =   3960
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   6000
         TabIndex        =   411
         Top             =   3960
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   6720
         TabIndex        =   410
         Top             =   3960
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   16
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   409
         Top             =   3960
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   480
         TabIndex        =   420
         Top             =   3720
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   4200
         TabIndex        =   418
         Top             =   3720
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   6000
         TabIndex        =   417
         Top             =   3720
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   6720
         TabIndex        =   416
         Top             =   3720
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   15
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   415
         Top             =   3720
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   480
         TabIndex        =   426
         Top             =   3480
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   4200
         TabIndex        =   424
         Top             =   3480
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   6000
         TabIndex        =   423
         Top             =   3480
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   6720
         TabIndex        =   422
         Top             =   3480
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   14
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   421
         Top             =   3480
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   480
         TabIndex        =   432
         Top             =   3240
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   4200
         TabIndex        =   430
         Top             =   3240
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   6000
         TabIndex        =   429
         Top             =   3240
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   6720
         TabIndex        =   428
         Top             =   3240
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   13
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   427
         Top             =   3240
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   480
         TabIndex        =   438
         Top             =   3000
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   4200
         TabIndex        =   436
         Top             =   3000
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   6000
         TabIndex        =   435
         Top             =   3000
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   6720
         TabIndex        =   434
         Top             =   3000
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   12
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   433
         Top             =   3000
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   480
         TabIndex        =   444
         Top             =   2760
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   4200
         TabIndex        =   442
         Top             =   2760
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   6000
         TabIndex        =   441
         Top             =   2760
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   6720
         TabIndex        =   440
         Top             =   2760
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   11
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   439
         Top             =   2760
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   480
         TabIndex        =   450
         Top             =   2520
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   4200
         TabIndex        =   448
         Top             =   2520
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   6000
         TabIndex        =   447
         Top             =   2520
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   6720
         TabIndex        =   446
         Top             =   2520
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   10
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   445
         Top             =   2520
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   480
         TabIndex        =   456
         Top             =   2280
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   4200
         TabIndex        =   454
         Top             =   2280
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   6000
         TabIndex        =   453
         Top             =   2280
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   6720
         TabIndex        =   452
         Top             =   2280
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   9
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   451
         Top             =   2280
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   480
         TabIndex        =   462
         Top             =   2040
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   4200
         TabIndex        =   460
         Top             =   2040
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   6000
         TabIndex        =   459
         Top             =   2040
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   6720
         TabIndex        =   458
         Top             =   2040
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   8
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   457
         Top             =   2040
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   480
         TabIndex        =   468
         Top             =   1800
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   4200
         TabIndex        =   466
         Top             =   1800
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   6000
         TabIndex        =   465
         Top             =   1800
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   6720
         TabIndex        =   464
         Top             =   1800
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   7
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   463
         Top             =   1800
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   480
         TabIndex        =   474
         Top             =   1560
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   4200
         TabIndex        =   472
         Top             =   1560
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   6000
         TabIndex        =   471
         Top             =   1560
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   6720
         TabIndex        =   470
         Top             =   1560
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   6
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   469
         Top             =   1560
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   480
         TabIndex        =   480
         Top             =   1320
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   4200
         TabIndex        =   478
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   6000
         TabIndex        =   477
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   6720
         TabIndex        =   476
         Top             =   1320
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   5
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   475
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   480
         TabIndex        =   486
         Top             =   1080
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   4200
         TabIndex        =   484
         Top             =   1080
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   6000
         TabIndex        =   483
         Top             =   1080
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   6720
         TabIndex        =   482
         Top             =   1080
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   4
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   481
         Top             =   1080
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   480
         TabIndex        =   492
         Top             =   840
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   4200
         TabIndex        =   490
         Top             =   840
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   6000
         TabIndex        =   489
         Top             =   840
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   6720
         TabIndex        =   488
         Top             =   840
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   3
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   487
         Top             =   840
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   480
         TabIndex        =   498
         Top             =   600
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   4200
         TabIndex        =   496
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   6000
         TabIndex        =   495
         Top             =   600
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   6720
         TabIndex        =   494
         Top             =   600
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   2
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   493
         Top             =   600
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   480
         TabIndex        =   504
         Top             =   360
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   4200
         TabIndex        =   502
         Top             =   360
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   6000
         TabIndex        =   501
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   6720
         TabIndex        =   500
         Top             =   360
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   1
         Left            =   5280
         MaxLength       =   6
         TabIndex        =   499
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox Asg 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   480
         Locked          =   -1  'True
         TabIndex        =   510
         Text            =   "AUDIO SG"
         Top             =   120
         Width           =   2535
      End
      Begin VB.TextBox Rs232send 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   4200
         Locked          =   -1  'True
         TabIndex        =   508
         Text            =   "RS232"
         Top             =   120
         Width           =   1095
      End
      Begin VB.TextBox Wtime 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   6000
         Locked          =   -1  'True
         TabIndex        =   507
         Text            =   "Wtime"
         Top             =   120
         Width           =   735
      End
      Begin VB.TextBox Po 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   6720
         Locked          =   -1  'True
         TabIndex        =   506
         Text            =   "PO"
         Top             =   120
         Width           =   495
      End
      Begin VB.TextBox Ry 
         Alignment       =   2  'Center
         Height          =   270
         Index           =   0
         Left            =   5280
         Locked          =   -1  'True
         TabIndex        =   505
         Text            =   "RY"
         Top             =   120
         Width           =   735
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "37"
         Height          =   255
         Index           =   37
         Left            =   120
         TabIndex        =   511
         Top             =   9000
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "36"
         Height          =   255
         Index           =   36
         Left            =   120
         TabIndex        =   512
         Top             =   8760
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "35"
         Height          =   255
         Index           =   35
         Left            =   120
         TabIndex        =   513
         Top             =   8520
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "34"
         Height          =   255
         Index           =   34
         Left            =   120
         TabIndex        =   514
         Top             =   8280
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "33"
         Height          =   255
         Index           =   33
         Left            =   120
         TabIndex        =   515
         Top             =   8040
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "32"
         Height          =   255
         Index           =   32
         Left            =   120
         TabIndex        =   516
         Top             =   7800
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "31"
         Height          =   255
         Index           =   31
         Left            =   120
         TabIndex        =   517
         Top             =   7560
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "30"
         Height          =   255
         Index           =   30
         Left            =   120
         TabIndex        =   518
         Top             =   7320
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "29"
         Height          =   255
         Index           =   29
         Left            =   120
         TabIndex        =   519
         Top             =   7080
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "28"
         Height          =   255
         Index           =   28
         Left            =   120
         TabIndex        =   520
         Top             =   6840
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "27"
         Height          =   255
         Index           =   27
         Left            =   120
         TabIndex        =   521
         Top             =   6600
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "26"
         Height          =   255
         Index           =   26
         Left            =   120
         TabIndex        =   522
         Top             =   6360
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "25"
         Height          =   255
         Index           =   25
         Left            =   120
         TabIndex        =   523
         Top             =   6120
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "24"
         Height          =   255
         Index           =   24
         Left            =   120
         TabIndex        =   524
         Top             =   5880
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "23"
         Height          =   255
         Index           =   23
         Left            =   120
         TabIndex        =   525
         Top             =   5640
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "22"
         Height          =   255
         Index           =   22
         Left            =   120
         TabIndex        =   526
         Top             =   5400
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "21"
         Height          =   255
         Index           =   21
         Left            =   120
         TabIndex        =   527
         Top             =   5160
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "20"
         Height          =   255
         Index           =   20
         Left            =   120
         TabIndex        =   528
         Top             =   4920
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "19"
         Height          =   255
         Index           =   19
         Left            =   120
         TabIndex        =   529
         Top             =   4680
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "18"
         Height          =   255
         Index           =   18
         Left            =   120
         TabIndex        =   530
         Top             =   4440
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "17"
         Height          =   255
         Index           =   17
         Left            =   120
         TabIndex        =   531
         Top             =   4200
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "16"
         Height          =   255
         Index           =   16
         Left            =   120
         TabIndex        =   532
         Top             =   3960
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "15"
         Height          =   255
         Index           =   15
         Left            =   120
         TabIndex        =   533
         Top             =   3720
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "14"
         Height          =   255
         Index           =   14
         Left            =   120
         TabIndex        =   534
         Top             =   3480
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "13"
         Height          =   255
         Index           =   13
         Left            =   120
         TabIndex        =   535
         Top             =   3240
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "12"
         Height          =   255
         Index           =   12
         Left            =   120
         TabIndex        =   536
         Top             =   3000
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "11"
         Height          =   255
         Index           =   11
         Left            =   120
         TabIndex        =   537
         Top             =   2760
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "10"
         Height          =   255
         Index           =   10
         Left            =   120
         TabIndex        =   538
         Top             =   2520
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "9"
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   539
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "8"
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   540
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "7"
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   541
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "6"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   542
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "5"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   543
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "4"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   544
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "3"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   545
         Top             =   840
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   546
         Top             =   600
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   547
         Top             =   360
         Width           =   375
      End
      Begin VB.Label STEPno 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "NO"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   548
         Top             =   120
         Width           =   375
      End
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "作成：香港十和田生产技术课"
      Height          =   180
      Left            =   6240
      TabIndex        =   1
      Top             =   600
      Width           =   2340
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "ICX236 CHECKER PROGRAM"
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
      Left            =   5040
      TabIndex        =   0
      Top             =   120
      Width           =   4350
   End
End
Attribute VB_Name = "ICX236"
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
  Write #1, Meano(i), Itme(i).Caption, Hi(i), Low(i), Asg(i), Mmeter(i), Rs232send(i), Ry(i), Wtime(i), Po(i)
  Next i
Write #1, Time$, Date$
   Close #1
End Sub

Private Sub Command4_Click() '条件设定
If Command4.Caption = "条件设定" Then
Command4.Caption = "返回"
Picture1(0).Visible = False
Picture1(1).Visible = False
Picture2(0).Visible = True
Picture2(1).Visible = True
Command3.Enabled = False
Else
Command4.Caption = "条件设定"
Picture2(0).Visible = False
Picture2(1).Visible = False
Picture1(0).Visible = True
Picture1(1).Visible = True
Command3.Enabled = True
End If
End Sub

Private Sub Command5_Click()
Unload Me
End
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



Private Sub Form_Activate()
Open App.Path & "\Setting" For Input As #2 '数据LOAD
For i = 1 To Stepmax
  'Input #2, Meano(i), Itme(i).Caption, Hi(i), Low(i), Asg(i), Mmeter(i), Rs232send(i), Ry(i), Wtime(i), Po(i)
   Input #2, Sdata(i, 0), Sdata(i, 1), Sdata(i, 2), Sdata(i, 3), Cdata(i, 1), Cdata(i, 2), Cdata(i, 3), Cdata(i, 4), Cdata(i, 5), Cdata(i, 6)
   Meano(i) = Sdata(i, 0)
   Itme(i).Caption = Sdata(i, 1)
   Hi(i) = Sdata(i, 2)
   Low(i) = Sdata(i, 3)
   Asg(i) = Cdata(i, 1)
   Mmeter(i) = Cdata(i, 2)
   Rs232send(i) = Cdata(i, 3)
   Ry(i) = Cdata(i, 4)
   Wtime(i) = Cdata(i, 5)
   Po(i) = Cdata(i, 6)
  Next i
 Close #2
 LOCKED
Stopinf = 0
 TESTstart
End Sub

Private Sub Form_Deactivate()
Stopinf = 1
End Sub

Private Sub Form_Load()
AUDIOadr = 7
 R64Adr = 3
GPibini    'GPIB初始化
DIOINIT   'io初始化
IOini 'io输出初始化
If IOread = 1 Then
Sleep (500)
Call IOwrite(4, 1)
Sleep (1000)
Call IOwrite(4, 0)
End If
SokuteikiInt  '测量仪初始化
MSComm1.PortOpen = True '打开端口
MSComm1.RThreshold = 1
Stepmax = 70
Resetting    '屏幕初始化
command6_Click
End Sub
Public Sub Closedevice()
PIODIO_DriverClose
ilonl AUDIOadr, 0
ilonl R64Adr, 0
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


Private Sub GPIBCleanup(msg$)
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
If Stepitme = 24 Or Stepitme = 37 Then Exit Function
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
'Public Function GPread1(adr) 'interface gpib
'
'Dim RecvLen As Long
'    ' Receives data from a specified device.
'    RecvLen = 32
'    OutpDevAdrsTbl(0) = adr
'    OutpDevAdrsTbl(1) = -1
'  nRet = PciGpibExMastRecvData(nBoardNo, OutpDevAdrsTbl(0), RecvLen, RecvBuffer, 0)
'    If nRet Then
'    Call DsplyErrMessage(nRet)
'        Select Case adrrs
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
'
' tmp! = Val(RecvBuffer)
' GPread = tmp!
'End Function

Public Sub GPIBwr(adrrs As Integer, CMD As String)
If Stepitme = 24 Or Stepitme = 37 Then Exit Sub
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
IOin = IOread
IOin = IOin And 2
DoEvents  '循环等待期间其他事件响应ON/OFF
Loop Until IOin > 0
Do
IOin = IOread
IOin = IOin And 2
Loop Until IOin = 0
End Sub
Public Sub SokuteikiInt()

'万用表
a$ = "F1,R5,PR2"
Call GPIBwr(R64Adr, a$)
'ASG 7
a$ = "FR1KHZAP-20DBMM3LOGAUHPF0LP0"
Call GPIBwr(AUDIOadr, a$)


End Sub
Public Sub WAITtime(NO As Integer)
DoEvents
Dim ii As Long
Dim jj As Long
ii = GetTickCount()
If NO = 0 Then
'条件设定WAITTIME
DoEvents
If Val(Wtime(Stepitme).Text) <= 0 Then Exit Sub
WaitMAX.Max = Val(Wtime(Stepitme).Text)
WaitMAX.Min = 0
Do Until (jj - ii) >= Wtime(Stepitme)
AAA = jj - ii
   jj = GetTickCount()
   If AAA > 0 Then
   WaitMAX.value = AAA
   End If
       DoEvents
IOREADvalue = IOread
If IOREADvalue = 7 And Manual = 1 Then
Exit Sub
End If
Loop
 WaitMAX.value = Val(Wtime(Stepitme).Text)
Else
'内部WAITTIME
DoEvents
WaitMAX.Max = NO
WaitMAX.Min = 0
Do Until (jj - ii) >= NO
AAA = jj - ii
   jj = GetTickCount()
   If AAA > 0 Then
   WaitMAX.value = AAA
   End If
    DoEvents
    IOREADvalue = IOread
If IOREADvalue = 7 And Manual = 1 Then
Exit Sub
End If
Loop
WaitMAX.value = NO
End If
End Sub

Public Sub Rs232TX()
Dim OUTString As String
OUTString = Trim(Rs232send(Stepitme).Text)
MSComm1.Output = OUTString & Chr$(13)
End Sub

Public Function Rs232RX()
Dim INString As String
BUFFER$ = MSComm1.Input
Rs232RX = BUFFER$
End Function

Public Sub LOCKED()
For i = 1 To Stepmax
Hi(i).LOCKED = True
Low(i).LOCKED = True
Asg(i).LOCKED = True
Mmeter(i).LOCKED = True
Rs232send(i).LOCKED = True
Ry(i).LOCKED = True
Wtime(i).LOCKED = True
Po(i).LOCKED = True
Next i
IOCHECKER.Enabled = False
Command4.Enabled = False
Command3.Enabled = False
End Sub
Public Sub UNLOCKED()
For i = 1 To Stepmax
Hi(i).LOCKED = False
Low(i).LOCKED = False
Asg(i).LOCKED = False
Mmeter(i).LOCKED = False
Rs232send(i).LOCKED = False
Ry(i).LOCKED = False
Wtime(i).LOCKED = False
Po(i).LOCKED = False
Next i
IOCHECKER.Enabled = True
Command4.Enabled = True
Command3.Enabled = True
End Sub

Public Sub Resetting()
For i = 1 To Stepmax
Measure(i).Caption = ""
Measure(i).BackColor = &H8000000F
Judge(i).Caption = ""
Judge(i).BackColor = &H8000000F
Next i
INFdisplay.Alignment = 0
INFdisplay.Font.Size = 12
INFdisplay.BackColor = &H80000005
INFdisplay.ForeColor = 0
INFdisplay.Text = ""
WaitMAX.Visible = True
NGflag = 0
Stopinf = 0
'Saveinf = 0
Picture2(0).Visible = False
Picture2(1).Visible = False
Picture1(0).Visible = True
Picture1(1).Visible = True
End Sub

Public Sub CDATAsetting()
Dim GPIBERdata As String
If Itme(Stepitme).Caption = "START" Then
Prot_4 = 34
Call IOwrite(4, Prot_4) 'pin up
MSComm1.OutBufferCount = 0
MSComm1.InBufferCount = 0
End If

If Stepitme = 2 Then
Testmode (True)
End If
Select Case Stepitme
Case 66
Call IOwrite(0, 0)
Sleep (500)
Testmode (False)
Sleep (1500)
Call IOwrite(4, &HC2)
Sleep (500)
Call IOwrite(4, &H42)
Sleep (500)
Call IOwrite(0, 1)
Sleep (500)
Call IOwrite(0, 0)
Case 67
Call IOwrite(4, &HC2)
Sleep (500)
Call IOwrite(4, &H42)
Sleep (500)
Call IOwrite(2, 4)
Sleep (500)
Call IOwrite(2, 0)
End Select

If Rs232send(Stepitme).Text <> "" Then
Call Rs232TX
End If
If Asg(Stepitme).Text <> "" Then
GPIBERdata = UCase$(Trim(Asg(Stepitme).Text))
Call GPIBwr(AUDIOadr, GPIBERdata)
End If

If Mmeter(Stepitme).Text <> "" Then
GPIBERdata = UCase$(Trim(Mmeter(Stepitme).Text))
Call GPIBwr(R64Adr, GPIBERdata)
End If


a$ = UCase$(Trim(Ry(Stepitme).Text))
Prot_0 = Val("&H" + Right$(a$, 2))
Prot_1 = Val("&H" + Mid(a$, 3, 2))
Prot_2 = Val("&H" + Left$(a$, 2))
Call IOwrite(0, Prot_0)
Call IOwrite(1, Prot_1)
Call IOwrite(2, Prot_2)

If Val(Wtime(Stepitme).Text) > 0 Then
Call WAITtime(0)
End If

End Sub
Public Function Testmode(OF As Boolean) As Boolean
If OF = True Then
Prot_4 = 98
Call IOwrite(4, Prot_4) 'test mode
Call IOwrite(0, 2)
Sleep (2000)
Prot_4 = 66
Call IOwrite(4, Prot_4)
End If
If OF = False Then
Call IOwrite(4, &H2)
Sleep (500)
Call IOwrite(4, &H42)
End If
End Function

Public Sub Mea()
Dim Po3 As Integer
Dim Hidata As Single
Dim Lowdata As Single
Hidata = Val(Hi(Stepitme).Text)
Lowdata = Val(Low(Stepitme).Text)
Po3 = Val(Po(Stepitme))
Dim er01 As Integer
Dim RETval As String
RETval = "OK"
If Stepitme = 64 Then
GoTo Next2323
End If
er01 = 0
Next23201:
If Rs232send(Stepitme).Text <> "" And Po3 <> 3 Then
MM$ = Rs232RX
Measure(Stepitme).Caption = MM$
    If InStr(1, MM$, RETval) = 0 Then
    er01 = er01 + 1
          If er01 = 2 Then
            Judge(Stepitme).Caption = "232NG"
            Judge(Stepitme).BackColor = &HFF
            NGflag = 1
          Exit Sub
          End If
               Call Rs232TX
        If Val(Wtime(Stepitme).Text) > 0 Then
        Call WAITtime(0)
        End If
    GoTo Next23201
    End If
End If
Next2323:
Select Case Po3
Case 0
Measure(Stepitme).Caption = "PASS"
Case 1
meavalue(Stepitme) = GPread(R64Adr)
'STEPstep
If Mmeter(Stepitme).Text = "F5,R6,PR2" Then meavalue(Stepitme) = meavalue(Stepitme) * 1000
If Mmeter(Stepitme).Text = "F5,R4,PR2" Then
meavalue(Stepitme) = (meavalue(Stepitme) * 1000000)
End If
If Stepitme = 69 And meavalue(Stepitme) < 0 Then
meavalue(Stepitme) = 0
End If
Measure(Stepitme).Caption = Format$(meavalue(Stepitme), "#0.00")
    If meavalue(Stepitme) >= Lowdata And meavalue(Stepitme) <= Hidata Then
     Judge(Stepitme).Caption = "OK"
     Judge(Stepitme).BackColor = &HFF00&
    Else
     Judge(Stepitme).Caption = "NG"
     Judge(Stepitme).BackColor = &HFF
     NGflag = 1
    End If
 Case 2
 If Stepitme <> 24 Or Stepitme <> 37 Then
 meavalue(Stepitme) = GPread(AUDIOadr)
 End If
STEPstep
Measure(Stepitme).Caption = Format$(meavalue(Stepitme), "#0.00")
If (meavalue(Stepitme) < Lowdata) Or (meavalue(Stepitme) > Hidata) Then
Call GPIBwr(AUDIOadr, "AU")
Sleep 1000
meavalue(Stepitme) = GPread(AUDIOadr)
STEPstep
Measure(Stepitme).Caption = Format$(meavalue(Stepitme), "#0.00")
End If
If meavalue(Stepitme) >= Lowdata And meavalue(Stepitme) <= Hidata Then
     Judge(Stepitme).Caption = "OK"
     Judge(Stepitme).BackColor = &HFF00&
    Else
     Judge(Stepitme).Caption = "NG"
     Judge(Stepitme).BackColor = &HFF
     NGflag = 1
    End If
Case 3
Dim HH232 As Long
Dim LL232 As Long
MM$ = Rs232RX
NN$ = Trim(Low(Stepitme).Text)
Measure(Stepitme).Caption = MM$
Select Case Stepitme
Case 48
meavalue(Stepitme) = Val("&h" & Mid(MM$, 3, 4))
HH232 = Val("&H" & Trim(Hi(Stepitme).Text))
LL232 = Val("&H" & Trim(Low(Stepitme).Text))
    If HH232 >= meavalue(Stepitme) And meavalue(Stepitme) >= LL232 Then
    Judge(Stepitme).Caption = "OK"
    Judge(Stepitme).BackColor = &HFF00&
    Else
    Judge(Stepitme).Caption = "NG"
    Judge(Stepitme).BackColor = &HFF
    NGflag = 1
    End If
Case 65
meavalue(Stepitme) = Val("&h" & MM$)
HH232 = Val("&H" & Trim(Hi(Stepitme).Text))
LL232 = Val("&H" & Trim(Low(Stepitme).Text))
    If HH232 >= meavalue(Stepitme) And meavalue(Stepitme) >= LL232 Then
    Judge(Stepitme).Caption = "OK"
    Judge(Stepitme).BackColor = &HFF00&
    Else
    Judge(Stepitme).Caption = "NG"
    Judge(Stepitme).BackColor = &HFF
    NGflag = 1
    End If

Case Else
    If InStr(1, MM$, NN$) <> 0 Then
    Judge(Stepitme).Caption = "OK"
    Judge(Stepitme).BackColor = &HFF00&
    Else
    Judge(Stepitme).Caption = "NG"
    Judge(Stepitme).BackColor = &HFF
    NGflag = 1
    End If
End Select
End Select
End Sub



Public Sub OKNGdisplay()
WaitMAX.Visible = False
Dim i As Integer
For i = 0 To Stepmax
If Judge(i).Caption = "NG" Or Judge(i).Caption = "232NG" Then
NGflag = 1
End If
Next i
If NGflag = 0 Then
INFdisplay.Alignment = 2
INFdisplay.Font.Size = 50
INFdisplay.ForeColor = H00FF0000&
INFdisplay.Text = "OK"
INFdisplay.BackColor = &HFF00&
Call IOwrite(4, 0)
Sleep 800
Call IOwrite(4, 1)
Sleep 200
Call IOwrite(4, 0)
If Saveinf = 1 Then DATAsave
'DATAsave
Else
INFdisplay.Alignment = 2
INFdisplay.Font.Size = 50
INFdisplay.Text = "NG"
INFdisplay.BackColor = &HFF
Call IOwrite(4, &H10)

Do

DoEvents  '循环等待期间其他事件响应ON/OFF
Loop Until (IOread And 4) = 4
Do
DoEvents
Loop Until (IOread And 4) = 0
Call IOini
Sleep (200)
Call IOwrite(4, 0)
Sleep 500
Call IOwrite(4, 1)
Sleep 200
Call IOwrite(4, 0)
End If
End Sub
Public Sub DATAsave()
Dim FILEstr As String
Dim OLDfile As String
Dim NEWfile As String
OLDfile = App.Path & "\testdata"
FILEstr = Date$ + Left$(Time$, 2)
NEWfile = App.Path & "\" + FILEstr
Open App.Path & "\testdata" For Append As #4 '测试数据save
 
For i = 1 To Stepmax
    Write #4, meavalue(i),
Next i
   Write #4, Time$, Date$, GpibType
   Close #4
   If FileLen(OLDfile) > 1000000 Then
 Name OLDfile As NEWfile
 End If

End Sub

Public Sub Maintest()
MSComm1.InBufferCount = 0
MSComm1.OutBufferCount = 0
DoEvents
For Stepitme = 1 To Stepmax
NGflag = 0
'If Stepitme = 6 Then
'Stepitme = 50
'End If
TIPsub
Dim Err02 As Integer
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
'ng Retest
If NGflag = 1 Then
Err02 = Err02 + 1
If Err02 <= 2 Then
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
Select Case Stepitme
Case 20
      Call IOwrite(4, &H4A)
    Case 50
Call IOwrite(4, &H42)
Case 55
    Call IOwrite(4, &H4A)
Case 57
Call IOwrite(4, &H42)
    End Select
End Sub
Public Sub TESTstart()
Do
DoEvents  '循环等待期间其他事件响应ON/OFF
Do
DoEvents  '循环等待期间其他事件响应ON/OFF
Loop Until IOread = 0
Do
DoEvents  '循环等待期间其他事件响应ON/OFF
Loop Until IOread = 1
Sleep 2000
Resetting
Maintest
Loop
End Sub


Public Sub STEPstep()
Select Case Stepitme
Case 20, 21
meavalue(Stepitme) = meavalue(Stepitme) * 1000
Case 16
meavalue(Stepitme) = meavalue(14) - meavalue(Stepitme)
Case 17, 18
meavalue(Stepitme) = meavalue(Stepitme) - meavalue(14)
Case 27
meavalue(Stepitme) = meavalue(22) - meavalue(Stepitme)
Case 28
meavalue(Stepitme) = meavalue(23) - meavalue(Stepitme)
Case 24
meavalue(Stepitme) = meavalue(23) - meavalue(22)
Case 29
meavalue(Stepitme) = meavalue(22) - meavalue(Stepitme)
Case 30
meavalue(Stepitme) = meavalue(23) - meavalue(Stepitme)
Case 37
meavalue(Stepitme) = meavalue(36) - meavalue(35)
Case 40
meavalue(Stepitme) = meavalue(35) - meavalue(Stepitme)
Case 41
meavalue(Stepitme) = meavalue(36) - meavalue(Stepitme)
Case 42
meavalue(Stepitme) = meavalue(35) - meavalue(Stepitme)
Case 43
meavalue(Stepitme) = meavalue(36) - meavalue(Stepitme)
Case 31, 33
meavalue(Stepitme) = meavalue(Stepitme) - meavalue(22)
Case 32, 34
meavalue(Stepitme) = meavalue(Stepitme) - meavalue(23)
Case 44, 46
meavalue(Stepitme) = meavalue(Stepitme) - meavalue(35)
Case 45, 47
meavalue(Stepitme) = meavalue(Stepitme) - meavalue(36)
Case 51
meavalue(Stepitme) = meavalue(50) - meavalue(Stepitme)
Case 53, 54
meavalue(Stepitme) = meavalue(Stepitme) - meavalue(50)
End Select
End Sub

Private Sub Form_Unload(Cancel As Integer)
Call IOini
Sleep (500)
If IOread = 1 Then
Call IOwrite(4, 1)
Sleep (1000)
Call IOwrite(4, 0)
End If
Closedevice
End Sub

Private Sub IOCHECKER_Click()
Stopinf = 1
Sleep (500)
FORM2.Show
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

