; 16位流水灯

; 运行：
; 1. 置I/O=FFFF(全1)
; 2. 主程序执行I/O单元16位LED循环移位

#LOAD   "MYCPU.IS"              ;预调入指令系统/微程序
DATA    SEGMENT                 ;将程序装载到由AR寻址的RAM空间

        org     0000h           ;复位地址
start:  mov     ax,0ffffh       ;设I/O为准双向口
        out     io,ax

rio:    in      ax,io
        mov     bx,0ffffh
        cmp     ax,bx
        jnz     rio             ;如果I/O单元不为全1则等待

        mov     ax,8000h        ;从最高位开始移位
mloop:  out     io,ax           ;输出到I/O单元
        rcr     ax              ;AX带进位右移

        mov     cx,0020h
        loop    $               ;延时

        jmp     mloop           ;循环

        end