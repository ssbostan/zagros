

	; ======================== ZagrOS =======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
	; Bostandoust.IR
	; ======================== ZagrOS =======================

	; ==================== zero_cpu_regs ====================

	zero_cpu_regs:

		mov		ax, 0
		mov		bx, 0
		mov		cx, 0
		mov		dx, 0
		mov		si, 0
		mov		di, 0
		ret

	; ==================== zero_cpu_regs ====================



	; ==================== dump_cpu_regs ====================

	dump_cpu_regs:

		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di

		cpu_dump_cpu_regs_ax:

		mov		si, offset _AX
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_bx:

		mov		ax, bx
		mov		si, offset _BX
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_cx:

		mov		ax, cx
		mov		si, offset _CX
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_dx:

		mov		ax, dx
		mov		si, offset _DX
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_sp:

		mov		ax, sp
		mov		si, offset _SP
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_bp:

		mov		ax, bp
		mov		si, offset _BP
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_si:

		pop		di
		pop		si
		mov		ax, si
		push	si
		push	di
		mov		si, offset _SI
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_di:

		mov		ax, di
		mov		si, offset _DI
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_ds:
		mov		ax, ds
		mov		si, offset _DS
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_es:
		mov		ax, es
		mov		si, offset _ES
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_ss:
		mov		ax, ss
		mov		si, offset _SS
		add		si, 03h
		call	hex2str


		cpu_dump_cpu_regs_cs:
		mov		ax, cs
		mov		si, offset _CS
		add		si, 03h
		call	hex2str


		pop		di
		pop		si
		pop		dx
		pop		cx
		pop		bx
		pop		ax
		ret

	_AX		db		"AX=", 05h dup(00h)
	_BX		db		"BX=", 05h dup(00h)
	_CX		db		"CX=", 05h dup(00h)
	_DX		db		"DX=", 05h dup(00h)
	_SP		db		"SP=", 05h dup(00h)
	_BP		db		"BP=", 05h dup(00h)
	_SI		db		"SI=", 05h dup(00h)
	_DI		db		"DI=", 05h dup(00h)
	_DS		db		"DS=", 05h dup(00h)
	_ES		db		"ES=", 05h dup(00h)
	_SS		db		"SS=", 05h dup(00h)
	_CS		db		"CS=", 05h dup(00h)

	; ==================== dump_cpu_regs ====================

