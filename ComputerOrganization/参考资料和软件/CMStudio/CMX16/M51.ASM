; MCS-51单片机的设计与实现
;   方式字   = 微程序控制
;   连接方式 = 在线
;   I/O选择  = MUB

#LOAD "MCS51.IS" ;预调入指令系统/微程序

        org 0
        mov sp,#07h
lp1:    mov a,p1
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

delay:  mov r0,#03h
dloop:  mov r1,#10h
        djnz r1,$
        djnz r0,dloop
        ret

        end