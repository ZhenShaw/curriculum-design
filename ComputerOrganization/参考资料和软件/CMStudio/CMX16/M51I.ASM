; MCS-51单片机的设计与实现(中断应用)
;   方式字   = 微程序控制
;   连接方式 = 在线
;   I/O选择  = MUB

#LOAD "MCS51.IS" ;预调入指令系统/微程序

        org 0000h
        ljmp masl

        org 0003h
        mov r1,p1
        reti

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