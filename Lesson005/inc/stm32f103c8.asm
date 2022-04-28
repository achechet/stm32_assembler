; User LED connected to PC13
; https://stm32-base.org/boards/STM32F103C8T6-STM32-Smart-V2.0#User-LED
PERIPH_BB_BASE	EQU	0x42000000      ; Periferial bit-banding alias
PERIPH_BASE     EQU	0x40000000      ; Peripheral bit-band region

RCC_APB2ENR	            EQU	0x40021018      ; RCC 0x4002 1000 + RCC_APB2ENR Address: 0x18
RCC_APB2ENR_IOPCEN_N    EQU 4               ; Bit 4 IOPCEN: I/O port C clock enable

GPIOC_REG       EQU 0x40011000
       
GPIOC_CRH	    EQU	0x40011004      ; Address offset: 0x04
GPIOC_ODR	    EQU	0x4001100C      ; Address offset: 0x0C

GPIOC_CRH_MODE13_0_N	EQU 20
GPIO_ODR_ODR13_N	    EQU 13
    
GPIOC_BSRR      EQU 0x10            ; Address offset: 0x10 - BS13=13 & BR13=29
 
  END