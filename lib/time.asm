

	; ===================== ZagrOS ====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ===================== ZagrOS ====================

	; ==================== gettime ====================

	gettime:

		push	ax

		clc
		mov		ah, 02h
		int		1ah

		pop		ax
		ret

	; ==================== gettime ====================



	; ==================== settime ====================

	settime:

		push	ax

		clc
		mov		ah, 03h
		int		1ah

		pop		ax
		ret

	; ==================== settime ====================



	; ==================== getdate ====================

	getdate:

		push	ax

		clc
		mov		ah, 04h
		int		1ah

		pop		ax
		ret

	; ==================== getdate ====================



	; ==================== setdate ====================

	setdate:

		push	ax

		clc
		mov		ah, 05h
		int		1ah

		pop		ax
		ret

	; ==================== setdate ====================

