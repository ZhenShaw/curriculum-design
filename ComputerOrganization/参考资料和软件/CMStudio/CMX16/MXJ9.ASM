;PLA模型机程序 (微程序 & PLD综合控制)

#LOAD "MXJ9.IS"         ;预调入指令系统/微程序
#SET RAM 0260h = 5500h  ;数据区0260H单元预置数据5500h

        org   0
start:  setb  ea        ;开中断
loop:   in    r0, iol
        add   r0, 0260h
        sta   0261h, r0
        out   ioh, 0261h
        jmp   loop

        org   10h       ;中断服务指令集
        in    r0, iol
        sta   0260h, r0
        iret

        end
