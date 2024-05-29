INCLUDE Irvine32.inc

.data
    inputPrompt BYTE "Input (0 - Blue, 1 - Orange, 2 - Red): ", 0
    tigerStr    BYTE "War Eagle", 0

.code
InputIntColor PROC
    mov edx, OFFSET inputPrompt
    mov eax, white
    call SetTextColor
    call WriteString
    call ReadInt
    cmp eax, 0
    je SetBlue
    cmp eax, 1
    je SetOrange
    cmp eax, 2
    je SetRed
  

SetBlue:
    mov bl, 0
    ret

SetOrange:
    mov bl, 1
    ret

SetRed:
    mov bl, 2
    ret


InputIntColor ENDP

DisplayTiger PROC
    cmp bl, 0
    je BlueColor
    cmp bl, 1
    je OrangeColor
    cmp bl, 2
    je RedColor
    

BlueColor:
    mov edx, OFFSET tigerStr
    mov eax, blue
    call SetTextColor
    call WriteString
    ret

OrangeColor:
    mov edx, OFFSET tigerStr
    mov eax, lightRed
    call SetTextColor
    call WriteString
    ret

RedColor:
    mov edx, OFFSET tigerStr
    mov eax, red
    call SetTextColor
    call WriteString
    ret

DisplayTiger ENDP

main PROC
    call InputIntColor
    call DisplayTiger
    call ExitProcess
main ENDP

END main
