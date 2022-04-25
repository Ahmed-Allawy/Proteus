
_get_passWord:

;SmartLock.c,5 :: 		char get_passWord(){
;SmartLock.c,6 :: 		Loop:
___get_passWord_Loop:
;SmartLock.c,7 :: 		Lcd_Out(1,1,"Enter PassWord");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_SmartLock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SmartLock.c,8 :: 		for(i=0;i<3;i++){
	CLRF       _i+0
	CLRF       _i+1
L_get_passWord0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__get_passWord23
	MOVLW      3
	SUBWF      _i+0, 0
L__get_passWord23:
	BTFSC      STATUS+0, 0
	GOTO       L_get_passWord1
;SmartLock.c,9 :: 		while(passWord[i]==0){
L_get_passWord3:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_get_passWord4
;SmartLock.c,10 :: 		passWord[i]=Keypad_Key_Click();
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FLOC__get_passWord+0
	CALL       _Keypad_Key_Click+0
	MOVF       FLOC__get_passWord+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;SmartLock.c,11 :: 		}
	GOTO       L_get_passWord3
L_get_passWord4:
;SmartLock.c,12 :: 		switch(passWord[i]){
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      R1+0
	GOTO       L_get_passWord5
;SmartLock.c,13 :: 		case 1:passWord[i]='7';
L_get_passWord7:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVLW      55
	MOVWF      INDF+0
;SmartLock.c,14 :: 		break;
	GOTO       L_get_passWord6
;SmartLock.c,15 :: 		case 2:passWord[i]='8';
L_get_passWord8:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVLW      56
	MOVWF      INDF+0
;SmartLock.c,16 :: 		break;
	GOTO       L_get_passWord6
;SmartLock.c,17 :: 		case 3:passWord[i]='9';
L_get_passWord9:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVLW      57
	MOVWF      INDF+0
;SmartLock.c,18 :: 		break;
	GOTO       L_get_passWord6
;SmartLock.c,19 :: 		case 5:passWord[i]='4';
L_get_passWord10:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVLW      52
	MOVWF      INDF+0
;SmartLock.c,20 :: 		break;
	GOTO       L_get_passWord6
;SmartLock.c,21 :: 		case 6:passWord[i]='5';
L_get_passWord11:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVLW      53
	MOVWF      INDF+0
;SmartLock.c,22 :: 		break;
	GOTO       L_get_passWord6
;SmartLock.c,23 :: 		case 7:passWord[i]='6';
L_get_passWord12:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVLW      54
	MOVWF      INDF+0
;SmartLock.c,24 :: 		break;
	GOTO       L_get_passWord6
;SmartLock.c,25 :: 		case 9:passWord[i]='1';
L_get_passWord13:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVLW      49
	MOVWF      INDF+0
;SmartLock.c,26 :: 		break;
	GOTO       L_get_passWord6
;SmartLock.c,27 :: 		case 10:passWord[i]='2';
L_get_passWord14:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVLW      50
	MOVWF      INDF+0
;SmartLock.c,28 :: 		break;
	GOTO       L_get_passWord6
;SmartLock.c,29 :: 		case 11:passWord[i]='3';
L_get_passWord15:
	MOVF       _i+0, 0
	ADDLW      _passWord+0
	MOVWF      FSR
	MOVLW      51
	MOVWF      INDF+0
;SmartLock.c,30 :: 		break;
	GOTO       L_get_passWord6
;SmartLock.c,31 :: 		}
L_get_passWord5:
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_get_passWord7
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_get_passWord8
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_get_passWord9
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_get_passWord10
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_get_passWord11
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_get_passWord12
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_get_passWord13
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_get_passWord14
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_get_passWord15
L_get_passWord6:
;SmartLock.c,32 :: 		Lcd_Chr(2,i+1,'*');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;SmartLock.c,8 :: 		for(i=0;i<3;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;SmartLock.c,33 :: 		}
	GOTO       L_get_passWord0
L_get_passWord1:
;SmartLock.c,34 :: 		if(strcmp(passWord,"123")==0){return 1;}
	MOVLW      _passWord+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr2_SmartLock+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__get_passWord24
	MOVLW      0
	XORWF      R0+0, 0
L__get_passWord24:
	BTFSS      STATUS+0, 2
	GOTO       L_get_passWord16
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_get_passWord
L_get_passWord16:
;SmartLock.c,36 :: 		Lcd_Out(1,1,"Wrong PassWord");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_SmartLock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SmartLock.c,37 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_get_passWord18:
	DECFSZ     R13+0, 1
	GOTO       L_get_passWord18
	DECFSZ     R12+0, 1
	GOTO       L_get_passWord18
	DECFSZ     R11+0, 1
	GOTO       L_get_passWord18
	NOP
	NOP
;SmartLock.c,38 :: 		passWord[0]=0;
	CLRF       _passWord+0
;SmartLock.c,39 :: 		passWord[1]=0;
	CLRF       _passWord+1
;SmartLock.c,40 :: 		passWord[2]=0;
	CLRF       _passWord+2
;SmartLock.c,41 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SmartLock.c,42 :: 		goto Loop;
	GOTO       ___get_passWord_Loop
;SmartLock.c,44 :: 		}
L_end_get_passWord:
	RETURN
; end of _get_passWord

_main:

;SmartLock.c,45 :: 		void main() {
;SmartLock.c,46 :: 		TRISD.B0=0;
	BCF        TRISD+0, 0
;SmartLock.c,47 :: 		PORTD.b0=0;
	BCF        PORTD+0, 0
;SmartLock.c,49 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;SmartLock.c,50 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SmartLock.c,51 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SmartLock.c,54 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;SmartLock.c,57 :: 		get_passWord();
	CALL       _get_passWord+0
;SmartLock.c,60 :: 		while(1){
L_main19:
;SmartLock.c,61 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;SmartLock.c,62 :: 		Lcd_Out(1,2,"Flash progress");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_SmartLock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SmartLock.c,63 :: 		PORTD.B0=~PORTD.B0;
	MOVLW      1
	XORWF      PORTD+0, 1
;SmartLock.c,64 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
;SmartLock.c,65 :: 		}
	GOTO       L_main19
;SmartLock.c,66 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
