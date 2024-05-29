include Irvine32.inc

.data
sensor1 DWORD ?
sensor2 DWORD ?

prompt1 BYTE "Enter sensor value 1: ", 0
prompt2 BYTE "Enter sensor value 2: ", 0

outAgree BYTE "Agree", 0
outDisagree BYTE "Disagree", 0
outNoseDown BYTE "Nose Down", 0

.code
main PROC
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov sensor1, eax
    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov sensor2, eax
    mov eax, sensor1
    sub eax, sensor2
    imul eax, eax
    cmp eax, 16 ; 4 * 4
    jle agree
    mov edx, OFFSET outDisagree
    call WriteString
    call Crlf
    exit

agree:
    mov edx, OFFSET outAgree
    call WriteString
    call Crlf


    cmp sensor1, 50
    jg noseDown
    cmp sensor2, 50
    jg noseDown
    exit

noseDown:
    mov edx, OFFSET outNoseDown
    call WriteString
    call Crlf
    exit
    

main ENDP

END main

