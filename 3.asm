include Irvine32.inc

.data
	result_fin byte " characters in the string",0
	test1 byte "abcdefghijklmnopqrstuvwxyz",0

.code
main proc
	
	mov eax, lengthof test1
	sub eax, 1
	call WriteDec
	mov edx, offset result_fin
	call WriteString
	

main endp

end main