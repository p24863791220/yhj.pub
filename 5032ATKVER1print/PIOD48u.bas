Attribute VB_Name = "PIOD48u"
'Option Explicit
'
'
''// ******************************************************************
''// Initialize the INT2(COut0) Interrupt to High
''// this will uses the Counter0 to trigger the interrupt.
''//
''// wAddrBase       : The base address of PIO-D48,
''//                   please refer to function 'PIODIO_GetConfigAddressSpace()'.
''// wClockIntConfig : The "Clock/Int Control Register" configuration code,
''//                   refer to section "Read/Write Clock/Int Control Register"
''//                   in the hardware's manaul.
''// wCounter0Config : The configuration code of Counter0
''// wCounter0Value  : 0 to &hFFFF, the value is used to set the Counter0
''//                   Only the low WORD (16-bits) is valid.
''// ******************************************************************
'Sub PIOD48u_INT2InitialHigh(ByVal wAddrBase As Long, ByVal wClockIntConfig As Integer, _
'    ByVal wCounter0Config As Integer, ByVal wCounter0Value As Long)
'
'    PIODIO_OutputByte (wAddrBase + &HF0), wClockIntConfig
'
'    '//--- program the trigger freq as P2C0 div wCounter0Value   ---
'    '//--- For example: if freq of P2C0 is 100Hz, then the       ---
'    '//--- Freq for COut0 as P2C0/wCounter0Value                 ---
'    wCounter0Config = (wCounter0Config \ 2) And &H7       ' Counter mode
'    PIOD48_SetCounter wAddrBase, 0, wCounter0Config, wCounter0Value  'Counter 0
'
'End Sub
'
''// ******************************************************************
''// Initialize the INT3(COut2) Interrupt to High,
''// this will uses the Counter1 and Counter2 to trigger the interrupt.
''//
''// wAddrBase       : The base address of PIO-D48,
''//                   please refer to function 'PIODIO_GetConfigAddressSpace()'.
''// wClockIntConfig : The "Clock/Int Control Register" configuration code,
''//                   refer to section "Read/Write Clock/Int Control Register"
''//                   in the hardware's manaul.
''// wCounter1Config : The configuration code of Counter1
''// wCounter1Value  : 0 to &hFFFF, the value is used to set the Counter1
''//                   Only the low WORD (16-bits) is valid.
''// wCounter2Config : The configuration code of Counter2
''// wCounter2Value  : 0 to &hFFFF, the value is used to set the Counter2
''//                   Only the low WORD (16-bits) is valid.
''// ******************************************************************
'Sub PIOD48u_INT3InitialHigh(ByVal wAddrBase As Long, ByVal wClockIntConfig As Integer, _
'          ByVal wCounter1Config As Integer, ByVal wCounter1Value As Long, _
'          ByVal wCounter2Config As Integer, ByVal wCounter2Value As Long)
'
'   PIODIO_OutputByte (wAddrBase + &HF0), wClockIntConfig
'
'   '// Cout2 as ?hz/( wCounter1Value * wCounter2Value)
'   wCounter1Config = (wCounter1Config \ 2) And &H7       ' Counter mode
'   wCounter2Config = (wCounter2Config \ 2) And &H7       ' Counter mode
'   PIOD48_SetCounter wAddrBase, 1, wCounter1Config, wCounter1Value  'Counter 1
'   PIOD48_SetCounter wAddrBase, 2, wCounter2Config, wCounter2Value  'Counter 2
'
'   '// wait for Cout2 to high
'   While (True)
'      If ((PIODIO_InputByte(wAddrBase + &H7) And &H8) <> 0) Then
'          Exit Sub
'      End If
'   Wend
'End Sub

