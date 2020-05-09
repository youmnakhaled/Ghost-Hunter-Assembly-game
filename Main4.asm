Extrn DrawGhost:FAR
Extrn DrawBlueShooter:FAR
Extrn DrawRedShooter:FAR
Extrn DrawTitle:FAR
Public Xghost
Public Yghost
Public colorghost
Public Xblue
Public Yblue
Public Xred
Public Yred
include moves.inc
.model small
.stack 64
.data
Xghost dw 140
Yghost dw 50
colorghost db 6

Xblue dw 540
Yblue dw 100

Xred dw 60
Yred dw 200

XLeftB dw ?
YLeftB dw ?
statusleftB db 1

XRightB dw ?
YRightB dw ?
statusrightB db 1

shootingred db 0
shootingblue db 0
keypressed db 0

leftB db 0,0,0Eh,0,0,0,0,0,0,0Eh,0Eh,0,0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0,0Eh,0Eh,0,0,0,0,0,0Eh,0,0,0,0
leftBup db 0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0,0Eh,0Eh,0Eh,0Eh,0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0,0,0Eh,0Eh,0,0,0,0
leftBdown db 0,0Eh,0Eh,0,0,0,0,0Eh,0Eh,0Eh,0Eh,0,0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0Eh,0,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0,0Eh,0Eh,0Eh,0Eh,0,0,0Eh,0Eh,0Eh,0Eh,0Eh

rightB db 0,0,0,0,0Eh,0,0,0,0,0,0Eh,0Eh,0,0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0,0Eh,0Eh,0,0,0,0,0,0,0Eh,0,0
rightBup db 0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0Eh,0Eh,0Eh,0Eh,0,0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0,0Eh,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0,0Eh,0Eh,0Eh,0Eh,0,0,0,0,0Eh,0Eh,0
rightBdown db 0,0,0,0,0Eh,0Eh,0,0,0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0,0Eh,0Eh,0Eh,0Eh,0,0,0,0Eh,0Eh,0Eh,0Eh,0Eh,0,0


bomb db 0,0,0,0,0,0,6,6,6,6,6,6,6,0,0,0,0,0,0
db 0,0,0,0,0,0,6,6,6,6,6,6,6,0,0,0,0,0,0
db 0,0,0,6,6,6,6,6,6,6,6,6,6,6,6,6,0,0,0
db 0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0
db 0,6,6,6,8,8,8,6,6,6,6,6,6,6,6,6,6,6,0
db 6,6,6,8,8,8,8,8,8,6,6,6,6,6,6,6,6,6,6
db 6,6,6,8,8,8,8,8,8,6,6,6,6,6,6,6,6,6,6
db 6,6,6,8,8,8,8,8,8,6,6,6,6,6,6,6,6,6,6
db 6,6,6,8,8,8,8,8,8,6,6,6,6,6,6,6,6,6,6
db 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
db 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
db 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
db 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
db 0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0
db 0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0
db 0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0
db 0,0,0,6,6,6,6,6,6,6,6,6,6,6,6,6,0,0,0
db 0,0,0,0,0,0,6,6,6,6,6,6,6,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

heart db 0,0,0ah,0ah,0ah,0ah,0ah,0,0,0,0,0,0ah,0ah,0ah,0ah,0ah,0,0
db 0,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0,0,0,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0
db 0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah
db 0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah
db 0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah
db 0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah
db 0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah
db 0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah
db 0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah
db 0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah
db 0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0
db 0,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0,0
db 0,0,0,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0,0,0
db 0,0,0,0,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0,0,0,0
db 0,0,0,0,0,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0,0,0,0,0
db 0,0,0,0,0,0,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0ah,0ah,0ah,0ah,0ah,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0ah,0ah,0ah,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0ah,0,0,0,0,0,0,0,0,0





Inlinemsg db 'Inline Chatting and Notifications will be implemented here in phase 2 ISA ',3,'$' 
mes1 db 'Start chatting ','$' 
mes2 db 'Start Playing   ','$'
mes3 db 'End program  ','$'
mes4 db 'Chatting will be uploaded soon!!, See You Next Phase INSHALLAH ',03,'$'
mes5 db 'Thank You for playing Come back soon ',03,'!! ','$'  
mes6 db 'Game starting.... ','$'
line db 0
axy  db 0   ;count for moving arrow

chooselevel  db 'Please Choose level : ','$'
levelmsg1    db 'Level 1  ','$' 
levelmsg2    db 'Level 2 ','$'
level 		 db 0

	UserName db 30 dup('$')
	Partnername2 db 30 dup('$')
	RECEIVED db 0
	first        db 'Enter your username :',10,'$'  
Blueusername       db 'Blue player username :',10,'$'
Redusername    db 'Red player username :',10,'$'
UserName1    db  32,?, 30 dup('$') 	;username for red player 
UserName2    db  32,?, 30 dup('$')	;username for blue player
errormessage db  'Please !!,Enter 15-Alphabets only,Enter Again :',10,'$' 
show         db  'Names Saved!','$'
show2        db 'Press Enter to start','$' 
clearline db '                                                ','$'
redname db 1
isent db 0

clearscore db '  ','$'

loopcount dw 0

ghosts dw 200,200   ;x of ghost1 , y of ghost1
	   db 1		  ; color of ghost 1
	   dw 180,180	  ;same way 
	   db 4
	   dw 300,320
	   db 0ch
	   dw 230,250 
	   db 7
	   dw 400,160
	   db 3
	   dw 190,300
	   db 0eh
	   dw 200,200  ;first bomb
	   db 7
	   dw 250,250  ;second bomb
	   db 2
	   
ghostsRecieved dw ?,?   ;x of ghost1 , y of ghost1
	   db ?		  ; color of ghost 1
	   dw ?,?	  ;same way 
	   db ?
	   dw ?,?
	   db ?
	   dw ?,? 
	   db ?
	   dw ?,?
	   db ?
	   dw ?,?
	   db ?
	   dw ?,?  ;first bomb
	   db ?
	   dw ?,?  ;second bomb
		db ?	   
	   
ghostsColour db 1,4,0ch,7,3,0eh
	   
confirm db 0
	   
ScoreRed db 0
ScoreBlue db 0

ColourDead db 0
ColourDead2 db 0
DeadFlag db 0,0,0,0,0,0

DeadFlagR db 0,0,0,0,0,0

GhostID dw 0

winner  db 10,09,09,09,'   End Of Game !! ',10,13,09,09,09 ,'Winner Announcement ',01,'$'
congrats db 09,09,'Congrats !!','$'
congrats1 db 09,'Congrats !!',03,10,13,09,09,09,'$'

go db 0

MenuClicked db 3
MySent db 0
MyReceived db 0

FirstPlayer db 0
ToDo db 0

MyInvitation db 4
HisInvitation db 4
Value db 0

MGI db 25
MCI db 26
HGI db 27
HCI db 28
EXT db 29


MyChatInv db 'You sent a chat invitation','$'
MyGameInv db 'You sent a game invitation','$'

HisChatInv db ' sent you a chat invitation','$'
HisGameInv db ' sent you a game invitation','$'

level1msg db 'You will play level 1','$'
level2msg db 'You will play level 2','$'

OtherPlayer db 30h
;Nada
ESCAPECHAT DB 0
IS_INLINE DB 0
tempchar	db ?

;PLAYER1 INFO
WHITECOLOR	EQU 0FH
CHATKEYP1 DB ?
CHATROWP1	DB 0
CHATCOLP1	DB 0

;PLAYER2 INFO
STARTGREY EQU 1920
GREYCOLOR EQU 125
YELLOWCOLOR	EQU 7EH
CHATKEYP2 DB ?
CHATROWP2	DB 12
CHATCOLP2	DB 0 

scoreRedS  db 0
scoreBlueS db 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.CODE
MAIN  PROC FAR
      MOV AX, @DATA
	  MOV DS,AX

		CALL INTIALPORT
	
	
		  
		  mov ah,0       ;set video mode
		  mov al,12h 
		  int 10h 
	  
		 call DrawTitle
		 mov Xghost,132
		 mov Yghost,182
		 mov colorghost,1  
		 call DrawGhost
		
		 mov Xghost,325
		 mov Yghost,150
		 mov colorghost,4 
		 call DrawGhost
		
		call Names
		
		 Menu:
		 ;;Main menu screen
		 mov ax,0600h     ;clear screen
		 mov bh,0
		 mov cx,0
		 mov dx,1d4fh
		 int 10h

	  
		 mov Xghost,210
		 mov Yghost,220
		 mov colorghost,5 
		 
		call DrawGhost
		; show message on appropriate coordinates 
			mov ah,2
			mov dh,14
			mov dl,30
			int 10h 

			mov ah,9
			mov dx,offset mes1
			int 21h

			mov ah,2
			mov dh,16
			mov dl,30         
			int 10h 

			mov ah,9
			mov dx,offset mes2
			int 21h  

			mov ah,2
			mov dh,18
			mov dl,30
			int 10h 

			mov ah,9
			mov dx,offset mes3
			int 21h
			
			call SetInvitations
			cmp ToDo,0
			jz startingchat
			cmp ToDo,1
			jz CheckLevels
			jmp EndGame

		;;/Main menu screen		
startingchat:
   		 mov ax,0600h     ;clear screen
		 mov bh,0
		 mov cx,0
		 mov dx,1d4fh
		 int 10h
call Chatproc
JMP Menu

CheckLevels:
 	
cmp FirstPlayer,0
jz RECEIVElevel
;;;;if yes--> choose level
 
   call levelscreen
   MOV DX,3FDH
   AGAINlevel:
   IN AL, DX
   AND AL,00100000B     ;READ LINE STATUS
   JZ AGAINlevel
   
  ;; IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
   MOV DX,3F8H
   MOV AL, level
   OUT DX,AL
  
jmp startGame

;;;player 2
RECEIVElevel:
	MOV DX,3FDH
    IN AL,DX
    AND AL,1
    JZ RECEIVElevel
  
	
   ;;IF READY READ THE VALUE IN RECEIVE DATA REGISTER 
    MOV DX,03F8H 
    IN AL,DX
    MOV level, AL 

cmp level,1
jz print1
        mov ah,2
		mov dh,29
		mov dl,0
		int 10h
		
		mov ah,9
		mov dx,offset level2msg
		int 21h 



jmp startGame

print1:
	    mov ah,2
		mov dh,29
		mov dl,0
		int 10h
		
		mov ah,9
		mov dx,offset level1msg
		int 21h 
   




