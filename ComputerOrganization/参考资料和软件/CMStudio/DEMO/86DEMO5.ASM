; 中断控制

; 连线：INT(位于键盘左侧) 连接 XINT(位于键盘上方)
; 置I/O=FFFF
; 置数：I/O单元 (S15~S8) = FF (全1)
; 运行：主程序获取I/O S7~S0数据，按"中断"进入中断服务，将I/O低8位写到I/O高8位

#LOAD "86CPU.IS"        ;预调入指令系统/微程序

        org 0000h
        nop
        jmp start

        org 0003h       ;中断向量入口
        mov ch,cl
        mov ah,ch
        mov al,0ffh
        out 0,ax
        iret            ;返回

start:  sti             ;中断允许
mloop:  in al,0
        mov cl,al
        jmp mloop       ;等待中断

        end
