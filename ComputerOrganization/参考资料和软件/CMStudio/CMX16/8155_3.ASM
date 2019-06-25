; 扩展8155 -- Timer
#LOAD "EX.IS"  ;预调入指令系统/微程序
CS8155  equ  0300h      ;8155控制口
MODE    equ  0305h      ;方式字

        org  0
start:  cin  rx0, io    ;取方式命令字，IO=C266h
        cout MODE, r0   ;送方式字
        cout CS8155, r1 ;启动
        halt            ;停机
        end
