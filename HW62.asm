INCLUDE Irvine32.inc

.data
PromptUser BYTE "Please enter a value:", 0


.code
main proc

mov ecx, 5
loop1:
mov edx, OFFSET PromptUser
call WriteString
call ReadInt
push eax
loop loop1

mov ecx, 5
loop2:
pop eax
call WriteInt
call Crlf
loop loop2

call ExitProcess
main endp
end main
