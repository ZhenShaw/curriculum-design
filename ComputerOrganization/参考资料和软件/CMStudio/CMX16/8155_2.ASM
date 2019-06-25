; 扩展8155 -- RAM
#LOAD "EX.IS"  ;预调入指令系统/微程序
ram0    equ  0200h
ram1    equ  0201h

        org  0
start:  in   r0, iol    ;取数
        cout ram0, r0   ;存0单元
        cout ram1, r1   ;存1单元
        cin  r2, ram0   ;0单元送r2
        cin  r3, ram1   ;1单元送r3
        jmp  start      ;偱环取存送
        end
