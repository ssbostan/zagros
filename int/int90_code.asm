

	; ==================== ZagrOS ====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
	; Bostandoust.IR
	; ==================== ZagrOS ====================

	; ================= int 90h code =================

	int90:

	cmp		ah, 00h
	jz		int90_00		; 00=Get Character.

	cmp		ah, 01h
	jz		int90_01		; 01=Put Character.

	cmp		ah, 02h
	jz		int90_02		; 02=Get String.

	cmp		ah, 03h
	jz		int90_03		; 03=Put String.


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



	int90_00:

	push	bx
	push	cx
	push	dx

	mov		ah, 00h
	int		16h

	mov		ah, 03h
	mov		bh, 00h
	int		10h

	cmp		al, 08h
	jz		int90_00_bksp

	cmp		al, 0dh
	jz		int90_00_entr

	mov		ah, 09h
	mov		bh, 00h
	push	ax
	push	ds
	mov		ax, 1000h
	mov		ds, ax
	mov		bl, [P_COLOR]
	pop		ds
	pop		ax
	mov		cx, 01h
	int		10h

	mov		ah, 02h
	mov		bh, 00h
	inc		dl
	int		10h

	pop		dx
	pop		cx
	pop		bx
	mov		ah, 00h

	iret


	int90_00_bksp:

	cmp		dl, 0
	jz		int90_00_endp

	mov		ah, 02h
	mov		bh, 00h
	dec		dl
	int		10h

	pop		dx
	pop		cx
	pop		bx
	mov		ah, 00h

	iret


	int90_00_entr:

	mov		ah, 02h
	mov		bh, 00h
	mov		dl, 00h
	int		10h

	pop		dx
	pop		cx
	pop		bx
	mov		ah, 00h

	iret


	int90_00_endp:

	pop		dx
	pop		cx
	pop		bx
	mov		ah, 00h

	iret



	int90_01:

	push	ax
	push	bx
	push	cx
	push	dx

	cmp		al, 0ah
	jz		int90_01_newl

	cmp		al, 0dh
	jz		int90_01_entr

	mov		ah, 09h
	mov		bh, 00h
	push	ax
	push	ds
	mov		ax, 1000h
	mov		ds, ax
	mov		bl, [P_COLOR]
	pop		ds
	pop		ax
	mov		cx, 01h
	int		10h

	mov		ah, 03h
	mov		bh, 00h
	int		10h

	mov		ah, 02h
	inc		dl
	int		10h

	pop		dx
	pop		cx
	pop		bx
	pop		ax

	iret


	int90_01_newl:

	mov		ah, 03h
	mov		bh, 00h
	int		10h

	mov		ah, 02h
	inc		dh
	int		10h

	pop		dx
	pop		cx
	pop		bx
	pop		ax

	iret


	int90_01_entr:

	mov		ah, 03h
	mov		bh, 00h
	int		10h

	mov		ah, 02h
	mov		dl, 0
	int		10h

	pop		dx
	pop		cx
	pop		bx
	pop		ax

	iret



	int90_02:

	push	ax
	push	bx
	push	cx
	push	dx
	push	si

	mov		si, 0
	mov		cx, 0
	mov		bx, dx

	mov		[bx+1], 0


	int90_02_loop:

	mov		ah, 00h
	int		16h

	cmp		al, 08h
	jz		int90_02_bksp

	cmp		al, 0dh
	jz		int90_02_entr

	mov		ch, [bx]
	dec		ch
	mov		cl, [bx+1]
	cmp		ch, cl
	jz		int90_02_loop

	mov		ah, 01h
	int		90h

	mov		[bx+si+2], al
	inc		si
	inc		cl
	mov		[bx+1], cl
	jmp		int90_02_loop


	int90_02_bksp:

	mov		cl, [bx+1]
	cmp		cl, 00h
	jz		int90_02_loop

	dec		cl
	mov		[bx+1], cl
	dec		si
	mov		[bx+si+2], 24h

	push	bx
	push	cx

	mov		ah, 03h
	mov		bh, 00h
	int		10h

	mov		ah, 02h
	dec		dl
	int		10h

	mov		ah, 07h
	mov		al, 00h
	push	ax
	push	ds
	mov		ax, 1000h
	mov		ds, ax
	mov		bh, [P_COLOR]
	pop		ds
	pop		ax
	mov		ch, dh
	mov		cl, dl
	add		dl, 01h
	int		10h

	pop		cx
	pop		bx

	jmp		int90_02_loop


	int90_02_entr:

	mov		[bx+si+2], 00h
	inc		si
	inc		cl
	mov		[bx+1], cl

	pop		si
	pop		dx
	pop		cx
	pop		bx
	pop		ax

	iret



	int90_03:

	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	si
	push	es

	push	ds
	pop		es

	mov		bx, dx

	mov		si, 0


	int90_03_scot:

	mov		al, [bx+si]
	cmp		al, 24h
	jz		int90_03_next
	cmp		al, 00h
	jz		int90_03_next

	inc		si
	jmp		int90_03_scot


	int90_03_next:

	push	bx
	mov		ah, 03h
	mov		bh, 00h
	int		10h

	mov		ah, 13h
	mov		al, 01h
	mov		bh, 00h
	push	ax
	push	ds
	mov		ax, 1000h
	mov		ds, ax
	mov		bl, [P_COLOR]
	pop		ds
	pop		ax
	mov		cx, si
	pop		bp
	int		10h

	pop		es
	pop		si
	pop		bp
	pop		dx
	pop		cx
	pop		bx
	pop		ax

	iret

	; ================= int 90h code =================

