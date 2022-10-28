;/**************************************************************************//**
; * @file     startup_ARMSC000.s
; * @brief    CMSIS SC000 Core Device Startup File
; *           for ARMSC000 Device Series
; * @version  V1.06
; * @date     16. November 2011
; *
; * @note
; * Copyright (C) 2011 ARM Limited. All rights reserved.
; *
; * @par
; * ARM Limited (ARM) is supplying this software for use with Cortex-M 
; * processor based microcontrollers.  This file can be freely distributed 
; * within development tools that are supporting such ARM based processors. 
; *
; * @par
; * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
; * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
; * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
; * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
; * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
; *
; ******************************************************************************/
;/*
;//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;*/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00001400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000000

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

				; External Interrupts
                DCD     Timer0_IRQHandler               ;  0: Default
                DCD     Timer1_IRQHandler               ;  1: Default                
                DCD     WDT_IRQHandler                  ;  2: Watchdog溢出中断 
                DCD     FLASH_IRQHandler                ;  3: FLASH擦写结束中断
                DCD     FLASHError_IRQHandler           ;  4: FLASH数据错误中断
                DCD     SECRST_IRQHandler               ;  5: 安全传感器复位中断
                DCD     0                               ;  6: 保留
                DCD     RNG1_IRQHandler                 ;  7: 随机数准备完成中断
                DCD     SCIRST_IRQHandler               ;  8: 7816复位中断
                DCD     SCISend_IRQHandler              ;  9: 7816发送结束中断
                DCD     SCIReceive_IRQHandler           ; 10: 7816接收结束中断
                DCD     SCIBufOverFlow_IRQHandler       ; 11: 7816缓冲区溢出中断
                DCD     SWPIO_Detect_IRQHandler         ; 12: IFDET,SWP接口检测中断  
                DCD     SWP_IRQHandler                  ; 13: SWP接口中断
                DCD     SPI_IRQHandler                  ; 14: SPI接口中断
                DCD     GPIO_IRQHandler                 ; 15: GPIO合并外部中断  
				
__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler                [WEAK]
                ;IMPORT  SystemInit
				
				        ;控制系统运行模式
				        MRS 	R0,	control
				        LDR 	R1,	=0xFFFFFFFE
				        ANDS 	R0,	R0,	R1
				        MSR 	control, 	R0
                
				        IMPORT  __main
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler                  [WEAK]
                B       .
                ENDP
HardFault_Handler  PROC
                EXPORT  HardFault_Handler            [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler                  [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler               [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler              [WEAK]
                B       .
                ENDP
Timer0_IRQHandler PROC
                EXPORT  Timer0_IRQHandler            [WEAK]
                B       .
				ENDP
Timer1_IRQHandler PROC
                EXPORT  Timer1_IRQHandler            [WEAK]
                B       .
				ENDP
WDT_IRQHandler PROC
                EXPORT  WDT_IRQHandler               [WEAK]
                B       .
				ENDP
FLASH_IRQHandler PROC
                EXPORT  FLASH_IRQHandler             [WEAK]
                B       .
				ENDP
FLASHError_IRQHandler PROC
                EXPORT  FLASH_IRQHandler             [WEAK]
                B       .
				ENDP
SECRST_IRQHandler PROC
                EXPORT  SECRST_IRQHandler            [WEAK]
                B       .
				ENDP
RNG1_IRQHandler PROC
                EXPORT  RNG1_IRQHandler              [WEAK]
                B       .
				ENDP
SCIRST_IRQHandler PROC
                EXPORT  SCIRST_IRQHandler            [WEAK]
                B       .
				ENDP
SCISend_IRQHandler PROC
                EXPORT  SCISend_IRQHandler           [WEAK]
                B       .
				ENDP
SCIReceive_IRQHandler PROC
                EXPORT  SCIReceive_IRQHandler        [WEAK]
                B       .
				ENDP
SCIBufOverFlow_IRQHandler PROC
                EXPORT  SCIBufOverFlow_IRQHandler    [WEAK]
                B       .
				ENDP
SWPIO_Detect_IRQHandler PROC
                EXPORT  SWPIO_Detect_IRQHandler      [WEAK]
                B       .
				ENDP
SWP_IRQHandler PROC
                EXPORT  SWP_IRQHandler               [WEAK]
                B       .
				ENDP
SPI_IRQHandler PROC
                EXPORT  SPI_IRQHandler               [WEAK]
                B       .
				ENDP
GPIO_IRQHandler PROC
                EXPORT  GPIO_IRQHandler              [WEAK]
                B       .
				ENDP

                ALIGN

; User Initial Stack & Heap

                IF      :DEF:__MICROLIB				
                
                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit
                
                ELSE
                
                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap
__user_initial_stackheap

                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR

                ALIGN

                ENDIF


                END
