

	; ======================== ZagrOS =======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
	; Bostandoust.IR
	; ======================== ZagrOS =======================

	; ==================== tools_command ====================

	tools_command:

		push	si
		call	endl

		mov		si, offset COMMAND_WELCOME
		call	putstr
		call	endl
		call	endl

		mov		si, offset COMMAND_COMMAND
		call	putstr
		call	endl

		mov		si, offset COMMAND_SYSINFO
		call	putstr
		call	endl

		mov		si, offset COMMAND_CLEAR
		call	putstr
		call	endl

		mov		si, offset COMMAND_REBOOT
		call	putstr
		call	endl

		mov		si, offset COMMAND_TIME
		call	putstr
		call	endl

		mov		si, offset COMMAND_DUMP
		call	putstr

		call	endl
		pop		si
		ret

	COMMAND_WELCOME		db	"command v.0.0.1 (25/10/2012).", 00h
	COMMAND_COMMAND		db	" command: show this list.", 00h
	COMMAND_SYSINFO		db	" sysinfo: show system information.", 00h
	COMMAND_CLEAR		db	" clear:   clear terminal window.", 00h
	COMMAND_REBOOT		db	" reboot:  reboot system.", 00h
	COMMAND_TIME		db	" time:    show current date and time.", 00h
	COMMAND_DUMP		db	" dump:    dump cpu registers.", 00h
	
	; ==================== tools_command ====================

