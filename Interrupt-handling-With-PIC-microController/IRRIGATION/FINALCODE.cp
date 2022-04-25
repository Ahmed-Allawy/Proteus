#line 1 "D:/engahmed/«⁄„«·Ì/ «· … Õ«”»« /„⁄«„· «· —„ «·À«‰Ì/Interrupt-handling-With-PIC-microController/IRRIGATION/FINALCODE.c"
int counter=0,seconds=0,days=0,ex=0,runtime=0;

void initialize_proberties(void){
 TRISC=0;
 TRISB.B1=0;
 PORTB.B1=0;
 TMR0IE_bit=1;
 INTE_bit=1;
 GIE_bit=1;
 T0CS_bit=0;
 PSA_bit=0;
 PS0_bit=0;
 PS1_bit=1;
 PS2_bit=0;
 TMR0=6;
}
int screen(int d){
 if(d==3){
 return 0b01000000;
 }

 if(d==2){
 return 0b01111001;
 }
 if(d==1){
 return 0b0100100;
 }
 if(d==0){
 return 0b0110000;
 }

}
void main() {
 initialize_proberties();

 while(1){
 if(counter==500){
 counter=0;
 seconds++;
 if(ex=1 | days==3) runtime++;
 }
 if(seconds==86400){
 seconds=0;
 days++;
 }

 if(days==3){
 PORTB.B1=1;
 }
 if(runtime==15){
 runtime=0;
 ex=0;
 days=0;
 seconds=0;
 PORTB.B1=0;
 }
 PORTC=screen(days);

 }

}

void interrupt() {
 if (INTCON.TMR0IF==1) {
 counter++;
 INTCON.TMR0IF=0;
 TMR0=6;
 }
 if(INTF_bit==1){
 INTF_bit=0;
 PORTB.B1=1;
 ex=1;
 }
}
