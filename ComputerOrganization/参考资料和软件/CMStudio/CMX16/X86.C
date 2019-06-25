// 高级语言实验：十六位移位控制

#LOAD "80X86.IS" //预调入指令系统/微程序

void interrupt irq(void)
{
  _DL -= 0x10;
}

//主函数(程序入口)
main()
{
  _AX = 0xffff; //定义I/O初始值
  asm OUT 0, AX; //令I/O为准双向口
  do
  {
    asm IN AX, 0 //读I/O口
  } while (_AX != 0xffff); //不为全1等待
  asm STI //开中断
  _CH = 0x00;
  _DL = 0x22;
  _AX = 0x8000; //从最高位开始
  asm CLC
  while(1)
  {
    do //十六位循环右移
    {
      asm OUT 0, AX;
      sleep();
      asm RCR AX, 1
    } while(_AX != 0x0001);
    do //十六位循环左移
    {
      asm OUT 0, AX
      sleep();
      asm RCL AX, 1
    } while(a != 0x8000);
  }
}

//延时函数
void sleep()
{
  _CL = _DL; //初始延时变量
  asm LOOP $
}
