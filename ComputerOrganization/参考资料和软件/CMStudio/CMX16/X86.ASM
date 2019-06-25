; 80X86微处理器的设计与实现
;   方式字   = 微程序
;   连接方式 = 在线
;   I/O选择  = MUB

#LOAD "80X86.IS" ;预调入指令系统/微程序

code    segment
        assume cs:code

        org 0000h
xp16:   nop
        jmp sta0

        org 0003h       ;中断向量入口
        sub dl,10h      ;原常数减10h
        iret            ;返回

;主程序入口
sta0:   mov ax,0ffffh   ;定义i/o初始值
        out 0,ax        ;令i/o为准双向口
srio:   in ax,0         ;读i/o
        cmp ax,0ffffh   ;与0ffffh比较
        jnz srio        ;不为全1转!
        sti             ;开中断
        mov ch,00h      ;ch淸零
        mov dl,22h      ;设初值
        mov ax,8000h    ;从最高位开始
        clc             ;清进位标志
lrcr:   out 0,ax        ;当前ax送i/o
        call dely       ;调延时子程序
        rcr ax,1        ;ax带进位右移
        jnc lrcr        ;无符号转(c='0')
lrcl:   out 0,ax        ;当前ax送i/o
        call dely       ;调延时子程序
        rcl ax,1        ;ax带进位左移
        jnc lrcl        ;无符号转(c='0')
        jmp lrcr        ;遇c='1'转右移

dely:   mov cl,dl       ;定义延时常数
        loop $          ;循环
        ret             ;返回

code    ends
        end xp16
