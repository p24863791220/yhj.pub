Attribute VB_Name = "Mod_FPGAwr"
Public BottonHANLD As Long ' 开始写入按钮句柄
Public R_TEXTHanld As Long ' 消息LOG句柄
Public Const SW_SHOWMAXIMIZED = 3 '最大化窗口并激活
Public Const SW_SHOWMINIMIZED = 2 '最小化窗口并激活
Public Const SW_MINIMIZE = 6 '最小化窗口
Public Const SW_SHOWMINNOACTIVE = 7  '最小化窗口，不改变活动状态
Public ATK_WriteButton As Long
Public ATK_ResultText As Long
Public No_Pub As Long

Public Next_pub As Long
Public Go_pub As Long
Public Program_pub As Long
Public Success As Long
Public Program2_pub As Long

Public Flash_Tool_pub As Long
Public FlashMMC_pub As Long
Public ProgramSe_pub As Long
Public Browse_pub As Long
Public WriteResult_pub As Long

Public Ox_pub As Long
Public Oy_pub As Long
Public PubNumToolbarWindow32 As Long
Public LogString As String
Type Zsc
    Zs As String
    Zc As String
    hwnd As Long
End Type
Public Zsx(1000) As Zsc
Public ZsxToolbarWindow32(2000) As Zsc
Public YesBtn As Long
Public NoBtn As Long
Public CancelBtn As Long
Public CloseBtn As Long
Public TipText As Long
Public TerminateBtn As Long
Public FuYueBtn As Long
Public FangQiBtn As Long
Public RichText_Text As Long
Public DisText_text As Long
Public Const WM_SYSKEYUP = &H105
Public Const WM_SYSKEYDOWN = &H104
Public Const WM_SETFOCUS = &H7
Public Const WM_RBUTTONDOWN = &H204
Public Const WM_RBUTTONDBLCLK = &H206
Public Const WM_QUIT = &H12
Public Const WM_MENUSELECT = &H11F
Public Const WM_MOUSEWHEEL = &H20A
Public Const WM_IMEKEYUP = &H291
Public Const WM_IMEKEYDOWN = &H290
Public Const WM_IME_CHAR = &H286
Public Type POINTAPI
   X As Long
   Y As Long
End Type
Public Type HD_HITTESTINFO
   pt  As POINTAPI
   flags  As Long
   iItem As Long
End Type
     Public pt As POINTAPI
     Public HTI As HD_HITTESTINFO
'HitTest positions
Public Const HHT_NOWHERE = &H1
Public Const HHT_ONHEADER = &H2
Public Const HHT_ONDIVIDER = &H4
Public Const HHT_ONDIVOPEN = &H8
Public Const HHT_ABOVE = &H100
Public Const HHT_BELOW = &H200
Public Const HHT_TORIGHT = &H400
Public Const HHT_TOLEFT = &H800

'header class id's
Public Const HEADER32_CLASS   As String = "SysHeader32"
Public Const HEADER_CLASS     As String = "SysHeader"

'header info
Public Const HDI_WIDTH        As Long = &H1
Public Const HDI_HEIGHT       As Long = HDI_WIDTH
Public Const HDI_TEXT         As Long = &H2
Public Const HDI_FORMAT       As Long = &H4
Public Const HDI_LPARAM       As Long = &H8
Public Const HDI_BITMAP       As Long = &H10
Public Const HDI_IMAGE        As Long = &H20
Public Const HDI_DI_SETITEM   As Long = &H40
Public Const HDI_ORDER        As Long = &H80

'header formats
Public Const HDF_LEFT         As Long = 0
Public Const HDF_RIGHT        As Long = 1
Public Const HDF_CENTER       As Long = 2
Public Const HDF_JUSTIFYMASK  As Long = &H3
Public Const HDF_RTLREADING   As Long = 4
Public Const HDF_IMAGE        As Long = &H800
Public Const HDF_OWNERDRAW    As Long = &H8000&
Public Const HDF_STRING       As Long = &H4000
Public Const HDF_BITMAP       As Long = &H2000
Public Const HDF_BITMAP_ON_RIGHT  As Long = &H1000

