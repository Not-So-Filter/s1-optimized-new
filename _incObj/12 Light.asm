; ---------------------------------------------------------------------------
; Object 12 - lamp (SYZ)
; ---------------------------------------------------------------------------

SpinningLight:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Light_Index(pc,d0.w),d1
		jmp	Light_Index(pc,d1.w)
; ===========================================================================
Light_Index:	dc.w Light_Main-Light_Index
		dc.w Light_Animate-Light_Index
; ===========================================================================

Light_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.l	#Map_Light,obMap(a0)
		move.w	#make_art_tile(ArtTile_Level,0,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.b	#$10,obActWid(a0)
		move.w	#6*$80,obPriority(a0)

Light_Animate:	; Routine 2
		subq.b	#1,obTimeFrame(a0)
		bpl.s	.chkdel
		move.b	#7,obTimeFrame(a0)
		addq.b	#1,obFrame(a0)
		cmpi.b	#6,obFrame(a0)
		blo.s	.chkdel
		clr.b	obFrame(a0)

.chkdel:
		out_of_range.w	DeleteObject_Respawn
		bra.w	DisplaySprite