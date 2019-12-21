

	; ====================== ZagrOS ======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ====================== ZagrOS ======================

	; ==================== tools_dump ====================

	tools_dump:

		push	ax
		push	si
		call	endl

		call	dump_cpu_regs

		mov		si, offset DUMP_WELCOME
		call	putstr
		call	endl
		call	endl

		mov		al, 20h
		call	putchr
		mov		si, offset _AX
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset _BX
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset _CX
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset _DX
		call	putstr
		call	endl
		mov		al, 20h
		call	putchr
		mov		si, offset _SP
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset _BP
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset _SI
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset _DI
		call	putstr
		call	endl
		mov		al, 20h
		call	putchr
		mov		si, offset _DS
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset _ES
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset _SS
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset _CS
		call	putstr

		call	endl
		pop		si
		pop		ax
		ret

	DUMP_WELCOME		db	"dump v.0.0.2 (01/11/2012).", 00h


	; ==================== tools_dump ====================

