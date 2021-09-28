Attribute VB_Name = "Mod_FPGAwr"
Public BottonHANLD As Long ' 开始写入按钮句柄
Public R_TEXTHanld As Long ' 消息LOG句柄
Public Const SW_SHOWMAXIMIZED = 3 '最大化窗口并激活
Public Const SW_SHOWMINIMIZED = 2 '最小化窗口并激活
Public Const SW_MINIMIZE = 6 '最小化窗口
Public Const SW_SHOWMINNOACTIVE = 7  '最小化窗口，不改变活动状态



Public Const WM_GETTEXT = &HD '得到文本消息
Public Const WM_SETTEXT = &HC '设定文本消息
Public Const BM_CLICK = &HF5 '鼠标双击
Public Const WM_CLOSE = &H10 '关闭窗口
Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
'打开过程
Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
'打开工程文件
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
''获得句柄
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
Declare Function IsWindow Lib "user32" (ByVal hwnd As Long) As Long



Public Function EnumChildProc(ByVal hwnd As Long, ByVal lParam As Long) As Long  '枚举子窗口及控件
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
    'Debug.Print sSave & "---" & ZCLASS & "---" & hwnd
    If ZCLASS = "RichEdit20A" Then R_TEXTHanld = hwnd
    If sSave = "PROGRAM" And ZCLASS = "Button" Then BottonHANLD = hwnd
    EnumChildProc = 1
End Function


