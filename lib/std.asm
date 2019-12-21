

	; ==================== ZagrOS ====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ==================== ZagrOS ====================

	; ==================== getchr ====================

	getchr:

		mov		ah, 00h
		int		90h
		ret

	; ==================== getchr ====================



	; ==================== putchr ====================

	putchr:

		push	ax

		mov		ah, 01h
		int		90h

		pop		ax
		ret

	; ==================== putchr ====================



	; ==================== getstr ====================

	getstr:

		push	ax
		push	dx

		mov		dx, si

		mov		ah, 02h
		int		90h

		pop		dx
		pop		ax
		ret

	; ==================== getstr ====================



	; ==================== putstr ====================

	putstr:

		push	ax
		push	dx

		mov		dx, si

		mov		ah, 03h
		int		90h

		pop		dx
		pop		ax
		ret

	; ==================== putstr ====================



	; ==================== reboot ====================

	reboot:

		push	ax

		mov		ah, 00h
		int		91h

		pop		ax
		ret

	; ==================== reboot ====================



	; ==================== clearw ====================

	clearw:

		push	ax

		mov		ah, 01h
		int		91h

		pop		ax
		ret

	; ==================== clearw ====================



	; =================== setcolor ===================

	setcolor:

		push	ax

		mov		ah, 02h
		int		91h

		pop		ax
		ret

	; =================== setcolor ===================



	; =================== getcolor ===================

	getcolor:

		mov		ah, 03h
		int		91h
		ret

	; =================== getcolor ===================



	; ==================== gotoxy ====================

	gotoxy:

		push	ax
		push	bx
		push	dx

		mov		ah, 02h
		mov		bh, 00h
		int		10h

		pop		dx
		pop		bx
		pop		ax
		ret

	; ==================== gotoxy ====================



	; ==================== wherex ====================

	wherex:

		push	ax
		push	bx
		push	cx

		mov		ah, 03h
		mov		bh, 00h
		int		10h

		mov		dh, 00h

		pop		cx
		pop		bx
		pop		ax
		ret

	; ==================== wherex ====================



	; ==================== wherey ====================

	wherey:

		push	ax
		push	bx
		push	cx

		mov		ah, 03h
		mov		bh, 00h
		int		10h

		mov		dl, 00h

		pop		cx
		pop		bx
		pop		ax
		ret

	; ==================== wherey ====================



	; ===================== endl =====================

	endl:

		push	ax
		mov		al, 0ah
		call	putchr
		mov		al, 0dh
		call	putchr

		mov		ah, 04h
		int		91h

		pop		ax
		ret

	; ===================== endl =====================

