; 8位加法器
; 置I/O=FFFF
; I/O单元 (S7~S0) + 寄存器CL，将结果送至 S15~S8

#LOAD   "MYCPU.IS"              ;预调入指令系统/微程序
DATA    SEGMENT                 ;将程序装载到由AR寻址的RAM空间

        org     0000h           ;复位地址
        mov     bl,55h          ;设定加数1
start:  in      al,iol          ;得到加数2
        add     al,bl           ;相加
        out     ioh,al          ;输出到I/O S15..S8
        jmp     start           ;循环

        end