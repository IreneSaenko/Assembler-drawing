%TITLE "Ваш комментарий программы"
INCLUDE IO.ASM

MODEL	small

ST1 SEGMENT             ;Описали сегмент стека;
	DB 128 DUP(?)
ST1 ENDS

DATA SEGMENT

;.....................................
FileName  DB 'h:\data.txt',0h
	FileName1 DB 'h:\data1.txt',0h
	ErrorStr1  DB 'Error1','$'
	ErrorStr  DB 'Error','$'
	Buffer    DB  512 dup (?)	; сєЇхЁ эр 1 ёштюыют
	Nodig     DB    'It is not a digit$'
	Digit     DB    3 dup (?)
	Digit1    dw     0
	TEN       dw    10
	F         dw    0
;............................................ 



	x1 dw ?
	y1 dw ?
	x dw ?
	y dw ?
	b db ?
	t dw ?
	a dw ?
	c dw ?
	rcol dw 1
	scol dw 2
DATA ENDS


CODE SEGMENT            ;открыли сегмент кода;
ASSUME SS:ST1,DS:DATA,CS:CODE    ;связали регистровые сегменты с сегментами;
point proc
	mov ah,	0Ch
	mov bh,	0
	int 10h	
ret
point endp
line macro x,y,z; макрос для рисования вертикальной линии
local L1
mov dx,y
mov cx,z
L1: 	push cx
	mov cx,x
	call point
	inc dx
	pop cx
	Loop L1
endm 

line2 macro x,y,z; макрос для рисования горизонтальной линии
local L1
mov si,x
mov t,si
mov dx,y
mov cx,z
L1: 	push cx
	mov cx,t
	call point
	inc t
	pop cx
	Loop L1
endm


 
star proc ; рисует звезду 
	line x1,y1,1
	inc x1
	line x1,y1,2
	inc x1
	line x1,y1,3
	add y1,9
	line x1,y1,2
	sub y1,9
	inc x1
	line x1,y1,4
	add y1,6
	line x1,y1,5
	sub y1,6
	inc x1
	line x1,y1,10
	inc x1
	dec y1
	line x1,y1,10
	inc x1
	sub y1,2
	line x1,y1,12
	inc x1
	sub y1,2
	line x1,y1,13
	inc x1
 	line x1,y1,13
	inc x1
	add y1,2
	line x1,y1,12
	inc x1
	add y1,2
	line x1,y1,10
	inc x1
	inc y1
	line x1,y1,10
	inc x1
	line x1,y1,4
	add y1,6
	line x1,y1,5
	sub y1,6
	inc x1
	line x1,y1,3
	add y1,9
	line x1,y1,2
	sub y1,9
	inc x1
	line x1,y1,2
	inc x1
	line x1,y1,1
	ret
endp


