/**************************************
 高级语言解释实验：移位控制与中断应用
 设置工作方式:
   方式字   = 微程序控制
   连接方式 = 在线
   I/O选择  = MUB

 调试信息文件：M51.DBG
**************************************/

#LOAD "MCS51.IS" //预调入指令系统/微程序

unsigned char DT; //全局延时变量

//中断服务函数
void IntDelayTimes() interrupt 0
{
  DT = P1; //读取P1数据重设延时变量
}

//延时函数
void sleep()
{
  unsigned char i = DT;
  do
  {
    i--;
  } while (i != 0);
}

//主函数(程序入口)
main()
{
  unsigned char a;
  EA = 1;    //开中断
  DT = P1;   //读取P1数据初始延时变量
  a  = 0x08; //移位初值
  while(1)
  {
    do //循环左移
    {
      P3 = a;
      sleep();
      a <<= 1; //左移1位
    } while(a != 0x80);
    do //循环右移
    {
      P3 = a;
      sleep();
      a >>= 1; //右移1位
    } while(a != 0x01);
  }
}