startGame:
		
		mov cx,2
		delayloop111: 
		push cx
		mov cx,0fh
		mov dx,4240h
		mov ah,86h
		int 15h
		pop cx
		loop delayloop111
		
        
		 mov ax,0600h     ;clear screen
		 mov bh,0
		 mov cx,0
		 mov dl,80
		 mov dh,30
		 int 10h
		 
		mov ah,2     ;;Printing the score bar
		mov dh,01
		mov dl,4
		int 10h
		
		mov ah,9
		mov dx,offset username1[0]
		int 21h 
		
		
		
		mov dh,01
		mov dl,22
		int 10h 
		
		mov dl,scoreRed
		call ShowScore
		
		
		mov Xghost,0
	    mov yghost,10
	    mov colorghost,5
	    call DrawGhost
	
	   ;;;;;; ghost 2 data
		
		
		mov ah,2
		mov dh,01
		mov dl,58
		int 10h 
		
		mov dl,scoreBlue
		call ShowScore
		
		 
		
	    mov ah,2
		mov dh,01
		mov dl,62
		int 10h
		
		mov ah,9
		mov dx,offset username2[0]
		int 21h 
		
		
		  mov Xghost,620
		  mov yghost,10
		  mov colorghost,5
		  call DrawGhost
	  	
	  
	  
	  Call DrawBorders
	  
	  Call DrawBlueShooter
	  Call DrawRedShooter
	  
	  Call DrawLeftBullet
	  Call DrawRightBullet
	  
	  CHECK: 
	   cmp redname,1
	   jz checkred
	   cmp shootingblue,1
	   jz call2
	   
	   jmp CHECK2
	   
	    checkred:
		cmp shootingred,1     ;Check if the red shooter is shooting a bullet if yes call shootred
	    jz call1
		 
		 Check2:
		
		
		   ; push di
		   ; push dx
		   ; push bx
		    ; call SandRArray
		    ; CALL whichmove
		  
		   
		   ; pop bx
		   ; pop dx
		   ; pop di
		   ; mov loopcount,0
		   cont17:	      
		  
		 
		cmp keypressed,1
		jz cont15
		jmp cont16
		cont15:
		mov ah,0
		int 16h 
		mov keypressed,0
		
		cont16:
		cmp redname,1
		jz checkblue
	     cmp shootingred,1
		 jz call111
		 
		 jmp cont13
		 
		 checkblue:
		 cmp shootingblue,1      ;Check if the blue shooter is shooting a bullet if yes call shootblue
	     jz call111
	    
		 jmp cont13
		 
		 
	     call1:
		 call shootred
		 call2:
		 call shootblue
		 
		 call111:
		 jmp ShootOtherPlayer
		 
		 
		  
	  cont13:
	  ;;
	 
	  ; compare:
	  ; CMP ScoreRed,20   ;;Check when to end game if a player won
		 ; jae gameover1 
		 
		 ; CMP ScoreBlue,20
		 ; jae gameover1 
		 
		 ;;call delay
		 ; jmp notgameover
		 
		; gameover1:
	  ; jmp gameover
	  
		; notgameover:
		
		 push di
		   push dx
		   push bx
		   call SandRFlag
		    call SandRArray
		    CALL whichmove
			
			mov ah,2
		mov dh,01
		mov dl,22
		mov bx,0
		int 10h
		
		cmp redname,1
		jz  showsHerex
		mov dl,scoreRedS
		call ShowScore
		jmp doneshowing
		showsHerex:
		mov dl,scoreRed
		call ShowScore
		doneshowing:
		
		mov ah,2
		mov dh,01
		mov dl,58
		mov bx,0 
		int 10h
		
		cmp redname,1
		jz  showsHere
		mov dl,scoreBlueS
		call ShowScore
		jmp doneshowing1
		showsHere:
		mov dl,scoreBlue
		call ShowScore
		doneshowing1:
		  
		   
		   pop bx
		   pop dx
		   pop di
		   mov loopcount,0

		
	    mov ah,1
		int 16h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jnz sendkey
mov Value,30
jmp cont43
;;;law dass
sendkey:
mov VALUE,ah
cont43:
CMP ScoreRed,20   ;;Check when to end game if a player won
		 jae gameover1 
		 
		 CMP ScoreBlue,20
		 jae gameover1 
		 
		 ;call delay
		 jmp notgameover
		 
		gameover1:
	  mov Value,40
	  
		notgameover:



	
	
	    ; mov ah,2
		; mov bh,0
		; mov dl,0
		; mov dh,29
		; int 10h 
		
		; mov dl,Value
		; mov ah,2
		; int 21h 
		
		
		mov dx , 3FDH		; Line Status Register
AGAINshooter:  	
		In al , dx 			;Read Line Status
  		test al , 00100000b
  		JZ AGAINshooter                               ;Not empty

;;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,VALUE
  		out dx , al
		
		cmp VALUE,40
		jnz cont59
		jmp Gameover
		cont59:
		
		mov dx , 3FDH		; Line Status Register
	CHKshooter:	
		in al , dx 
  		test al , 1
  		JZ CHKshooter                                    ;Not Ready
;;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H
  		in al , dx 
  		mov OtherPlayer , al
		
		
		; mov ah,2
		; mov bh,0
		; mov dl,0
		; mov dh,28
		; int 10h 

		; mov dl,OtherPlayer
		; mov ah,2
		; int 21h 
		
		
		cmp OtherPlayer,72
		jnz cont36
		jmp MoveOtherPlayerUp
		cont36:
		cmp OtherPlayer,80
		jnz cont37
		jmp MoveOtherPlayerDown
		cont37:
		cmp OtherPlayer,77
		jnz cont45
		jmp MoveOtherPlayerRight
		cont45:
		cmp OtherPlayer,75
		jnz cont46
		jmp MoveOtherPlayerLeft
		cont46:
		
		cmp OtherPlayer,57
		jnz cont47
		jmp ShootOtherPlayer
		cont47:
		
		cmp OtherPlayer,39
		jnz cont50
		jmp MoveGunOtherPlayerUp
		cont50:
		
		cmp OtherPlayer,52
		jnz cont49
		jmp MoveGunOtherPlayerDown
		cont49:
		
		cmp OtherPlayer,25
		jnz cont54
		jmp OtherPlayerInline
		cont54:
		
		cmp OtherPlayer,40
		jnz cont57
		jmp gameover
		cont57:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
		
		
		 jmp ReadKey
trans16: jmp MoveLeft		
trans10: jmp MoveUPr
trans7:	 jmp MoveDOWNr	
trans6:	 jmp MoveRIGHTr
trans19: jmp MoveRight
trans:	 jmp MoveLEFTr	
trans2:	 jmp trans13
trans3:	 jmp trans11
trans4:	 jmp trans12
trans20: jmp MoveDown
trans8:  jmp trans9
trans14: jmp rightgunup
trans15: jmp rightgundown
trans22: jmp MoveUp

	ReadKey:
	    cmp Value,30
		jnz cont44
		jmp CHECK
		cont44:
		
		mov keypressed,1         ;;Check which key is pressed
		
		;;MyPlayer's Motion;;
		
		cmp VALUE,72
		jz trans22
		
		cmp VALUE,80
		jz trans20
		
		cmp VALUE,77
		jz trans19
		
		cmp VALUE,75
		jz trans16
		
		
		cmp VALUE,57     ;enter to shoot
		jz trans2
		
		
		cmp VALUE,39
		jz trans14
		
		cmp VALUE,52
		jz trans15
		
		cmp VALUE,25 ; P letter for pause
		jnz ReadKey2
		
		;SCURSOR 28,0
		;DISPCHAR 'K',0FH
		
		cmp Value,40
		jnz cont58
		jmp gameover
		cont58:
		
		
		jmp startinline
		jmp check
	
	ReadKey2:
		cmp keypressed,1
		jz cont14
		jmp cont13
		cont14:
		mov ah,0
		int 16h 
		mov keypressed,0
		
;;;;;;;;;;;;;;;;;;;;;;
		
		
;;;;;;;;;;;;;;;;;	


		jmp CHECK
		
		MoveUp:
		cmp redname,1
		jnz cont38 
		jmp MoveUPr
		cont38:
		cmp shootingblue,1
		jz dontredraw
		Call ClearRightBullet
		MoveBlueUp
		Call DrawRightBullet
		jmp ReadKey2
		dontredraw:
		MoveBlueUp
		jmp ReadKey2
		
		MoveDown:
		cmp redname,1
		jnz cont39
		jmp MoveDOWNr
		cont39:
		cmp shootingblue,1
		jz dontredraw2
		Call ClearRightBullet
		MoveBlueDown
		Call DrawRightBullet
		jmp ReadKey2
		dontredraw2:
		MoveBlueDown
		jmp ReadKey2
		
		MoveRight:
		cmp redname,1
		jnz cont40
		jmp MoveRIGHTr
		cont40:
		cmp shootingblue,1
		jz dontredraw3
		Call ClearRightBullet
		MoveBlueRight
		Call DrawRightBullet
		jmp ReadKey2
		dontredraw3:
		MoveBlueRight
		jmp ReadKey2

		MoveLeft:
		cmp redname,1
		jnz cont41
		jmp MoveLEFTr
		cont41:
		cmp shootingblue,1
		jz dontredraw4
		Call ClearRightBullet
		MoveBlueLeft
		Call DrawRightBullet
		jmp ReadKey2
		dontredraw4:
		MoveBlueLeft
		jmp ReadKey2

trans18: jmp ReadKey2
trans24: jmp CHECK2
		
		
		
		MoveUPr:
		cmp shootingred,1
		jz dontredraw5
		Call ClearLeftBullet
		MoveRedUp
		Call DrawLeftBullet
		jmp ReadKey2
		dontredraw5:
		MoveRedUp
		jmp ReadKey2
		
		MoveDOWNr:
		cmp shootingred,1
		jz dontredraw6
		Call ClearLeftBullet
		MoveRedDown
		Call DrawLeftBullet
		jmp ReadKey2
		dontredraw6:
		MoveRedDown
		jmp ReadKey2
		


trans11:jmp leftgunup


		MoveRIGHTr:
		cmp shootingred,1
		jz dontredraw7
		Call ClearLeftBullet
		MoveRedRight
		Call DrawLeftBullet
		jmp ReadKey2
		dontredraw7:
		MoveRedRight
		jmp ReadKey2

		MoveLEFTr:
		cmp shootingred,1
		jz dontredraw8
		Call ClearLeftBullet
		MoveRedLeft
		Call DrawLeftBullet
		jmp ReadKey2
		dontredraw8:
		MoveRedLeft
		jmp ReadKey2
		
trans5: jmp trans18		
trans9:		jmp shootblue
trans12:    jz leftgundown
trans13:jz shootred
	
		leftgunup:
		cmp statusleftB,0
		jz trans5
		dec statusleftB
		call DrawLeftBullet
		jmp trans5
		
		leftgundown:
		cmp statusleftB,2
		jz trans5
		inc statusleftB
		call DrawLeftBullet
		jmp trans5

		
		rightgunup:
		cmp redname,1
		jz leftgunup
		cmp statusrightB,0
		jz trans5
		dec statusrightB
		call DrawRightBullet
		jmp trans5
		
		rightgundown:
		cmp redname,1
		jz leftgundown
		cmp statusrightB,2
		jz trans5
		inc statusrightB
		call DrawRightBullet
		jmp trans5

;;;
startinline:

mov IS_INLINE,1
call STARTINLINECHAT
mov IS_INLINE,0
MOV ESCAPECHAT,0
MOV AX,0600H
	MOV Cl,0
	MOV ch,23
	MOV BH,0
	MOV Dl,79
	MOV Dh,29
	INT 10H
jmp ReadKey2



trans31: jmp trans24
shootred:                       ;;Draws the red bullet in its three positions and handles reflections and hitting of borders
		cmp redname,0
		jnz cont42
		jmp shootblue
		cont42:
		mov shootingred,1
		call MovingLeftBullet
		call CheckDeadRed
		cmp shootingred,0
		jz trans25
		mov cx,01
		mov dx,0
		mov ah,86h
		int 15h
		call ClearLeftBullet
			
		cmp statusleftB,1
		jz drawst2
			  
    	cmp statusleftB,0
	    jz drawup2
			  
	    cmp statusleftB,2
   	    jz drawdown2
			
		drawst2:
		add XLeftB,15
		mov bx,XLeftB
		add bx,7
		cmp bx,490
		jl trans23
		jmp endd8

trans17:  jmp trans5
trans23: cmp redname,1
 jz trans31
 jmp ReadKey2
trans25: jmp endd8	
		drawup2:
		sub YLeftB,10
		add XLeftB,20
		
		mov bx,XLeftB
		add bx,7
		cmp bx,490
		jg endd8
		
		cmp YLeftB,35
		jg trans23
		jmp edit
		
		edit:
		mov statusleftB,2
		jmp trans23
		
		drawdown2:
		add XLeftB,10
		add YLeftB,20
		
		mov bx,XLeftB
		add bx,7
		cmp bx,490
		jg endd8
		
		mov si,YLeftB
		add si,7
		cmp si,340  ;edge of the border for inline chatting and notifications
		jl trans23
		
		edit2:
		mov statusleftB,0
		jmp trans23
		
		endd8:
		call DrawLeftBullet
		mov shootingred,0
		jmp trans23
