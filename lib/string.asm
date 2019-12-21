

	; ==================== ZagrOS ====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ==================== ZagrOS ====================

	; ==================== strlen ====================

	strlen:

		push	si

		mov		cx, 00h


		string_strlen_next:

		cmp		[si], 00h
		je		string_strlen_endp
		inc		si
		inc		cx
		jmp		string_strlen_next


		string_strlen_endp:

		pop		si
		ret

	; ==================== strlen ====================



	; ==================== strrev ====================

	strrev:

		push	ax
		push	cx
		push	si
		push	di

		mov		ax, 00h
		mov		cx, 00h
		mov		di, si


		string_strrev_next:

		cmp		[si], 00h
		je		string_strrev_mrev
		push	[si]
		inc		cx
		inc		si
		jmp		string_strrev_next


		string_strrev_mrev:

		pop		ax
		mov		[di], al
		inc		di

		loop	string_strrev_mrev

		pop		di
		pop		si
		pop		cx
		pop		ax
		ret

	; ==================== strrev ====================



	; ==================== strlwr ====================

	strlwr:

		push	ax
		push	si

		mov		ax, 00h


		string_strlwr_next:

		cmp		[si], 00h
		je		string_strlwr_endp
		cmp		[si], 41h
		jge		string_strlwr_tlwr
		inc		si
		jmp		string_strlwr_next


		string_strlwr_tlwr:

		cmp		[si], 5ah
		jg		string_strlwr_sinc
		mov		al, [si]
		xor		al, 20h
		mov		[si], al
		inc		si
		jmp		string_strlwr_next


		string_strlwr_sinc:

		inc		si
		jmp		string_strlwr_next


		string_strlwr_endp:

		pop		si
		pop		ax
		ret

	; ==================== strlwr ====================



	; ==================== strupr ====================

	strupr:

		push	ax
		push	si

		mov		ax, 00h


		string_strupr_next:

		cmp		[si], 00h
		je		string_strupr_endp
		cmp		[si], 61h
		jge		string_strupr_tupr
		inc		si
		jmp		string_strupr_next


		string_strupr_tupr:

		cmp		[si], 7ah
		jg		string_strupr_sinc
		mov		al, [si]
		xor		al, 20h
		mov		[si], al
		inc		si
		jmp		string_strupr_next


		string_strupr_sinc:

		inc		si
		jmp		string_strupr_next


		string_strupr_endp:

		pop		si
		pop		ax
		ret

	; ==================== strupr ====================



	; ==================== strcmp ====================

	strcmp:

		push	bx
		push	cx
		push	si
		push	di

		call	strlen
		mov		bx, cx
		xchg	si, di
		call	strlen

		cmp		bx, cx
		jne		string_strcmp_nequ
		mov		cx, bx
		xchg	si, di

		repe	cmpsb
		je		string_strcmp_sequ
		jne		string_strcmp_nequ
		jmp		string_strcmp_endp


		string_strcmp_sequ:

		mov		ax, 01h
		jmp		string_strcmp_endp


		string_strcmp_nequ:

		mov		ax, 00h
		jmp		string_strcmp_endp


		string_strcmp_endp:

		pop		di
		pop		si
		pop		cx
		pop		bx
		ret

	; ==================== strcmp ====================



	; ==================== chrdup ====================

	chrdup:

		push	cx
		push	si


		string_chrdup_next:

		mov		[si], dl
		inc		si

		loop	string_chrdup_next

		mov		[si], 00h

		pop		si
		pop		cx
		ret

	; ==================== chrdup ====================



	; ==================== strcat ====================

	strcat:

		push	dx
		push	si
		push	di


		string_strcat_next:

		cmp		[si], 00h
		je		string_strcat_scat
		inc		si
		jmp		string_strcat_next


		string_strcat_scat:

		cmp		[di], 00h
		je		string_strcat_endp
		mov		dl, [di]
		mov		[si], dl
		inc		si
		inc		di
		jmp		string_strcat_scat


		string_strcat_endp:

		mov		[si], 00h

		pop		di
		pop		si
		pop		dx
		ret

	; ==================== strcat ====================



	; ==================== strcpy ====================

	strcpy:

		push	dx
		push	si
		push	di


		string_strcpy_next:

		cmp		[di], 00h
		je		string_strcpy_endp
		mov		dl, [di]
		mov		[si], dl
		inc		si
		inc		di
		jmp		string_strcpy_next


		string_strcpy_endp:

		mov		[si], 00h

		pop		di
		pop		si
		pop		dx
		ret

	; ==================== strcpy ====================



	; ==================== strchr ====================

	strchr:

		push	dx
		push	si


		string_strchr_next:

		cmp		[si], 00h
		je		string_strchr_cnot
		cmp		[si], dl
		je		string_strchr_cfnd
		inc		si
		jmp		string_strchr_next


		string_strchr_cnot:

		mov		di, 00h
		jmp		string_strchr_endp


		string_strchr_cfnd:

		mov		di, si
		jmp		string_strchr_endp


		string_strchr_endp:

		pop		si
		pop		dx
		ret

	; ==================== strchr ====================



	; ==================== substr ====================

	substr:

		push	ax
		push	bx
		push	cx
		push	si
		push	di

		mov		ax, 00h
		add		si, bx

		cmp		cx, 00h
		je		string_substr_fsub
		jne		string_substr_usub


		string_substr_fsub:

		cmp		[si], 00h
		je		string_substr_null
		mov		al, [si]
		mov		[di], al
		inc		si
		inc		di
		jmp		string_substr_fsub


		string_substr_usub:

		cmp		[si], 00h
		je		string_substr_null
		mov		al, [si]
		mov		[di], al
		inc		si
		inc		di

		loop	string_substr_usub


		string_substr_null:

		cmp		[di], 00h
		je		string_substr_endp

		mov		[di], 00h
		jmp		string_substr_endp


		string_substr_endp:

		pop		di
		pop		si
		pop		cx
		pop		bx
		pop		ax
		ret

	; ==================== substr ====================



	; ==================== strstr ====================

	strstr:

		push	ax
		push	bx
		push	cx
		push	si

		mov		bx, 00h
		mov		cx, 00h

		call	strlen
		mov		bx, cx
		xchg	si, di
		call	strlen

		cmp		bx, cx
		jl		string_strstr_endp
		xchg	si, di


		string_strstr_next:

		cmp		[si], 00h
		je		string_strstr_snot
		xchg	si, di
		call	strcmp
		xchg	si, di
		cmp		ax, 01h
		je		string_strstr_sfnd
		inc		si
		jmp		string_strstr_next


		string_strstr_snot:

		mov		di, 00h
		jmp		string_strstr_endp


		string_strstr_sfnd:

		mov		di, si
		jmp		string_strstr_endp


		string_strstr_endp:

		pop		si
		pop		cx
		pop		bx
		pop		ax
		ret

	; ==================== strstr ====================

