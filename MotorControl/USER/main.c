#include "led.h"
#include "delay.h"
#include "key.h"
#include "sys.h"
#include "usart.h"
#include "timer.h"
#include "exti.h"
 
/************************************************
 ALIENTEK战舰STM32开发板实验9
 PWM输出实验  
 技术支持：www.openedv.com
 淘宝店铺：http://eboard.taobao.com 
 关注微信公众平台微信号："正点原子"，免费获取STM32资料。
 广州市星翼电子科技有限公司  
 作者：正点原子 @ALIENTEK
************************************************/

u16 pwm=1951;//1951边界

 int main(void)
 {
		delay_init();	    	 	//延时函数初始化	  
		NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2); 	 //设置NVIC中断分组2:2位抢占优先级，2位响应优先级
		uart_init(115200);	 	//串口初始化为115200
		LED_Init();			     	//LED端口初始化
   	BEEP_Init();         	//初始化蜂鸣器端口
		TIM3_PWM_Init(1999,719);	//不分频。PWM周期=2000*720/72000000=20ms，720表示将时钟频率分频到100khz,为0.1ms计数一次
    TIM2_Int_Init(39999,7199); //计时6秒
		 
		KEY_Init();         	//初始化与按键连接的硬件接口
		EXTIX_Init();		 			//外部中断初始化
   	while(1)
		{
      BEEP=0;
			delay_ms(200);   
			TIM_SetCompare2(TIM3,pwm); 
      delay_ms(200);
            
		}	 
 }

