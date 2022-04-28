  GET	stm32f103c8.asm
Stack_Size    EQU   0x400
top_of_stack  EQU 0x20000000 + Stack_Size

  PRESERVE8
  THUMB
  
  AREA	RESET,	DATA, READONLY
  DCD   top_of_stack  ;Top of Stack
  DCD   Start

  AREA  |.text|, CODE, READONLY

  ENTRY
 
Start    PROC

  MOV   R0, #0
  MOV   R1, #1
  
  LDR   R2, =(PERIPH_BB_BASE + (RCC_APB2ENR - PERIPH_BASE) * 32 + RCC_APB2ENR_IOPCEN_N * 4)
  STR   R1, [R2]

  LDR   R2, =(PERIPH_BB_BASE + (GPIOC_CRH - PERIPH_BASE) * 32 + GPIOC_CRH_MODE13_0_N * 4)
  STR   R1, [R2]
  
  LDR   R2, =(PERIPH_BB_BASE + (GPIOC_ODR - PERIPH_BASE) * 32 + GPIO_ODR_ODR13_N * 4)
  STR   R1, [R2]
  

  
loop
  B loop


  ENDP

  ALIGN
  END