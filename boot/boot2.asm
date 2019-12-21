

	; ====================== ZagrOS ======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
    ; Bostandoust.IR
	; ====================== ZagrOS ======================

	; ================ precompile section ================

	#make_bin#

	#load_segment=1000h#
	#load_offset=0000h#

	#cs=1000h#
	#ds=1000h#
	#es=1000h#
	#ss=0000h#
	#bp=fdfeh#
	#sp=fffeh#

	#ax=0#
	#bx=0#
	#cx=0#
	#dx=0#
	#si=0#
	#di=0#

	; ================ precompile section ================

	

	; ==================== bootloader ====================

	xor		ax, ax

	mov		ax, 1000h
	mov		ds, ax
	mov		es, ax

	mov		ax, 0000h
	mov		ss, ax
	mov		bp, 0fdfeh
	mov		sp, 0fffeh

	include	"int.asm"

	start:

	mov		ah, 00h
	mov		al, 03h
	int		10h

	mov		ah, 01h
	mov		ch, 20h
	mov		cl, 00h
	int		10h

	mov		ah, 02h
	mov		al, 10h
	int		91h

	mov		ah, 01h
	int		91h


	mov		ah, 07h
	mov		al, 00h
	mov		bh, 00h
	mov		ch, 06d
	mov		cl, 27d
	mov		dh, 16d
	mov		dl, 55d
	int		10h

	mov		ah, 07h
	mov		al, 00h
	mov		bh, 70h
	mov		ch, 05d
	mov		cl, 26d
	mov		dh, 15d
	mov		dl, 54d
	int		10h


	mov		ah, 02h
	mov		bh, 00h
	mov		dh, 06h
	mov		dl, 20h
	int		10h

	mov		ah, 02h
	mov		al, 74h
	int		91h

	mov		ah, 03h
	mov		dx, offset BOOT_WELCOME
	int		90h


	mov		ah, 02h
	mov		bh, 00h
	mov		dh, 07h
	mov		dl, 1bh
	int		10h

	mov		ah, 02h
	mov		al, 70h
	int		91h

	mov		ah, 03h
	mov		dx, offset BOOT_LSPLIT
	int		90h


	mov		ah, 07h
	mov		al, 00h
	mov		bh, 1eh
	mov		ch, 09d
	mov		cl, 27d
	mov		dh, 09d
	mov		dl, 53d
	int		10h

	mov		ah, 02h					
	mov		bh, 00h
	mov		dh, 09h
	mov		dl, 1bh
	int		10h

	mov		ah, 02h
	mov		al, 1eh
	int		91h

	mov		ah, 03h
	mov		dx, offset BOOT_OSTART
	int		90h
	mov		si, 01h


	mov		ah, 02h
	mov		bh, 00h
	mov		dh, 0ah
	mov		dl, 1bh
	int		10h

	mov		ah, 02h
	mov		al, 70h
	int		91h

	mov		ah, 03h
	mov		dx, offset BOOT_REBOOT
	int		90h


	jmp		bootloader_select



	bootloader_label1:

		cmp		si, 01h
		jz		bootloader_select


		mov		ah, 07h
		mov		al, 00h
		mov		bh, 70h
		mov		ch, 10d
		mov		cl, 27d
		mov		dh, 10d
		mov		dl, 53d
		int		10h

		mov		ah, 02h
		mov		bh, 00h
		mov		dh, 0ah
		mov		dl, 1bh
		int		10h

		mov		ah, 02h
		mov		al, 70h
		int		91h

		mov		ah, 03h
		mov		dx, offset BOOT_REBOOT
		int		90h


		mov		ah, 07h
		mov		al, 00h
		mov		bh, 1eh
		mov		ch, 09d
		mov		cl, 27d
		mov		dh, 09d
		mov		dl, 53d
		int		10h

		mov		ah, 02h
		mov		bh, 00h
		mov		dh, 09h
		mov		dl, 1bh
		int		10h

		mov		ah, 02h
		mov		al, 1eh
		int		91h

		mov		ah, 03h
		mov		dx, offset BOOT_OSTART
		int		90h
		mov		si, 01h


		jmp		bootloader_select



	bootloader_label2:

		cmp		si, 02h
		jz		bootloader_select


		mov		ah, 07h
		mov		al, 00h
		mov		bh, 70h
		mov		ch, 09d
		mov		cl, 27d
		mov		dh, 09d
		mov		dl, 53d
		int		10h

		mov		ah, 02h
		mov		bh, 00h
		mov		dh, 09h
		mov		dl, 1bh
		int		10h

		mov		ah, 02h
		mov		al, 70h
		int		91h

		mov		ah, 03h
		mov		dx, offset BOOT_OSTART
		int		90h


		mov		ah, 07h
		mov		al, 00h
		mov		bh, 1eh
		mov		ch, 10d
		mov		cl, 27d
		mov		dh, 10d
		mov		dl, 53d
		int		10h

		mov		ah, 02h
		mov		bh, 00h
		mov		dh, 0ah
		mov		dl, 1bh
		int		10h

		mov		ah, 02h
		mov		al, 1eh
		int		91h

		mov		ah, 03h
		mov		dx, offset BOOT_REBOOT
		int		90h
		mov		si, 02h


		jmp		bootloader_select



	bootloader_select:

		mov		ah, 00h
		int		16h

		cmp		ah, 48h
		jz		bootloader_label1

		cmp		ah, 50h
		jz		bootloader_label2

		cmp		al, 0dh
		jz		bootloader_scheck


		jmp		bootloader_select



	bootloader_scheck:

		cmp		si, 01h
		jz		bootloader_ostart

		cmp		si, 02h
		jz		bootloader_reboot


		jmp		bootloader_select



	bootloader_ostart:

		push	es
		mov		ax, 2000h
		mov		es, ax

		mov		ah, 02h
		mov		al, 10h
		mov		bx, 00h
		mov		ch, 00h
		mov		cl, 0bh
		mov		dh, 00h
		mov		dl, 00h
		int		13h

		cmp		es:[bx], 33h
		jnz		kern_kerror

		jmp		2000h:0000h


	kern_kerror:

		pop		es

		mov		ah, 02h
		mov		bh, 00h
		mov		dh, 0eh
		mov		dl, 1dh
		int		10h

		mov		ah, 02h
		mov		al, 70h
		int		91h

		mov		ah, 03h
		mov		dx, offset BOOT_KERROR
		int		90h

		mov		ah, 00h
		int		16h

		mov		ah, 00h
		int		91h

		hlt



	bootloader_reboot:

		mov		ah, 00h
		int		91h

	; ==================== bootloader ====================



	; ================= define variables =================

	BOOT_WELCOME	db	"Welcome to ZagrOS", 24h
	BOOT_OSTART		db	"Start ZagrOS.", 24h
	BOOT_REBOOT		db	"Reboot system.", 24h
	BOOT_KERROR		db	"Kernel is missing...", 07h, 07h, 07h, 24h
	BOOT_LSPLIT		db	1bh dup(5fh), 24h
	BOOT_AUTHOR		db	"Saeid Bostandoust", 24h

	; ================= define variables =================

