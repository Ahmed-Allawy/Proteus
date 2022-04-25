#line 1 "D:/engahmed/«⁄„«·Ì/ «· … Õ«”»« /„⁄«„· «· —„ «·À«‰Ì/SmartLock/SmartLock.c"
#line 1 "d:/engahmed/«⁄„«·Ì/ «· … Õ«”»« /„⁄«„· «· —„ «·À«‰Ì/smartlock/lcd.h"

sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;


sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;
#line 2 "D:/engahmed/«⁄„«·Ì/ «· … Õ«”»« /„⁄«„· «· —„ «·À«‰Ì/SmartLock/SmartLock.c"
 char keypadPort at PORTB;
 int i;
 char passWord[4];
 char get_passWord(){
 Loop:
 Lcd_Out(1,1,"Enter PassWord");
 for(i=0;i<3;i++){
 while(passWord[i]==0){
 passWord[i]=Keypad_Key_Click();
 }
 switch(passWord[i]){
 case 1:passWord[i]='7';
 break;
 case 2:passWord[i]='8';
 break;
 case 3:passWord[i]='9';
 break;
 case 5:passWord[i]='4';
 break;
 case 6:passWord[i]='5';
 break;
 case 7:passWord[i]='6';
 break;
 case 9:passWord[i]='1';
 break;
 case 10:passWord[i]='2';
 break;
 case 11:passWord[i]='3';
 break;
 }
 Lcd_Chr(2,i+1,'*');
 }
 if(strcmp(passWord,"123")==0){return 1;}
 else{
 Lcd_Out(1,1,"Wrong PassWord");
 delay_ms(1000);
 passWord[0]=0;
 passWord[1]=0;
 passWord[2]=0;
 Lcd_Cmd(_LCD_CLEAR);
 goto Loop;
 }
 }
void main() {
 TRISD.B0=0;
 PORTD.b0=0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 Keypad_Init();


 get_passWord();


 while(1){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,2,"Flash progress");
 PORTD.B0=~PORTD.B0;
 delay_ms(1000);
}
}
