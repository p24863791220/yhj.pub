Attribute VB_Name = "Remote_Cont"
Option Explicit
Public ProductIp As String
Public ProductID As Long
Public strBuffer As String
Public Response As Integer
Public RetestAudio As Integer

Global Const COMMANDPROMPT = "C:\Windows\System32\cmd.exe"
Private Const INIT_FILE = "remote.ini"              '���`�ȥ��`�Щ`���O���ե�����
Private Const PRODUCT_CNT_FILE = "prodcnt.txt"      '�y�������uƷ���Ťα���ե�����
Public Const RESFILE = "c:\result.txt"             '���`�ȥ��`�Щ`����Υ쥹�ݥ󥹥ե�����

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

'׷��
Public hProcess As Long
Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long

Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
'
Public Const PROCESS_QUERY_INFORMATION = &H400&
Public Const STILL_ACTIVE = &H103&

'׷�Ӥ����ޤ�

'--------------------------------------------------------------------
'   Redhat��rsh�ǥƥ��ȥ��ޥ�ɤ����Ť���
'       test_cmd        �� DIAG���ޥ��
'       id              �� DIAG�g��ID���uƷNo.��
'       res_valid       �� True = Linux��������ܤ�ȡ�롡False = Linux����Ώ����ܤ�ȡ��ʤ�
'       wait            �� �ƥ��Ȍg�д����r�g��sec��
'       msg             �� �ƥ��ȽY���Υ�å��`��
'       ���ꂎ          ����0 = �ƥ���OK
'                       ����1 = �ƥ���NG
'                       ����-1 = ��𥿥��ॢ���ȥ���`
'--------------------------------------------------------------------
Function Exec_Test(test_cmd As String, ip As String, id As Long, Wait As Long, Msg As String) As Integer
'On Error Resume Next
'Dim id_num As String
'Dim s As String
'Dim Cmd$
'Dim lExitCode As Long   '׷��
'Dim start_time As Long  '׷��
'Dim i As Long           '׷��
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
'    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '׷��
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
'        Call TestModule.Wtime2(Wait)   '�ȴ�ʱ��
''        If RemoteCommandReceive = False Then Call TestModule.WtimeOut    '�ȴ�ʱ��
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
Dim lExitCode As Long   '׷��
Dim start_time As Long  '׷��
Dim i As Long           '׷��

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
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '׷��
    Call TestModule.Wtime2(Wait) '�ȴ�ʱ��
    Ret = GetExitCodeProcess(hProcess, lExitCode)
'    If lExitCode = STILL_ACTIVE Then RomCheck5017.WtimeOut (wait) '��������
   Ret = GetExitCodeProcess(hProcess, lExitCode)
            If lExitCode = STILL_ACTIVE Then 'ǿ�ƽ�������
            Call Send_CTRL_C
            
'            DoEvents
            Ret = GetExitCodeProcess(hProcess, lExitCode)
            If lExitCode = STILL_ACTIVE Then Ret = CloseHandle(hProcess)
            End If
            
    AppActivate MY_APP
    
End Function
Function Send_OK()

Dim lExitCode As Long   '׷��
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '׷��
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

Dim lExitCode As Long   '׷��
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '׷��
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

Dim lExitCode As Long   '׷��
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '׷��
    'Do
        On Error GoTo Err:
        AppActivate COMMANDPROMPT
        DoEvents
        SendKeys ("^(C)")
        DoEvents
'        Ret = GetExitCodeProcess(hProcess, lExitCode)
        Sleep (10)
If CheckApplicationIsRun("cmd.exe") = True Then 'Explorer.exeΪ��Ҫ�����Ľ�������
Shell "taskkill /im cmd.exe /f", vbHide 'Explorer.exeΪ��Ҫ�����Ľ�������
End If
If CheckApplicationIsRun("CMD.exe") = True Then 'Explorer.exeΪ��Ҫ�����Ľ�������
Shell "taskkill /im CMD.exe /f", vbHide 'Explorer.exeΪ��Ҫ�����Ľ�������
End If
    'Loop While lExitCode = STILL_ACTIVE
Err:
    Exit Function

End Function
Public Function Send_ENTER()

