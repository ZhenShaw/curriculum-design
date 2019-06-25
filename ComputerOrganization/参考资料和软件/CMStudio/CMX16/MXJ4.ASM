;复杂模型机程序
#LOAD "MXJ4.IS"  ;预调入指令系统/微程序

        org   0
start:  in    r0, iol
        in    r2, iol
        adc   r0, r2
        mov   r1, r0
        rlc   r0
        bzc   start
        halt
        end
