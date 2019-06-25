#LOAD "MCS51.IS" ;预调入指令系统/微程序

        org 0000h
        ljmp masl
        
        org 0003h
        pop acc
        pop acc
        clr a
        push acc
        mov a,p1
        anl a,#07h
        push acc
        mov r1,p1
        reti

masl:   mov sp,#07h
        setb ea
        mov r1,p1
        mov a,#08h
        clr c
lrl:    mov p3,a
        acall dely
        rlc a
        jnc lrl
lrc:    mov p3,a
        acall dely
        rrc a
        jnc lrc
        sjmp lrl

dely:   mov b,r1
        djnz b,$
        ret

        org 0100h
        mov a,#08h
rl1:    mov p3,a
        acall dely
        rl a
        sjmp rl1

        org 0200h
        mov a,#08h
rr1:    mov p3,a
        acall dely
        rr a
        sjmp rr1

        org 0300h
        mov a,#18h
rl2:    mov p3,a
        acall dely
        rl a
        sjmp rl2

        org 0400h
        mov a,#18h
rr2:    mov p3,a
        acall dely
        rr a
        sjmp rr2

        org 0500h
        mov a,#28h
rl3:    mov p3,a
        acall dely
        rl a
        sjmp rl3

        org 0600h
        mov a,#28h
rr3:    mov p3,a
        acall dely
        rr a
        sjmp rr3

        org 0700h
        mov a,#18h
        clr c
rls:    mov p3,a
        acall dely
        rlc a
        jnc rls
rrs:    mov p3,a
        acall dely
        rrc a
        jnc rrs
        sjmp rls

        end

;*138译码实验示例
;一.程序段
;1.程序指针11位,可寻址范围0-0fffh,共8K
;2.选用138译码器可定义八个入口地址
;3.138译码表:
;  A10 A9 A8   寻址目标 寻址范围     功能
;    0  0  0   外部扩展  000-0FF     带进位左右移
;    0  0  1   内部主存  100-1FF     左循环
;    0  1  0   外部扩展  200-2FF     右循环
;    0  1  1   内部主存  300-3FF     双位左循环
;    1  0  0   外部扩展  400-4FF     双位右循环
;    1  0  1   内部主存  500-5FF   间双位左循环
;    1  1  0   外部扩展  600-6FF   间双位右循环
;    1  1  1   内部主存  700-7FF   双带进位左右移

;