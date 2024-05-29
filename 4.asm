include Irvine32.inc

coordinate struct
    x word ?
    y word ?
    z word ?
coordinate ends

numPoints = 3

.data
    
    coords coordinate numPoints dup(<>)
    testCord coordinate <3, 5, 7>, <7, 3, 2>, <5, 3, 2>

.code

main proc
    mov esi, OFFSET testCord
    mov ecx, numPoints
    L1:
        movzx eax, [esi].coordinate.z
        call WriteDec
        call Crlf
        add esi, TYPE coordinate 
        loop L1

    exit
main endp

end main
