        AREA     myData, DATA
                                ; Name this block of code ARMex

COUNT	EQU	10					; test count
SUM		EQU 0

		AREA	myCode, CODE
			ENTRY
			EXPORT	__main

__main
	LDR	r0, =COUNT
	LDR	r1, =SUM
	LDR r2, =1

myloop	
	ADD r1, r2, r1
	ADD r2, r2, #1
	SUBS r4, r0, r2
	BNE myloop
	ADD r1, r2, r1
	
stop B stop

	END
