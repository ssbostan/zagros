

	; ==================== ZagrOS ====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ==================== ZagrOS ====================

	; ================ int 90h define ================

	mov		al, 90h
	mov		bl, 04h
	mul		bl
	mov		bx, ax

	mov		si, offset [int90]
	mov		es:[bx], si

	mov		ax, cs
	add		bx, 02h
	mov		es:[bx], ax

	; ================ int 90h define ================

