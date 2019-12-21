

	; ======================= ZagrOS =======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ======================= ZagrOS =======================

	; ==================== tools_reboot ====================

	tools_reboot:

		push	ax
		push	si
		call	endl

		mov		si, offset REBOOT_WELCOME
		call	putstr
		call	endl

		mov		si, offset REBOOT_PROMPT
		call	putstr
		call	getchr
		cmp		al, 79h
		je		tools_reboot_rsys

		call	endl
		pop		si
		pop		ax
		ret

		tools_reboot_rsys:

		call	reboot
		ret

	REBOOT_WELCOME		db	"reboot v.0.0.2 (26/10/2012).", 00h
	REBOOT_PROMPT		db	" Are you sure? (y/n): ", 00h

	; ==================== tools_reboot ====================

