; 16位左右循环移位 (含中断控制)

; 连线：INT(位于键盘左侧) 连接 XINT(位于键盘上方)
; 运行：
; 1. 置I/O=FFFF(全1)
; 2. 主程序执行I/O单元16位LED左右循环移位
; 3. 按下"中断"按钮进入中断服务程序I/O=5555
; 4. 释放"中断"按钮返回主程序继续循环移位

#LOAD   "MYCPU.IS"              ;预调入指令系统/微程序
DATA    SEGMENT                 ;将程序装载到由AR寻址的RAM空间

        org     0000h           ;复位地址
        jmp     start

        org     0003h           ;中断向量地址
        push    ax
        mov     ax,5555h
        out     io,ax
        pop     ax
        iret                    ;从中断返回

start:  mov     ax,0ffffh       ;设I/O为准双向口
        out     io,ax

rio:    in      ax,io
        mov     bx,0ffffh
        cmp     ax,bx
        jnz     rio             ;如果I/O单元不为全1则等待

        mov     ax,8000h        ;从最高位开始移位
        clc                     ;清进位
        sti                     ;开中断

iorcr:  out     io,ax           ;输出到I/O单元
        call    delay           ;延时
        rcr     ax              ;AX带进位右移
        jnc     iorcr           ;if C==0 goto iorcr

iorcl:  out     io,ax           ;输出到I/O单元
        call    delay           ;延时
        rcl     ax              ;AX带进位左移
        jnc     iorcl           ;if C==0 goto iorcl
        jmp     iorcr           ;else goto lrcr

delay:  mov     cx,0020h        ;定义延时常数
        loop    $               ;循环
        ret                     ;返回

        end