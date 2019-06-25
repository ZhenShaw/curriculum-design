; 8位加法器
; 置I/O=FFFF
; I/O单元 (S7~S0) + 寄存器CL，将结果送至 S15~S8

#LOAD "86CPU.IS"        ;预调入指令系统/微程序

        org 0000h

        mov cl,55h      ;预置的加数1
start:  in al,0         ;取I/O低8位开关数据 作为加数2
        mov ch,al

        add ch,cl       ;两数相加

        mov ah,ch       ;准备数据
        mov al,0ffh
        out 0,ax

        jmp start       ;循环

        end
