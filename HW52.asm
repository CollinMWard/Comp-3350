INCLUDE Irvine32.inc

.data
CloudArray SWORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 0Ah, 0Bh, 0Ch
MistArray SWORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 0Ah, 0Bh, 0Ch
FogArray SWORD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.code
main PROC
    mov esi, OFFSET CloudArray 
    mov ecx, LENGTHOF CloudArray 


CloudArrayL:
    mov ax, [esi]  
    call WriteHex  
    call Crlf       
    add esi, TYPE CloudArray  
    loop CloudArrayL  

    mov esi, OFFSET MistArray 
    mov ecx, LENGTHOF CloudArray
 

MistArrayL:
    mov ax, [esi] 
    call WriteHex   
    call Crlf       
    add esi, TYPE MistArray   
    loop MistArrayL     

    
    mov esi, OFFSET CloudArray  
    mov edi, OFFSET MistArray   
    mov ebx, OFFSET FogArray    
    mov ecx, LENGTHOF CloudArray
 
SumArrayL:
    mov ax, [esi] 
    add ax, [edi] 
    mov [ebx], ax 
    add esi, TYPE CloudArray 
    add edi, TYPE MistArray 
    add ebx, TYPE FogArray 
    loop SumArrayL 
    mov esi, OFFSET FogArray   


    mov ecx, LENGTHOF CloudArray
   
FogArrayL:
    mov ax, [esi]   
    call WriteHex 
    call Crlf      
    add esi, TYPE FogArray    
    loop FogArrayL    

    exit
main ENDP

END main