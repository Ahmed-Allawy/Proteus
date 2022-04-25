#include"LCD.h"
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
       // initialization for LCD
       Lcd_Init();
       Lcd_Cmd(_LCD_CLEAR); // Clear display
       Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off

       // initialization for KeyPad
       Keypad_Init();

       //getting password
       get_passWord();

       //making flash
       while(1){
       Lcd_Cmd(_LCD_CLEAR);
       Lcd_Out(1,2,"Flash progress");
       PORTD.B0=~PORTD.B0;
       delay_ms(1000);
}
}