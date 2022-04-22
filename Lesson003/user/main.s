  GET	stm32f446re.asm
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
  
  LDR   R2, =(PERIPH_BB_BASE + (RCC_AHBENR - PERIPH_BASE) * 32 + RCC_AHBENR_IOPEEN * 4)
  STR   R1, [R2]
 
  LDR   R2, =GPIOE_REG
  ORR   R3, R3, #0x40000000
  STR   R3, [R2]
  
  LDR   R2, =GPIOE_ODR
  MOV   R3, #0
  ORR   R3, R3, #0x00008000
  STR   R3, [R2]
  
loop
  B loop


  ENDP

  ALIGN
  END