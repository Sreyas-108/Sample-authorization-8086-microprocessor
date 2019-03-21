.model tiny
.stack
.data
dsp1 db 'ENTER USER NAME',0Ah,'$'
user db 'qwerty$'
userlen dw 0006h
max1 db 16
act1 db ?
inp1 db 16 dup(0)

dsp2 db 'ENTER PASSWORD',0Ah,'$'
passwd db 'asdfgh$'
passwdlen dw 0006h
max2 db 16
act2 db ?
inp2 db 32 dup(0)

dsp3 db 'HELLO USER',0Ah,'$'

.code
.startup
		lea dx, dsp1
		mov ah, 09h
		int 21h
		LEA DX,max1
		MOV AH, 0Ah
		INT21h			; Input username
		lea si, userlen
		mov cx,[si]
		lea si, user
		lea di, inp1
		REPE cmpsb		; Verify username
		jnz myexit

		lea dx, dsp2
		mov ah, 09h
		int 21h
		LEA DX,max2
		MOV AH, 0Ah
		INT21h			; Input password
		lea si, passwdlen
		mov cx,[si]
		lea si, passwd
		lea di, inp2
		REPE cmpsb		; Verify password
		jnz myexit

		lea dx, dsp3
		mov ah, 09h
		int 21h			; Print success and welcome the user

	myexit:	mov ah,4ch
		int 21h
.exit
end