

	; ======================= ZagrOS ======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ======================= ZagrOS ======================

	; ==================== tools_clear ====================

	tools_clear:

		push	dx

		call	clearw

		mov		dh, 00h
		mov		dl, 00h
		call	gotoxy

		pop		dx
		ret

	; ==================== tools_clear ====================