rocket proc ;рисует ракету
	mov al,4
	line2 x1,y1,2
	add x1,2
	dec y1
	line2 x1,y1,2
	add y1,2
	line2 x1,y1,2
	sub y1,2
	add x1,2
	dec y1
	line2 x1,y1,2
	add y1,4
	line2 x1,y1,2
	sub y1,4
	add x1,2
	dec y1
	line2 x1,y1,3
	add y1,6
	line2 x1,y1,3
	sub y1,6
	add x1,3
	inc y1
	line2 x1,y1,1
	add y1,4
	line2 x1,y1,1
	sub y1,4
	mov al,14
	sub x1,7
	add y1,2
 	line2 x1,y1,7
	add x1,2
	dec y1
	line2 x1,y1,6
	add y1,2
  	line2 x1,y1,6
	sub y1,2
	add x1,2
	dec y1
	line2 x1,y1,3
	add y1,4
	line2 x1,y1,3
	sub y1,2
	add x1,3
	mov al,1
	line2 x1,y1,7
	sub y1,5
	line2 x1,y1,4
	inc x1
	inc y1
	line2 x1,y1,4
	inc y1
	inc x1
	line2 x1,y1,5
	inc y1
	line2 x1,y1,3
	add y1,4
	line2 x1,y1,3
	inc y1
	line2 x1,y1,5
	dec x1
	inc y1
 	line2 x1,y1,4
	dec x1
	inc y1
 	line2 x1,y1,4
	add x1,16
	sub y1,2
 	line2 x1,y1,1
	dec y1
	line2 x1,y1,3
	dec y1
	line2 x1,y1,4
	dec y1
	line2 x1,y1,4
	dec y1
	line2 x1,y1,4
	dec y1
	line2 x1,y1,3
	dec y1
	line2 x1,y1,1
	sub x1,2
	mov al,7
	line x1,y1,7
	sub x1,5
	add y1,3
	mov al,13
	line2 x1,y1,4
	dec y1
	inc x1
	line2 x1,y1,2
	add y1,2
	line2 x1,y1,2
	sub x1,9
	sub y1,2

	mov al,9
	line2 x1,y1,9
	add y1,2
	line2 x1,y1,9
	add x1,6
	dec y1
	line2 x1,y1,2
	sub y1,2
	sub x1,2

	line2 x1,y1,9
	add y1,4
	line2 x1,y1,9
	sub y1,5
	add x1,3
        line2 x1,y1,6
	add y1,6
	line2 x1,y1,6
	add x1,7
	sub y1,6
	line x1,y1,7
	sub x1,3
	add y1,2
	line2 x1,y1,2
	add y1,2
	line2 x1,y1,2
	dec y1
	inc x1
	line x1,y1,1

ret 
rocket endp


rocketblack proc; закршивает ракету чёрным
	mov al,0
	line2 x1,y1,2
	add x1,2
	dec y1
	line2 x1,y1,2
	add y1,2
	line2 x1,y1,2
	sub y1,2
	add x1,2
	dec y1
	line2 x1,y1,2
	add y1,4
	line2 x1,y1,2
	sub y1,4
	add x1,2
	dec y1
	line2 x1,y1,3
	add y1,6
	line2 x1,y1,3
	sub y1,6
	add x1,3
	inc y1
	line2 x1,y1,1
	add y1,4
	line2 x1,y1,1
	sub y1,4
	sub x1,7
	add y1,2
 	line2 x1,y1,7
	add x1,2
	dec y1
	line2 x1,y1,6
	add y1,2
  	line2 x1,y1,6
	sub y1,2
	add x1,2
	dec y1
	line2 x1,y1,3
	add y1,4
	line2 x1,y1,3
	sub y1,2
	add x1,3
	line2 x1,y1,7
	sub y1,5
	line2 x1,y1,4
	inc x1
	inc y1
	line2 x1,y1,4
	inc y1
	inc x1
	line2 x1,y1,5
	inc y1
	line2 x1,y1,3
	add y1,4
	line2 x1,y1,3
	inc y1
	line2 x1,y1,5
	dec x1
	inc y1
 	line2 x1,y1,4
	dec x1
	inc y1
 	line2 x1,y1,4
	add x1,16
	sub y1,2
 	line2 x1,y1,1
	dec y1
	line2 x1,y1,3
	dec y1
	line2 x1,y1,4
	dec y1
	line2 x1,y1,4
	dec y1
	line2 x1,y1,4
	dec y1
	line2 x1,y1,3
	dec y1
	line2 x1,y1,1
	sub x1,2
	line x1,y1,7
	sub x1,5
	add y1,3
	line2 x1,y1,4
	dec y1
	inc x1
	line2 x1,y1,2
	add y1,2
	line2 x1,y1,2
	sub x1,9
	sub y1,2
	line2 x1,y1,9
	add y1,2
	line2 x1,y1,9
	add x1,6
	dec y1
	line2 x1,y1,2
	sub y1,2
	sub x1,2

	line2 x1,y1,9
	add y1,4
	line2 x1,y1,9
	sub y1,5
	add x1,3
        line2 x1,y1,6
	add y1,6
	line2 x1,y1,6
	add x1,7
	sub y1,6
	line x1,y1,7
	sub x1,3
	add y1,2
	line2 x1,y1,2
	add y1,2
	line2 x1,y1,2
	dec y1
	inc x1
	line x1,y1,1

