; 扩展8255
#LOAD "EX.IS"  ;预调入指令系统/微程序
CS8255  equ  0203h      ;8255控制口
PORTA   equ  0200h      ;8255并行口A
PORTB   equ  0201h      ;8255并行口B
PORTC   equ  0202h      ;8255并行口D

        org  0
        in   r0, iol    ;取命令字，IOL=90h
        cout CS8255, r0 ;送命令字
loop:   cin  r0, PORTA  ;读PA
        cout PORTB, r0  ;写PB
        jmp  loop       ;偱环读写
        end
