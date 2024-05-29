INCLUDE Irvine32.inc

.data
MyString BYTE "Summer is pleasant in Auburn", 0
SearchChar BYTE 'k', 0
Index DWORD ?
NewLine BYTE 0dh, 0ah, 0
String1 BYTE "Character found: ", 0
String2 BYTE "Character not found", 0
String3 BYTE " at index: ", 0
.code
main PROC

    
    mov edx, OFFSET MyString 
    mov al, SearchChar 
    mov ecx, 0    

scan:
    mov bl, [edx]           
    cmp bl, 0             
    je charNotFound

    cmp bl, al              
    je charFound

    inc edx                 
    inc ecx            
    jmp scan

charFound:
    mov Index, ecx        

    mov edx, OFFSET NewLine
    call WriteString

    mov edx, 0
    mov edx, OFFSET string1
    call WriteString

    mov al, SearchChar     
    call WriteChar

    mov edx, OFFSET string3
    call WriteString

    mov eax, Index        
    call WriteInt

    jmp done

charNotFound:
    mov edx, OFFSET string2
    call WriteString

done:
    call Crlf

    exit
main ENDP
END main