;;;end shootred
trans30:jmp trans17

shootblue:                     ;;Draws the blue bullet in its three positions and handles reflections and hitting of borders
	mov shootingblue,1
	call MovingRightBullet
	call CheckDeadBlue
		cmp shootingblue,0
		jnz cont51
		jmp  endd13
		cont51:
		mov cx,01h
		mov dx,0
		mov ah,86h
		int 15h
		call ClearRightBullet
		
		cmp statusrightB,1
		jz drawst5
		  
    	cmp statusrightB,0
	    jz drawup5
		  
		cmp statusrightB,2
		jz drawdown5
		
		drawst5:
		sub XRightB,20
		cmp XRightB,150
		ja trans21
		jmp endd13
		
trans21:cmp redname,1
        jz trans30
		jmp CHECK2
		
		drawup5:
		sub YRightB,10
		sub XRightB,20
		
		cmp XRightB,150
		jb endd13
		
		cmp YRightB,35
		jg trans21
		jmp edit3
		
		edit3:
		mov statusrightB,2
		jmp trans21
		
		drawdown5:
		sub XRightB,10
		add YRightB,20
		
		cmp XRightB,150
		jb endd13
		
		mov si,YRightB
		add si,7
		cmp si,340
		jl trans21
		
		edit4:
		mov statusrightB,0
		jmp trans21
		
		endd13:
		call DrawRightBullet
		mov shootingblue,0
		jmp trans21
;;;end shootblue

MoveOtherPlayerUp:
		cmp redname,1
		jnz MoveRedUp1
        cmp shootingblue,1
		jz dontredraw9
		Call ClearRightBullet
		MoveBlueUp
		Call DrawRightBullet
		jmp ReadKey
		dontredraw9:
		MoveBlueUp
		jmp ReadKey
		
		MoveRedUp1:
		cmp shootingred,1
		jz dontredraw10
		Call ClearLeftBullet
		MoveRedUp
		Call DrawLeftBullet
		jmp ReadKey
		dontredraw10:
		MoveRedUp
		jmp ReadKey
		
MoveOtherPlayerDown:
		cmp redname,1
		jnz MoveRedDown1
		cmp shootingblue,1
		jz dontredraw11
		Call ClearRightBullet
		MoveBlueDown
		Call DrawRightBullet
		jmp ReadKey
		dontredraw11:
		MoveBlueDown
		jmp ReadKey
		
		MoveRedDown1:
		cmp shootingred,1
		jz dontredraw12
		Call ClearLeftBullet
		MoveRedDown
		Call DrawLeftBullet
		jmp ReadKey
		dontredraw12:
		MoveRedDown
		jmp ReadKey
		
MoveOtherPlayerRight:
		cmp redname,1
		jnz MoveRedRight1
		cmp shootingblue,1
		jz dontredraw13
		Call ClearRightBullet
		MoveBlueRight
		Call DrawRightBullet
		jmp ReadKey
		dontredraw13:
		MoveBlueRight
		jmp ReadKey
		
		MoveRedRight1:
		cmp shootingred,1
		jz dontredraw14
		Call ClearLeftBullet
		MoveRedRight
		Call DrawLeftBullet
		jmp ReadKey
		dontredraw14:
		MoveRedRight
		jmp ReadKey
		
MoveOtherPlayerLeft:
		cmp redname,1
		jnz MoveRedLeft1
		cmp shootingblue,1
		jz dontredraw15
		Call ClearRightBullet
		MoveBlueLeft
		Call DrawRightBullet
		jmp ReadKey
		dontredraw15:
		MoveBlueLeft
		jmp ReadKey
		
		MoveRedLeft1:
		cmp shootingred,1
		jz dontredraw16
		Call ClearLeftBullet
		MoveRedLeft
		Call DrawLeftBullet
		jmp ReadKey
		dontredraw16:
		MoveRedLeft
		jmp ReadKey
		
ShootOtherPlayer:
		cmp redname,1
		jz cont48
		jmp ShootRed11
		cont48:
		mov shootingblue,1
	call MovingRightBullet
	call CheckDeadBlue
		cmp shootingblue,0
		jz endd20
		mov cx,01h
		mov dx,0
		mov ah,86h
		int 15h
		call ClearRightBullet
		
		cmp statusrightB,1
		jz drawst55
		  
    	cmp statusrightB,0
	    jz drawup55
		  
		cmp statusrightB,2
		jz drawdown55
		
		drawst55:
		sub XRightB,20
		cmp XRightB,150
		ja trans28
		jmp endd20
		
trans28: jmp cont13
		
		drawup55:
		sub YRightB,10
		sub XRightB,20
		
		cmp XRightB,150
		jb endd20
		
		cmp YRightB,35
		jg trans28
		jmp edit7
		
		edit7:
		mov statusrightB,2
		jmp trans28
		
		drawdown55:
		sub XRightB,10
		add YRightB,20
		
		cmp XRightB,150
		jb endd20
		
		mov si,YRightB
		add si,7
		cmp si,340
		jl trans28
		
		edit8:
		mov statusrightB,0
		jmp trans21
		
		endd20:
		call DrawRightBullet
		mov shootingblue,0
		jmp trans28

		jmp ReadKey
		
		ShootRed11:
		mov shootingred,1
		call MovingLeftBullet
		call CheckDeadRed
		cmp shootingred,0
		jz trans26
		mov cx,01
		mov dx,0
		mov ah,86h
		int 15h
		call ClearLeftBullet
			
		cmp statusleftB,1
		jz drawst22
			  
    	cmp statusleftB,0
	    jz drawup22
			  
	    cmp statusleftB,2
   	    jz drawdown22
			
		drawst22:
		add XLeftB,15
		mov bx,XLeftB
		add bx,7
		cmp bx,490
		jl trans27
		jmp endd19


trans27: jmp cont13
trans26: jmp endd19	
		drawup22:
		sub YLeftB,10
		add XLeftB,20
		
		mov bx,XLeftB
		add bx,7
		cmp bx,490
		jg endd19
		
		cmp YLeftB,35
		jg trans27
		jmp edit5
		
		edit5:
		mov statusleftB,2
		jmp trans27
		
		drawdown22:
		add XLeftB,10
		add YLeftB,20
		
		mov bx,XLeftB
		add bx,7
		cmp bx,490
		jg endd19
		
		mov si,YLeftB
		add si,7
		cmp si,340  ;edge of the border for inline chatting and notifications
		jl trans27
		
		edit6:
		mov statusleftB,0
		jmp trans27
		
		endd19:
		call DrawLeftBullet
		mov shootingred,0
		jmp trans27
		
		
MoveGunOtherPlayerUp:
		cmp redname,1
		jnz Move1111
		cmp statusrightB,0
		jz trans29
		dec statusrightB
		call DrawRightBullet
		jmp trans29
		
		Move1111:
        cmp statusleftB,0
		jz trans29
		dec statusleftB
		call DrawLeftBullet
		jmp trans29
		
trans29: jmp ReadKey

MoveGunOtherPlayerDown:
		cmp redname,1
		jnz Move2222
		cmp statusrightB,2
		jz trans29
		inc statusrightB
		call DrawRightBullet
		jmp trans29		
Move2222:
		cmp statusleftB,2
		jz trans29
		inc statusleftB
		call DrawLeftBullet
		jmp trans29

OtherPlayerInline:
mov IS_INLINE,1
call STARTINLINECHAT
mov IS_INLINE,0
MOV ESCAPECHAT,0
MOV AX,0600H
	MOV Cl,0
	MOV ch,23
	MOV BH,0
	MOV Dl,79
	MOV Dh,29
	INT 10H
jmp ReadKey
		

Gameover:
		mov ax,0600h            ;clear screen
		 mov bx,00
		 mov cx,0
		  mov dx,1d4fh
		 int 10h
			
		mov ah,9
		mov dx,offset winner
		int 21h  

		mov xred,150
		mov yred,100
		 
		mov Xblue,350
		mov yblue,100
			
		

		mov al,scoreBlue
		cmp al,scoreRed
		ja  BlueWin
		jl Redwin
		call RedWinProc
		call BlueWinProc
		RedWin:
		call RedWinProc
		jmp delayClear
		Bluewin:
		call BlueWinProc
		jmp delayClear

		delayClear:
		mov cx,10h
		mov dx,4240h
		mov ah,86h
		int 15h


		; Now Clear Screen 
		 mov ax,0600h
		 mov bx,00
		 mov cx,0
		 mov dx,184fh
		 int 10h
		
		mov scoreBlue,0
		mov scoreRed,0
		mov Xblue, 540
		mov Yblue, 100

		mov Xred,60
		mov Yred,200
		call Menu


endGame:
	    mov ah,2
		mov bh,0
		mov dl,05
		mov dh,EXT
		int 10h 

		mov dx,offset mes5
		mov ah,9
		int 21h 
		
		mov cx,2
		delayloop1: 
		push cx
		mov cx,0fh
		mov dx,4240h
		mov ah,86h
		int 15h
		pop cx
		loop delayloop1
		
	  
	  MOV AH, 4CH
	  INT 21h 
MAIN ENDP

ShowScore PROC 
	     mov ah,2 
		
		masking1:
		push ax 
		mov al,dl
		mov ah,00
		aam
		mov dx,ax
		push cx
		mov cl,8
		ror dx,cl
		pop cx
		pop ax
		add dl,30h 
		int 21h
		mov dl,dh
		add dl,30h 
		int 21h
		endshow:
	RET
ShowScore EndP
	
RedWinProc PROC 
	call DrawRedShooter

	mov ah,2
	mov dx,0a02h        
	int 10h 

	mov ah,9
	mov dx,offset Congrats
	int 21h 

	mov ah,2
	mov dx,0c10h        
	int 10h
	 
	mov ah,9
	mov dx,offset Username1[2]
	int 21h 
	RET
RedWinProc endp

BlueWinProc PROC 
call DrawBlueShooter

	mov ah,2
	mov dx,0a1ah        
	int 10h 

	mov ah,9
	mov dx,offset Congrats
	int 21h 

	mov ah,2
	mov dx,0c28h        
	int 10h

	mov ah,9
	mov dx,offset Username2[2]
	int 21h
	RET
BlueWinProc ENDP

ClearGhost  PROC 
        push di
		push bx
		mov cx,Xghost      ;Column 
		mov dx,Yghost        ;Row 

		mov di,cx
		add di,19

		mov si,dx
		add si,19

		loop1:      
		mov al,0         ;Pixel color 
		mov ah,0ch       ;Draw Pixel Command 
		mov bx,0		
		int 10h 
		inc cx
		cmp cx,di
		jz nextrow
		cmp dx,si
		jnz loop1

		jmp endd

		nextrow:
		inc dx
		mov cx,Xghost
		jmp loop1

		endd:
		pop bx
		pop di
		RET
ClearGhost ENDP


DrawBorders  PROC 
	  mov cx,0         ;Column 
	  mov dx,355        ;Row  
	  loop2:
	         
	  mov al,5         ;Pixel color 
	  mov ah,0ch       ;Draw Pixel Command    
	  int 10h 
	  inc cx
	  cmp cx,1280    ;640+640   to draw two lines
	  jnz loop2
	  
	  mov cx,0         ;Column 
	  mov dx,30        ;Row  
	  loop13:
	         
	  mov al,5         ;Pixel color 
	  mov ah,0ch       ;Draw Pixel Command    
	  int 10h 
	  inc cx
	  cmp cx,640    ;640+640   to draw two lines
	  jnz loop13
	  
	  ;;Display Message
	  
	  mov ah,2       ;set first cursor position
	  mov dx,1903h
	  mov bh,0
	  int 10h
	        
	 
	  mov si,0
	  
