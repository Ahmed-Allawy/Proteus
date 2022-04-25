int counter=0,seconds=0,days=0,ex=0,runtime=0;

void initialize_proberties(void){
    TRISC=0; //screen pins as output
    TRISB.B1=0; //set pin output
    PORTB.B1=0; // with value ==0
    TMR0IE_bit=1;   //enable timer interrupt
    INTE_bit=1;  //enable external intterrupt
    GIE_bit=1;    //enable global interrrupt
    T0CS_bit=0;  //use internal clock which equal 4/f from crystal
    PSA_bit=0;  //assigned prescaler to timer
    PS0_bit=0;  // with...
    PS1_bit=1;  //value....
    PS2_bit=0;//==32
    TMR0=6;   //start count from 6 to count 250
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
         if(counter==500){//count 1 second
            counter=0;
            seconds++;//counter for seconds
            if(ex=1 | days==3) runtime++; //counter for  run time
           }
            if(seconds==86400){
              seconds=0;
              days++; //counter for days
           }

           if(days==3){  //run motor after 3 days from last one
               PORTB.B1=1;
           }
           if(runtime==15){ //stop motor after 15 seconds from run time
              runtime=0;     // and reset counters
              ex=0;
              days=0;
              seconds=0;
              PORTB.B1=0;
           }
           PORTC=screen(days); //set pins value to 7-segment

      }

}

void interrupt() {  //interrrupt handler
  if (INTCON.TMR0IF==1) {  //timer interrupt
    counter++;
    INTCON.TMR0IF=0;
    TMR0=6;
  }
  if(INTF_bit==1){  //external interrupt
        INTF_bit=0;
        PORTB.B1=1;
        ex=1;
  }
}