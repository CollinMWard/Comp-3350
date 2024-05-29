
INCLUDE Irvine32.inc

.data
    inputPrompt BYTE "Enter 0 for Blue, 1 for Orange, or 2 for Red: ", 0
    tigerStr    BYTE "War Eagle", 0

.code
InputIntColor PROC
    ; Display the input prompt
    mov edx, OFFSET inputPrompt
    call WriteString

    ; Read an integer from the keyboard
    call ReadInt

    ; Check the value and set BL accordingly
    cmp eax, 0
    je SetBlue
    cmp eax, 1
    je SetOrange
    cmp eax, 2
    je SetRed
    jmp InvalidInput

SetBlue:
    mov bl, 0
    ret

SetOrange:
    mov bl, 1
    ret

SetRed:
    mov bl, 2
    ret

InvalidInput:
    ; Handle invalid input (not 0, 1, or 2)
    mov bl, 0xFF
    ret

InputIntColor ENDP

DisplayTiger PROC
    ; Check the value of BL and set the text color accordingly
    cmp bl, 0
    je Blue
    cmp bl, 1
    je Orange
    cmp bl, 2
    je Red
    jmp DefaultColor

Blue:
    mov edx, OFFSET tigerStr
    call SetTextColorBlue
    call WriteString
    jmp Done

Orange:
    mov edx, OFFSET tigerStr
    call SetTextColorOrange
    call WriteString
    jmp Done

Red:
    mov edx, OFFSET tigerStr
    call SetTextColorRed
    call WriteString
    jmp Done

DefaultColor:
    ; Set default text color
    call SetTextColorWhite
    mov edx, OFFSET tigerStr
    call WriteString

Done:
    ret

DisplayTiger ENDP

main PROC
    ; Call InputIntColor to get the color choice
    call InputIntColor

    ; Call DisplayTiger to display "War Eagle" in the chosen color
    call DisplayTiger

    ; Exit the program
    call DumpRegs
    call ExitProcess
main ENDP

END main