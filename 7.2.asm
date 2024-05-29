include Irvine32.inc

.data
key DWORD 147, 0
lastname BYTE "Ward", 0
cipher BYTE 4 DUP (0) 
plain BYTE 4 DUP (0)


.code
main PROC
   
    mov edx, OFFSET lastname
    call WriteString
    call Crlf
    mov esi, OFFSET lastname
    mov edi, OFFSET cipher 
    mov ecx, LENGTHOF lastname
    dec ecx
    mov ebx, key  

encode:
    mov al, [esi]              
    xor al, bl                 
    mov [edi], al              
    inc esi                  
    inc edi
    loop encode

    mov byte ptr [edi], 0
    mov edx, OFFSET cipher
    call WriteString
    call Crlf
    mov esi, OFFSET cipher
    mov edi, OFFSET plain 
    mov ebx, key 

    mov ecx, LENGTHOF lastname
    dec ecx
decode:
    mov al, [esi]             
    xor al, bl              
    mov [edi], al             
    inc esi             
    inc edi
    loop decode

    mov byte ptr [edi], 0
    mov edx, OFFSET plain
    call WriteString
    exit
main ENDP

END main

