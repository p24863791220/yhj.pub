Attribute VB_Name = "Remote_Cont"
Option Explicit
Public ProductIp As String
Public ProductID As Long
Public strBuffer As String
Public Response As Integer
Public RetestAudio As Integer

Global Const COMMANDPROMPT = "C:\Windows\System32\cmd.exe"
Private Const INIT_FILE = "remote.ini"              'リモートサーバーの設定ファイル
Private Const PRODUCT_CNT_FILE = "prodcnt.txt"      '測定した製品番号の保存ファイル
Public Const RESFILE = "c:\result.txt"             'リモートサーバーからのレスポンスファイル

Private Const DEFAULT_HOSTNAME = "10.0.1.1"
Private Const DEFAULT_USERNAME = "root"
Private Const DEFAULT_DIAGEXE = "/usr/local/sony/diag/EBX5016/diag.sh"

Global MY_APP As String


Global HOSTNAME As String
Global USERNAME As String
Global DIAGEXE As String
Global Ret
Global CmdRet


Declare Function GetTickCount Lib "kernel32" () As Long

Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

'追加
Public hProcess As Long
Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long

Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
'
Public Const PROCESS_QUERY_INFORMATION = &H400&
Public Const STILL_ACTIVE = &H103&

'追加ここまで

'--------------------------------------------------------------------
'   Redhatにrshでテストコマンドを送信する
'       test_cmd        ： DIAGコマンド
'       id              ： DIAG実行ID（製品No.）
'       res_valid       ： True = Linuxから応答を受け取る　False = Linuxからの応答は受け取らない
'       wait            ： テスト実行待ち時間（sec）
'       msg             ： テスト結果のメッセージ
'       戻り値          ：　0 = テストOK
'                       ：　1 = テストNG
'                       ：　-1 = 応答タイムアウトエラー
'--------------------------------------------------------------------
Function Exec_Test(test_cmd As String, ip As String, id As Long, Wait As Long, Msg As String) As Integer
'On Error Resume Next
'Dim id_num As String
'Dim s As String
'Dim Cmd$
'Dim lExitCode As Long   '追加
'Dim start_time As Long  '追加
'Dim i As Long           '追加
'Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
'If Ret <> 0 Then
'Call Send_CTRL_C
'SendMessageTimeout Ret, WM_CLOSE, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
'Sleep (100)
'End If
'If Dir(RESFILE$) <> "" Then Kill RESFILE$
'    id_num = id ' + Right("0000000" & CStr(id), 7)
'Select Case Stepitme
'Case 100
'Cmd$ = COMMANDPROMPT & " /c ssh " & ProductIp & " -l " & DEFAULT_USERNAME & " " & "/usr/local/sony/diag/EBX5016/" & test_cmd & " > " & RESFILE$ & " 2>&1"
''Case 1, 2, 3, 4
''Cmd$ = COMMANDPROMPT & " /c ssh " & DEFAULT_HOSTNAME & " -l " & DEFAULT_USERNAME & " " & DEFAULT_DIAGEXE & " " & "10.0.0.1" & " " & "1" & " " & test_cmd & " > " & RESFILE$ & " 2>&1"
'Case Else
'Cmd$ = COMMANDPROMPT & " /c ssh " & ProductIp & " -l " & DEFAULT_USERNAME & " " & DEFAULT_DIAGEXE & " " & DEFAULT_HOSTNAME & " " & "100" & " " & test_cmd & " > " & RESFILE$ & " 2>&1"
'End Select
'EBX5009_1.INFdisplay = Cmd$
'    CmdRet = Shell(Cmd$, vbMinimizedFocus)
'    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
'            Select Case Stepitme
'    Case 8, 13, 15, 17, 19 'AUDIO TEST
'    start_time = GetTickCount()
'Do
'    MMn = ""
'  MMn = LinuxCommandReceive
'  Ret = 0
'Ret = InStr(1, MMn, "OK")
'DoEvents
'Sleep (50)
'Loop Until GetTickCount() - start_time > 7000 Or Ret > 0
'EBX5009_1.INFdisplay = MMn
'If Ret > 0 Then
'Call EBX5009_1.WAITtime(Wait)
'End If
'    Case 22 'KEYTEST
'start_time = GetTickCount()
'Do
'    MMn = ""
'  MMn = LinuxCommandReceive
'  Ret = 0
'Ret = InStr(1, MMn, "Vol")
'DoEvents
'Sleep (50)
'Loop Until GetTickCount() - start_time > 10000 Or Ret > 0
'EBX5009_1.INFdisplay = MMn
'Sleep (1000)
'If Ret > 0 And Len(MMn) > 20 Then
'            Call IOwrite(1, 72)
'            Sleep (200)
'            Call IOwrite(1, 64)
'            Sleep (1000)
'
'            Call IOwrite(1, 68)
'            Sleep (200)
'            Call IOwrite(1, 64)
'            Sleep (1000)
'
'            Call IOwrite(1, 66)
'            Sleep (200)
'            Call IOwrite(1, 64)
'            Sleep (1000)
'
'            Call IOwrite(1, 65)
'            Sleep (200)
'            Call IOwrite(1, 64)
'            Sleep (1000)
'Call TestModule.Wtime2(3000)
'Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
'If Ret > 0 Then
'            Call IOwrite(1, 72)
'            Sleep (200)
'            Call IOwrite(1, 64)
'            Sleep (1000)
'
'            Call IOwrite(1, 68)
'            Sleep (200)
'            Call IOwrite(1, 64)
'            Sleep (1000)
'
'            Call IOwrite(1, 66)
'            Sleep (200)
'            Call IOwrite(1, 64)
'            Sleep (1000)
'
'            Call IOwrite(1, 65)
'            Sleep (200)
'            Call IOwrite(1, 64)
'            Sleep (1000)
'Call TestModule.Wtime2(3000)
'End If
'End If
'Case 27 'TPTEST
'Call EBX5009_1.WAITtime(3000)
'Call IOwrite(2, &H20)
'Sleep (500)
'Call IOwrite(2, &H0)
'Sleep (500)
'   End Select
'        If Stepitme < 8 Or Stepitme > 20 Then
'        Call TestModule.Wtime2(Wait)   '等待时间
''        If RemoteCommandReceive = False Then Call TestModule.WtimeOut    '等待时间
'        End If
'
'If Stepitme < 8 Or Stepitme > 20 Then
'    Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
'    If Ret <> 0 Then
'    Call Send_CTRL_C
'    SendMessageTimeout Ret, WM_CLOSE, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
'    Sleep (100)
'    End If
'End If
'MMn = LinuxCommandReceive
'EBX5009_1.INFdisplay = MMn
'    AppActivate MY_APP
    
