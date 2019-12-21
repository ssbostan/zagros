

	; ====================== ZagrOS =====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ====================== ZagrOS =====================

	; =============== command interpreter ===============

	command:

		call	wherey
		cmp		dh, 18h
		jnge	com_command_next
		call	scroll


		com_command_next:

		mov		si, offset COM_POINTER
		call	putstr

		mov		si, offset COM_BUFFER
		call	getstr

		mov		si, offset COM_VAL
		call	comchk

		call	endl
		jmp		command



	comchk:

		push	ax
		push	cx

		call	strlen
		cmp		cx, 0
		je		com_comchk_empty


		mov		di, offset COM_COMMAND
		call	strcmp
		cmp		ax, 01h
		je		com_comchk_command

		mov		di, offset COM_SYSINFO
		call	strcmp
		cmp		ax, 01h
		je		com_comchk_sysinfo

		mov		di, offset COM_CLEAR
		call	strcmp
		cmp		ax, 01h
		je		com_comchk_clear

		mov		di, offset COM_REBOOT
		call	strcmp
		cmp		ax, 01h
		je		com_comchk_reboot

		mov		di, offset COM_TIME
		call	strcmp
		cmp		ax, 01h
		je		com_comchk_time

		mov		di, offset COM_DUMP
		call	strcmp
		cmp		ax, 01h
		je		com_comchk_dump

		call	endl
		mov		si, offset COM_NOTFOUND
		call	putstr
		call	endl

		pop		cx
		pop		ax
		ret


		com_comchk_empty:

		pop		cx
		pop		ax
		ret



		com_comchk_command:

		call	tools_command
		pop		cx
		pop		ax
		ret

		com_comchk_sysinfo:

		call	tools_sysinfo
		pop		cx
		pop		ax
		ret

		com_comchk_clear:

		call	tools_clear
		pop		cx
		pop		ax
		ret

		com_comchk_reboot:

		call	tools_reboot
		pop		cx
		pop		ax
		ret

		com_comchk_time:

		call	tools_time
		pop		cx
		pop		ax
		ret

		com_comchk_dump:

		call	tools_dump
		pop		cx
		pop		ax
		ret



	scroll:

		push	ax
		push	bx
		push	cx
		push	dx

		mov		ah, 06h
		mov		al, 01h
		mov		bh, 07h
		mov		ch, 00h
		mov		cl, 00h
		mov		dh, 18h
		mov		dl, 4fh
		int		10h

		mov		dh, 17h
		mov		dl, 00h
		call	gotoxy 

		pop		dx
		pop		cx
		pop		bx
		pop		ax
		ret
		
	; =============== command interpreter ===============



	; ==================== variables ====================

	COM_POINTER		db		"#>", 00h
	COM_NOTFOUND	db		"Command not found.", 00h
	COM_ERROR		db		"Unknown error.", 00h

	COM_BUFFER LABEL BYTE
		COM_MAX		db		4eh
		COM_ACT		db		00h
		COM_VAL		db		0ffh dup(00h)

	COM_COMMAND		db		"command", 00h
	COM_SYSINFO		db		"sysinfo", 00h
	COM_CLEAR		db		"clear", 00h
	COM_REBOOT		db		"reboot", 00h
	COM_TIME		db		"time", 00h
	COM_DUMP		db		"dump", 00h

	; ==================== variables ====================