'header styles
Public Const HDS_HORZ         As Long = &H0
Public Const HDS_BUTTONS      As Long = &H2
Public Const HDS_HOTTRACK     As Long = &H4
Public Const HDS_HIDDEN       As Long = &H8
Public Const HDS_DRAGDROP     As Long = &H40
Public Const HDS_FULLDRAG     As Long = &H80
Public Hhwnd As Long
Public Hhwnd2 As Long
Public Const WM_GETTEXT = &HD '得到文本消息
Public Const WM_SETTEXT = &HC '设定文本消息
Public Const BM_CLICK = &HF5 '鼠标双击
Public Const WM_CLOSE = &H10 '关闭窗口
'header messages
Public Const HDM_FIRST           As Long = &H1200
Public Const HDM_GETITEMCOUNT    As Long = (HDM_FIRST + 0)
Public Const HDM_INSERTITEM      As Long = (HDM_FIRST + 1)
Public Const HDM_DELETEITEM      As Long = (HDM_FIRST + 2)
Public Const HDM_GETITEM         As Long = (HDM_FIRST + 3)
Public Const HDM_SETITEM         As Long = (HDM_FIRST + 12)
Public Const HDM_LAYOUT          As Long = (HDM_FIRST + 5)
Public Const HDM_HITTEST         As Long = (HDM_FIRST + 6)
Public Const HDM_GETITEMRECT     As Long = (HDM_FIRST + 7)
Public Const HDM_SETIMAGELIST    As Long = (HDM_FIRST + 8)
Public Const HDM_GETIMAGELIST    As Long = (HDM_FIRST + 9)
Public Const HDM_ORDERTOINDEX    As Long = (HDM_FIRST + 15)
Public Const HDM_SETITEMW = (HDM_FIRST + 12)
Public Const LB_FINDSTRING = &H18F
Public Const CBN_DROPDOWN = 7
Public Const WM_ENABLE = &HA

'SendMessageTimeout values
Public Const HWND_BROADCAST As Long = &HFFFF&
Public Const WM_SETTINGCHANGE As Long = &H1A
Public Const SPI_SETNONCLIENTMETRICS As Long = &H2A
Public Const SMTO_ABORTIFHUNG As Long = &H2

Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
'打开过程
Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
'打开工程文件
Declare Function ShellExecute Lib "Shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
''获得句柄
Declare Function SendMessageTimeout Lib "user32" Alias "SendMessageTimeoutA" (ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long, ByVal fuFlags As Long, ByVal uTimeout As Long, lpdwResult As Long) As Long