End Function
Function Exec_TestP(test_cmd As String, ip As String, id As Long, Wait As Long, Msg As String) As Integer
Dim id_num As String
Dim s As String
Dim Cmd$
Dim lExitCode As Long   '追加
Dim start_time As Long  '追加
Dim i As Long           '追加

    On Error Resume Next
    If Dir("c:\result3.txt") <> "" Then Kill "c:\result3.txt"
    If Err.Number = 70 Then
        Call Send_CTRL_C
        If Dir("c:\result3.txt") <> "" Then Kill "c:\result3.txt"
    End If
    id_num = id ' + Right("0000000" & CStr(id), 7)
'        If Stepitme < 30 Then
        Cmd$ = COMMANDPROMPT & " /c ssh " & ProductIp & " -l " & "root" & " " & test_cmd & " > " & "c:\result3.txt" & " 2>&1"
'    Else
'        Cmd$ = COMMANDPROMPT & " /c rsh " & "10.0.0.1" & " -l " & DEFAULT_USERNAME & " " & DEFAULT_DIAGEXE & " " & ip & " " & id_num & " " & test_cmd & " > " & "c:\result2.txt" & " 2>&1"
'    End If
EBX5009_1.INFdisplay.Text = Cmd$
    CmdRet = Shell(Cmd$, vbMinimizedFocus)
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
    Call TestModule.Wtime2(Wait) '等待时间
    Ret = GetExitCodeProcess(hProcess, lExitCode)
'    If lExitCode = STILL_ACTIVE Then RomCheck5017.WtimeOut (wait) '继续待待
   Ret = GetExitCodeProcess(hProcess, lExitCode)
            If lExitCode = STILL_ACTIVE Then '强制结束待待
            Call Send_CTRL_C
            
'            DoEvents
            Ret = GetExitCodeProcess(hProcess, lExitCode)
            If lExitCode = STILL_ACTIVE Then Ret = CloseHandle(hProcess)
            End If
            
    AppActivate MY_APP
    
