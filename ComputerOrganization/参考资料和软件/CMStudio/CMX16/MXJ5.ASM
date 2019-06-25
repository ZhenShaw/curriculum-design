;流水模型机程序

#LOAD "MXJ5.IS"         ;预调入指令系统/微程序
#SET RAM 0260h = 5500h  ;数据区0260H单元预置数据5500h

        org   0
start:  in    r0, iol
        add   r0, 0260h
        sta   0261h, r0
        out   ioh, 0261h
        jmp   start
        end
