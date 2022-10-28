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
	MOVS R0, #7
	LDR  R1, =Timer0Load
	STR  R0,[R1]
	LDR  R2, =Timer0Value
	LDR  R3,[R2]
	MOVS R0, #7

	ENDP
		
	ALIGN
	END
		