loop3:

		
	  ; mov ah,9          ;print msg
	  ; mov al,Inlinemsg[si]
	  ; mov bl,05h
	  ; mov cx,1
	  ; int 10h
	  
	  mov ah,2        ;increment cursor position
	  add dl,1
	  mov bh,0
	  int 10h
	  
	  inc si 
	  cmp Inlinemsg[si],24h
	  jnz loop3
	  
	  

	  
	  RET
DrawBorders ENDP

ClearRedShooter  PROC 
		mov cx,Xred      ;Column 
		mov dx,Yred        ;Row 

		mov di,cx
		add di,40

		mov si,dx
		add si,40

		loop4:      
		mov al,0         ;Pixel color 
		mov ah,0ch       ;Draw Pixel Command 
		mov bx,0		
		int 10h 
		inc cx
		cmp cx,di
		jz nextrow4
		cmp dx,si
		jnz loop4

		jmp endd4

		nextrow4:
		inc dx
		mov cx,Xred 
		jmp loop4

		endd4:
		RET
ClearRedShooter ENDP

ClearBlueShooter  PROC 
		mov cx,Xblue      ;Column 
		mov dx,Yblue        ;Row 

		mov di,cx
		add di,40

		mov si,dx
		add si,40

		loop5:
		mov bx,0		
		mov al,0         ;Pixel color 
		mov ah,0ch       ;Draw Pixel Command  
		int 10h 
		inc cx
		cmp cx,di
		jz nextrow5
		cmp dx,si
		jnz loop5

		jmp endd5

		nextrow5:
		inc dx
		mov cx,Xblue
		jmp loop5

		endd5:
		RET
ClearBlueShooter ENDP

DrawLeftBullet  PROC 
	  mov cx,Xred
      add cx,40
	  mov XLeftB,cx	  
	  mov si,0 
	  mov dx,Yred
	  add dx,14
	  mov YLeftB,dx
loop6: 
	         
	         
      cmp statusleftB,1
	  jz drawst
	  
	  cmp statusleftB,0
	  jz drawup
	  
	  cmp statusleftB,2
	  jz drawdown
	  
	  drawst:
	  mov al,leftB[si]         ;Pixel color 
	  jmp cont6
  
      drawup:
	  mov al,leftBup[si]
	  jmp cont6
	  
	  drawdown:
	  mov al,leftBdown[si]
	  
  cont6:
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
	  inc cx
	  inc si
	  mov di,XLeftB
	  add di,7
	  cmp cx,di
	  jz nextrow6
	  cmp si,49     ; 7*7 pixels
	  jl loop6
	  jmp endd6
	  
	  nextrow6:
	  inc dx
	  mov cx,XLeftB 
	  jmp loop6

endd6:
		RET
DrawLeftBullet ENDP

DrawRightBullet  PROC 
	  
	  mov cx,Xblue
	  sub cx,7
	  mov XRightB,cx	  
	  mov si,0 
	  mov dx,Yblue
	  add dx,14
	  mov YRightB,dx
	  
loop10: 
	         
	         
      cmp statusrightB,1
	  jz drawst3
	  
	  cmp statusrightB,0
	  jz drawup3
	  
	  cmp statusrightB,2
	  jz drawdown3
	  
	  drawst3:
	  mov al,rightB[si]         ;Pixel color 
	  jmp cont10
  
      drawup3:
	  mov al,rightBup[si]
	  jmp cont10
	  
	  drawdown3:
	  mov al,rightBdown[si]
	  
  cont10:
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
	  inc cx
	  inc si
	  mov di,XRightB
	  add di,7
	  cmp cx,di
	  jz nextrow10
	  cmp si,49     ; 7*7 pixels
	  jle loop10
	  jmp endd10
	  
	  nextrow10:
	  inc dx
	  mov cx,XRightB 
	  jmp loop10
	  
endd10:
	  mov cx,XRightB
	  mov dx,YRightB
	  add dx,7
	  mov al,0
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
		RET
DrawRightBullet ENDP

MovingLeftBullet  PROC     ;;fn responsible for drawing the bullet when not attached to the shooter i.e. when it is shot already
	  mov cx,XLeftB	  
	  mov si,0 
	  mov dx,YLeftB
loop9:        
      cmp statusleftB,1
	  jz drawst1
	  
	  cmp statusleftB,0
	  jz drawup1
	  
	  cmp statusleftB,2
	  jz drawdown1
	  
	  drawst1:
	  mov al,leftB[si]         ;Pixel color 
	  jmp cont9
  
      drawup1:
	  mov al,leftBup[si]
	  jmp cont9
	  
	  drawdown1:
	  mov al,leftBdown[si]
	  
  cont9:
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
	  inc cx
	  inc si
	  mov di,XLeftB
	  add di,7
	  cmp cx,di
	  jz nextrow9
	  cmp si,49     ; 7*7 pixels
	  jl loop9
	  jmp endd9
	  
	  nextrow9:
	  inc dx
	  mov cx,XLeftB 
	  jmp loop9

endd9:

	  
		RET
MovingLeftBullet ENDP

MovingRightBullet  PROC 
	  mov cx,XRightB	  
	  mov si,0 
	  mov dx,YRightB
loop12:        
      cmp statusrightB,1
	  jz drawst4
	  
	  cmp statusrightB,0
	  jz drawup4
	  
	  cmp statusrightB,2
	  jz drawdown4
	  
	  drawst4:
	  mov al,rightB[si]         ;Pixel color 
	  jmp cont12
  
      drawup4:
	  mov al,rightBup[si]
	  jmp cont12
	  
	  drawdown4:
	  mov al,rightBdown[si]
	  
  cont12:
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
	  inc cx
	  inc si
	  mov di,XRightB
	  add di,7
	  cmp cx,di
	  jz nextrow12
	  cmp si,49     ; 7*7 pixels
	  jl loop12
	  jmp endd12
	  
	  nextrow12:
	  inc dx
	  mov cx,XRightB 
	  jmp loop12

endd12:
	  mov cx,XRightB
	  mov dx,YRightB
	  add dx,7
	  mov al,0
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
		RET
MovingRightBullet ENDP

ClearLeftBullet  PROC 
		mov cx,XLeftB      ;Column 
		mov dx,YLeftB        ;Row 

		mov di,cx
		add di,7

		mov si,dx
		add si,7

		loop7:      
		mov al,0         ;Pixel color 
		mov ah,0ch       ;Draw Pixel Command  
		mov bx,0
		int 10h 
		inc cx
		cmp cx,di
		jz nextrow7
		cmp dx,si
		jnz loop7

		jmp endd7

		nextrow7:
		inc dx
		mov cx,XLeftB
		jmp loop7

		endd7:
		RET
ClearLeftBullet ENDP

ClearRightBullet  PROC 
		mov cx,XRightB      ;Column 
		mov dx,YRightB        ;Row 

		mov di,cx
		add di,7

		mov si,dx
		add si,7

		loop11:      
		mov al,0         ;Pixel color 
		mov ah,0ch       ;Draw Pixel Command  
		mov bx,0
		int 10h 
		inc cx
		cmp cx,di
		jz nextrow11
		cmp dx,si
		jnz loop11

		jmp endd11

		nextrow11:
		inc dx
		mov cx,XRightB
		jmp loop11

		endd11:
		RET
ClearRightBullet ENDP

arrowxy proc                 ;; fn in main menu responsible for moving the ghost between the three options
		cmp axy,0
		jnz check4 
		mov Xghost,210
		mov Yghost,250
		call ClearGhost
		;CLEAR ghost
		mov Xghost,210
		mov Yghost,280
		call ClearGhost 
		;draw ghost
		mov Xghost,210
		mov Yghost,220
		mov colorghost,5 
		call DrawGhost
		mov line,0
		jmp endhere
		check4:
		cmp axy,1
		jnz check3 
		;clearing the other two ghosts 
		mov Xghost,210
		mov Yghost,220
		call ClearGhost
		;clear ghost2
		mov Xghost,210
		mov Yghost,280
		call ClearGhost
		;now draw
		mov Xghost,210
		mov Yghost,250
		mov colorghost,0ah 
		call DrawGhost
		mov line,1
		jmp endhere
		check3:
		mov ah,2
		mov bh,0
		mov dx,0E02H
		int 10h
		;CLEAR ghosts IN OTHER TWO LINES
		mov Xghost,210
		mov Yghost,220
		call ClearGhost
		;CLEAR ghost
		mov Xghost,210
		mov Yghost,250
		call ClearGhost 
		;DRAW ARROW IN LINE #0 
		;now draw
		mov Xghost,210
		mov Yghost,280
		mov colorghost,04h 
		call DrawGhost
		mov line,2  
		endhere:  
		RET 
arrowxy	endp 

Names proc

mov si,0
	  mov di,0
mov ah,2
	mov bx,0
	mov dx,0f15h
	int 10h    
			
	mov ah,9
	mov dx,offset first 
	mov bx,0
	int 21h 


RECEIVE:
	cmp RECEIVED,1
    jnz asyouare
	cmp isent,1
	jnz SEND
	jmp exit
	asyouare:
    MOV DX,3FDH
    IN AL,DX
    AND AL,1
    JZ SEND
    
    ;IF READY READ THE VALUE IN RECEIVE DATA REGISTER 
    MOV DX,03F8H 
    IN AL,DX
    MOV Partnername2[di], AL
	
	cmp Partnername2[di],13
	jz comehere
	inc di
	jmp RECEIVE
	comehere:
	mov RECEIVED,1
    	
	
    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
SEND:
   cmp isent,1
   jz RECEIVE
   
    MOV AH,1
    INT 16H
	JZ checknames
	jmp readkeynames
	checknames:
	cmp RECEIVED,1
	JZ SEND
    Jmp RECEIVE
   readkeynames:
   MOV UserName[si],AL   ;ENTERED
   
   MOV AH,0
   INT 16H ;CLEAR BUFFER
   
    mov ah,2 
	mov dx,1018h 
	int 10h
   
   MOV AH,9
   MOV Dx, offset UserName
   INT 21H 
   
   
   
   
   
   cmp UserName[si],13
   jz SendFe3lan
   inc si
   jmp SEND
   
   
 SendFe3lan:
 ;;;
 checkname1:
	cmp UserName[16],24h
	jnz wrong
	mov bl,UserName[0]
	cmp bl,7Ah
	ja wrong                 
	cmp bl,41h
	jb wrong 
	cmp bl,61h
	jbe proceed
	cmp bl,5Ah
	jae proceed

	wrong:
	mov ah,2
	mov bx,0
	mov dx,0f15h
	int 10h 
		   
	mov ah,9
	mov dx,offset errormessage 
	mov bx,0
	int 21h  

	mov ah,2 
	mov dx,1018h 
	int 10h

	mov ah,9
	mov dx,offset clearline 
	mov bx,0
	int 21h

	mov si,0
	refill:
	mov UserName[si],24h
	inc si
	cmp si,30
	jnz refill
    mov si,0
	jmp SEND

	proceed: 
	;;;
 mov si,0
 mov cx,30
