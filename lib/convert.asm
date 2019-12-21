

	; ===================== ZagrOS ====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ===================== ZagrOS ====================

	; ==================== bin2str ====================

	bin2str:

		push	bx
		mov		bx, 02h
		call	num2str
		pop		bx
		ret

	; ==================== bin2str ====================



	; ==================== oct2str ====================

	oct2str:

		push	bx
		mov		bx, 08h
		call	num2str
		pop		bx
		ret

	; ==================== oct2str ====================



	; ==================== int2str ====================

	int2str:

		push	bx
		mov		bx, 0ah
		call	num2str
		pop		bx
		ret

	; ==================== int2str ====================



	; ==================== hex2str ====================

	hex2str:

		push	bx
		mov		bx, 10h
		call	num2str
		pop		bx
		ret

	; ==================== hex2str ====================



	; ==================== num2str ====================

	num2str:

		push	ax
		push	bx
		push	cx
		push	dx
		push	si

		mov		cx, 00h
		mov		dx, 00h

		cmp		ax, 00h
		je		convert_num2str_zero
		cmp		ah, 00h
		je		convert_num2str_byte_conv
		jne		convert_num2str_word_conv


		convert_num2str_zero:

		mov		[si], 30h
		inc		si
		mov		[si], 00h
		jmp		convert_num2str_endp



		convert_num2str_byte_conv:

		div		bl
		cmp		ah, 00h
		je		convert_num2str_byte_zfnd


		convert_num2str_byte_zfls:

		push	ax
		inc		cx
		mov		ah, 00h
		cmp		al, 00h
		je		convert_num2str_byte_zfnd
		jmp		convert_num2str_byte_conv


		convert_num2str_byte_zfnd:

		cmp		al, 00h
		je		convert_num2str_byte_tstr
		jmp		convert_num2str_byte_zfls


		convert_num2str_byte_tstr:

		pop		ax
		cmp		ah, 09h
		jg		convert_num2str_byte_shex
		jng		convert_num2str_byte_sdec


		convert_num2str_byte_shex:

		add		ah, 37h
		mov		[si], ah
		inc		si

		loop	convert_num2str_byte_tstr
		jmp		convert_num2str_byte_comp


		convert_num2str_byte_sdec:

		add		ah, 30h
		mov		[si], ah
		inc		si

		loop	convert_num2str_byte_tstr
		jmp		convert_num2str_byte_comp


		convert_num2str_byte_comp:

		cmp		[si], 00h
		je		convert_num2str_endp

		mov		[si], 00h
		jmp		convert_num2str_endp



		convert_num2str_word_conv:

		div		bx
		cmp		dx, 00h
		je		convert_num2str_word_zfnd


		convert_num2str_word_zfls:

		push	dx
		inc		cx
		mov		dx, 00h
		cmp		ax, 00h
		je		convert_num2str_word_zfnd
		jmp		convert_num2str_word_conv


		convert_num2str_word_zfnd:

		cmp		ax, 00h
		je		convert_num2str_word_tstr
		jmp		convert_num2str_word_zfls


		convert_num2str_word_tstr:

		pop		dx
		cmp		dl, 09h
		jg		convert_num2str_word_shex
		jng		convert_num2str_word_sdec


		convert_num2str_word_shex:

		add		dl, 37h
		mov		[si], dl
		inc		si

		loop	convert_num2str_word_tstr
        jmp		convert_num2str_word_comp


		convert_num2str_word_sdec:

		add		dl, 30h
		mov		[si], dl
		inc		si

		loop	convert_num2str_word_tstr
		jmp		convert_num2str_word_comp


		convert_num2str_word_comp:

		cmp		[si], 00h
		je		convert_num2str_endp

		mov		[si], 00h
		jmp		convert_num2str_endp



		convert_num2str_endp:

		pop		si
		pop		dx
		pop		cx
		pop		bx
		pop		ax
		ret

	; ==================== num2str ====================



	; ==================== str2int ====================

	str2int:

		push	bx
		push	cx
		push	dx
		push	bp
		push	si

		mov		ax, 00h
		mov		bx, 00h
		mov		cx, 00h
		mov		dx, 00h
		mov		bp, 01h

		convert_str2int_splt:

		cmp		[si], 00h
		je		convert_str2int_next
		mov		dl, [si]
		sub		dl, 30h
		push	dx
		inc		cx
		inc		si
		jmp		convert_str2int_splt


		convert_str2int_next:

		pop		ax
		mul		bp
		add		bx, ax
		mov		ax, 0ah
		mul		bp
		mov		bp, ax

		loop	convert_str2int_next

		mov		ax, bx


		pop		si
		pop		bp
		pop		dx
		pop		cx
		pop		bx
		ret

	; ==================== str2int ====================



	; ==================== bcd2int ====================

	bcd2int:

		push	bx
		push	cx

		mov		bx, 00h
		mov		cx, 00h

		mov		bl, al
		shr		bl, 04h
		and		al, 0fh
		mov		cl, al
		mov		al, 0ah
		mul		bl
		add		al, cl

		pop		cx
		pop		bx
		ret

	; ==================== bcd2int ====================



	; ==================== int2bcd ====================

	int2bcd:

		push	bx
		push	cx

		mov		bx, 00h
		mov		cx, 00h

		mov		bl, 0ah
		div		bl
		mov		cl, ah
		mov		bl, 10h
		mul		bl
		add		al, cl

		pop		cx
		pop		bx
		ret

	; ==================== int2bcd ====================

