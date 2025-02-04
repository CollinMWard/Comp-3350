INCLUDE Irvine32.inc

.data
    num1    WORD 02h, 0Ah   
    num2    WORD 01h, 01h   
    result  WORD 0, 0       

.code
main PROC
 
    mov     edi, OFFSET num1  
    mov     esi, OFFSET num2 
    mov     ecx, 2          
    xor     ax, ax     

    sub_loop:
        mov     ax, [edi]     
        sub     ax, [esi]    
        das                  
        mov     [result], ax   
        add     edi, 2     
        add     esi, 2    
        loop    sub_loop  

   
    mov     ax, [result]      
    or      ax, [result + 2]  
    jnz     not_zero         

  
    mov     edx, OFFSET result 
    call    WriteDec         
    jmp     done           

not_zero:

 

   mov ax, [result]
   mov eax, eax
  and eax, 00001111h
   
    call    WriteHex    

done:
    call    Crlf           

 
 
    exit
main ENDP



END MAIN
