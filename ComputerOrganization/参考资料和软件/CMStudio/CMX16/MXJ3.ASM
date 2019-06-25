;移位模型机程序
#LOAD "MXJ3.IS"  ;预调入指令系统/微程序

        org   0
start:  in    r0, iol
        add   r0, 00h
        rrc   r0
        rl    r0
        sta   01h, r0
        out   ioh, 01h
        jmp   start
        end