Declare Function SendMessageCallback Lib "user32" Alias "SendMessageCallbackA" (ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long, ByVal lpResultCallBack As Long, ByVal dwData As Long) As Long
Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Declare Function EnumChildWindows Lib "user32" (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Declare Function RegisterWindowMessage Lib "user32" Alias "RegisterWindowMessageA" (ByVal lpString As String) As Long
Declare Function GetDesktopWindow Lib "user32" () As Long
Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
'
Public Declare Function SetActiveWindow Lib "user32" (ByVal hwnd As Long) As Long

Declare Function EnumThreadWindows Lib "user32" (ByVal dwThreadId As Long, ByVal lpfn As Long, ByVal lParam As Long) As Long
Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
Declare Function GetTickCount Lib "kernel32" () As Long


Public Function EnumChildProcYesNoCancel(ByVal hwnd As Long, ByVal lParam As Long) As Long  '枚举子窗口及控件
    Dim sSave As String
    Dim ZCLASS As String
    Dim slen As Long
    ZCLASS = Space$(255)
    sSave = Space$(GetWindowTextLength(hwnd) + 1)
    GetWindowText hwnd, sSave, Len(sSave)
    GetClassName hwnd, ZCLASS, 255
    ZCLASS = Trim(ZCLASS)
    sSave = Left$(sSave, Len(sSave) - 1)
    ZCLASS = Left$(ZCLASS, Len(ZCLASS) - 1)
    'Form1.Print sSave & "---" & ZCLASS & "---" & hwnd
    Debug.Print sSave & "---" & ZCLASS & "---" & hwnd
    If sSave = "是(&Y)" Or Trim(sSave) = "确定" And ZCLASS = "Button" Then
    YesBtn = hwnd
    End If
           If sSave = "否(&N)" And ZCLASS = "Button" Then
           NoBtn = hwnd
           End If
              If Trim(sSave) = "取消" And ZCLASS = "Button" Then
              CancelBtn = hwnd
              End If
                  If sSave = "终止(&A)" And ZCLASS = "Button" Then
    TerminateBtn = hwnd
    End If
           If sSave = "忽略(&R)" And ZCLASS = "Button" Then
           FuYueBtn = hwnd
           End If
              If sSave = "放弃(&I)" And ZCLASS = "Button" Then
              FangQiBtn = hwnd
              End If
                                          If sSave = "Close" And ZCLASS = "Button" Then
             CloseBtn = hwnd
              End If
    EnumChildProcYesNoCancel = 1
End Function
Public Function EnumChildProcTerminate(ByVal hwnd As Long, ByVal lParam As Long) As Long  '枚举子窗口及控件
    Dim sSave As String
    Dim ZCLASS As String
    Dim slen As Long
    ZCLASS = Space$(255)
    sSave = Space$(GetWindowTextLength(hwnd) + 1)
    GetWindowText hwnd, sSave, Len(sSave)
    GetClassName hwnd, ZCLASS, 255
    ZCLASS = Trim(ZCLASS)
    sSave = Left$(sSave, Len(sSave) - 1)
    ZCLASS = Left$(ZCLASS, Len(ZCLASS) - 1)
    'Form1.Print sSave & "---" & ZCLASS & "---" & hwnd
    Debug.Print sSave & "---" & ZCLASS & "---" & hwnd
    If sSave = "终止(&A)" And ZCLASS = "Button" Then
    TerminateBtn = hwnd
    End If
           If sSave = "忽略(&R)" And ZCLASS = "Button" Then
           FuYueBtn = hwnd
           End If
              If sSave = "放弃(&I)" And ZCLASS = "Button" Then
              FangQiBtn = hwnd
              End If
                  If sSave = "是(&Y)" Or sSave = "确定" Or sSave = "OK" And ZCLASS = "Button" Then
    YesBtn = hwnd
    End If
                      If sSave = "" And ZCLASS = "ComboBox" Then
    CloseBtn = hwnd
    End If
           If sSave = "否(&N)" And ZCLASS = "Button" Then
           NoBtn = hwnd
           End If
                      If sSave = "&Search the best JTAG clock" And ZCLASS = "Button" Then
           NoBtn = hwnd
           End If
              If sSave = "取消" And ZCLASS = "Button" Then
              CancelBtn = hwnd
              End If
                            If sSave = "Close" And ZCLASS = "Button" Then
             CloseBtn = hwnd
              End If
    EnumChildProcTerminate = 1
End Function
Public Function EnumChildProc(ByVal hwnd As Long, ByVal lParam As Long) As Long  '枚举子窗口及控件
'On Error Resume Next
    Dim sSave As String
    Dim ZCLASS As String
    Dim slen As Long
    PubNum = PubNum + 1
    ZCLASS = Space$(255)
    sSave = Space$(GetWindowTextLength(hwnd) + 1)
    GetWindowText hwnd, sSave, Len(sSave)
    GetClassName hwnd, ZCLASS, 255
    ZCLASS = Trim(ZCLASS)
    sSave = Left$(sSave, Len(sSave) - 1)
    ZCLASS = Left$(ZCLASS, Len(ZCLASS) - 1)
    'Form1.Print sSave & "---" & ZCLASS & "---" & hwnd
    Debug.Print sSave & "---" & ZCLASS & "---" & hwnd
Open App.Path & "\" & "QinBao.dat" For Append As #1    'ＯＫ数据保存
Write #1, sSave, ZCLASS, hwnd
Close #1
Ret = InStr(1, sSave, "Debug")
'If Ret > 0 Then EnumChildWindows hwnd, AddressOf EnumChildProc2, ByVal 0&
       Zsx(PubNum).Zs = sSave
       Zsx(PubNum).Zc = ZCLASS
       Zsx(PubNum).hwnd = hwnd
'       Form1.Send_Combo.AddItem PubNum & "-" & sSave & "-" & ZCLASS & "-" & hwnd
'       Form1.Send_Combo.Text = PubNum & "-" & sSave & "-" & ZCLASS & "-" & hwnd
                                   If Len(sSave) > 100 And ZCLASS = "Button" Then
             TipText = hwnd
              End If
                                                 If ZCLASS = "RICHEDIT" And RichText_Text = 0 Then
             RichText_Text = hwnd
              End If

                                                 If ZCLASS = "msctls_statusbar32" And StateBar_text = 0 Then
             StateBar_text = hwnd
              End If
    EnumChildProc = 1
End Function
Public Function EnumChildProcDis(ByVal hwnd As Long, ByVal lParam As Long) As Long  '枚举子窗口及控件
'On Error Resume Next
    Dim sSave As String
    Dim ZCLASS As String
    Dim slen As Long
    PubNum = PubNum + 1
    ZCLASS = Space$(255)
    sSave = Space$(GetWindowTextLength(hwnd) + 1)
    GetWindowText hwnd, sSave, Len(sSave)
    GetClassName hwnd, ZCLASS, 255
    ZCLASS = Trim(ZCLASS)
    sSave = Left$(sSave, Len(sSave) - 1)
    ZCLASS = Left$(ZCLASS, Len(ZCLASS) - 1)
    'Form1.Print sSave & "---" & ZCLASS & "---" & hwnd
    Debug.Print sSave & "---" & ZCLASS & "---" & hwnd
'Open App.Path & "\" & "QinBao.dat" For Append As #1   'ＯＫ数据保存
'Write #1, sSave, ZCLASS, hwnd
'Close #1
Ret = InStr(1, sSave, "Debug")
'If Ret > 0 Then EnumChildWindows hwnd, AddressOf EnumChildProc2, ByVal 0&
       Zsx(PubNum).Zs = sSave
       Zsx(PubNum).Zc = ZCLASS
       Zsx(PubNum).hwnd = hwnd
       Form1.Send_Combo.AddItem PubNum & "-" & sSave & "-" & ZCLASS & "-" & hwnd
       Form1.Send_Combo.Text = PubNum & "-" & sSave & "-" & ZCLASS & "-" & hwnd
                                                 If ZCLASS = "RICHEDIT" And DisText_text = 0 Then
                                                 DisNum = DisNum + 1
                                                 If DisNum = 4 Then
             DisText_text = hwnd
             End If
              End If
    EnumChildProcDis = 1
End Function
Public Function EnumChildProcAudio(ByVal hwnd As Long, ByVal lParam As Long) As Long  '枚举子窗口及控件
    Dim sSave As String
    Dim ZCLASS As String
    Dim slen As Long

    ZCLASS = Space$(255)
    sSave = Space$(GetWindowTextLength(hwnd) + 1)
    GetWindowText hwnd, sSave, Len(sSave)
    GetClassName hwnd, ZCLASS, 255
    ZCLASS = Trim(ZCLASS)
    sSave = Left$(sSave, Len(sSave) - 1)
    ZCLASS = Left$(ZCLASS, Len(ZCLASS) - 1)
'    Form1.Print sSave & "---" & ZCLASS & "---" & hwnd
    Debug.Print sSave & "---" & ZCLASS & "---" & hwnd
    If sSave = "Next >" And ZCLASS = "Button" And Next_pub = 0 Then Next_pub = hwnd
    If sSave = "Go" And ZCLASS = "Button" And Go_pub = 0 Then Go_pub = hwnd
    If sSave = "Program" And ZCLASS = "Button" And Program_pub = 0 Then Program_pub = hwnd 'PROGRAM SE
        If sSave = "Program" And ZCLASS = "Button" And Program2_pub < 3 Then
        Program2_pub = Program2_pub + 1
        If Program2_pub = 2 Then Program2_pub = hwnd
        End If
If sSave = "Flash Tool" And ZCLASS = "Button" And Flash_Tool_pub = 0 Then Flash_Tool_pub = hwnd
If sSave = "" And ZCLASS = "ComboBox" And FlashMMC_pub = 0 Then FlashMMC_pub = hwnd 'MMC SELECT

If sSave = "" And ZCLASS = "Edit" And Ox_pub < 3 Then
Ox_pub = Ox_pub + 1
If Ox_pub = 2 Then Ox_pub = hwnd
End If
If sSave = "" And ZCLASS = "Edit" And Oy_pub < 4 Then
Oy_pub = Oy_pub + 1
If Oy_pub = 3 Then Oy_pub = hwnd
End If

If sSave = "" And ZCLASS = "Edit" And WriteResult_pub < 7 Then
WriteResult_pub = WriteResult_pub + 1
If WriteResult_pub = 4 Then WriteResult_pub = hwnd
End If

    If sSave = "" And ZCLASS = "Edit" And Browse_pub < 5 Then 'BROWSER SELECT
    Browse_pub = Browse_pub + 1
    If Browse_pub = 5 Then Browse_pub = hwnd
    End If
    EnumChildProcAudio = 1
End Function
