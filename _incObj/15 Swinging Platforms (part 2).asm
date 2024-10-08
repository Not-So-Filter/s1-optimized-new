; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Swing_Move:
		move.b	(v_oscillate+$1A).w,d0
		btst	#0,obStatus(a0)
		beq.s	Swing_Move2
		neg.w	d0
		addi.w	#$80,d0
		bra.s	Swing_Move2
; End of function Swing_Move


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Obj48_Move:
		tst.b	objoff_3D(a0)
		bne.s	loc_7B9C
		move.w	objoff_3E(a0),d0
		addq.w	#8,d0
		move.w	d0,objoff_3E(a0)
		add.w	d0,obAngle(a0)
		cmpi.w	#$200,d0
		bne.s	loc_7BB6
		move.b	#1,objoff_3D(a0)
		bra.s	loc_7BB6
; ===========================================================================

loc_7B9C:
		move.w	objoff_3E(a0),d0
		subq.w	#8,d0
		move.w	d0,objoff_3E(a0)
		add.w	d0,obAngle(a0)
		cmpi.w	#-$200,d0
		bne.s	loc_7BB6
		move.b	#0,objoff_3D(a0)

loc_7BB6:
		move.b	obAngle(a0),d0
; End of function Obj48_Move


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Swing_Move2:
		bsr.w	CalcSine
		move.w	objoff_38(a0),d2
		move.w	objoff_3A(a0),d3
		lea	obSubtype(a0),a2
		moveq	#0,d6
		move.b	(a2)+,d6

loc_7BCE:
		moveq	#0,d4
		move.b	(a2)+,d4
	if object_size=$40
		lsl.w	#object_size_bits,d4
	else
		mulu.w	#object_size,d4
	endif
		addi.l	#v_objspace,d4
		movea.l	d4,a1
		moveq	#0,d4
		move.b	objoff_3C(a1),d4
		move.l	d4,d5
		muls.w	d0,d4
		asr.l	#8,d4
		muls.w	d1,d5
		asr.l	#8,d5
		add.w	d2,d4
		add.w	d3,d5
		move.w	d4,obY(a1)
		move.w	d5,obX(a1)
		dbf	d6,loc_7BCE
		rts
; End of function Swing_Move2

; ===========================================================================

Swing_ChkDel:
		out_of_range.s	Swing_DelAll,objoff_3A(a0)

Swing_Display:	; Routine $A
		bra.w	DisplaySprite
; ===========================================================================

Swing_DelAll:
		moveq	#0,d2
		lea	obSubtype(a0),a2
		move.b	(a2)+,d2

Swing_DelLoop:
		moveq	#0,d0
		move.b	(a2)+,d0
	if object_size=$40
		lsl.w	#object_size_bits,d0
	else
		mulu.w	#object_size,d0
	endif
		addi.l	#v_objspace,d0
		movea.l	d0,a1
		bsr.w	DeleteChild
		dbf	d2,Swing_DelLoop ; repeat for length of	chain
		rts
; ===========================================================================

Swing_Delete:	; Routine 6, 8
		bra.w	DeleteObject