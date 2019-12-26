

	; ====================== ZagrOS ======================
	; Zagros Open Source Operating System
	; Saeid Bostandoust (ssbostan@linuxmail.org)
	; Bostandoust.IR
	; ====================== ZagrOS ======================

	; ================ precompile section ================

	#make_bin#

	#load_segment=2000h#
	#load_offset=0000h#

	#cs=2000h#
	#ds=2000h#
	#es=2000h#
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



	; ====================== kernel ======================

	xor		ax, ax

	mov		ax, 2000h
	mov		ds, ax
	mov		es, ax

	cli
	mov		ax, 0000h
	mov		ss, ax
	mov		bp, 0fdfeh
	mov		sp, 0fffeh
	sti

	include	"lib.asm"
	include	"tools.asm"

	start:

	mov		ah, 00h
	mov		al, 03h
	int		10h

	mov		ah, 02h
	mov		al, 07h
	int		91h

	mov		ah, 01h
	int		91h

	mov		ah, 02h
	mov		bh, 00h
	mov		dh, 00h
	mov		dl, 00h
	int		10h

	mov		ah, 01h
	mov		ch, 07h
	mov		cl, 07h
	int		10h


	mov		al, 02h
	call	setcolor
	mov		dh, 01h
	mov		dl, 02h
	call	gotoxy

	mov		si, offset OS_NAME
	call	putstr

	mov		al, 20h
	call	putchr

	mov		si, offset OS_VERSION
	call	putstr

	mov		al, 20h
	call	putchr

	mov		si, offset OS_RELEASE
	call	putstr

	mov		al, 07h
	call	setcolor
	call	endl
	call	endl

	include "command.asm"

	; ====================== kernel ======================



	; ================= define variables =================

	OS_NAME				db	"ZagrOS", 24h
	OS_VERSION			db	"v.0.0.4", 24h
	OS_RELEASE			db	"01/11/2012", 24h
	OS_AUTHOR			db	"Saeid Bostandoust", 24h

	; ================= define variables =================

