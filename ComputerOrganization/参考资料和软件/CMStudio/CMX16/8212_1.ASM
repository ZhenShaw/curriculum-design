; 扩展CPLD 8212 -- INPUT

#LOAD "EX.IS"  ;预调入指令系统/微程序

        org  0
start:  mov  r0, #00h   ;取方式字
        cout 0200h, r0  ;写输入令
loop:   cin  iol, 0201h ;8212->IOL
        jmp  loop       ;循环读
        end