loopSend: 
   MOV DX,3FDH
   AGAIN:
   IN AL, DX
   AND AL,00100000B     ;READ LINE STATUS
   JZ AGAIN
  
    
   ;IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
   MOV DX,3F8H
   MOV AL, UserName[si]
   OUT DX,AL
   cmp UserName[si],13
   jz cont35
   inc si
   loop loopSend
   cont35:
   mov isent,1 
   
   cmp RECEIVED,1
   jz exit2
   jmp RECEIVE
   
   
   exit2:
   mov redname,0
   
   
   exit:
   
  
	cmp redname,0
	jz youareblue
	
	jmp youarered
	
	youareblue:
	mov cx,30
	mov si,0
	loopNames:
	mov al,UserName[si]
	mov UserName2[si],al
	
	mov al,Partnername2[si]
	mov UserName1[si],al
	inc si
	loop loopNames
	
	
	
	jmp finishnames
	youarered:
	
	mov cx,30
	mov si,0
	loopNames2:
	mov al,UserName[si]
	mov UserName1[si],al
	
	mov al,Partnername2[si]
	mov UserName2[si],al
	inc si
	loop loopNames2
	
	
	
	
   
   finishnames:
   
    MOV AH,0
    MOV AL,12H
    INT 10H
	
	call DrawTitle
		mov Xghost,132
		 mov Yghost,182
		 mov colorghost,1  
		call DrawGhost
		
		mov Xghost,325
		 mov Yghost,150
		 mov colorghost,4 
		call DrawGhost
   
	mov ah,2
	mov bx,0
	mov dx,1115h
	int 10h    
			
	
	
	
	
	mov si,0
	typeblue:
	mov ah,9          
	mov al,Blueusername[si]
    mov bl,01h
    mov cx,1
    int 10h
    
    mov ah,2        ;increment coloumn position
	add dl,1
    mov bh,0
	int 10h
    
    inc si 
    cmp si,22
	jb typeblue	
	;;;;
	
	mov ah,2
	mov bx,0
	mov dx,0f15h
	int 10h 
	
	mov si,0
	typered:
	mov ah,9         
	mov al,Redusername[si]
    mov bl,04h
    mov cx,1
    int 10h
    
    mov ah,2        ;increment coloumn position
	add dl,1
    mov bh,0
	int 10h
    
    inc si 
    cmp si,21
	jb typered	
	
   mov ah,2 
	mov dx,1018h 
	int 10h
	
	MOV AH,9
    MOV Dx, offset UserName1
    INT 21H
	
	mov ah,2 
	mov dx,1218h 
	int 10h
	
	MOV AH,9
    MOV Dx, offset UserName2
    INT 21H
	
   mov ah,2
	mov bx,0
	mov dx,1a20h
	int 10h 
			
	mov ah,9
	mov dx,offset show  
	mov bx,0
	int 21h 


	
   
 exitnames:
   
	
	mov cx,2
		delayloop11: 
		push cx
		mov cx,0fh
		mov dx,4240h
		mov ah,86h
		int 15h
		pop cx
		loop delayloop11
	
	
	RET
Names endP

MoveGhosts proc
	

	lea di,[ghosts]
	; kol ghost bytrsm f path bl raqam bta3o 
	move:
	mov GhostID,0
	
	call setxyc
	call ClearGhost
	add xghost,1
	call borders
	
	
	
	cmp DeadFlag[0],1            ;; if the ghost is dead dont draw it
	jz gotoghost2
	
	
	call DrawGhost
	
	
	
	gotoghost2:
	
	
	call getxyc
	inc GhostID
	add di,5 	;next ghost info 
	call setxyc
	call ClearGhost
	
	sub xghost,1
	call borders
	
	cmp DeadFlag[1],1
	jz gotoghost3
	
	
	
	call DrawGhost
	
	
	gotoghost3:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 3 info 
	call setxyc
	call ClearGhost
	add xghost,2
	add yghost,2
	call borders
	
	cmp DeadFlag[2],1
	jz gotoghost4
	
	
	
	call DrawGhost
	
	
	 jmp n
	 move1:
	 jmp move
	n:
	
	gotoghost4:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 4 info 
	call setxyc
	call ClearGhost
	add xghost,4
	sub yghost,1
	call borders
	
	cmp DeadFlag[3],1
	jz gotoghost5
	
	
	
	call DrawGhost
	
	
	gotoghost5:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 5 info 
	call setxyc
	call ClearGhost
	sub xghost,2
	add yghost,1
	call borders
	
	cmp DeadFlag[4],1
	jz gotoghost6
	
	
	
	call DrawGhost
	
	
	gotoghost6:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 6 info 
	call setxyc
	call ClearGhost
	add xghost,2
	sub yghost,2
	call borders
	
	cmp DeadFlag[5],1
	jz stop
	
	
	
	call DrawGhost
	
	
	stop:
	call getxyc
	;call delay
	lea di,[ghosts]
	; jmp move1
	
	
	
	RET
MoveGhosts endP

borders proc near          ;;fn responsible for regenerating the ghosts and sending them out again in random positions whenever they hit a border
	push di
	
	cmp xghost,150
	jle do
	cmp xghost,490
	jge do
	cmp yghost,40
	jle do
	cmp yghost,320
	jge do 
	jmp noborder
	
	do:
	mov di,GhostID
	cmp DeadFlag[di],1
	jz toggle
	jmp cont18
	 
	
	
	toggle:
	mov DeadFlag[di],0
	
	
	cont18:
	cmp redname,1
	jnz noborder
	
	push ax
	push dx
	call assign 
	mov al,dl
	mov dh,20
	mul dh
	add ax,35
	mov yghost,ax
	call assign 
	mov al,dl
	mov dh,20
	mul dh
	add ax,150
	mov xghost,ax
	
	pop dx
	pop ax
	
	
	
	noborder:
	pop di
	ret
borders endp




delay proc 
	push cx
	push dx
	push ax
	mov cx,0ah
	mov dx,4240h
	mov ah,86h
	int 15h
	pop ax
	pop dx
	pop cx 
	ret
delay endp
			
setxyc proc           ;;moves certain coordinates in xghost and yghost to be drawn
	push bx
	mov bx,[di]
	mov xghost,bx
	add di,2
	mov bx,[di] 
	mov yghost,bx
	add di,2 
	mov bl,[di]
	mov colorghost,bl
	pop bx
	ret
setxyc endp

getxyc PROC               ;;updates the values of certain coordinates with the values of the xghost and yghost
	push bx
	mov bl,colorghost
	mov [di],bl
	sub di,2
	mov bx,yghost  
	mov [di],bx  
	sub di,2
	mov bx,xghost
	mov [di],bx
	pop bx 
	ret
getxyc endp

Assign proc near       ;;fn to get a random number from 0 to 15
   push ax
   push cx
	
   MOV AH,00h  ; interrupts to get system time        
   INT 1AH      ; CX:DX now hold number of clock ticks since midnight      
   
   mov  ax, dx
   xor  dx, dx
   mov  cx, 16    ;Divide by 16 and get remainder    
   div  cx       ; here dx contains the remainder of the division - from 0 to 15
   pop cx
   pop ax
   ret
Assign ENDP

CheckDeadRed Proc     ;;fn to check whether the red shooter has scored by checking the color of the pixels the bullet passes by
	push bx
	push di
	
	mov dx,YLeftB
	add dx,3
	
	mov cx,XLeftB
	add cx,7
	redo:
	mov bh,0
	mov AH,0Dh
	int 10h 
	mov ColourDead,al
	
		cmp al,0
		jnz cont19
		
		jmp endd15
		
		cont19: 
		cmp al,1
		jz updatescore
		
		cmp al,4
		jz updatescore1
		
		cmp al,6
		jz losescore
		
		cmp al,0ah
		jz incrementscore
		
		cmp al,0fh
		jz recheck
		
		cmp al,8
		jz recheck
		
		inc ScoreRed
		jmp endd14
		
		
		recheck:
		add dx,6
		jmp redo
		
		updatescore:
		cmp scoreBlue,1
		jle nodec
		dec ScoreBlue
		dec ScoreBlue
		nodec:
		jmp endd14
		
		updatescore1:
		inc ScoreRed
		inc ScoreRed
		jmp endd14
		
		incrementscore:
		add ScoreRed,5
		jmp endd14
		
		losescore:
		mov ScoreRed,0
		
		
	endd14:
	
		 
		call ClearLeftBullet               ;;redraw the bullet again in the hand of the red shooter
	    call DrawLeftBullet
		mov shootingred,0
		
		;Figure out which ghost is shot
		
		mov di,0
		check5:
		mov al,ghostsColour[di]
		cmp al,ColourDead
		jnz loopagain
		
		jmp updateghosts
		
		loopagain:
		
		inc di
		cmp di,6
		jb check5
		
		updateghosts:
		mov DeadFlag[di],1
					
		;Figure out which ghost is shot
		
		mov ah,2
		mov dh,01
		mov dl,22
		int 10h
	
		mov dl,scoreRed
		call ShowScore

		mov ah,2
		mov dh,01
		mov dl,58
		int 10h
		mov dl,scoreBlue
		call ShowScore
		
		
	
	endd15:
	
	pop di
	pop bx	
	RET
CheckDeadRed EndP




CheckDeadBlue Proc
	push bx
	push di
	
	mov dx,YRightB
	add dx,3
	
	mov cx,XRightB
	dec cx
	
	redo2:
	mov bh,0
	mov AH,0Dh
	int 10h 
	mov ColourDead2,al
	
		cmp al,0
		jnz cont20
		
		jmp endd17
		
		cont20:  
		
		cmp al,1
		jz updatescore2
		
		cmp al,4
		jz updatescore3
		
		cmp al,6
		jz losescore1
		
		cmp al,0ah
		jz incrementscore1
		
		cmp al,0fh
		jz recheck2
		
		cmp al,8
		jz recheck2
		
		inc ScoreBlue
		jmp endd16
		
		
		recheck2:
		add dx,6
		jmp redo2
		
		updatescore2:
		inc ScoreBlue
		inc ScoreBlue
		jmp endd16
		
		losescore1:
		mov ScoreBlue,0
		jmp endd16
		
		incrementscore1:
		add ScoreBlue,5
		jmp endd16
		
		updatescore3:
		cmp scoreRed,1
		jle notdec1
		dec ScoreRed
		dec ScoreRed
		notdec1:
		
		
	endd16:
	
		 
		call ClearRightBullet
	    call DrawRightBullet
		mov shootingblue,0
		
		;Figure out which ghost is shot

		mov di,0
		check6:
		mov al,ghostsColour[di]
		cmp al,ColourDead2
		jnz loopagain1
		
		jmp updateghosts1
		
		loopagain1:
		
		inc di
		cmp di,6
		jb check6
		
		updateghosts1:
		mov DeadFlag[di],1
		
		
		
		mov ah,2            ;;print updated score
		mov dh,01
		mov dl,22
		int 10h
		mov dl,scoreRed
		call ShowScore

		mov ah,2
		mov dh,01
		mov dl,58
		int 10h
		mov dl,scoreBlue
		call ShowScore
		
		endd17:
		
		
	pop di
	pop bx	
	RET
CheckDeadBlue EndP

DrawBomb Proc
 push di 
	  push bx

 mov cx,Xghost 
	  mov si,0 
	  mov dx,Yghost ; draw square 19x19 
loop14: 
	               
	  mov al,bomb[si]         ;Pixel color 
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
	  inc cx
	  inc si
	  mov di,Xghost
	  add di,19
	  cmp cx,di
	  jz nextrow13
	  cmp si,361     ; 19*19 pixels
	  jle loop14
	  jmp endd18
	  
	  nextrow13:
	  inc dx
	  mov cx,Xghost
	  jmp loop14

endd18:
 mov cx,Xghost  
	  mov dx,Yghost
	  add dx,19
	  mov al,0
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
	  
pop bx
	pop di
RET
DrawBomb ENDP

DrawHeart Proc
 push di 
	  push bx

 mov cx,Xghost 
	  mov si,0 
	  mov dx,Yghost ; draw square 19x19 
loop16: 
	               
	  mov al,heart[si]         ;Pixel color 
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
	  inc cx
	  inc si
	  mov di,Xghost
	  add di,19
	  cmp cx,di
	  jz nextrow14
	  cmp si,361     ; 19*19 pixels
	  jle loop16
	  jmp endd21
	  
	  nextrow14:
	  inc dx
	  mov cx,Xghost
	  jmp loop16

endd21:
 mov cx,Xghost  
	  mov dx,Yghost
	  add dx,19
	  mov al,0
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
	  
pop bx
	pop di
RET
DrawHeart ENDP


