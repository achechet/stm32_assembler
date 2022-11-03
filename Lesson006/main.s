   GET INC/Hed98428.s
Stack_Size    EQU 0x400
top_of_stack  EQU 0x20000000 + Stack_Size
	
	PRESERVE8
	THUMB
	
	AREA RESET, DATA, READONLY
	DCD  top_of_stack
	DCD  Start
		
	AREA |.text|, CODE, READONLY
		
	ENTRY
	
Start PROC
	MOVS R0, #0
	MOVS R1, #1
	ADDS R1, R1, #1
	LDR  R2, =SFCR
	LDR  R3,[R2]
	MOVS R2, #3

	ENDP
		
	ALIGN
	END
		
