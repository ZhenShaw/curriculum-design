; 4位加法器
; 置I/O=FFFF
; I/O单元 (S7~S4) + (S3~S0)，将结果送至 S15~S8

#LOAD "86CPU.IS"        ;预调入指令系统/微程序

        org 0000h

start:  in al,0         ;获取两个4位数

        mov cl,al       ;取低4位
        and cl,0fh

        shr al,1        ;右移4次, 取高4位
        shr al,1
        shr al,1
        shr al,1
        
        mov ch,al
        and ch,0fh      ;存高4位

        add ch,cl       ;两数相加

        mov ah,ch       ;准备数据
        mov al,0ffh
        out 0,ax

        jmp start       ;循环

        end
