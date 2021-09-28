Attribute VB_Name = "GPIBborad"
Declare Function PciGpibExInitBoard Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal hWnd As Long) As Long
Declare Function PciGpibExFinishBoard Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExGetInfo Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal nPrmNo As Long, ByRef upGetPrm As Long) As Long
Declare Function PciGpibExSetConfig Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal szInfo As String) As Long
Declare Function PciGpibExGetConfig Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal nPrmNo As Long, ByRef upGetPrm As Long) As Long
Declare Function PciGpibExSetIfc Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal nTime As Long) As Long
Declare Function PciGpibExSetRen Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExResetRen Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExSetRemote Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long) As Long
Declare Function PciGpibExExecTrigger Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long) As Long
Declare Function PciGpibExExecDevClear Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExExecSdc Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long) As Long
Declare Function PciGpibExSetLocal Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long) As Long
Declare Function PciGpibExSetLlo Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExSetRwls Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long) As Long
Declare Function PciGpibExExecPassCtrl Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long) As Long
Declare Function PciGpibExReSysCtrl Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal nMode As Long) As Long
Declare Function PciGpibExGoStandby Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal nMode As Long) As Long
Declare Function PciGpibExGoActCtrller Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal nMode As Long) As Long
Declare Function PciGpibExExecSpoll Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long, ByRef npStbTbl As Long, ByRef npStbAdrs As Long) As Long
Declare Function PciGpibExCheckSrq Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExClearSrq Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExEnableSrq Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExDisableSrq Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExExecPpoll Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npPst As Long) As Long
Declare Function PciGpibExCfgPpoll Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long, ByVal nPpe As Long) As Long
Declare Function PciGpibExUnCfgPpoll Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long) As Long
Declare Function PciGpibExWriteBusCmd Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npCmdTbl As Long) As Long
Declare Function PciGpibExSetSignal Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal uSignal As Long, ByVal bDetect As Long) As Long
Declare Function PciGpibExWaitSignal Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef uStatus As Long) As Long
Declare Function PciGpibExGetStatus Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef uStatus As Long) As Long
Declare Function PciGpibExClrStatus Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal uClrStat As Long) As Long
Declare Function PciGpibExMastSendData Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long, ByVal dwLength As Long, ByVal pvBuffer As String, ByVal uMsg As Long) As Long
Declare Function PciGpibExMastRecvData Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long, ByRef dwpLength As Long, ByVal pvBuffer As String, ByVal uMsg As Long) As Long
Declare Function PciGpibExMastSendFile Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long, ByVal szFname As String) As Long
Declare Function PciGpibExMastRecvFile Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef npAdrsTbl As Long, ByRef dwpLength As Long, ByVal szFname As String) As Long
Declare Function PciGpibExSlavSendData Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal dwLength As Long, ByVal pvBuffer As String, ByVal uMsg As Long) As Long
Declare Function PciGpibExSlavRecvData Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef dwpLength As Long, ByVal pvBuffer As String, ByVal uMsg As Long) As Long
Declare Function PciGpibExSlavSendFile Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal szFname As String) As Long
Declare Function PciGpibExSlavRecvFile Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByRef dwpLength As Long, ByVal szFname As String) As Long
Declare Function PciGpibExSlavCheckStb Lib "GPC4304.DLL" (ByVal nBoardNo As Long) As Long
Declare Function PciGpibExSlavSetSrq Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal nStb As Long) As Long
Declare Function PciGpibExSlavSetIst Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal nFlag As Long) As Long
Declare Function PciGpibExSlavSetPp2 Lib "GPC4304.DLL" (ByVal nBoardNo As Long, ByVal nMode As Long) As Long
Declare Function PciGpibExWaitTimer Lib "GPC4304.DLL" (ByVal dwTimer As Long) As Long
Declare Function PciGpibExStartTimer Lib "GPC4304.DLL" () As Long
Declare Function PciGpibExClearTimer Lib "GPC4304.DLL" () As Long
Declare Function PciGpibExReadTimer Lib "GPC4304.DLL" (ByRef dwReadTimer As Long) As Long
Declare Function PciGpibExStopTimer Lib "GPC4304.DLL" () As Long

