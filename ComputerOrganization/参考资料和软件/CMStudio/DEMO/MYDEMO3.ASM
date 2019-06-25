; 4位加法器
; 置I/O=FFFF
; I/O单元 (S7~S4) + (S3~S0)，将结果送至 S15~S8

#LOAD   "MYCPU.IS"              ;预调入指令系统/微程序
DATA    SEGMENT                 ;将程序装载到由AR寻址的RAM空间

        org     0000h           ;复位地址
start:  in      al,iol          ;获取S3..S0低4位数
        mov     bl,0fh
        and     al,bl
        mov     cl,al           ;暂存第1个4位数

        in      al,iol          ;获取S7..S4高4位数
        mov     bl,0f0h
        and     al,bl
        ror     al
        ror     al
        ror     al
        ror     al              ;得到第2个4位数

        mov     bl,cl           ;准备数据
        add     al,bl           ;相加
        out     ioh,al          ;输出到I/O S15..S8

        jmp     start           ;循环

        end