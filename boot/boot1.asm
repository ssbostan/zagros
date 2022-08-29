

	; ====================== ZagrOS ======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
	; Bostandoust.IR
	; ====================== ZagrOS ======================

	; ================ preassemble section ================

	#make_boot#

	#load_segment=0000#
	#load_offset=7c00h#

	#cs=0000h#
	#ds=0000h#
	#es=0000h#
	#ss=0000h#
	#bp=fdfeh#
	#sp=fffeh#

	#ax=0#
	#bx=0#
	#cx=0#
	#dx=0#
	#si=0#
	#di=0#

	; ================ preassemble section ================



	; =================== first sector ===================

	org		7c00h

	mov		ax, 0000h
	mov		ds, ax
	mov		es, ax
	mov		ss, ax

	mov		bp, 0fdfeh
	mov		sp, 0fffeh

	push	es
	mov		ax, 1000h
	mov		es, ax

	mov		ah, 02h
	mov		al, 08h
	mov		bx, 00h
	mov		ch, 00h
	mov		cl, 02h
	mov		dh, 00h
	mov		dl, 00h
	int		13h

	cmp		es:[bx], 33h
	jnz		exit

	jmp		1000h:0000h



	exit:

		pop		es

		mov		ah, 00h
		mov		al, 03h
		int		10h

		mov		ah, 01h
		mov		ch, 20h
		mov		cl, 00h
		int		10h

		mov		ah, 02h
		mov		bh, 00h
		mov		dh, 00h
		mov		dl, 00h
		int		10h

		mov		ah, 07h
		mov		al, 00h
		mov		bh, 07h
		mov		ch, 00h
		mov		cl, 00h
		mov		dh, 18h
		mov		dl, 4fh
		int		10h

		mov		ah, 13h
		mov		al, 01h
		mov		bh, 00h
		mov		bl, 07h
		mov		ch, 00h
		mov		cl,	[BOOT_ERROR_LEN]
		mov		dh, 00h
		mov		dl, 00h
		lea		bp, [BOOT_ERROR_MSG]
		int		10h

		mov		ah, 00h
		int		16h

		jmp		0ffffh:0000h

		hlt

	; =================== first sector ===================



	; ================= define variables =================

	BOOT_ERROR_MSG		db	"Bootloader is missing..."
	BOOT_ERROR_LEN		db	$-BOOT_ERROR_MSG

	; ================= define variables =================

