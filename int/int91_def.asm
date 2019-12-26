

	; ==================== ZagrOS ====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
	; Bostandoust.IR
	; ==================== ZagrOS ====================

	; ================ int 91h define ================

	mov		al, 91h
	mov		bl, 04h
	mul		bl
	mov		bx, ax

	mov		si, offset [int91]
	mov		es:[bx], si

	mov		ax, cs
	add		bx, 02h
	mov		es:[bx], ax

	; ================ int 91h define ================

