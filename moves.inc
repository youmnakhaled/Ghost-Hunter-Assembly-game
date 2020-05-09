MoveBlueUp Macro 
    LOCAL dontmove
	LOCAL moveon
	call ClearBlueShooter
	sub Yblue,10
	
	cmp Yblue,35
	jb dontmove
	
	cmp Yblue,0FFF0h
	ja dontmove
	
	jmp moveon
	
	dontmove:
	add Yblue,10
	
	moveon:
	call DrawBlueShooter
EndM MoveBlueUp

MoveBlueDown Macro
	LOCAL dontmove2
	LOCAL moveon2 
	call ClearBlueShooter
	add Yblue,10
	
	cmp Yblue,315
	ja dontmove2
	
	jmp moveon2
	
	dontmove2:
	sub Yblue,10
	
	moveon2:
	call DrawBlueShooter
EndM MoveBlueDown

MoveBlueLeft Macro 
	LOCAL dontmove5
	LOCAL moveon5
	call ClearBlueShooter
	sub Xblue,10
	
	cmp Xblue,485
	jb dontmove5
	
	jmp moveon5
	
	dontmove5:
	add Xblue,10
	
	moveon5:
	call DrawBlueShooter
EndM MoveBlueLeft

MoveBlueRight Macro 
	LOCAL dontmove6
	LOCAL moveon6
	call ClearBlueShooter
	add Xblue,10
	
	cmp Xblue,600
	ja dontmove6
	
	jmp moveon6
	
	dontmove6:
	sub Xblue,10
	
	moveon6:
	call DrawBlueShooter
EndM MoveBlueRight

MoveRedUp Macro
	LOCAL dontmove3
	LOCAL moveon3
	call ClearRedShooter
	;Call ClearLeftBullet
	sub Yred,10
	
	cmp Yred,35
	jb dontmove3
	
	cmp Yred,0FFF0h
	ja dontmove3
	
	jmp moveon3
	
	dontmove3:
	add Yred,10
	
	moveon3:
	
	call DrawRedShooter
	;Call DrawLeftBullet
EndM MoveRedUp
		
MoveRedDown Macro
	LOCAL dontmove4
	LOCAL moveon4
	call ClearRedShooter
	;Call ClearLeftBullet
	add Yred,10
	
	cmp Yred,315
	ja dontmove4
	
	jmp moveon4
	
	dontmove4:
	sub Yred,10
	
	moveon4:
	
	call DrawRedShooter
	;Call DrawLeftBullet
EndM MoveRedDown

MoveRedRight Macro
	LOCAL dontmove7
	LOCAL moveon7
	call ClearRedShooter
	;Call ClearLeftBullet
	add Xred,10
	
	cmp Xred,135
	ja dontmove7
	
	jmp moveon7
	
	dontmove7:
	sub Xred,10
	
	moveon7:
	call DrawRedShooter
	;Call DrawLeftBullet
EndM MoveRedRight


MoveRedLeft Macro
	LOCAL dontmove8
	LOCAL moveon8
	call ClearRedShooter
	;Call ClearLeftBullet
	sub Xred,10
	
	cmp Xred,0fff5h
	ja dontmove8
	
	jmp moveon8
	
	dontmove8:
	add Xred,10
	
	moveon8:
	call DrawRedShooter
	;Call DrawLeftBullet
EndM 

SCROLLP1	MACRO
LOCAL NOSCROLL
		CMP CHATROWP1,12
		JB NOSCROLL
		
		MOV AH,06
		MOV AL,1	;NUMBER OF LINES
		MOV BH,00
		MOV Ch,1
		MOV CL,0
		MOV DH,11	;END OF ROWS OF P1
		MOV DL,79	;END OF COLS
		INT 10H
		
		MOV CHATROWP1,11
		MOV CHATCOLP1,0
				
		NOSCROLL:
		
ENDM
;PLAYER2
;__________________________________________________________
SCROLLP2	MACRO
LOCAL NOSCROLLP2
		CMP CHATROWP2,25
		JB NOSCROLLP2
		
		MOV AH,06
		MOV AL,1	;NUMBER OF LINES
		MOV BH,GREYCOLOR
		MOV CH,13
		MOV CL,0
		MOV DX,184FH
		INT 10H
		
		MOV CHATROWP2,24
		MOV CHATCOLP2,0
		
		NOSCROLLP2:
ENDM
;__________________________________________________________

;INLINE SCROLLING
;__________________________________________________________
;PLAYER1
INSCROLLP1	MACRO
	LOCAL INOSCROLL
		CMP CHATROWP1,1AH
		JB INOSCROLL
		
		MOV AH,06
		MOV AL,1	;NUMBER OF LINES
		MOV BH,00
		MOV CX,1800H
		MOV DX,1950H
		INT 10H
		
		MOV CHATROWP1,19H
		MOV CHATCOLP1,0
				
		INOSCROLL:
		
ENDM
;PLAYER2
;__________________________________________________________
INSCROLLP2	MACRO
LOCAL NOINSCROLLP2
		CMP CHATROWP2,1DH
		JB NOINSCROLLP2
		
		MOV AH,06
		MOV AL,1	;NUMBER OF LINES
		MOV BH,00
		MOV CX,1B00H
		MOV DX,1C50H
		INT 10H
		
		MOV CHATROWP2,1CH
		MOV CHATCOLP2,0
		
		NOINSCROLLP2:
ENDM
;__________________________________________________________

;DISPLAY CHAR 
;__________________________________________________________
DISPCHAR	MACRO CHAR,COLOR
		PUSH BX
		
		MOV CX,1
		MOV AH,09
		MOV BH,0
		MOV AL,CHAR
		MOV BL,COLOR
		INT 10H
		
		POP BX
ENDM

;__________________________________________________________
SCURSOR MACRO	ROW,COL	
	PUSH BX
	
	MOV AH,02
	MOV BH,00
	MOV DH,ROW
	MOV DL,COL
	INT 10H
	
	POP BX
	
ENDM	
		