MoveGhosts2 proc
	

	lea di,[ghosts]
	; kol ghost bytrsm f path bl raqam bta3o 
	move2:
	mov GhostID,0
	
	call setxyc
	call ClearGhost
	add xghost,4
	call borders
	
	
	
	cmp DeadFlag[0],1            ;; if the ghost is dead dont draw it
	jz gotoghost22
	
	
	call DrawGhost
	
	
	
	gotoghost22:
	
	
	call getxyc
	inc GhostID
	add di,5 	;next ghost info 
	call setxyc
	call ClearGhost
	
	sub xghost,4
	call borders
	
	cmp DeadFlag[1],1
	jz gotoghost33
	
	
	
	call DrawGhost
	
	
	gotoghost33:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 3 info 
	call setxyc
	call ClearGhost
	add xghost,4
	add yghost,4
	call borders
	
	cmp DeadFlag[2],1
	jz gotoghost44
	
	
	
	call DrawGhost
	
	
	 ; jmp n1
	 ; move1:
	 ; jmp move2
	; n1:
	
	gotoghost44:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 4 info 
	call setxyc
	call ClearGhost
	add xghost,4
	sub yghost,2
	call borders
	
	cmp DeadFlag[3],1
	jz gotoghost55
	
	
	
	call DrawGhost
	
	
	gotoghost55:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 5 info 
	call setxyc
	call ClearGhost
	sub xghost,4
	add yghost,2
	call borders
	
	cmp DeadFlag[4],1
	jz gotoghost66
	
	
	
	call DrawGhost
	
	
	gotoghost66:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 6 info 
	call setxyc
	call ClearGhost
	add xghost,4
	sub yghost,4
	call borders
	
	cmp DeadFlag[5],1
	jz gotobomb1
	
	
	
	call DrawGhost
	
	
	gotobomb1:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 6 info 
	call setxyc
	call ClearGhost
	add xghost,2
	call borders
	
	
	call DrawBomb
	
	gotobomb2:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 6 info 
	call setxyc
	call ClearGhost
	sub xghost,2
	call borders
	
	call DrawHeart
	   
	stop1:
	call getxyc
	;call delay
	lea di,[ghosts]
	; jmp move1
	
	
	
	RET
MoveGhosts2 endP

Levelscreen proc
		 mov line,0
		 mov axy,0
		 mov ax,0600h     ;clear screen
		 mov bh,0
		 mov cx,0
		 mov dx,1d4fh
		 int 10h

	  
		 mov Xghost,210
		 mov Yghost,220
		 mov colorghost,5 
		 
		call DrawGhost
		; show message on appropriate coordinates 
		mov ah,2
		mov dh,14
		mov dl,30
		int 10h 

		mov ah,9
		mov dx,offset chooselevel
		int 21h

		mov ah,2
		mov dh,16
		mov dl,30         
		int 10h 

		mov ah,9
		mov dx,offset levelmsg1
		int 21h  

		mov ah,2
		mov dh,18
		mov dl,30
		int 10h 

		mov ah,9
		mov dx,offset levelmsg2
		int 21h

		; get button click
		checkbutton1:
		mov ah,0        
		int 16h 
		cmp ah,80
		jnz up1
		cmp axy,2
		jz notdown1
		inc axy 
		call arrowxy  
		notdown1:
		mov ah,00
		jmp checkbutton1 
		up1:
		cmp ah,72
		jnz checkEnter1
		cmp axy,0
		jz dontup1 
		dec axy
		call arrowxy 
		dontup1:
		mov ah,00
		jmp checkbutton1 

		checkEnter1:
		cmp al,13
		jnz checkbutton1
		cmp line,0  ; m5tar esm el screen aslan so do nothing 
		jz checkbutton1
		cmp line,1
		jz level1  	;e5tar level1
		cmp line,2 
		jz level2
		level1: 
		mov level,1
		jmp enddd11
		level2:
		mov level,2
		enddd11:
		RET
Levelscreen endp

SetInvitations PROC
 mov cx,0         ;Column 
	  mov dx,384        ;Row  
	  loop15:
	         
	  mov al,5         ;Pixel color 
	  mov ah,0ch       ;Draw Pixel Command    
	  int 10h 
	  inc cx
	  cmp cx,640    ;640+640   to draw two lines
	  jnz loop15


mov isent,0
mov RECEIVED,0

cmp MyInvitation,4
jz checkhisinvitation

cmp MyInvitation,0
jz printMCI

jmp printMGI

checkhisinvitation:
cmp HisInvitation,4
jnz cont56
jmp RECEIVEmenu
cont56:
cmp HisInvitation,0
jz printHCI

jmp printHGI

printMGI:
 mov ah,2
	mov bx,0
	mov dl,0
	mov dh,MGI
	int 10h 
		   
	mov ah,9
	mov dx,offset MyGameInv 
	mov bx,0
	int 21h
	jmp checkhisinvitation

printMCI:
 mov ah,2
	mov bx,0
	mov dl,0
	mov dh,MCI
	int 10h 
		   
	mov ah,9
	mov dx,offset MyChatInv 
	mov bx,0
	int 21h  
	jmp checkhisinvitation

printHGI:	
mov ah,2
	mov bx,0
	mov dl,0
	mov dh,HGI
	int 10h 
	
    mov ah,9
	mov dx, offset Partnername2	
	mov bx,0
	int 21h	
	
	mov ah,2
	mov bx,0
	mov dl,15
	mov dh,HGI
	int 10h
	
	mov ah,9
	mov dx, offset HisGameInv	
	mov bx,0
	int 21h
	jmp RECEIVEmenu
	
printHCI:
mov ah,2
	mov bx,0
	mov dl,0
	mov dh,HCI
	int 10h 
		   
	mov ah,9
	mov dx, offset Partnername2	
	mov bx,0
	int 21h	
	
	mov ah,2
	mov bx,0
	mov dl,15
	mov dh,HCI
	int 10h	   
		   
	mov ah,9
	mov dx,offset HisChatInv	
	mov bx,0
	int 21h

RECEIVEmenu:
	cmp RECEIVED,1
	jnz cont23
	jmp SENDmenu

cont23:	
    MOV DX,3FDH
    IN AL,DX
    AND AL,1
    JNZ cont22
   ;; maba3tsh check hwa sent wala la2
	cmp isent,1
	jz RECEIVEmenu
	
	jmp SENDmenu
	
	cont22:
   ;;IF READY READ THE VALUE IN RECEIVE DATA REGISTER 
    MOV DX,03F8H 
    IN AL,DX
    MOV MyReceived, AL
	mov RECEIVED,1
	
	cmp MyReceived,2
	jnz cont32
	call endGame
	cont32:
	
	cmp MyInvitation,4
	jz  cont28
	jmp CheckAcceptance1st
	cont28:
	mov al,MyReceived
	mov HisInvitation,al
	cmp al,0
	jz printrecchat
	mov ah,2
	mov bx,0
	mov dl,0
	mov dh,HGI
	int 10h 
	
    mov ah,9
	mov dx, offset Partnername2	
	mov bx,0
	int 21h	
	
	mov ah,2
	mov bx,0
	mov dl,15
	mov dh,HGI
	int 10h
	
	mov ah,9
	mov dx, offset HisGameInv	
	mov bx,0
	int 21h
	
	jmp cont29
	printrecchat:
	mov ah,2
	mov bx,0
	mov dl,0
	mov dh,HCI
	int 10h 
		   
	mov ah,9
	mov dx, offset Partnername2	
	mov bx,0
	int 21h	
	
	mov ah,2
	mov bx,0
	mov dl,15
	mov dh,HCI
	int 10h	   
		   
	mov ah,9
	mov dx,offset HisChatInv	
	mov bx,0
	int 21h
	cont29:
	
	
	SENDmenu:
   
    call MainMenu
	
	
	cmp MenuClicked,3
    JNZ cont34
	
	jmp RECEIVEmenu
	
	cont34:
	mov al,MenuClicked
	MOV MySent,AL;ENTERED
	
  
   
   
   MOV DX,3FDH
   AGAINmenu:
   IN AL, DX
   AND AL,00100000B     ;READ LINE STATUS
   JZ AGAINmenu
   
    
  ;; IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
   MOV DX,3F8H
   MOV AL, MySent
   OUT DX,AL
   
  cmp MySent,2
	jnz cont33
	call endGame
	cont33:
   cmp HisInvitation,4
   jz cont30
   
  jmp CheckAcceptance2nd
	cont30:
   mov MyInvitation,al
   cmp al,0
   jz printchatinv
   ;;printgameinvit
    mov ah,2
	mov bx,0
	mov dl,0
	mov dh,MGI
	int 10h 
		   
	mov ah,9
	mov dx,offset MyGameInv 
	mov bx,0
	int 21h  
   mov isent,1
   
  jmp cont27
  printchatinv:
    mov ah,2
	mov bx,0
	mov dl,0
	mov dh,MCI
	int 10h 
		   
	mov ah,9
	mov dx,offset MyChatInv 
	mov bx,0
	int 21h  
   mov isent,1
   cont27:

   JMP Receivemenu
  
CheckAcceptance1st:

mov al,MyInvitation
cmp MyReceived,al
jz cont24
mov isent,0
mov RECEIVED,0
jmp cont28

jmp SENDmenu
;;law msh equal---> call notifications
cont24:
mov FirstPlayer,1
mov ToDo,al
mov MyInvitation,4
jmp return111


CheckAcceptance2nd:
mov al,MySent
cmp HisInvitation,al
jz cont25
mov isent,0
mov RECEIVED,0

jmp cont30
cont25:
mov FirstPlayer,0
mov ToDo,al
mov HisInvitation,4
jmp return111

  
return111:
RET
SetInvitations ENDP

MainMenu PROC


		; get button click
		checkbutton:
		mov ah,1        
		int 16h 
		jnz cont26
		jmp notclickedreturn
		cont26:
		cmp ah,80
		jnz up 
		cmp axy,2
		jz notdown
		inc axy 
		call arrowxy  
		notdown:
		mov ah,00
		mov ah,0
		int 16h
		jmp notclickedreturn
		up:
		cmp ah,72
		jnz checkEnter
		cmp axy,0
		jz dontup 
		dec axy
		call arrowxy 
		dontup:
		mov ah,00
		mov ah,0
		int 16h
		jmp notclickedreturn 

		checkEnter:
		mov ah,0
		int 16h
		
		cmp al,13
		jnz notclickedreturn
		
	
		cmp line,0
		jz checkchat
		cmp line,1
		jz checkstart
		cmp line,2 
		jz checkexit
		checkchat:
		mov MenuClicked,0

		jmp Returnmenu
		
		checkExit:
		mov MenuClicked,2
		jmp returnmenu
		; show exitting message 
		

		checkstart: 
		mov MenuClicked,1
		jmp Returnmenu
		
		
		
		notclickedreturn:
		 mov MenuClicked,3
		 
returnmenu:

RET 
MainMenu ENDP

;GETKEY PRESSED
;__________________________________________________________
GETKEY PROC	NEAR 
	MOV AH,1
	INT 16H
	JZ IGN_JMP
	;GET KEY PRESSED 
	MOV AH,0
	INT 16H
	MOV CHATKEYP1,AL
	
	;CHECK IF KEY IS ESCAPECHAT
	CMP AH,01
	JNE CMPENTER
	MOV ESCAPECHAT,1
	MOV CHATKEYP1,AH
	JMP IN_SEND
	;CHECK IF KEY PRESSED IS ENTER
CMPENTER:
	CMP AH,1CH
	JNE	CMPBACK
	MOV CHATKEYP1,AH
	ADD CHATROWP1,1
	CMP IS_INLINE,1
	JE INLINES1
	SCROLLP1	;CHECK IF SCREEN NEEDS SCROLLING
	MOV CHATCOLP1,0
	JMP IN_SEND