End Function
Function Send_OK()

Dim lExitCode As Long   '追加
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
    Do
        On Error GoTo Err:
        AppActivate COMMANDPROMPT
        DoEvents
        SendKeys ("{ENTER}")
        DoEvents
        Ret = GetExitCodeProcess(hProcess, lExitCode)
    Loop While lExitCode = STILL_ACTIVE

Err:
    Exit Function

End Function


Function Send_NG()

Dim lExitCode As Long   '追加
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
    Do
        On Error GoTo Err:
        AppActivate COMMANDPROMPT
        DoEvents
        SendKeys ("N" & "{ENTER}")
        DoEvents
        Ret = GetExitCodeProcess(hProcess, lExitCode)
    Loop While lExitCode = STILL_ACTIVE
Err:
    Exit Function

End Function

Public Function Send_CTRL_C()

Dim lExitCode As Long   '追加
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
    'Do
        On Error GoTo Err:
        AppActivate COMMANDPROMPT
        DoEvents
        SendKeys ("^(C)")
        DoEvents
'        Ret = GetExitCodeProcess(hProcess, lExitCode)
        Sleep (10)
If CheckApplicationIsRun("cmd.exe") = True Then 'Explorer.exe为你要结束的进程名字
Shell "taskkill /im cmd.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
End If
If CheckApplicationIsRun("CMD.exe") = True Then 'Explorer.exe为你要结束的进程名字
Shell "taskkill /im CMD.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
End If
    'Loop While lExitCode = STILL_ACTIVE
Err:
    Exit Function

End Function
Public Function Send_ENTER()

Dim lExitCode As Long   '追加
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
'    Do
        On Error GoTo Err:
        AppActivate COMMANDPROMPT
        DoEvents
        SendKeys ("{ENTER}")
        DoEvents
        Ret = GetExitCodeProcess(hProcess, lExitCode)
'    Loop While lExitCode = STILL_ACTIVE
Err:
    Exit Function

End Function
'--------------------------------------------------------------------
'   Reddatから実行結果を取得する
'       msg         ： 受信したメッセージ
'       wait        ： 受信待ち時間(sec) ; 0 = 永久ループ
'       戻り値      ：　true = 受信成功
'                   ：　false = 受信タイムアウト
'--------------------------------------------------------------------
Function Get_Response(Msg As String, Wait As Long, Line As Long) As Boolean
Dim tmp$
Dim flen As Long
Dim start_time As Long
Dim Timeout As Boolean
Dim i As Long

    
    Msg = ""
    Timeout = False
    flen = 0
    start_time = GetTickCount()
    Do
        tmp$ = Dir(RESFILE$)
        If tmp$ <> "" Then
            flen = FileLen(RESFILE$)
        End If
        DoEvents
        
        If Wait <> 0 Then
            If (GetTickCount() - start_time) > (Wait * 1000) Then Timeout = True: Exit Do
        End If
            
    Loop Until tmp$ <> "" And flen > 0

    If Timeout = False Then
        Open RESFILE For Input As #1
        For i = 1 To Line
            Line Input #1, Msg
            If EOF(1) Then Exit For
        Next i
        Close #1
'        frmEBX5009Check.lblMessage.Caption = msg
        Get_Response = True
    Else
        Get_Response = False
    End If
    
    DoEvents
    
End Function


