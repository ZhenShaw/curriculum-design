; 模型机程序实验连线:

; IR  (M2) --- LDIR    指令寄存器写入
; W   (M6) --- W       字/字节操作
; XP  (M7) --- XP      源部件奇偶操作
; X0  (M8) --- X0      源部件编码0
; X1  (M9) --- X1      源部件编码1
; X2 (M10) --- X2      源部件编码2
; S0 (M11) --- S0      运算操作码0
; S1 (M12) --- S1      运算操作码1
; S2 (M13) --- S2      运算操作码2
; M  (M15) --- M       算术/逻辑运算
; OP (M16) --- OP      目标部件奇偶操作
; o0 (M17) --- CPLD.19 目标部件编码0
; o1 (M18) --- CPLD.18 目标部件编码1
; o2 (M19) --- CPLD.17 目标部件编码2
; MWR(M21) --- MWR     存储器写
; IP (M22) --- LDPC    PC增量或写入
; E/M(M23) --- E/M     程序区/数据区选择
; CPLD.5   --- LDAR    地址寄存器写入
; CPLD.6   --- BXW     BX运算寄存器写入
; CPLD.7   --- AXW     AX运算寄存器写入
; CPLD.9   --- SPW     SP堆栈指针写入
; CPLD.10  --- IOW     IO双向端口写入
; CPLD.11  --- RXW     REG通用寄存器写入

#LOAD "MXJ_DJ.IS"      ;预调入指令系统/微程序

        org   0
        mov   CL, 55h
        sta   [0260h], CL
start:  in    CL, IOL
        add   CL, [0260h]
        sta   [0261h], CL
        out   IOH, [0261h]
        jmp   start
        end
