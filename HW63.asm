INCLUDE Irvine32.inc

.data
prompt      BYTE "Please input a value: ", 0
spacing     BYTE ", ", 0;
String1     BYTE "The target value is,", 0
String2     BYTE "and is located at index: ", 0
String3     BYTE  "Value not found", 0
target DW 0

.code
main proc

mov edx, OFFSET prompt
call WriteString
call ReadInt
mov target, ax

mov edx, OFFSET String1
call WriteString
call WriteInt
mov edx, OFFSET spacing
call WriteString
mov edx, OFFSET string2
call WriteString

mov eax, -79
push eax
mov eax, -44
push eax
mov eax, -10
push eax
mov eax, -1
push eax
mov eax, -6
push eax
mov eax, -7
push eax


main endp

Search PROC

mov ecx, 6
mov ebx, 0
loop1:
pop eax
cmp target, ax
je Found
add ebx, 1
loop loop1

call Crlf
mov edx, OFFSET String3
call WriteString


call ExitProcess


Found:
mov eax, ebx
call WriteInt
call ExitProcess

Search ENDP

end main
