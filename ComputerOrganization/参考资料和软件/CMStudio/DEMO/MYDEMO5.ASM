; 中断控制

; 连线：INT(位于键盘左侧) 连接 XINT(位于键盘上方)
; 置I/O=FFFF
; 置数：I/O单元 (S15~S8) = FF (全1)
; 运行：主程序获取I/O S7~S0数据，按"中断"进入中断服务，将I/O低8位写到I/O高8位

#LOAD   "MYCPU.IS"              ;预调入指令系统/微程序
DATA    SEGMENT                 ;将程序装载到由AR寻址的RAM空间

        org     0000h           ;复位地址
        jmp     start

        org     0003h           ;中断服务子程序
        in      al,iol
        out     ioh,al
        iret

start:  sti                     ;开中断
        jmp     $               ;循环,等待中断

        end