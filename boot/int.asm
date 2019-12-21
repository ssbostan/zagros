

	; ==================== ZagrOS =====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ==================== ZagrOS =====================

	; =============== define interrupts ===============

	push	ax
	push	es

	mov		ax, 0
	mov		es, ax

	include	"../int/int90_def.asm"
	include	"../int/int91_def.asm"

	pop		es
	pop		ax

	jmp		start

	; =============== define interrupts ===============



	; ================== interrupts ===================

	include	"../int/int90_code.asm"
	include	"../int/int91_code.asm"

	; ================== interrupts ===================



	; ============= define int variables ==============

	P_COLOR		db	07h
	INT_ERR		db	"This interrupt function is not defined yet.", 24h

	; ============= define int variables ==============