ret 
rocketblack endp

App proc; отвечает за появление на экране ракет и звёзд (x,y- координаты звёзд, a,c- ракет)
	mov si,x
	mov x1,si
	mov si,y
	mov y1,si
	mov al,14

	mov cx,scol
L2:	push cx
	push x1
	push y1
	call star
	pop y1
	pop x1
	add x1,80
	pop cx
	loop L2


	mov si,a
	mov x1,si
	mov si,c
	mov y1,si

    mov cx,rcol
L4:	push cx
	push x1
	push y1
	call rocket
	pop y1
	pop x1
	add x1,50
	add y1,50
	pop cx
	loop L4

	

	call delay
	mov si,x
	mov x1,si
	mov si,y
	mov y1,si
	mov al,0

	mov cx,scol
L3:	push cx
	push x1
	push y1
	call star
	pop y1
	pop x1
	add x1,80
	pop cx
	loop L3

	mov si,a
	mov x1,si
	mov si,c
	mov y1,si

	mov cx,rcol
L5:	push cx
	push x1
	push y1
	call rocketblack
	pop y1
	pop x1
	add x1,50
	add y1,50
	pop cx
	loop L5



ret
endp

right macro kol
Local L1,L6
	mov cx,kol
L1:	push cx
	call app
	pop cx
	inc x
	inc y
	inc a
	Loop L1


        mov si,x
	mov x1,si
	mov si,y
	mov y1,si
	mov al,14

	mov cx,3
L6:	push cx
	push x1
	push y1
	call app
	pop y1
	pop x1
	add x1,80
	pop cx
	loop L6
	
endm

left macro kol
Local L4,L7
	mov cx,kol
L4:	push cx
	call star
	pop cx
	dec x
	inc y
	Loop L4
 mov si,x
	mov x1,si
	mov si,y
	mov y1,si
	mov al,14

	mov cx,3
L7:	push cx
	push x1
	push y1
	call star
	pop y1
	pop x1
	add x1,80
	pop cx
	loop L7

endm

down macro kol
Local L5,L8
	mov cx,kol
L5:	push cx
	call app
	pop cx
	inc y
	Loop L5

 	mov si,x
	mov x1,si
	mov si,y
	mov y1,si
	mov al,14

	mov cx,3
L8:	push cx
	push x1
	push y1
	call star
	pop y1
	pop x1
	add x1,80
	pop cx
	loop L8
endm


Delay proc
push ax
push cx
push dx
mov ah, 86h
mov cx,0
mov dx,65535
int 15h
pop dx
pop cx
pop ax
ret
delay endp

sky proc
mov al,14

	mov cx,50
L10: push cx
	mov cx,x
	mov dx,y
	call point
	add x,20
	add y,37
	pop cx
	loop L10

	mov cx,50
L11: push cx
	mov cx,x
	mov dx,y
	call point
	add x,16
	add y,111
	pop cx
	loop L11

 	mov cx,50
L12:push cx
	mov cx,x
	mov dx,y
	call point
	add x,57
	add y,3
	pop cx
       loop L12

	mov cx,50
L13:push cx
	mov cx,x
	mov dx,y
	call point
	add x,81
	add y,20
	pop cx
   	loop L13
ret
sky endp
; фы  ЁрсюЄ√ ё Їрщырьш...........................................

WriteStr    PROC   
     		mov ah,09h
        	int 21h
        	ret
WriteStr  ENDP

; ёхуьхэЄ ёьх∙хэшх ёЄЁюъш
; mov dx, OFFSET FileName
; FileName DB '43.asm',0h

OpenFileRead    PROC   
     		mov ah,3dh		
		mov al,0		
		int 21h
		ret			
OpenFileRead    ENDP              

; т BX фхъЁшяЄюЁ Їрщыр
CloseFile    	PROC   
     		mov ah,3eh		
		int 21h
		ret			
