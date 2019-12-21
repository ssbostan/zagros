

	; ==================== ZagrOS ====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ==================== ZagrOS ====================

	; ================= int 91h code =================

	int91:

	cmp		ah, 00h
	jz		int91_00		; 00=Reboot System.

	cmp		ah, 01h
	jz		int91_01		; 01=Clear Window.

	cmp		ah, 02h
	jz		int91_02		; 02=Set Color.

	cmp		ah, 03h
	jz		int91_03		; 03=Get Color.

	cmp		ah, 04h
	jz		int91_04		; 04=Scroll Window.


	push	ax
	push	dx
	push	ds

	mov		ax, 1000h
	mov		ds, ax

	mov		ah, 03h
	mov		dx, offset INT_ERR
	int		90h

	pop		ds
	pop		dx
	pop		ax

	iret



	int91_00:

	jmp		0ffffh:0000h

	iret



	int91_01:

	push	ax
	push	bx
	push	cx
	push	dx

	mov		ah, 07h
	mov		al, 00h
	push	ax
	push	ds
	mov		ax, 1000h
	mov		ds, ax
	mov		bh, [P_COLOR]
	pop		ds
	pop		ax
	mov		ch, 00h
	mov		cl, 00h
	mov		dh, 18h
	mov		dl, 4fh
	int		10h

	pop		dx
	pop		cx
	pop		bx
	pop		ax

	iret



	int91_02:

	push	ds
	push	ax

	mov		ax, 1000h
	mov		ds, ax

	pop		ax
	mov		[P_COLOR], al
	pop		ds

	iret



	int91_03:

	push	ds
	push	ax

	mov		ax, 1000h
	mov		ds, ax

	pop		ax
	mov		al, [P_COLOR]
	pop		ds

	iret



	int91_04:

	push	ax
	push	bx
	push	cx
	push	dx

	mov		ah, 03h
	mov		bh, 00h
	int		10h

	cmp		dh, 18h
	jnge	int91_04_next

	mov		ah, 06h
	mov		al, 01h
	push	ax
	push	ds
	mov		ax, 1000h
	mov		ds, ax
	mov		bh, [P_COLOR]
	pop		ds
	pop		ax
	mov		ch, 00h
	mov		cl, 00h
	mov		dh, 18h
	mov		dl, 4fh
	int		10h

	mov		ah, 03h
	mov		bh, 00h
	int		10h

	mov		ah, 02h
	sub		dh, 01h
	int		10h


	int91_04_next:

	pop		dx
	pop		cx
	pop		bx
	pop		ax	

	iret

	; ================= int 91h code =================

