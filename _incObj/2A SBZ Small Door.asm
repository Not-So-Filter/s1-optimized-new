; ---------------------------------------------------------------------------
; Object 2A - small vertical door (SBZ)
; ---------------------------------------------------------------------------

AutoDoor:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	ADoor_Index(pc,d0.w),d1
		jmp	ADoor_Index(pc,d1.w)
; ===========================================================================
ADoor_Index:	dc.w ADoor_Main-ADoor_Index
		dc.w ADoor_OpenShut-ADoor_Index
; ===========================================================================

ADoor_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.l	#Map_ADoor,obMap(a0)
		move.w	#make_art_tile(ArtTile_SBZ_Door,2,0),obGfx(a0)
		ori.b	#4,obRender(a0)
		move.b	#8,obActWid(a0)
		move.w	#4*$80,obPriority(a0)

ADoor_OpenShut:	; Routine 2
		moveq	#$40,d1		; set range for door detection
		clr.b	obAnim(a0)	; use "closing"	animation
		move.w	(v_player+obX).w,d0
		add.w	d1,d0
		cmp.w	obX(a0),d0
		blo.s	ADoor_Animate
		sub.w	d1,d0
		sub.w	d1,d0
		cmp.w	obX(a0),d0	; is Sonic > $40 pixels from door?
		bhs.s	ADoor_Animate	; close door
		add.w	d1,d0
		cmp.w	obX(a0),d0	; is Sonic left of the door?
		bhs.s	loc_899A	; if yes, branch
		btst	#0,obStatus(a0)
		bne.s	ADoor_Animate
		bra.s	ADoor_Open
; ===========================================================================

loc_899A:
		btst	#0,obStatus(a0)
		beq.s	ADoor_Animate

ADoor_Open:
		move.b	#1,obAnim(a0)	; use "opening"	animation

ADoor_Animate:
		lea	Ani_ADoor(pc),a1
		bsr.w	AnimateSprite
		tst.b	obFrame(a0)	; is the door open?
		bne.s	.remember	; if yes, branch
		moveq	#$11,d1
		moveq	#$20,d2
		moveq	#$21,d3
		move.w	obX(a0),d4
		bsr.w	SolidObject

.remember:
		out_of_range.w	DeleteObject_Respawn
		bra.w	DisplaySprite