CloseFile    	ENDP  


Start:
	push	ds
	push	ax
	mov	ax, data	
	mov	ds, ax
;========== Ниже пишите Ваш код ==============================

	mov ax,13h
	int 10h

	mov x,10
	mov y,10
	call sky

push ax
push bx
push cx
push dx
push si
push di 


     mov dx, OFFSET FileName	; шь  Їрщыр
	CALL OpenFileRead
	;jc Error1			; яЁютхЁшЄ№ Їыру эр ю°шсъє
	mov si, 0


        mov bx, ax			; фхёъЁшяЄюЁ Їрщыр т ┬╒
	mov ah, 3fh		; ЇєэъЎш  ўЄхэш  Їрщыр
	mov cx, 511		; ёъюы№ъю ўшЄрЄ№
	mov dx, OFFSET Buffer   	; сєЇхЁ
	int 21h
        ;jc Error1			; яЁютхЁшЄ№ Їыру эр ю°шсъє
	cmp Buffer, 55
	je CL1
CL1:	Call CloseFile

    mov di,offset buffer
    mov bx,511
	mov byte ptr[di+bx],'$'

	mov f,0
LL:     mov bl, byte ptr[di]
	cmp bl,' '
	je J2
        cmp bl,10
        je J2
	cmp bl,13
        je J2
	cmp bl,'0'
	jb LET
	cmp bl,'9'
	ja LET
	mov f,1
	sub bl,'0'
	mov bh,0
	mov ax,digit1
	mov dx,0
    MUL Ten
    add ax,bx
    mov digit1,ax
    JMP L4_f
J2:  cmp f,1
     je LET
L4_f:  inc di
     JMP LL
     
LET:
    mov ax, digit1
    mov a,ax



    mov digit1,0
    mov f,0
LL1:     mov bl, byte ptr[di]
	cmp bl,' '
	je J2_2
        cmp bl,10
        je J2_2
	cmp bl,13
        je J2_2
	cmp bl,'0'
	jb LET1
	cmp bl,'9'
	ja LET1
	mov f,1
	sub bl,'0'
	mov bh,0
	mov ax,digit1
	mov dx,0
    MUL Ten
    add ax,bx
    mov digit1,ax
    JMP L4_1
J2_2:  cmp f,1
     je LET1
L4_1:  inc di
     JMP LL1
     
LET1:
   mov ax, digit1
   mov c, ax



  mov digit1,0
    mov f,0
LL2:     mov bl, byte ptr[di]
	cmp bl,' '
	je J2_3
        cmp bl,10
        je J2_3
	cmp bl,13
        je J2_3
	cmp bl,'0'
	jb LET2
	cmp bl,'9'
	ja LET2
	mov f,1
	sub bl,'0'
	mov bh,0
	mov ax,digit1
	mov dx,0
    MUL Ten
    add ax,bx
    mov digit1,ax
    JMP L4_2
J2_3:  cmp f,1
     je LET2
L4_2:  inc di
     JMP LL2
     
LET2:
   mov ax, digit1
   mov scol, ax



   mov digit1,0
    mov f,0
LL3:     mov bl, byte ptr[di]
	cmp bl,' '
	je J2_4
        cmp bl,10
        je J2_4
	cmp bl,13
        je J2_4
	cmp bl,'0'
	jb LET3
	cmp bl,'9'
	ja LET3
	mov f,1
	sub bl,'0'
	mov bh,0
	mov ax,digit1
	mov dx,0
    MUL Ten
    add ax,bx
    mov digit1,ax
    JMP L4_3
J2_4:  cmp f,1
     je LET3
L4_3:  inc di
     JMP LL3
     
LET3:
   mov ax, digit1
   mov rcol, ax
 
pop di
pop si
pop dx
pop cx
pop bx
pop ax


        
	mov x,10
        mov y,10

	right 160


	
;========== Заканчивайте писать Ваш код======================
	pop	ax
	pop	ds
Exit:
	finish
ENDS

END	Start