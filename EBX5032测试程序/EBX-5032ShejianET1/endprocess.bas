Attribute VB_Name = "endprocess"
Function CheckApplicationIsRun(ByVal szExeFileName As String) As Boolean
On Error GoTo Err
Dim WMI
Dim Obj
Dim Objs
CheckApplicationIsRun = False
Set WMI = GetObject("WinMgmts:")
Set Objs = WMI.InstancesOf("Win32_Process")
For Each Obj In Objs
If InStr(UCase(szExeFileName), UCase(Obj.Description)) <> 0 Then
CheckApplicationIsRun = True
If Not Objs Is Nothing Then Set Objs = Nothing
If Not WMI Is Nothing Then Set WMI = Nothing
Exit Function
End If
Next
If Not Objs Is Nothing Then Set Objs = Nothing
If Not WMI Is Nothing Then Set WMI = Nothing
Exit Function
Err:
If Not Objs Is Nothing Then Set Objs = Nothing
If Not WMI Is Nothing Then Set WMI = Nothing
End Function

'Private Sub Form_Load()
'Timer1.Interval = 1000
'End Sub
'Private Sub Timer1_Timer()
'If CheckApplicationIsRun("Explorer.exe") = True Then 'Explorer.exe为你要结束的进程名字
'Shell "taskkill /im Explorer.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
'Else
'Exit Sub
'End If
'End Sub
Public Sub EndSSH()
If CheckApplicationIsRun("ssh.exe") = True Then 'Explorer.exe为你要结束的进程名字
Shell "taskkill /im ssh.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
End If
If CheckApplicationIsRun("sshd.exe") = True Then 'Explorer.exe为你要结束的进程名字
Shell "taskkill /im sshd.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
End If
If CheckApplicationIsRun("rsh.exe") = True Then 'Explorer.exe为你要结束的进程名字
Shell "taskkill /im rsh.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
End If
If CheckApplicationIsRun("SSHD.exe") = True Then 'Explorer.exe为你要结束的进程名字
Shell "taskkill /im SSHD.exe /f", vbHide 'Explorer.exe为你要结束的进程名字
End If
End Sub
