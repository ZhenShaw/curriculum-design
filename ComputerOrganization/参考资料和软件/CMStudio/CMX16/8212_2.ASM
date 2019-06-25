; 扩展CPLD 8212 -- OUTPUT

#LOAD "EX.IS"  ;预调入指令系统/微程序

        org  0
start:  mov  r0, #01h   ;取方式字
        cout 0200h, r0  ;写输出令
loop:   cout 0201h, iol ;IOL->8212
        jmp  loop       ;循环写
        end
