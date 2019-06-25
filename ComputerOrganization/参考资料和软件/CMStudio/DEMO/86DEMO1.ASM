; 16位流水灯

; 运行：
; 1. 置I/O=FFFF(全1)
; 2. 主程序执行I/O单元16位LED循环移位

#LOAD "86CPU.IS"        ;预调入指令系统/微程序

        org 0000h

start:  mov ax,0ffffh
        out 0,ax        ;设I/O为准双向口

rio:    in ax,0
        cmp ax,0ffffh
        jnz rio         ;如果I/O单元不为全1则等待

        mov ax,8000h    ;从最高位开始移位
mloop:  out 0,ax        ;输出到I/O单元
        rcr ax,1        ;AX带进位右移

        mov cx,0020h
        loop $          ;延时

        jmp mloop

        end
