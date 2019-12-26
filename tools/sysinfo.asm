

	; ======================== ZagrOS =======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
	; Bostandoust.IR
	; ======================== ZagrOS =======================

	; ==================== tools_sysinfo ====================

	tools_sysinfo:

		push	ax
		push	si
		call	endl

		call	memory_size
		call	biosrl_date

		mov		si, offset SYSINFO_MEMSIZE
		call	int2str

		mov		si, offset SYSINFO_WELCOME
		call	putstr
		call	endl
		call	endl

		mov		si, offset SYSINFO_KERNELV
		call	putstr
		mov		si, offset OS_NAME
		call	putstr
		mov		al, 20h
		call	putchr
		mov		si, offset OS_VERSION
		call	putstr
		call	endl

		mov		si, offset SYSINFO_KERNELU
		call	putstr
		mov		si, offset OS_RELEASE
		call	putstr
		call	endl

		mov		si, offset SYSINFO_KERNELA
		call	putstr
		mov		si, offset OS_AUTHOR
		call	putstr
		call	endl

		mov		si, offset SYSINFO_MEMSMSG
		call	putstr
		mov		si, offset SYSINFO_MEMSIZE
		call	putstr
		mov		si, offset SYSINFO_MEMUNIT
		call	putstr
		call	endl

		mov		si, offset SYSINFO_BIOSRLD
		call	putstr
		mov		si, offset _BIOSDATE
		call	putstr

		call	endl
		pop		si
		pop		ax
		ret

	SYSINFO_WELCOME		db	"sysinfo v.0.0.2 (26/10/2012).", 00h
	SYSINFO_KERNELV		db	" OS: ", 00h
	SYSINFO_KERNELU		db	" Kernel Update: ", 00h
	SYSINFO_KERNELA		db	" Kernel Author: ", 00h
	SYSINFO_MEMSIZE		db	05h dup(00h)
	SYSINFO_MEMUNIT		db	"KB", 00h
	SYSINFO_MEMSMSG		db	" Memory size: ", 00h
	SYSINFO_BIOSRLD		db	" Bios release date: ", 00h

	; ==================== tools_sysinfo ====================

