EXTRN Xghost:WORD
EXTRN Yghost:WORD
EXTRN colorghost:BYTE
Public DrawGhost
.model small
.data

 
ghost db 0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0
db 0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0
db 0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0
db 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0
db 0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0
db 0,1,1,1,0fh,0fh,0fh,0fh,1,1,1,1,0fh,0fh,0fh,0fh,1,0,0
db 0,1,1,1,0fh,0fh,8,8,8,1,1,1,0fh,8,8,8,1,0,0
db 0,1,1,1,0fh,0fh,8,8,8,1,1,1,0fh,8,8,8,8,0,0
db 1,1,1,0fh,0fh,0fh,8,8,8,1,1,0fh,0fh,8,8,8,8,1,1
db 1,1,1,0fh,0fh,0fh,8,8,8,1,1,0fh,0fh,8,8,8,8,1,1
db 1,1,1,1,0fh,0fh,0fh,0fh,1,1,1,1,0fh,0fh,0fh,0fh,1,1,1
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
db 1,1,0,0,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1
db 1,1,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,1,1
db 1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1,1




 .CODE
DrawGhost  PROC FAR
      MOV AX, @DATA
	  MOV DS,AX
	  push di 
	  push bx
	  
	  mov cx,Xghost 
	  mov si,0 
	  mov dx,Yghost
loop1: 
	         
	         ;Row 
cont: 
      cmp ghost[si],1
	  jz editcolor
	  mov al,ghost[si]         ;Pixel color 
	  jmp cont2
  editcolor:
	  mov al,colorghost
  cont2:
	  mov ah,0ch       ;Draw Pixel Command 
	  mov bx,0
	  int 10h 
	  inc cx
	  inc si
	  mov di,Xghost
	  add di,19
	  cmp cx,di
	  jz nextrow
	  cmp si,361     ; 19*19 pixels
	  jl loop1
	  jmp endd
	  
	  nextrow:
	  inc dx
	  mov cx,Xghost 
	  jmp cont

endd:
    pop bx
	pop di

RET
DrawGhost ENDP
END

