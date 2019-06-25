; 16位左右循环移位 (含中断控制)

; 连线：INT(位于键盘左侧) 连接 XINT(位于键盘上方)
; 运行：
; 1. 置I/O=FFFF(全1)
; 2. 主程序执行I/O单元16位LED左右循环移位
; 3. 按下"中断"按钮进入中断服务程序I/O=5555
; 4. 释放"中断"按钮返回主程序继续循环移位

#LOAD "86CPU.IS"        ;预调入指令系统/微程序

        org 0000h
xp16:   nop
        jmp sta0

        org 0003h       ;中断向量入口
        push ax
        mov ax,5555h
        out 0,ax
        pop ax
        iret            ;返回

;主程序入口
sta0:   mov ax,0ffffh
        out 0,ax        ;设I/O为准双向口
srio:   in ax,0
        cmp ax,0ffffh
        jnz srio        ;if AX!=0xFFFF go srio
        mov ch,00h
        mov dl,22h
        mov ax,8000h    ;从最高位开始移位
        clc
        sti             ;中断允许
lrcr:   out 0,ax        ;输出到I/O单元
        call delay      ;延时
        rcr ax,1        ;AX带进位右移
        jnc lrcr        ;if C=0 go lrcr
lrcl:   out 0,ax        ;输出到I/O单元
        call delay      ;延时
        rcl ax,1        ;AX带进位左移
        jnc lrcl        ;if C=0 go lrcl
        jmp lrcr        ;else go lrcr

delay:  mov cl,dl       ;定义延时常数
        loop $          ;循环
        ret             ;返回
        END