'--------------------------------------------------------------------
'   リモート制御の初期化
'
'--------------------------------------------------------------------
Function Remote_Init(Optional ttl As String)
Dim strBuffer As String
Dim length As Integer

    MY_APP = ttl

    '.iniファイルからホスト名を取得する
    length = GET_INI_ENTRY("Redhat", "HostName", strBuffer, App.Path & "\" & INIT_FILE)
    If (length > 0) Then
        HOSTNAME = Left(strBuffer, length)
    Else
        HOSTNAME = DEFAULT_HOSTNAME
    End If

    '.iniファイルからユーザー名を取得する
    length = GET_INI_ENTRY("Redhat", "UserName", strBuffer, App.Path & "\" & INIT_FILE)
    If (length > 0) Then
        USERNAME = Left(strBuffer, length)
    Else
        USERNAME = DEFAULT_USERNAME
    End If

    '.iniファイルからダイアグファイル名を取得する
    length = GET_INI_ENTRY("Redhat", "DiagExe", strBuffer, App.Path & "\" & INIT_FILE)
    If (length > 0) Then
        DIAGEXE = Left(strBuffer, length)
    Else
        DIAGEXE = DEFAULT_DIAGEXE
    End If


End Function

'--------------------------------------------------------------------
'   新しい製品番号の取得
'       戻り値      ： 製品番号
'--------------------------------------------------------------------
Function Get_Number() As Long
'Dim ProductId_pri As Long
'On Error GoTo Exit1
'Open App.Path & "\prodid.DAT" For Input As #2 '数据LOAD
'    Input #2, ProductID
'    Close #2
'    ProductID = ProductID + 1
'    Get_Number = ProductID
'Open App.Path & "\prodid.DAT" For Output As #2 '数据LOAD
'Write #2, ProductID
'Close #2
'    Exit Function
'Exit1:
'    ProductID = ProductID + 1
'    Get_Number = ProductID
'Open App.Path & "\prodid.DAT" For Output As #2 '数据LOAD
'Write #2, ProductID
'Close #2
End Function

'--------------------------------------------------------------------
'   新しい製品番号の保存
'       Num         ：　現在測定した製品番号
'       戻り値      ： なし
'--------------------------------------------------------------------
Function Put_Number(num As Long)
Dim Ret As Integer

    Ret = PUT_INI_ENTRY("RPRODUCT", "ProductCount", CStr(num), App.Path & "\" & PRODUCT_CNT_FILE)

End Function

'--------------------------------------------------------------------
'   製品番号をクリアする
'       引数        ：　なし
'       戻り値      ： なし
'--------------------------------------------------------------------
Function Clear_Number()
Dim Ret As Integer

    Ret = PUT_INI_ENTRY("RPRODUCT", "ProductCount", "0", App.Path & "\" & PRODUCT_CNT_FILE)

End Function

'--------------------------------------------------------------------
'   初期設定ファイル読み込み
'       SECTION     ： セクション名
'       ENTRY       ： エントリー名
'       BUF         ： 読み込み文字列格納バッファ
'       INIT_NAME   ： 初期設定ファイル名
'       戻り値      ： 読み込み文字数
'--------------------------------------------------------------------
Function GET_INI_ENTRY(SECTION As String, ENTRY As String, Buf As String, INI_NAME As String) As Integer
    
    Dim DEF As String
    Dim RBuff As String * 512
    
    On Error Resume Next
    
    DEF = ""
    
    RBuff = String(512, " ")
    GET_INI_ENTRY = GetPrivateProfileString(SECTION, ENTRY, DEF, RBuff, 512, INI_NAME)
    Buf = LeftB(RBuff, LenB(Trim(RBuff)) - 1)
    
End Function


'--------------------------------------------------------------------
'   初期設定ファイル書き込み
'       SECTION     ： セクション名
'       ENTRY       ： エントリー名
'       BUF         ： 書き込み文字列格納バッファ
'       INI_NAME    ： 初期設定ファイル名
'       戻り値      ： 書き込み文字数
'--------------------------------------------------------------------
Function PUT_INI_ENTRY(SECTION As String, ENTRY As String, Buf As String, INI_NAME As String) As Integer
    
    On Error Resume Next
    
    PUT_INI_ENTRY = WritePrivateProfileString(SECTION, ENTRY, Buf, INI_NAME)
    
End Function



'--------------------------------------------------------------------
'   スリープ
'       dwTime     ： スリープ時間(msec)
'       戻り値      ： なし
'--------------------------------------------------------------------
Public Function ManSleep(dwTime As Long)
    Dim dwCurrent As Long
    Dim dwDef As Long

    dwCurrent = GetTickCount()
    Do
        dwDef = GetTickCount() - dwCurrent
        If (dwDef > dwTime) Then
            Exit Do
        End If
        DoEvents
    Loop
End Function



Function Exec_Test2(ByVal test_cmd As String, ByVal ip As String, ByVal id As Long, ByVal Wait As Long, ByVal Msg As String) As Integer
Dim id_num As String
Dim s As String
Dim Cmd$
Dim lExitCode As Long   '追加
Dim start_time As Long  '追加
Dim i As Long           '追加
On Error Resume Next
Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
If Ret <> 0 Then
Call Send_CTRL_C
SendMessageTimeout Ret, WM_CLOSE, 0&, 0&, SMTO_ABORTIFHUNG, 300&, Success
Sleep (100)
End If
If Dir(RESFILE$) <> "" Then Kill RESFILE$
    id_num = id ' + Right("0000000" & CStr(id), 7)
Select Case Stepitme
Case 100
Cmd$ = COMMANDPROMPT & " /c ssh " & ProductIp & " -l " & DEFAULT_USERNAME & " " & "/usr/local/sony/diag/EBX5016/" & test_cmd & " > " & RESFILE$ & " 2>&1"
'Case 1, 2, 3, 4
'Cmd$ = COMMANDPROMPT & " /c ssh " & DEFAULT_HOSTNAME & " -l " & DEFAULT_USERNAME & " " & DEFAULT_DIAGEXE & " " & "10.0.0.1" & " " & "1" & " " & test_cmd & " > " & RESFILE$ & " 2>&1"
Case Else
Cmd$ = COMMANDPROMPT & " /c ssh " & ProductIp & " -l " & DEFAULT_USERNAME & " " & DEFAULT_DIAGEXE & " " & DEFAULT_HOSTNAME & " " & "100" & " " & test_cmd & " > " & RESFILE$ & " 2>&1"
End Select
EBX5009_1.INFdisplay = Cmd$
    CmdRet = Shell(Cmd$, vbMinimizedFocus)
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '追加
            Select Case id
    Case 100 'AUDIO TEST
    start_time = GetTickCount()
Do
    MMn = ""
  MMn = LinuxCommandReceive
  Ret = 0
Ret = InStr(1, MMn, "OK")
DoEvents
Sleep (50)
Loop Until GetTickCount() - start_time > 5000 Or Ret > 0
Sleep (500)
    Case 0 'KEYTEST
start_time = GetTickCount()
Do
    MMn = ""
  MMn = LinuxCommandReceive
  Ret = 0
Ret = InStr(1, MMn, "Vol")
DoEvents
Sleep (50)
Loop Until GetTickCount() - start_time > 10000 Or Ret > 0
EBX5009_1.INFdisplay = MMn
Sleep (300)
If Ret > 0 And Len(MMn) > 20 Then
            Call IOwrite(1, 72)
            Sleep (200)
            Call IOwrite(1, 64)
            Sleep (1000)
            
            Call IOwrite(1, 68)
            Sleep (200)
            Call IOwrite(1, 64)
            Sleep (1000)
            
            Call IOwrite(1, 66)
            Sleep (200)
            Call IOwrite(1, 64)
            Sleep (1000)
            
            Call IOwrite(1, 65)
            Sleep (200)
            Call IOwrite(1, 64)
            Sleep (1000)
Ret = FindWindow(vbNullString, "C:\Windows\System32\cmd.exe")
If Ret > 0 Then
            Call IOwrite(1, 72)
            Sleep (200)
            Call IOwrite(1, 64)
            Sleep (1000)
            
            Call IOwrite(1, 68)
            Sleep (200)
            Call IOwrite(1, 64)
            Sleep (1000)
            
            Call IOwrite(1, 66)
            Sleep (200)
            Call IOwrite(1, 64)
            Sleep (1000)
            
            Call IOwrite(1, 65)
            Sleep (200)
            Call IOwrite(1, 64)
            Sleep (1000)
End If
End If
Case 4 'TPTEST
Call EBX5009_1.WAITtime(3000)
Call IOwrite(2, &H20)
Sleep (500)
Call IOwrite(2, &H0)
Sleep (500)
   End Select
    Call TestModule.Wtime2(Wait)   '等待时间
           Ret = GetExitCodeProcess(hProcess, lExitCode)
            If lExitCode = STILL_ACTIVE Then '强制结束待待
'            Select Case Stepitme
'            Case 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
'            Case Else
            Call Send_CTRL_C
'            End Select
'            DoEvents
            Ret = GetExitCodeProcess(hProcess, lExitCode)
            If lExitCode = STILL_ACTIVE Then Ret = CloseHandle(hProcess)
            End If
    MMn = LinuxCommandReceive
EBX5009_1.INFdisplay = MMn
If id = 0 Then
Ret = InStr(1, MMn, "OK")
If Ret > 0 Then
EBX5009_1.Judge(22).BackColor = vbGreen
EBX5009_1.Judge(22).Caption = "OK"
End If
End If
    AppActivate MY_APP
    
End Function