INLINES1:
	INSCROLLP1
	MOV CHATCOLP1,0
	JMP IN_SEND
	
	IGN_JMP:JMP END_SENDIN	;AVOIDIND JMP OUT OF RANGE
	;CHECK IF IT'S BACKSPACE
CMPBACK:
	CMP AH,0EH
	JNE CONT1
	MOV CHATKEYP1,AH
	CMP CHATCOLP1,0
	JNE BACK3ADE
	MOV CHATCOLP1,79
	DEC CHATROWP1
	JMP EMSA7
BACK3ADE:
	DEC CHATCOLP1
EMSA7:
	SCURSOR	CHATROWP1,CHATCOLP1
	DISPCHAR 20H,00
	JMP IN_SEND


CONT1:
	SCURSOR CHATROWP1,CHATCOLP1	;INTIALLY SETTING CURSOR
	DISPCHAR CHATKEYP1,WHITECOLOR	
	
	;CHECK END COL
		
		
		CMP CHATCOLP1,79
		JB NOTENDU1
	;CHECL END OF ROWS
		INC CHATROWP1
		MOV CHATCOLP1,0
		JMP ENDCOL

NOTENDU1:INC CHATCOLP1	;INCRMENETING FOR NEXT PLACE
ENDCOL:;CHECKING IF SCREEN NEEDS SCROLLING
		CMP IS_INLINE,1
		JE INLINECHAT
		SCROLLP1
		JMP IN_SEND
		
INLINECHAT: INSCROLLP1
IN_SEND:	CALL SENDVAL
END_SENDIN:
		RET
GETKEY	ENDP

;__________________________________________________________
;SEND VALUE
SENDVAL PROC NEAR
	MOV DX,3FDH
SENDL:	IN AL,DX
		TEST AL,20H
		JZ SENDL
		
		MOV DX,3F8H
		MOV AL,CHATKEYP1
		OUT DX,AL
	
	RET
SENDVAL ENDP 

;__________________________________________________________
;RECEIVE VALUE
;__________________________________________________________
;RECEIVE VALUE
RECVAL	PROC	NEAR 
		
		MOV DX,3FDH
RECL:	IN AL,DX
		AND AL,1
		JZ VRRR
		
		MOV DX,03F8H
		IN AL,DX
		MOV CHATKEYP2,AL
		
		;CHECK IF IT'S ESCAPECHAT
		CMP CHATKEYP2,01
		JNE CHECKRECENTER
		MOV ESCAPECHAT,1
		JMP NOREC
		
		;CHECK IF KEY IS ENTER
CHECKRECENTER:
		CMP CHATKEYP2,1CH
		JNE CHECKBACK2
		ADD CHATROWP2,1
		MOV CHATCOLP2,0
		CMP IS_INLINE,1
		JE INLINECHAT2
		SCROLLP2
		JMP NOREC
VRRR:	JMP NOREC	;TO AVOID JMP OUT OF RANGE
INLINECHAT2:
		INSCROLLP2
		JMP NOREC

CHECKBACK2:		
		CMP CHATKEYP2,0EH
		JNE RECCONT
		CMP CHATCOLP2,0	;CHECK IF END OF COL
		JNE BACK3ADE2
		MOV CHATCOLP2,79
		DEC CHATROWP2
		JMP EMSA72
BACK3ADE2:
		DEC CHATCOLP2
EMSA72:	SCURSOR CHATROWP2,CHATCOLP2
		CMP IS_INLINE,1
		JE EMSA7INLINE
		DISPCHAR 20H,GREYCOLOR
		JMP NOREC
EMSA7INLINE:
		DISPCHAR 20H,00
		JMP NOREC
		

RECCONT:		
		;PRINT IF VALUE IS RECEIVED
		SCURSOR CHATROWP2,CHATCOLP2	;INTIALLY SETTING CURSOR
		DISPCHAR CHATKEYP2,YELLOWCOLOR	

		;CHECK END COL
		CMP CHATCOLP2,79
		JNE NOTENDU2
	;CHECL END OF ROWS
		INC CHATROWP2
		MOV CHATCOLP2,0
		JMP ENDCHATCOLP2
NOTENDU2:INC CHATCOLP2
ENDCHATCOLP2:;CHECKING IF SCREEN NEEDS SCROLLING
		CMP IS_INLINE,1
		JE INLINESCROLL
		SCROLLP2
		JMP NOREC
INLINESCROLL:
		INSCROLLP2
		
NOREC:
		RET
RECVAL ENDP
 

;__________________________________________________________

INTIALPORT PROC NEAR
	MOV DX,3FBH
	MOV AL,10000000B
	OUT DX,AL
	
	;LSB OF BAUD RATE
	MOV DX,3F8H
	MOV AL,0CH
	OUT DX,AL
	
	;MSB 
	MOV DX,3F9H
	MOV AL,00H
	OUT DX,AL
	
	;PORT
	MOV DX,3FBH
	MOV AL,00011011B
	OUT DX,AL
	RET
INTIALPORT	ENDP
;__________________________________________________________

SPLITS	PROC NEAR
	;CLEARING
	MOV AX,0600H
	MOV CX,0
	MOV BH,07
	MOV DX,184FH
	INT 10H
	
	;SPLITTING SCREEN
	MOV AX,0B800H
	MOV ES,AX
	
	;INTIALIZING 
	MOV BX,STARTGREY
	
GREYLOOP:
	MOV BYTE PTR ES:[BX],20H	;SPACE CHAR
	MOV BYTE PTR ES:[BX+1],125
	ADD BX,2
	CMP BX,4000
	JNZ GREYLOOP
	
	RET 
SPLITS ENDP
;__________________________________________________________ 

STARTINLINECHAT	PROC
    
       
 cmp keypressed,1
 jnz cont55
 mov ah,0
 int 16h
 mov keypressed,0
 cont55:
 
 
;int 10h
		;INTIALIZING ROWS AND COLUMNS OF EACH PLAYER 
		MOV CHATROWP1,17H
		MOV CHATCOLP1,0
		MOV	CHATROWP2,1AH
		MOV CHATCOLP2,0
		
		;SWITCH TO VIDEO MODE (NOT NEEDED IN GAME)
		
		CALL PRINTNAMES
		
INLINECHATLOOP:
		CALL GETKEY
		CALL RECVAL
		CMP BYTE PTR ESCAPECHAT,1
		JNE INLINECHATLOOP
		
		 ; MOV AX,0600H
	; MOV Cl,0
	; MOV ch,23
	; MOV BH,0
	; MOV Dl,79
	; MOV Dh,29
	; INT 10H
	
		
		RET
STARTINLINECHAT	ENDP

;__________________________________________________________
PRINTNAMES PROC
	CMP REDNAME,1
	JNE NOTREDPLAYER
	MOV BX,OFFSET UserName1
	JMP INTITNAME1
NOTREDPLAYER:
	MOV BX,OFFSET UserName2
INTITNAME1:
PRINTNAME1:
SCURSOR CHATROWP1,CHATCOLP1
	 mov ah,9
	 mov dx,bx
	 int 21h
	 add CHATCOLP1,16
	 SCURSOR CHATROWP1,CHATCOLP1
	 mov ah,2
	 mov dl,03
	 int 21h
	 inc CHATCOLP1
	 SCURSOR CHATROWP1,CHATCOLP1
	 mov ah,2
	 mov dl,3AH
	 int 21h
	 inc CHATROWP1
	 mov CHATCOLP1,0
	 SCURSOR CHATROWP1,CHATCOLP1
	
	;DISPLAYING SECOND PLAYER
	CMP REDNAME,1
	JNE NOTREDPLAYER2
	MOV BX,OFFSET username2
	JMP INTITNAME2
NOTREDPLAYER2:
	MOV BX,OFFSET username1 
	;mov bx,offset Partnername2
 INTITNAME2:	
	
 PRINTNAME2:
	 SCURSOR CHATROWP2,CHATCOLP2
	 mov ah,9
	 mov dx,bx
	 int 21h
	 add CHATCOLP2,16
	 SCURSOR CHATROWP2,CHATCOLP2
	 mov ah,2
	 mov dl,03
	 int 21h
	 inc CHATCOLP2
	 SCURSOR CHATROWP2,CHATCOLP2
	 mov ah,2
	 mov dl,3AH
	 int 21h
	 inc CHATROWP2
	 mov CHATCOLP2,0
	 SCURSOR CHATROWP2,CHATCOLP2
	RET
PRINTNAMES	ENDP

Chatproc Proc
		mov ah,0
		mov al,3
		int 10h
 
		CALL SPLITS
		mov CHATCOLP1,0
		MOV CHATROWP1,0
		MOV CHATCOLP2,0
		MOV CHATROWP2,12
		;printing name for two players
		CALL PRINTNAMES
		
	LOOPCHAT:	
			CALL GETKEY
			CALL RECVAL
			CMP BYTE PTR ESCAPECHAT,1
			JNE LOOPCHAT
			mov ah,0       ;set video mode
	        mov al,12h 
	        int 10h
			mov ESCAPECHAT,0
			RET
			
Chatproc endp		
;__________________________________________________________ 
sendarray proc
mov dx , 3FDH
   cofirmreceiving1:
		IN AL,DX
		AND AL,1
	jz cofirmreceiving1

	MOV DX,03F8H 
	IN AL,DX
	MOV confirm, AL
	
	; cmp confirm,31h
	; jnz sendarray
 
mov si,0
mov cx,40
arraysending: 
   MOV DX,3FDH
   AGAINSA:        ;try again to check if i can send array
   IN AL, DX
   AND AL,00100000B     ;READ LINE STATUS
   JZ AGAINSA
  
    ; mov ah,2
		; mov bh,0
		; mov dl,0
		; mov dh,28
		; int 10h 
		
		; mov dl,cl
		; mov ah,2
		; int 21h 
		
   ;IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
   MOV DX,3F8H
   MOV AL,ghosts[si]
   OUT DX,AL
   inc si
   loop  arraysending
   
    ; mov cx,40
		  ; mov si,0
		   ; cont52:	      
		 
		  ; mov ah,2
	      ; mov bx,0
	     ; mov dl,cl
		 ; mov dh,23
	     ; int 10h    
			
	; mov ah,2
	; mov dl,ghosts[si] 
	; mov bx,0
	; int 21h 
	; inc si
	; loop cont52

   
   mov dx , 3FDH
   cofirmreceiving:
		IN AL,DX
		AND AL,1
	jz cofirmreceiving

	MOV DX,03F8H 
	IN AL,DX
	MOV confirm, AL
	
; mov ah,2
		; mov bh,0
		; mov dl,0
		; mov dh,25
		; int 10h 
		
		; mov dl,confirm
		; mov ah,2
		; int 21h 

	

   
   ret
sendarray endp
 
RecieveArray proc
mov confirm,31h
		
		   MOV DX,3FDH
		   AGAINSAAA:        ;try again to check if i can send array
		   IN AL, DX
		   AND AL,00100000B     ;READ LINE STATUS
		   JZ AGAINSAAA
		  
			
		   ;IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
		   MOV DX,3F8H
		   MOV AL, confirm
		   OUT DX,AL


	MOV DI,0
	mov cx,40
	arrayrecieving:
	MOV DX,3FDH
	checkready:
	
	
		 
		IN AL,DX
		AND AL,1
	jz checkready

	 MOV DX,03F8H 
		IN AL,DX
		MOV ghostsRecieved[di], AL
		inc di 
		
		loop arrayrecieving
		
		
		  ; mov cx,40
		  ; mov si,0
		   ; cont53:	      
		 
		  ; mov ah,2
	      ; mov bx,0
	     ; mov dl,cl
		 ; mov dh,23
	     ; int 10h    
			
	; mov ah,2
	; mov dl,ghostsRecieved[si] 
	; mov bx,0
	; int 21h 
	; inc si
	; loop cont53
		
		mov confirm,31h
		confirmsending: 
		   MOV DX,3FDH
		   AGAINSAA:        ;try again to check if i can send array
		   IN AL, DX
		   AND AL,00100000B     ;READ LINE STATUS
		   JZ AGAINSAA
		  
			
		  ; IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
		   MOV DX,3F8H
		   MOV AL, confirm
		   OUT DX,AL
		   
		; mov ah,2
		; mov bh,0
		; mov dl,0
		; mov dh,26
		; int 10h 

		; mov dl,confirm
		; mov ah,2
		; int 21h 
   
		
	RET
