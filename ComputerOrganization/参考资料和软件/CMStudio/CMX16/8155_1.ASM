; 扩展8155 -- I/O
#LOAD "EX.IS"  ;预调入指令系统/微程序
CS8155  equ  0300h      ;8155控制口
PORTA   equ  0301h      ;8155并行口A
PORTB   equ  0302h      ;8155并行口B
PORTC   equ  0303h      ;8155并行口D

        org  0
        in   r0, iol    ;取命令字，IOL=42h
        cout CS8155, r0 ;送命令字
loop:   cin  r0, PORTA  ;读PA
        cout PORTB, r0  ;写PB
        jmp  loop       ;偱环读写
        end
