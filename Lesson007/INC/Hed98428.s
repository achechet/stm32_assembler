AHBSA       EQU 0x50000000
APBSA       EQU 0x40000000

NVMCTRL     EQU AHBSA + 0x7080
EMMU        EQU AHBSA + 0x7000

Timer0Load  EQU APBSA + 0x0800
Timer0Value EQU APBSA + 0x0804
Timer0Control EQU APBSA + 0x0808
	
NVIC_ISER   EQU 0xE000E100
NVIC_ICER   EQU 0xE000E180	
	END
		