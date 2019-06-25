; 80X86微处理器的设计与实现(扩展存储器)
;   方式字   = 微程序
;   连接方式 = 在线
;   I/O选择  = MUB

#LOAD "80X86.IS" ;预调入指令系统/微程序

code    segment
        assume cs:code

        org 0000h
xp16:   jmp [sta0]

        org 0003h       ;中断向量入口
        sub dl,10h      ;原常数减10h
        nop             ;空操作
        iret            ;从中断返回

;主程序入口
        org 0800h
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
        jmp lrcr        ;遇c='1'转右移;

dely:   mov cl,dl       ;定义延时常数
        loop $          ;循环
        ret             ;从子程序返回

code    ends
        end xp16

;71v016存贮器扩展连线
;一.地址总线 addbus与71v016之间的a15~a1对应连接
;二.控制总线
;  1.选通控制 71v016片选端CE与eA控位相连
;             71v016高八选通BHE由A0反和W端相与获得
;             71v016高八选通BLE与地址线A0连接
;
;  2.读控制   71v016读命令OE与MRD控位相连
;  3.写控制   "IR"控位及T4节拍和"与非门"二输入端相连
;             其输岀端及"MWR"控位和"或门"二输入端相连
;             该"或门"输岀端与71v016WE相连
;  4.段控制   71v016地址端"A0"与"EM"控位相连
;三.电源连线  71v016-VDD端与主机VCC相连
;             71v016-VSS端与主机GND相连
;四.数据总线 dbus与71v016之间的d15~d0对应连接