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

Public Const SMTO_ABORTIFHUNG = &H2
Public Const WM_GETTEXT = &HD '得到文本消息
Public Const WM_SETTEXT = &HC '设定文本消息
Public Const BM_CLICK = &HF5 '鼠标双击
Public Const WM_CLOSE = &H10 '关闭窗口
Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Declare Function SetWindowPos& Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
Declare Function SendMessageTimeout Lib "user32" Alias "SendMessageTimeoutA" (ByVal hwnd As Long, ByVal msg As Long, ByVal wParam As Long, ByVal lParam As Long, ByVal fuFlags As Long, ByVal uTimeout As Long, lpdwResult As Long) As Long

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
Public Declare Function SetActiveWindow Lib "user32" (ByVal hwnd As Long) As Long
Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
Public Function EnumChildProcmemwrite(ByVal hwnd As Long, ByVal lParam As Long) As Long  '枚举子窗口及控件
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
    EnumChildProcmemwrite = 1
End Function

Public Function EnumChildProcATK(ByVal hwnd As Long, ByVal lParam As Long) As Long  '枚举子窗口及控件
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
    If sSave = "" And ZCLASS = "Edit" And ATK_ResultText = 0 Then ATK_ResultText = hwnd
    If sSave = "" And ZCLASS = "ToolbarWindow32" Then ATK_WriteButton = hwnd
    EnumChildProcATK = 1
End Function

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
    Debug.Print sSave & "---" & ZCLASS & "---" & hwnd
    If sSave = "否(&N)" And ZCLASS = "Button" Then No_Pub = hwnd
    EnumChildProc = 1
End Function

