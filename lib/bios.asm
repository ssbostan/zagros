

	; ===================== ZagrOS ====================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
	; Bostandoust.IR
	; ===================== ZagrOS ====================

	; ================== memory_size ==================

	memory_size:

		push	ds

		mov		ax, 40h
		mov		ds, ax

		mov		ax, [13h]

		pop		ds
		ret

	; ================== memory_size ==================



	; ================== disply_mode ==================

	disply_mode:

		push	ds

		mov		ax, 40h
		mov		ds, ax

		mov		ah, 00h
		mov		al, [49h]

		pop		ds
		ret

	; ================== disply_mode ==================



	; ================== disply_xcnt ==================

	disply_xcnt:

		push	ds

		mov		ax, 40h
		mov		ds, ax

		mov		ax, [4ah]

		pop		ds
		ret

	; ================== disply_xcnt ==================



	; ================== disply_ycnt ==================

	disply_ycnt:

		push	ds

		mov		ax, 40h
		mov		ds, ax

		mov		ah, 00h
		mov		al, [84h]
		add		al, 01h

		pop		ds
		ret

	; ================== disply_ycnt ==================



	; ================== disply_page ==================

	disply_page:

		push	ds

		mov		ax, 40h
		mov		ds, ax

		mov		ah, 00h
		mov		al, [62h]

		pop		ds
		ret

	; ================== disply_page ==================



	; ================== system_type ==================

	system_type:

		push	ds

		mov		ax, 0ffffh
		mov		ds, ax

		mov		ax, [0eh]

		pop		ds
		ret

	; ================== system_type ==================



	; ================== biosrl_date ==================

	biosrl_date:

		push	ax
		push	cx
		push	si
		push	di
		push	ds

		mov		ax, 0ffffh
		mov		ds, ax

		mov		cx, 08h
		mov		si, offset _BIOSDATE

		cmp		[05h], 39h
		jg		bios_biosrl_date_comp
		jng		bios_biosrl_date_norm


		bios_biosrl_date_comp:

		mov		di, 06h
		jmp		bios_biosrl_date_next


		bios_biosrl_date_norm:

		mov		di, 05h
		jmp		bios_biosrl_date_next


		bios_biosrl_date_next:

		mov		al, [di]
		pop		ds
		mov		[si], al
		push	ds
		mov		ax, 0ffffh
		mov		ds, ax
		inc		si
		inc		di

		loop	bios_biosrl_date_next


		pop		ds
		pop		di
		pop		si
		pop		cx
		pop		ax
		ret

	_BIOSDATE	db	09h dup(00h), 00h

	; ================== biosrl_date ==================

