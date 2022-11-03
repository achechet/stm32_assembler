SFCR        EQU 0xE000EF90
AHBSA       EQU 0x50000000
APBSA       EQU 0x40000000

NVMCTRL     EQU AHBSA + 0x7080
EMMU        EQU AHBSA + 0x7000

TIMER       EQU APBSA + 0x0800
NVIC_ISER   EQU 0xE000E100
	END
		