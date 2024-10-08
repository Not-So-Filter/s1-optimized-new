; ---------------------------------------------------------------------------
; Object 0F - "PRESS START BUTTON" and "TM" from title screen
; ---------------------------------------------------------------------------

PSBTM:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	PSB_Index(pc,d0.w),d1
		jmp	PSB_Index(pc,d1.w)
; ===========================================================================
PSB_Index:	dc.w PSB_Main-PSB_Index
		dc.w PSB_PrsStart-PSB_Index
		dc.w PSB_Exit-PSB_Index
; ===========================================================================

PSB_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.w	#$D8,obX(a0)
		move.w	#$130,obScreenY(a0)
		move.l	#Map_PSB,obMap(a0)
		move.w	#make_art_tile(ArtTile_Title_Foreground,0,0),obGfx(a0)
		cmpi.b	#2,obFrame(a0)	; is object "PRESS START"?
		blo.s	PSB_PrsStart	; if yes, branch

		addq.b	#2,obRoutine(a0)
		cmpi.b	#3,obFrame(a0)	; is the object	"TM"?
		bne.s	PSB_Exit	; if not, branch

		move.w	#make_art_tile(ArtTile_Title_Trademark,1,0),obGfx(a0) ; "TM" specific code
		move.w	#$178,obX(a0)
		move.w	#$F8,obScreenY(a0)

PSB_Exit:	; Routine 4
		bra.w	DisplaySprite
; ===========================================================================

PSB_PrsStart:	; Routine 2
		lea	Ani_PSBTM(pc),a1
		bsr.w	AnimateSprite	; "PRESS START" is animated
		bra.w	DisplaySprite