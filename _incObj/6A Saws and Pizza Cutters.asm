; ---------------------------------------------------------------------------
; Object 6A - ground saws and pizza cutters (SBZ)
; ---------------------------------------------------------------------------

Saws:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Saw_Index(pc,d0.w),d1
		jmp	Saw_Index(pc,d1.w)
; ===========================================================================
Saw_Index:	dc.w Saw_Main-Saw_Index
		dc.w Saw_Action-Saw_Index

saw_origX = objoff_3A		; original x-axis position
saw_origY = objoff_38		; original y-axis position
saw_here = objoff_3D		; flag set when the ground saw appears
; ===========================================================================

Saw_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.l	#Map_Saw,obMap(a0)
		move.w	#make_art_tile(ArtTile_SBZ_Saw,2,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.w	#4*$80,obPriority(a0)
		move.b	#$20,obActWid(a0)
		move.w	obX(a0),saw_origX(a0)
		move.w	obY(a0),saw_origY(a0)
		cmpi.b	#3,obSubtype(a0) ; is object a ground saw?
		bhs.s	Saw_Action	; if yes, branch
		move.b	#$A2,obColType(a0)

Saw_Action:	; Routine 2
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		andi.w	#7,d0
		add.w	d0,d0
		move.w	.index(pc,d0.w),d1
		jsr	.index(pc,d1.w)
		out_of_range.s	.delete,saw_origX(a0)
		jmp	(DisplaySprite).l

.delete:
		jmp	(DeleteObject_Respawn).l
; ===========================================================================
.index:		dc.w .type00-.index, .type01-.index, .type02-.index ; pizza cutters
		dc.w .type03-.index, .type04-.index ; ground saws
; ===========================================================================

.type00:
		rts			; doesn't move
; ===========================================================================

.type01:
		moveq	#0,d0
		move.b	(v_oscillate+$E).w,d0
		btst	#0,obStatus(a0)
		beq.s	.noflip01
		neg.w	d0
		addi.w	#$60,d0

.noflip01:
		move.w	saw_origX(a0),d1
		sub.w	d0,d1
		move.w	d1,obX(a0)	; move saw sideways

		subq.b	#1,obTimeFrame(a0)
		bpl.s	.sameframe01
		move.b	#2,obTimeFrame(a0) ; time between frame changes
		bchg	#0,obFrame(a0)	; change frame

.sameframe01:
		tst.b	obRender(a0)
		bpl.s	.nosound01
		moveq	#$F,d0
		and.w	(v_framecount).w,d0
		bne.s	.nosound01
		playsound sfx_Saw,sfx

.nosound01:
		rts
; ===========================================================================

.type02:
		moveq	#0,d0
		move.b	(v_oscillate+6).w,d0
		btst	#0,obStatus(a0)
		beq.s	.noflip02
		neg.w	d0
		addi.w	#$80,d0

.noflip02:
		move.w	saw_origY(a0),d1
		sub.w	d0,d1
		move.w	d1,obY(a0)	; move saw vertically
		subq.b	#1,obTimeFrame(a0)
		bpl.s	.sameframe02
		move.b	#2,obTimeFrame(a0)
		bchg	#0,obFrame(a0)

.sameframe02:
		tst.b	obRender(a0)
		bpl.s	.nosound02
		move.b	(v_oscillate+6).w,d0
		cmpi.b	#$18,d0
		bne.s	.nosound02
		playsound sfx_Saw,sfx

.nosound02:
		rts
; ===========================================================================

.type03:
		tst.b	saw_here(a0)	; has the saw appeared already?
		bne.s	.here03		; if yes, branch

		move.w	(v_player+obX).w,d0
		subi.w	#$C0,d0
		bcs.s	.nosaw03x
		sub.w	obX(a0),d0
		bcs.s	.nosaw03x
		move.w	(v_player+obY).w,d0
		subi.w	#$80,d0
		cmp.w	obY(a0),d0
		bhs.s	.nosaw03y
		addi.w	#$100,d0
		cmp.w	obY(a0),d0
		blo.s	.nosaw03y
		move.b	#1,saw_here(a0)
		move.w	#$600,obVelX(a0) ; move object to the right
		move.b	#$A2,obColType(a0)
		move.b	#2,obFrame(a0)
		playsound sfx_Saw,sfx

.nosaw03x:
		addq.l	#4,sp

.nosaw03y:
		rts
; ===========================================================================

.here03:
		jsr	(SpeedToPos).l
		move.w	obX(a0),saw_origX(a0)
		subq.b	#1,obTimeFrame(a0)
		bpl.s	.sameframe03
		move.b	#2,obTimeFrame(a0)
		bchg	#0,obFrame(a0)

.sameframe03:
		rts
; ===========================================================================

.type04:
		tst.b	saw_here(a0)
		bne.s	.here04
		move.w	(v_player+obX).w,d0
		addi.w	#$E0,d0
		sub.w	obX(a0),d0
		bcc.s	.nosaw04x
		move.w	(v_player+obY).w,d0
		subi.w	#$80,d0
		cmp.w	obY(a0),d0
		bhs.s	.nosaw04y
		addi.w	#$100,d0
		cmp.w	obY(a0),d0
		blo.s	.nosaw04y
		move.b	#1,saw_here(a0)
		move.w	#-$600,obVelX(a0) ; move object to the left
		move.b	#$A2,obColType(a0)
		move.b	#2,obFrame(a0)
		playsound sfx_Saw,sfx

.nosaw04x:
		addq.l	#4,sp

.nosaw04y:
		rts
; ===========================================================================

.here04:
		jsr	(SpeedToPos).l
		move.w	obX(a0),saw_origX(a0)
		subq.b	#1,obTimeFrame(a0)
		bpl.s	.sameframe04
		move.b	#2,obTimeFrame(a0)
		bchg	#0,obFrame(a0)

.sameframe04:
		rts