Public nBoardNo As Long              ' Board number
Public nInitBoardNo As Long          ' Board number (The specified number when the board is initialized.)
Public InpDevAdrs As Long            ' Talker address
Public OutpDevAdrs As Long           ' Listener address

Public InpDevAdrsTbl(1) As Long      ' Talker address table
Public OutpDevAdrsTbl(1) As Long     ' Listener address table

Public RecvBuffer As String * 32     ' Receive buffer


Public Sub DsplyErrMessage(ByVal nErrCode As Integer)
    Select Case nErrCode
        Case 2
            nRet = MsgBox("Return value: 2 The read operation was successfully completed with detecting the EOI assertion.", (vbOKOnly + vbInformation), "Device_B")
        Case 1
            nRet = MsgBox("Return value: 1 The read operation is terminated when count of data bytes received reaches the specified number.", (vbOKOnly + vbInformation), "Device_B")
        Case 0
            nRet = MsgBox("Return value: 0 The process was successfully completed.", (vbOKOnly + vbInformation), "Device_B")
        Case -1
            nRet = MsgBox("Return value: -1 The specified board number is invalid.", (vbOKOnly + vbCritical), "Device_B")
        Case -4
            nRet = MsgBox("Return value: -4 The interface is not a Listener or a Talker.", (vbOKOnly + vbCritical), "Device_B")
        Case -5
            nRet = MsgBox("Return value: -5 The interface is not the Controller-in-charge.", (vbOKOnly + vbCritical), "Device_B")
        Case -7
            nRet = MsgBox("Return value: -7 Failed to send a GPIB command.", (vbOKOnly + vbCritical), "Device_B")
        Case -12
            nRet = MsgBox("Return value: -12 Failed to read an operation.", (vbOKOnly + vbCritical), "Device_B")
        Case -13
            nRet = MsgBox("Return value: -13 Failed to write an operation.", (vbOKOnly + vbCritical), "Device_B")
        Case -14
            nRet = MsgBox("Return value: -14 The timeout interval is elapsed before the read operation is completed.", (vbOKOnly + vbCritical), "Device_B")
        Case -16
            nRet = MsgBox("Return value: -16 The I/O operation is aborted by the IFC signal assertion.", (vbOKOnly + vbCritical), "Device_B")
        Case -20
            nRet = MsgBox("Return value: -20 Asynchronous transfer is in progress on the GPIB.", (vbOKOnly + vbCritical), "Device_B")
        Case -995
            nRet = MsgBox("Return value: -995 Failed to close the board.", (vbOKOnly + vbCritical), "Device_B")
        Case -996
            nRet = MsgBox("Return value: -996 The driver software cannot allocate enough memory.", (vbOKOnly + vbCritical), "Device_B")
        Case -997
            nRet = MsgBox("Return value: -997 The timer is not successfully configured.", (vbOKOnly + vbCritical), "Device_B")
        Case -998
            nRet = MsgBox("Return value: -998 Hardware resources such as IRQ level and DMA channel may conflict with the system or other devices.", (vbOKOnly + vbCritical), "Device_B")
        Case -999
            nRet = MsgBox("Return value: -999 The board is not correctly installed or the I/O port addresses conflicts with the system or other devices.", (vbOKOnly + vbCritical), "Device_B")
        Case Else
            nRet = MsgBox("An unexpected error occurred.", (vbOKOnly + vbCritical), "Device_B")
    End Select
End Sub

Public Sub GPIBINIT()
Dim sParam As String
  
  ' Initializes a GPIB board.
  nStat = PciGpibExInitBoard(0, 0)
  If nStat Then
    Call DsplyErrMessage(nStat)
    Unload TESTFROM
  End If
  
  ' IFC line assertion
  nStat = PciGpibExSetIfc(0, 1)
  If nStat Then
    Call DsplyErrMessage(nStat)
    Unload TESTFROM
  End If
  
  ' REN line configuration
  nStat = PciGpibExSetRen(0)
  If nStat Then
    Call DsplyErrMessage(nStat)
    Unload TESTFROM
  End If

End Sub