Dim lExitCode As Long   '׷��
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '׷��
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
'   Reddat����g�нY����ȡ�ä���
'       msg         �� ���Ť�����å��`��
'       wait        �� ���Ŵ����r�g(sec) ; 0 = ���å�`��
'       ���ꂎ      ����true = ���ųɹ�
'                   ����false = ���ť����ॢ����
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
'   ���`�������γ��ڻ�
'
'--------------------------------------------------------------------
Function Remote_Init(Optional ttl As String)
Dim strBuffer As String
Dim length As Integer

    MY_APP = ttl

    '.ini�ե����뤫��ۥ�������ȡ�ä���
    length = GET_INI_ENTRY("Redhat", "HostName", strBuffer, App.Path & "\" & INIT_FILE)
    If (length > 0) Then
        HOSTNAME = Left(strBuffer, length)
    Else
        HOSTNAME = DEFAULT_HOSTNAME
    End If

    '.ini�ե����뤫���`���`����ȡ�ä���
    length = GET_INI_ENTRY("Redhat", "UserName", strBuffer, App.Path & "\" & INIT_FILE)
    If (length > 0) Then
        USERNAME = Left(strBuffer, length)
    Else
        USERNAME = DEFAULT_USERNAME
    End If

    '.ini�ե����뤫����������ե���������ȡ�ä���
    length = GET_INI_ENTRY("Redhat", "DiagExe", strBuffer, App.Path & "\" & INIT_FILE)
    If (length > 0) Then
        DIAGEXE = Left(strBuffer, length)
    Else
        DIAGEXE = DEFAULT_DIAGEXE
    End If


End Function

'--------------------------------------------------------------------
'   �¤����uƷ���Ť�ȡ��
'       ���ꂎ      �� �uƷ����
'--------------------------------------------------------------------
Function Get_Number() As Long
'Dim ProductId_pri As Long
'On Error GoTo Exit1
'Open App.Path & "\prodid.DAT" For Input As #2 '����LOAD
'    Input #2, ProductID
'    Close #2
'    ProductID = ProductID + 1
'    Get_Number = ProductID
'Open App.Path & "\prodid.DAT" For Output As #2 '����LOAD
'Write #2, ProductID
'Close #2
'    Exit Function
'Exit1:
'    ProductID = ProductID + 1
'    Get_Number = ProductID
'Open App.Path & "\prodid.DAT" For Output As #2 '����LOAD
'Write #2, ProductID
'Close #2
End Function

'--------------------------------------------------------------------
'   �¤����uƷ���Ťα���
'       Num         �����F�ڜy�������uƷ����
'       ���ꂎ      �� �ʤ�
'--------------------------------------------------------------------
Function Put_Number(num As Long)
Dim Ret As Integer

    Ret = PUT_INI_ENTRY("RPRODUCT", "ProductCount", CStr(num), App.Path & "\" & PRODUCT_CNT_FILE)

End Function

'--------------------------------------------------------------------
'   �uƷ���Ť򥯥ꥢ����
'       ����        �����ʤ�
'       ���ꂎ      �� �ʤ�
'--------------------------------------------------------------------
Function Clear_Number()
Dim Ret As Integer

    Ret = PUT_INI_ENTRY("RPRODUCT", "ProductCount", "0", App.Path & "\" & PRODUCT_CNT_FILE)

End Function

'--------------------------------------------------------------------
'   �����O���ե������i���z��
'       SECTION     �� �����������
'       ENTRY       �� ����ȥ�`��
'       BUF         �� �i���z�������и�{�Хåե�
'       INIT_NAME   �� �����O���ե�������
'       ���ꂎ      �� �i���z��������
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
'   �����O���ե���������z��
'       SECTION     �� �����������
'       ENTRY       �� ����ȥ�`��
'       BUF         �� �����z�������и�{�Хåե�
'       INI_NAME    �� �����O���ե�������
'       ���ꂎ      �� �����z��������
'--------------------------------------------------------------------
Function PUT_INI_ENTRY(SECTION As String, ENTRY As String, Buf As String, INI_NAME As String) As Integer
    
    On Error Resume Next
    
    PUT_INI_ENTRY = WritePrivateProfileString(SECTION, ENTRY, Buf, INI_NAME)
    
End Function



'--------------------------------------------------------------------
'   ����`��
'       dwTime     �� ����`�וr�g(msec)
'       ���ꂎ      �� �ʤ�
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
Dim lExitCode As Long   '׷��
Dim start_time As Long  '׷��
Dim i As Long           '׷��
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
    hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 1, CmdRet)  '׷��
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
    Call TestModule.Wtime2(Wait)   '�ȴ�ʱ��
           Ret = GetExitCodeProcess(hProcess, lExitCode)
            If lExitCode = STILL_ACTIVE Then 'ǿ�ƽ�������
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
