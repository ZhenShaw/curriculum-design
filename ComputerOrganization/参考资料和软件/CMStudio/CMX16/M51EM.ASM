; MCS-51单片机的设计与实现(扩展6264)
;   方式字   = 微程序控制
;   连接方式 = 在线
;   I/O选择  = MUB

#LOAD "MCS51.IS" ;预调入指令系统/微程序

        org 0000h
        ljmp masl

        org 0003h
        mov r1,p1
        reti

        org 0800h
masl:   mov sp,#07h
        setb ea
        mov r1,p1
        mov a,#08h
        clr c

lrl:    mov p3,a
        acall delay
        rlc a
        jnc lrl
lrc:    mov p3,a
        acall delay
        rrc a
        jnc lrc
        sjmp lrl

delay:  mov b,r1
        djnz b,$
        ret

        end

;6264存贮器扩展连线
;一.地址总线 addbus与6264之间的a11~a0对应连接
;二.控制总线
;  1.选通控制 6264片选端CE与eA控位相连
;  2.读控制   6264读命令OE与MRD控位相连
;  3.写控制   "M2"控位及T4节拍和"与非门"二输入端相连
;             其输岀端及"M21"控位和"或门"二输入端相连
;             该"或门"输岀端与6264写命令WE相连
;  4.段控制   6264地址端"A12"与"M23"控位相连
;  5.预置端   6264-1.26与主机VCC相连
;三.电源连线  6264-28与主机VCC相连
;             6264-14与主机GND相连
;四.数据总线 dbus与6264之间的d7~d0对应连接