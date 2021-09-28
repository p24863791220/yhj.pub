Attribute VB_Name = "PIODIO"
Type LARGE_INTEGER
    lowpart As Long
    highpart As Long
End Type


Global Const PIODIO_NoError = 0
Global Const PIODIO_DriverOpenError = 1
Global Const PIODIO_DriverNoOpen = 2
Global Const PIODIO_GetDriverVersionError = 3
Global Const PIODIO_InstallIrqError = 4
Global Const PIODIO_ClearIntCountError = 5
Global Const PIODIO_GetIntCountError = 6
Global Const PIODIO_RegisterApcError = 7
Global Const PIODIO_RemoveIrqError = 8
Global Const PIODIO_FindBoardError = 9
Global Const PIODIO_ExceedBoardNumber = 10
Global Const PIODIO_ResetError = 11
Global Const PIODIO_IrqMaskError = 12
Global Const PIODIO_ActiveModeError = 13
Global Const PIODIO_GetActiveFlagError = 14
Global Const PIODIO_ActiveFlagEndOfQueue = 15

' define the interrupt signal source
Global Const PIOD144_P2C0 = 0 'pin29 of CN1(37 pin D-type, pin1 to pin37)
Global Const PIOD144_P2C1 = 1 'pin28 of CN1(37 pin D-type, pin1 to pin37)
Global Const PIOD144_P2C2 = 2 'pin27 of CN1(37 pin D-type, pin1 to pin37)
Global Const PIOD144_P2C3 = 3 'pin26 of CN1(37 pin D-type, pin1 to pin37)

' Interrupt Channel for PIO-D48
Global Const PIOD48_INTCH0 = 1   ' INT_CHAN_0
Global Const PIOD48_INTCH1 = 2   ' INT_CHAN_1
Global Const PIOD48_INTCH2 = 4   ' INT_CHAN_2
Global Const PIOD48_INTCH3 = 8   ' INT_CHAN_3
' Interrupt ActiveMode for PIOD48_XXX functions
Global Const PIOD48_ActiveLow = 1     ' Active When Low
Global Const PIOD48_ActiveHigh = 2    ' Active When High

' to trigger a interrupt when high -> low
Global Const PIODIO_ActiveLow = 0
' to trigger a interrupt when low -> high
Global Const PIODIO_ActiveHigh = 1


' ID
Global Const PIO_D168 = &H800150           ' 168 * D/I/O
Global Const PIO_D144 = &H800100           ' 144 * D/I/O
Global Const PIO_D96 = &H800110            ' 96 * D/I/O
Global Const PIO_D64 = &H800120            ' 64 * D/I/O
Global Const PIO_D56 = &H800140            ' D24 + 16I + 16O
Global Const PIO_D48 = &H800130            ' 48 * D/I/O
Global Const PIO_D24 = &H800140            ' 24 * D/I/O


' The Test functions
Declare Function PIODIO_ShortSub Lib "PIODIO.dll" _
        (ByVal A As Integer, ByVal b As Integer) As Integer
Declare Function PIODIO_FloatSub Lib "PIODIO.dll" _
        (ByVal A As Single, ByVal b As Single) As Single
Declare Function PIODIO_GetDllVersion Lib "PIODIO.dll" () As Integer

' The Driver functions
Declare Function PIODIO_DriverInit Lib "PIODIO.dll" () As Integer
Declare Sub PIODIO_DriverClose Lib "PIODIO.dll" ()
Declare Function PIODIO_SearchCard Lib "PIODIO.dll" _
        (wBoards As Integer, ByVal dwPIOPISOCardID As Long) As Integer
Declare Function PIODIO_GetDriverVersion Lib "PIODIO.dll" _
        (wDriverVersion As Integer) As Integer
Declare Function PIODIO_GetConfigAddressSpace Lib "PIODIO.dll" _
        (ByVal wBoardNo As Integer, wAddrBase As Long, wIrqNo As Integer, _
        wSubVendor As Integer, wSubDevice As Integer, wSubAux As Integer, _
        wSlotBus As Integer, wSlotDevice As Integer) As Integer

Declare Function PIODIO_ActiveBoard Lib "PIODIO.dll" _
        (ByVal wBoardNo As Integer) As Integer
Declare Function PIODIO_WhichBoardActive Lib "PIODIO.dll" () As Integer


' DIO functions
Declare Sub PIODIO_OutputByte Lib "PIODIO.dll" _
        (ByVal address As Long, ByVal dataout As Integer)
Declare Sub PIODIO_OutputWord Lib "PIODIO.dll" _
        (ByVal address As Long, ByVal dataout As Long)
Declare Function PIODIO_InputByte Lib "PIODIO.dll" _
        (ByVal address As Long) As Integer
Declare Function PIODIO_InputWord Lib "PIODIO.dll" _
        (ByVal address As Long) As Long

' Interrupt functions
Declare Function PIODIO_IntInstall Lib "PIODIO.dll" _
        (ByVal wBoard As Integer, hEvent As Long, _
        ByVal wInterruptSource As Integer, _
        ByVal wActiveMode As Integer) As Integer