RecieveArray endp 
 
SandRArray proc			;	the red player will be resposible for always sending positions of ghotst
		cmp redname,1
		jz sa ;sendarray
		jmp ra ;RecieveArray
		sa:
		call sendarray
		jmp endsandr
		ra:
		call RecieveArray
		endsandr:
		RET
SandRArray endp

whichmove proc 
		cmp level,1
		jnz mshlevel1
		;ifi Got here  it means i am in level 1 
		cmp redname,1
		jz saa ;ana elred player so i will choose drawghost el3adia
		jmp raa
		saa:
		call MoveGhosts
		Jmp END22
		raa:
		CALL MoveGhostsR
		JMP END22
		mshlevel1: 		;hyna2i mabeen moveghosts2 w moveghosts2R 3ala 7asab ana ani player
		cmp redname,1
		jz saa1 ;ana elred player so i will choose drawghost el3adia
		jmp raa1
		saa1:
		call MoveGhosts2
		Jmp END22
		raa1:
		CALL MoveGhosts2R
END22:
ret
whichmove endp




MoveGhostsR proc
	lea di,[ghosts]
	lea bx,ghostsRecieved
	
	; kol ghost bytrsm f path bl raqam bta3o 
	;move:
	mov GhostID,0
	
	call setxyc
	call ClearGhost
	;add xghost,1
	call SetFromArray
	call borders
	
	  
	
	
	
	cmp DeadFlagR[0],1            ;; if the ghost is dead dont draw it
	jz gotoghost2R
	
	
	; push bx
	    ; mov ah,2
		; mov bh,0
		; mov dl,GhostID
		; mov dh,29
		; int 10h 

		; mov dl,xghost
		; mov ah,2
		; int 21h
		
		; mov ah,2
		; mov bh,0
		; mov dl,1
		; mov dh,29
		; int 10h 

		; mov dl,yghost
		; mov ah,2
		; int 21h
     ; pop bx		
	call DrawGhost
	
	
	
	gotoghost2R:
	
	
	call getxyc
	inc GhostID
	add di,5 	;next ghost info 
	call setxyc
	call ClearGhost
	
	;sub xghost,1
	call SetFromArray
	call borders
	
	 
	
	cmp DeadFlagR[1],1
	jz gotoghost3R
	
	
	
	call DrawGhost
	
	
	gotoghost3R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 3 info 
	call setxyc
	call ClearGhost
	;add xghost,2
	;add yghost,2
	call SetFromArray
	call borders
	
	 
	
	
	cmp DeadFlagR[2],1
	jz gotoghost4R
	
	
	
	call DrawGhost
	
	
	 ;jmp n
	 ;move1:
	 ;jmp move
	;n:
	
	gotoghost4R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 4 info 
	call setxyc
	call ClearGhost
	
	 
	
	;add xghost,4
	;sub yghost,1
	call SetFromArray
	call borders
	
	cmp DeadFlagR[3],1
	jz gotoghost5R
	
	
	
	call DrawGhost
	
	
	gotoghost5R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 5 info 
	call setxyc
	call ClearGhost
	
	 
	
	;sub xghost,2
	;add yghost,1
	call SetFromArray
	call borders
	
	cmp DeadFlagR[4],1
	jz gotoghost6R
	
	
	
	call DrawGhost
	
	
	gotoghost6R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 6 info 
	call setxyc
	call ClearGhost
	
	 
	;add xghost,2
	;sub yghost,2
	call SetFromArray
	call borders
	
	cmp DeadFlagR[5],1
	jz stopR
	
	
	
	call DrawGhost
	
	
	stopR:
	call getxyc
	;call delay
	lea di,[ghosts]
	; jmp move1
	RET
MoveGhostsR endP

MoveGhosts2R proc
	lea di,[ghosts]
	lea bx,[ghostsRecieved]
	; kol ghost bytrsm f path bl raqam bta3o 
	;move2:
	mov GhostID,0
	
	call setxyc
	call ClearGhost
	;add xghost,4
	call SetFromArray
	call borders
	
	
	
	cmp DeadFlagR[0],1            ;; if the ghost is dead dont draw it
	jz gotoghost22R
	
	
	call DrawGhost
	
	
	
	gotoghost22R:
	
	
	call getxyc
	inc GhostID
	add di,5 	;next ghost info 
	call setxyc
	call ClearGhost
	
	;sub xghost,4
	call SetFromArray
	call borders
	
	cmp DeadFlagR[1],1
	jz gotoghost33R
	
	
	
	call DrawGhost
	
	
	gotoghost33R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 3 info 
	call setxyc
	call ClearGhost
	;add xghost,4
	;add yghost,4
	call SetFromArray
	call borders
	
	cmp DeadFlagR[2],1
	jz gotoghost44R
	
	
	
	call DrawGhost
	
	
	 ; jmp n1
	 ; move1:
	 ; jmp move2
	; n1:
	
	gotoghost44R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 4 info 
	call setxyc
	call ClearGhost
	;add xghost,4
	;sub yghost,2
	call SetFromArray
	call borders
	
	cmp DeadFlagR[3],1
	jz gotoghost55R
	
	
	
	call DrawGhost
	
	
	gotoghost55R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 5 info 
	call setxyc
	call ClearGhost
	;sub xghost,4
	;add yghost,2
	call SetFromArray
	call borders
	
	cmp DeadFlagR[4],1
	jz gotoghost66R
	
	
	
	call DrawGhost
	
	
	gotoghost66R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 6 info 
	call setxyc
	call ClearGhost
	;add xghost,4
	;sub yghost,4
	call SetFromArray
	call borders
	
	cmp DeadFlagR[5],1
	; jz gotobomb1R
	jz gotobomb1R
	
	
	
	call DrawGhost
	
	
	gotobomb1R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 6 info 
	call setxyc
	call ClearGhost
	;add xghost,2
	call SetFromArray
	call borders
	
	
	call DrawBomb
	
	gotobomb2R:
	call getxyc
	inc GhostID
	add di,5 ; go to ghost 6 info 
	call setxyc
	call ClearGhost
	;sub xghost,2
	call SetFromArray
	call borders
	
	call DrawHeart
	   
	stop1R:
	call getxyc
	;call delay
	;lea di,[ghosts]
	; jmp move1
	
	
	
	RET
MoveGhosts2R endP

SetFromArray Proc near
push ax
mov ax,[bx]
mov xghost,ax
add bx,2
mov ax,[bx]
mov yghost,ax
add bx,2
mov al,[bx]
mov colorghost,al
inc bx 
pop ax
Ret 
SetFromArray ENDP
sendflag proc
mov dx , 3FDH
   cofirmreceiving1f:
		IN AL,DX
		AND AL,1
	jz cofirmreceiving1f

	MOV DX,03F8H 
	IN AL,DX
	MOV confirm, AL
	
	; cmp confirm,31h
	; jnz sendarray
 
mov si,0
mov cx,6
flagsending: 
   MOV DX,3FDH
   AGAINSf:        ;try again to check if i can send array
   IN AL, DX
   AND AL,00100000B     ;READ LINE STATUS
   JZ AGAINSf
  	
   ;IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
   MOV DX,3F8H
   MOV AL,DeadFlag[si]
   OUT DX,AL
   inc si
   loop  flagsending
   
   ;;SEND SCORES 
   MOV DX,3FDH
   AGAINSf1:
   IN AL, DX
   AND AL,00100000B     ;READ LINE STATUS
   JZ AGAINSf1
  	
   ;IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
   MOV DX,3F8H
   MOV AL,ScoreBlue
   OUT DX,AL
   
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;now send score of Red
	MOV DX,3FDH   
   AGAINSf2:
   IN AL, DX
   AND AL,00100000B     ;READ LINE STATUS
   JZ AGAINSf2
  	
  ; IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
   MOV DX,3F8H
   MOV AL,ScoreRed
   OUT DX,AL
   
   
   
   mov dx , 3FDH
   cofirmreceivingF:
		IN AL,DX
		AND AL,1
	jz cofirmreceivingF

	MOV DX,03F8H 
	IN AL,DX
	MOV confirm, AL
	
		; mov ah,2
		; mov bh,0
		; mov dl,2
		; mov dh,28
		; int 10h 
		
		; mov dl,scoreBlue
		; mov ah,2
		; int 21h 
		
		; mov ah,2
		; mov bh,0
		; mov dl,2
		; mov dh,29
		; int 10h 
		
		; mov dl,scoreRed
		; mov ah,2
		; int 21h 
		
   ret
sendflag endp
 
RecieveFlag proc
mov confirm,31h
		
		   MOV DX,3FDH
		   AGAINSAAAF:        ;try again to check if i can send array
		   IN AL, DX
		   AND AL,00100000B     ;READ LINE STATUS
		   JZ AGAINSAAAF
		  
			
		   ;IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
		   MOV DX,3F8H
		   MOV AL, confirm
		   OUT DX,AL


	MOV DI,0
	mov cx,6
	flagrecieving:
	MOV DX,3FDH
	checkreadyf:
	
	
		 
		IN AL,DX
		AND AL,1
	jz checkreadyf

	 MOV DX,03F8H 
		IN AL,DX
		MOV DeadFlagR[di], AL
		inc di 
		
		loop flagrecieving
		
		;;;;;;;;;;;;;;Now send scoreee 
	 MOV DX,3FDH
	 checkreadys:
		IN AL,DX
		AND AL,1
	jz checkreadys

	 MOV DX,03F8H 
		IN AL,DX
		MOV scoreBlueS, AL		;recieving score of blue
		
		;;;;;;;;;;;;;;;;;;;;;;;this is recieving of score of red shooter
	MOV DX,3FDH
	checkreadys2:
		IN AL,DX
		AND AL,1
		jz checkreadys2

	     MOV DX,03F8H 
		 IN AL,DX
		 MOV scoreRedS, AL		;sending score of Red 		
		
		  
		
		  mov confirm,31h
		 confirmsendingF: 
		   MOV DX,3FDH
		   AGAINSAAF:        ;try again to check if i can send array
		   IN AL, DX
		   AND AL,00100000B     ;READ LINE STATUS
		   JZ AGAINSAAF
		  
			
		  ; IF LINE STATUS IS EMPTY PUT THE VALUE IN TRASMIT DATA REGISTTER
		   MOV DX,3F8H
		   MOV AL, confirm
		   OUT DX,AL
		   
		   	; mov ah,2
		; mov bh,0
		; mov dl,2
		; mov dh,28
		; int 10h 
		
		; mov dl,scoreBlueS
		; mov ah,2
		; int 21h 
		
		; mov ah,2
		; mov bh,0
		; mov dl,4
		; mov dh,29
		; int 10h
        ; mov dl,03
		; mov ah,2
		; int 21h 		
		
		; mov ah,2
		; mov bh,0
		; mov dl,2
		; mov dh,29
		; int 10h 
		
		; mov dl,scoreRedS
		; mov ah,2
		; int 21h 
		
			RET
RecieveFlag endp 
 
SandRFlag proc			;	the red player will be resposible for always sending positions of ghotst
		cmp redname,1
		jz sf ;sendarray
		jmp rf ;RecieveArray
		sf:
		call sendflag
		jmp endsandrf
		rf:
		call RecieveFlag
		endsandrf:
		RET
SandRFlag endp


END MAIN	  
	