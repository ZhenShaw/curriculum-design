; 8259多级中断控制器
#LOAD "EX.IS"  ;预调入指令系统/微程序
M8259   equ  0200h
C8259   equ  0201h

        org  0000h
        jmp  main       ;转主程序

; IRQ0 中断服务程序
        org  0008h
        mov  cx, 0020h  ;取向量字
        cout M8259, cl  ;写结束字
        iret            ;从中断返回

; IRQ1 中断服务程序
        org  0010h
        mov  cx, 1120h  ;取向量字
        cout M8259, cl  ;写结束字
        iret            ;从中断返回

; IRQ2 中断服务程序
        org  0018h
        mov  cx, 2220h  ;取向量字
        cout M8259, cl  ;写结束字
        iret            ;从中断返回

; IRQ3 中断服务程序
        org  0020h
        mov  cx, 3320h  ;取向量字
        cout M8259, cl  ;写结束字
        iret            ;从中断返回

; IRQ4 中断服务程序
        org  0028h
        mov  cx, 4420h  ;取向量字
        cout M8259, cl  ;写结束字
        iret            ;从中断返回

; IRQ5 中断服务程序
        org  0030h
        mov  cx, 5520h  ;取向量字
        cout M8259, cl  ;写结束字
        iret            ;从中断返回

; IRQ6 中断服务程序
        org  0038h
        mov  cx, 6620h  ;取向量字
        cout M8259, cl  ;写结束字
        iret            ;从中断返回

; IRQ7 中断服务程序
        org  0040h
        mov  cx, 7720h  ;取向量字
        cout M8259, cl  ;写结束字
        iret            ;从中断返回

; 8259 主程序
        org  0048h
main:   mov  cx, 001bh  ;取方式字
        cout M8259, cl  ;写方式字
        cout C8259, ch  ;写命令字
        mov  cx, 0009h  ;取命令字
        cout C8259, cl  ;写命令字
        cout C8259, ch  ;写命令字
        mov  cl, 03h    ;取启动字
        cout M8259, cl  ;写启动字
        setb ea         ;开中断
wait:   mov  ch, 88h    ;置非中断值
        jmp  wait       ;循环等候
        end