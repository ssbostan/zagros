

	; ====================== ZagrOS ======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
	; Bostandoust.IR
	; ====================== ZagrOS ======================

	; ==================== tools_time ====================

	tools_time:

		push	ax
		push	cx
		push	dx
		push	si

		call	gettime
		mov		ax, 00h
		mov		al, ch
		mov		si, offset TIME_SYSTIME
		call	bcd2int
		call	int2str
		add		si, 02h
		mov		[si], 3ah
		add		si, 01h
		mov		al, cl
		call	bcd2int
		call	int2str
		add		si, 02h
		mov		[si], 3ah
		add		si, 01h
		mov		al, dh
		call	bcd2int
		call	int2str

		call	getdate
		mov		ax, 00h
		mov		al, dl
		mov		si, offset TIME_SYSDATE
		call	bcd2int
		call	int2str
		add		si, 02h
		mov		[si], 2fh
		add		si, 01h
		mov		al, dh
		call	bcd2int
		call	int2str
		add		si, 02h
		mov		[si], 2fh
		add		si, 01h
		mov		al, cl
		call	bcd2int
		call	int2str

		call	endl
		mov		al, 20h
		call	putchr
		mov		si, offset TIME_SYSTIME
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset TIME_SYSDATE
		call	putstr
		call	endl

		pop		si
		pop		dx
		pop		cx
		pop		ax
		ret

	TIME_SYSTIME	db	08h dup(00h), 00h
	TIME_SYSDATE	db	08h dup(00h), 00h

	; ==================== tools_time ====================

