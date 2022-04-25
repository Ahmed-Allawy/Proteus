
_initialize_proberties:

;FINALCODE.c,3 :: 		void initialize_proberties(void){
;FINALCODE.c,4 :: 		TRISC=0; //screen pins as output
	CLRF       TRISC+0
;FINALCODE.c,5 :: 		TRISB.B1=0; //set pin output
	BCF        TRISB+0, 1
;FINALCODE.c,6 :: 		PORTB.B1=0; // with value ==0
	BCF        PORTB+0, 1
;FINALCODE.c,7 :: 		TMR0IE_bit=1;   //enable timer interrupt
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;FINALCODE.c,8 :: 		INTE_bit=1;  //enable external intterrupt
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;FINALCODE.c,9 :: 		GIE_bit=1;    //enable global interrrupt
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;FINALCODE.c,10 :: 		T0CS_bit=0;  //use internal clock which equal 4/f from crystal
	BCF        T0CS_bit+0, BitPos(T0CS_bit+0)
;FINALCODE.c,11 :: 		PSA_bit=0;  //assigned prescaler to timer
	BCF        PSA_bit+0, BitPos(PSA_bit+0)
;FINALCODE.c,12 :: 		PS0_bit=0;  // with...
	BCF        PS0_bit+0, BitPos(PS0_bit+0)
;FINALCODE.c,13 :: 		PS1_bit=1;  //value....
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;FINALCODE.c,14 :: 		PS2_bit=0;//==32
	BCF        PS2_bit+0, BitPos(PS2_bit+0)
;FINALCODE.c,15 :: 		TMR0=6;   //start count from 6 to count 250
	MOVLW      6
	MOVWF      TMR0+0
;FINALCODE.c,16 :: 		}
L_end_initialize_proberties:
	RETURN
; end of _initialize_proberties

_screen:

;FINALCODE.c,17 :: 		int screen(int d){
;FINALCODE.c,18 :: 		if(d==3){
	MOVLW      0
	XORWF      FARG_screen_d+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__screen15
	MOVLW      3
	XORWF      FARG_screen_d+0, 0
L__screen15:
	BTFSS      STATUS+0, 2
	GOTO       L_screen0
;FINALCODE.c,19 :: 		return 0b01000000;
	MOVLW      64
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_screen
;FINALCODE.c,20 :: 		}
L_screen0:
;FINALCODE.c,22 :: 		if(d==2){
	MOVLW      0
	XORWF      FARG_screen_d+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__screen16
	MOVLW      2
	XORWF      FARG_screen_d+0, 0
L__screen16:
	BTFSS      STATUS+0, 2
	GOTO       L_screen1
;FINALCODE.c,23 :: 		return 0b01111001;
	MOVLW      121
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_screen
;FINALCODE.c,24 :: 		}
L_screen1:
;FINALCODE.c,25 :: 		if(d==1){
	MOVLW      0
	XORWF      FARG_screen_d+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__screen17
	MOVLW      1
	XORWF      FARG_screen_d+0, 0
L__screen17:
	BTFSS      STATUS+0, 2
	GOTO       L_screen2
;FINALCODE.c,26 :: 		return 0b0100100;
	MOVLW      36
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_screen
;FINALCODE.c,27 :: 		}
L_screen2:
;FINALCODE.c,28 :: 		if(d==0){
	MOVLW      0
	XORWF      FARG_screen_d+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__screen18
	MOVLW      0
	XORWF      FARG_screen_d+0, 0
L__screen18:
	BTFSS      STATUS+0, 2
	GOTO       L_screen3
;FINALCODE.c,29 :: 		return 0b0110000;
	MOVLW      48
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_screen
;FINALCODE.c,30 :: 		}
L_screen3:
;FINALCODE.c,32 :: 		}
L_end_screen:
	RETURN
; end of _screen

_main:

;FINALCODE.c,33 :: 		void main() {
;FINALCODE.c,34 :: 		initialize_proberties();
	CALL       _initialize_proberties+0
;FINALCODE.c,36 :: 		while(1){
L_main4:
;FINALCODE.c,37 :: 		if(counter==500){//count 1 second
	MOVF       _counter+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      244
	XORWF      _counter+0, 0
L__main20:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;FINALCODE.c,38 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;FINALCODE.c,39 :: 		seconds++;//counter for seconds
	INCF       _seconds+0, 1
	BTFSC      STATUS+0, 2
	INCF       _seconds+1, 1
;FINALCODE.c,40 :: 		if(ex=1 | days==3) runtime++; //counter for  run time
	MOVLW      0
	XORWF      _days+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      3
	XORWF      _days+0, 0
L__main21:
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVLW      1
	IORWF      R0+0, 0
	MOVWF      _ex+0
	CLRF       _ex+1
	MOVLW      0
	IORWF      _ex+1, 1
	MOVLW      0
	MOVWF      _ex+1
	MOVF       _ex+0, 0
	IORWF      _ex+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	INCF       _runtime+0, 1
	BTFSC      STATUS+0, 2
	INCF       _runtime+1, 1
L_main7:
;FINALCODE.c,41 :: 		}
L_main6:
;FINALCODE.c,42 :: 		if(seconds==86400){
	MOVLW      0
	BTFSC      _seconds+1, 7
	MOVLW      255
	MOVWF      R0+0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVF       _seconds+1, 0
	XORLW      81
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      128
	XORWF      _seconds+0, 0
L__main22:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;FINALCODE.c,43 :: 		seconds=0;
	CLRF       _seconds+0
	CLRF       _seconds+1
;FINALCODE.c,44 :: 		days++; //counter for days
	INCF       _days+0, 1
	BTFSC      STATUS+0, 2
	INCF       _days+1, 1
;FINALCODE.c,45 :: 		}
L_main8:
;FINALCODE.c,47 :: 		if(days==3){  //run motor after 3 days from last one
	MOVLW      0
	XORWF      _days+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      3
	XORWF      _days+0, 0
L__main23:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;FINALCODE.c,48 :: 		PORTB.B1=1;
	BSF        PORTB+0, 1
;FINALCODE.c,49 :: 		}
L_main9:
;FINALCODE.c,50 :: 		if(runtime==15){ //stop motor after 15 seconds from run time
	MOVLW      0
	XORWF      _runtime+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      15
	XORWF      _runtime+0, 0
L__main24:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;FINALCODE.c,51 :: 		runtime=0;     // and reset counters
	CLRF       _runtime+0
	CLRF       _runtime+1
;FINALCODE.c,52 :: 		ex=0;
	CLRF       _ex+0
	CLRF       _ex+1
;FINALCODE.c,53 :: 		days=0;
	CLRF       _days+0
	CLRF       _days+1
;FINALCODE.c,54 :: 		seconds=0;
	CLRF       _seconds+0
	CLRF       _seconds+1
;FINALCODE.c,55 :: 		PORTB.B1=0;
	BCF        PORTB+0, 1
;FINALCODE.c,56 :: 		}
L_main10:
;FINALCODE.c,57 :: 		PORTC=screen(days); //set pins value to 7-segment
	MOVF       _days+0, 0
	MOVWF      FARG_screen_d+0
	MOVF       _days+1, 0
	MOVWF      FARG_screen_d+1
	CALL       _screen+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;FINALCODE.c,59 :: 		}
	GOTO       L_main4
;FINALCODE.c,61 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;FINALCODE.c,63 :: 		void interrupt() {  //interrrupt handler
;FINALCODE.c,64 :: 		if (INTCON.TMR0IF==1) {  //timer interrupt
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt11
;FINALCODE.c,65 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;FINALCODE.c,66 :: 		INTCON.TMR0IF=0;
	BCF        INTCON+0, 2
;FINALCODE.c,67 :: 		TMR0=6;
	MOVLW      6
	MOVWF      TMR0+0
;FINALCODE.c,68 :: 		}
L_interrupt11:
;FINALCODE.c,69 :: 		if(INTF_bit==1){  //external interrupt
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt12
;FINALCODE.c,70 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;FINALCODE.c,71 :: 		PORTB.B1=1;
	BSF        PORTB+0, 1
;FINALCODE.c,72 :: 		ex=1;
	MOVLW      1
	MOVWF      _ex+0
	MOVLW      0
	MOVWF      _ex+1
;FINALCODE.c,73 :: 		}
L_interrupt12:
;FINALCODE.c,74 :: 		}
L_end_interrupt:
L__interrupt26:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
