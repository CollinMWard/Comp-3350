INCLUDE Irvine32.inc

.data
result  DWORD 0
prompt BYTE "Enter value to multiply: ", 0

.code
main PROC
    mov     edx, OFFSET prompt
    call    WriteString
    call    ReadInt
    mov     ebx, eax
    mov     ebx, 10 
    mov     ecx, 15             
    call    Multiply15   
    call    WriteDec                      
    exit

main ENDP


Multiply15 PROC
    push    edx                  
    mov     eax, ebx             
    mov     edx, 0                
    mov     ecx, 4              
    shl     eax, cl       
    sub     eax, ebx
    pop     edx         
    ret

Multiply15 ENDP


END main