Declare Function PIODIO_IntRemove Lib "PIODIO.dll" () As Integer
Declare Function PIODIO_IntGetCount Lib "PIODIO.dll" _
        (dwIntCount As Long) As Integer
Declare Function PIODIO_IntResetCount Lib "PIODIO.dll" () As Integer

' PIOD48 Counter functions
Declare Sub PIOD48_SetCounter Lib "PIODIO.dll" _
        (ByVal dwBase As Long, ByVal wCounterNo As Integer, _
        ByVal bCounterMode As Integer, ByVal wCounterValue As Long)
Declare Function PIOD48_ReadCounter Lib "PIODIO.dll" _
        (ByVal dwBase As Long, ByVal wCounterNo As Integer, _
        ByVal bCounterMode As Integer) As Long
Declare Sub PIOD48_SetCounterA Lib "PIODIO.dll" _
        (ByVal wCounterNo As Integer, ByVal bCounterMode As Integer, _
        ByVal wCounterValue As Long)
Declare Function PIOD48_ReadCounterA Lib "PIODIO.dll" _
        (ByVal wCounterNo As Integer, ByVal bCounterMode As Integer) As Long

' PIOD48 Interrupt functions
Declare Function PIOD48_IntInstall Lib "PIODIO.dll" _
        (ByVal wBoardNo As Integer, hEvent As Long, _
        ByVal wIrqMask As Integer, ByVal wActiveMode As Integer) As Integer
Declare Function PIOD48_IntRemove Lib "PIODIO.dll" () As Integer
Declare Function PIOD48_IntGetActiveFlag Lib "PIODIO.dll" _
        (bActiveHighFlag As Integer, bActiveLowFlag As Integer) As Integer
Declare Function PIOD48_IntGetCount Lib "PIODIO.dll" _
        (dwIntCount As Long) As Integer

' PIOD64 Counter functions
Declare Sub PIOD64_SetCounter Lib "PIODIO.dll" _
        (ByVal dwBase As Long, ByVal wCounterNo As Integer, _
        ByVal bCounterMode As Integer, ByVal wCounterValue As Long)
Declare Function PIOD64_ReadCounter Lib "PIODIO.dll" _
        (ByVal dwBase As Long, ByVal wCounterNo As Integer, _
        ByVal bCounterMode As Integer) As Long
Declare Sub PIOD64_SetCounterA Lib "PIODIO.dll" _
        (ByVal wCounterNo As Integer, ByVal bCounterMode As Integer, _
        ByVal wCounterValue As Long)
Declare Function PIOD64_ReadCounterA Lib "PIODIO.dll" _
        (ByVal wCounterNo As Integer, ByVal bCounterMode As Integer) As Long

' PIOD48 Frequency Measurement Functons
Declare Function PIOD48_Freq Lib "PIODIO.dll" _
        (ByVal dwBase As Long) As Long
Declare Function PIOD48_FreqA Lib "PIODIO.dll" () As Long
Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long) 'µÈ´ýÊ±¼ä
Declare Function GetTickCount Lib "kernel32" () As Long
Declare Function QueryPerformanceFrequency Lib "kernel32" _
        (lpFrequency As LARGE_INTEGER) As Long

Declare Function QueryPerformanceCounter Lib "kernel32" _
        (lpPerformanceCount As LARGE_INTEGER) As Long
Declare Function timeSetEvent Lib "winmm.dll" (ByVal uDelay As Long, ByVal _
        uResolution As Long, ByVal lpFunction As Long, ByVal dwUser As Long, _
        ByVal uFlags As Long) As Long
Public wBaseAddr As Long
Public Sub DIOINIT()
'    Dim rtn
'    Dim wRetVal As Integer
'    wInitialCode = PIODIO_DriverInit()
'    If wInitialCode <> PIODIO_NoError Then
'        rtn = MsgBox("i/o Driver initialize error!!!", , "PIODIO Card Error")
'        Exit Sub
'    End If
'    '**************?
'    If PIODIO_SearchCard(wTotalBoards, PIO_D48) <> PIODIO_NoError Then
'        rtn = MsgBox("Search Card Error!!", , "PIODIO Card Error")
'    End If
'    'Get board's Configuration Space**************?
'
'    wRetVal = PIODIO_GetConfigAddressSpace(wTotalBoards - 1, wBaseAddr, wIrq, _
'            wSubVendor, wSubDevice, wSubAux, _
'            wSlotBus, wSlotDevice)
'    If wRetVal <> PIODIO_NoError Then
'        rtn = MsgBox("Search Card Error!!", , "PIODIO Card Error")
'        Exit Sub
'    End If
'    PIODIO_OutputByte wBaseAddr, 1           '// enable DI/DO
'
'    '"Setting Port 0, 1, 2 to Output-Mode"
'    PIODIO_OutputByte (wBaseAddr + &HCC), &H90
'    ' "Setting Port 3, 4, 5 to output-Mode"
'    PIODIO_OutputByte (wBaseAddr + &HDC), &H80

End Sub
