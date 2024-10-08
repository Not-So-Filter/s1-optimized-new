; ---------------------------------------------------------------------------
; Pattern load cues
; ---------------------------------------------------------------------------
ArtLoadCues:

ptr_PLC_Main:		dc.w PLC_Main-ArtLoadCues
ptr_PLC_Main2:		dc.w PLC_Main2-ArtLoadCues
ptr_PLC_Explode:	dc.w PLC_Explode-ArtLoadCues
ptr_PLC_GameOver:	dc.w PLC_GameOver-ArtLoadCues
PLC_Levels:
ptr_PLC_GHZ:		dc.w PLC_GHZ-ArtLoadCues
ptr_PLC_GHZ2:		dc.w PLC_GHZ2-ArtLoadCues
ptr_PLC_LZ:		dc.w PLC_LZ-ArtLoadCues
ptr_PLC_LZ2:		dc.w PLC_LZ2-ArtLoadCues
ptr_PLC_MZ:		dc.w PLC_MZ-ArtLoadCues
ptr_PLC_MZ2:		dc.w PLC_MZ2-ArtLoadCues
ptr_PLC_SLZ:		dc.w PLC_SLZ-ArtLoadCues
ptr_PLC_SLZ2:		dc.w PLC_SLZ2-ArtLoadCues
ptr_PLC_SYZ:		dc.w PLC_SYZ-ArtLoadCues
ptr_PLC_SYZ2:		dc.w PLC_SYZ2-ArtLoadCues
ptr_PLC_SBZ:		dc.w PLC_SBZ-ArtLoadCues
ptr_PLC_SBZ2:		dc.w PLC_SBZ2-ArtLoadCues
			zonewarning PLC_Levels,4
ptr_PLC_TitleCard:	dc.w PLC_TitleCard-ArtLoadCues
ptr_PLC_Boss:		dc.w PLC_Boss-ArtLoadCues
ptr_PLC_Signpost:	dc.w PLC_Signpost-ArtLoadCues
PLC_Animals:
ptr_PLC_GHZAnimals:	dc.w PLC_GHZAnimals-ArtLoadCues
ptr_PLC_LZAnimals:	dc.w PLC_LZAnimals-ArtLoadCues
ptr_PLC_MZAnimals:	dc.w PLC_MZAnimals-ArtLoadCues
ptr_PLC_SLZAnimals:	dc.w PLC_SLZAnimals-ArtLoadCues
ptr_PLC_SYZAnimals:	dc.w PLC_SYZAnimals-ArtLoadCues
ptr_PLC_SBZAnimals:	dc.w PLC_SBZAnimals-ArtLoadCues
			zonewarning PLC_Animals,2
ptr_PLC_EggmanSBZ2:	dc.w PLC_EggmanSBZ2-ArtLoadCues
ptr_PLC_FZBoss:		dc.w PLC_FZBoss-ArtLoadCues

plcm:	macro gfx,vram
	dc.l gfx
	dc.w tiles_to_bytes(vram)
	endm

; ---------------------------------------------------------------------------
; Pattern load cues - standard block 1
; ---------------------------------------------------------------------------
PLC_Main:	dc.w ((PLC_Mainend-PLC_Main)/6)-1
		plcm	KosPM_Lamp,   ArtTile_Lamppost      ; lamppost
		plcm	KosPM_Hud,    ArtTile_HUD           ; HUD
		plcm	KosPM_Lives,  ArtTile_Lives_Counter ; lives counter
		plcm	KosPM_Ring,   ArtTile_Ring          ; rings
		plcm	KosPM_Points, ArtTile_Points        ; points from enemy
PLC_Mainend:
; ---------------------------------------------------------------------------
; Pattern load cues - standard block 2
; ---------------------------------------------------------------------------
PLC_Main2:	dc.w ((PLC_Main2end-PLC_Main2)/6)-1
		plcm	KosPM_Monitors, ArtTile_Monitor       ; monitors
		plcm	KosPM_Shield,   ArtTile_Shield        ; shield
		plcm	KosPM_Stars,    ArtTile_Invincibility ; invincibility stars
PLC_Main2end:
; ---------------------------------------------------------------------------
; Pattern load cues - explosion
; ---------------------------------------------------------------------------
PLC_Explode:	dc.w ((PLC_Explodeend-PLC_Explode)/6)-1
		plcm	KosPM_Explode, ArtTile_Explosion ; explosion
PLC_Explodeend:
; ---------------------------------------------------------------------------
; Pattern load cues - game/time	over
; ---------------------------------------------------------------------------
PLC_GameOver:	dc.w ((PLC_GameOverend-PLC_GameOver)/6)-1
		plcm	KosPM_GameOver, ArtTile_Game_Over ; game/time over
PLC_GameOverend:
; ---------------------------------------------------------------------------
; Pattern load cues - Green Hill
; ---------------------------------------------------------------------------
PLC_GHZ:	dc.w ((PLC_GHZ2-PLC_GHZ)/6)-1
		plcm	KosPM_Stalk,     ArtTile_GHZ_Flower_Stalk       ; flower stalk
		plcm	KosPM_PplRock,   ArtTile_GHZ_Purple_Rock        ; purple rock
		plcm	KosPM_Crabmeat,  ArtTile_Crabmeat               ; crabmeat enemy
		plcm	KosPM_Buzz,      ArtTile_Buzz_Bomber            ; buzz bomber enemy
		plcm	KosPM_Chopper,   ArtTile_Chopper                ; chopper enemy
		plcm	KosPM_Newtron,   ArtTile_Newtron                ; newtron enemy
		plcm	KosPM_Motobug,   ArtTile_Moto_Bug               ; motobug enemy
		plcm	KosPM_Spikes,    ArtTile_Spikes                 ; spikes
		plcm	KosPM_HSpring,   ArtTile_Spring_Horizontal      ; horizontal spring
		plcm	KosPM_VSpring,   ArtTile_Spring_Vertical        ; vertical spring

PLC_GHZ2:	dc.w ((PLC_GHZ2end-PLC_GHZ2)/6)-1
		plcm	KosPM_Swing,     ArtTile_GHZ_MZ_Swing           ; swinging platform
		plcm	KosPM_Bridge,    ArtTile_GHZ_Bridge             ; bridge
		plcm	KosPM_SpikePole, ArtTile_GHZ_Spike_Pole         ; spiked pole
		plcm	KosPM_Ball,      ArtTile_GHZ_Giant_Ball         ; giant ball
		plcm	KosPM_GhzWall1,  ArtTile_GHZ_SLZ_Smashable_Wall ; breakable wall
		plcm	KosPM_GhzWall2,  ArtTile_GHZ_Edge_Wall          ; normal wall
PLC_GHZ2end:
; ---------------------------------------------------------------------------
; Pattern load cues - Labyrinth
; ---------------------------------------------------------------------------
PLC_LZ:		dc.w ((PLC_LZ2-PLC_LZ)/6)-1
		plcm	KosPM_LzBlock1,    ArtTile_LZ_Block_1         ; block
		plcm	KosPM_LzBlock2,    ArtTile_LZ_Block_2         ; blocks
		plcm	KosPM_Splash,      ArtTile_LZ_Splash          ; waterfalls and splash
		plcm	KosPM_Water,       ArtTile_LZ_Water_Surface   ; water surface
		plcm	KosPM_LzSpikeBall, ArtTile_LZ_Spikeball_Chain ; spiked ball
		plcm	KosPM_FlapDoor,    ArtTile_LZ_Flapping_Door   ; flapping door
		plcm	KosPM_Bubbles,     ArtTile_LZ_Bubbles         ; bubbles and numbers
		plcm	KosPM_LzBlock3,    ArtTile_LZ_Moving_Block    ; block
		plcm	KosPM_LzDoor1,     ArtTile_LZ_Door            ; vertical door
		plcm	KosPM_Harpoon,     ArtTile_LZ_Harpoon         ; harpoon
		plcm	KosPM_Burrobot,    ArtTile_Burrobot           ; burrobot enemy

PLC_LZ2:	dc.w ((PLC_LZ2end-PLC_LZ2)/6)-1
		plcm	KosPM_LzPole,      ArtTile_LZ_Pole            ; pole that breaks
		plcm	KosPM_LzDoor2,     ArtTile_LZ_Blocks          ; large horizontal door
		plcm	KosPM_LzWheel,     ArtTile_LZ_Conveyor_Belt   ; wheel
		plcm	KosPM_Gargoyle,    ArtTile_LZ_Gargoyle        ; gargoyle head
		plcm	KosPM_LzPlatfm,    ArtTile_LZ_Rising_Platform ; rising platform
		plcm	KosPM_Orbinaut,    ArtTile_LZ_Orbinaut        ; orbinaut enemy
		plcm	KosPM_Jaws,        ArtTile_Jaws               ; jaws enemy
		plcm	KosPM_LzSwitch,    ArtTile_Button             ; switch
		plcm	KosPM_Cork,        ArtTile_LZ_Cork            ; cork block
		plcm	KosPM_Spikes,      ArtTile_Spikes             ; spikes
		plcm	KosPM_HSpring,     ArtTile_Spring_Horizontal  ; horizontal spring
		plcm	KosPM_VSpring,     ArtTile_Spring_Vertical    ; vertical spring
PLC_LZ2end:
; ---------------------------------------------------------------------------
; Pattern load cues - Marble
; ---------------------------------------------------------------------------
PLC_MZ:		dc.w ((PLC_MZ2-PLC_MZ)/6)-1
		plcm	KosPM_MzMetal,  ArtTile_MZ_Spike_Stomper   ; metal blocks
		plcm	KosPM_MzFire,   ArtTile_MZ_Fireball        ; fireballs
		plcm	KosPM_Swing,    ArtTile_GHZ_MZ_Swing       ; swinging platform
		plcm	KosPM_MzGlass,  ArtTile_MZ_Glass_Pillar    ; green glassy block
		plcm	KosPM_Lava,     ArtTile_MZ_Lava            ; lava
		plcm	KosPM_Buzz,     ArtTile_Buzz_Bomber        ; buzz bomber enemy
		plcm	KosPM_Basaran,  ArtTile_Basaran            ; basaran enemy
		plcm	KosPM_Cater,    ArtTile_MZ_SYZ_Caterkiller ; caterkiller enemy

PLC_MZ2:	dc.w ((PLC_MZ2end-PLC_MZ2)/6)-1
		plcm	KosPM_MzSwitch, ArtTile_Button+4           ; switch
		plcm	KosPM_Spikes,   ArtTile_Spikes             ; spikes
		plcm	KosPM_HSpring,  ArtTile_Spring_Horizontal  ; horizontal spring
		plcm	KosPM_VSpring,  ArtTile_Spring_Vertical    ; vertical spring
		plcm	KosPM_MzBlock,  ArtTile_MZ_Block           ; green stone block
PLC_MZ2end:
; ---------------------------------------------------------------------------
; Pattern load cues - Star Light
; ---------------------------------------------------------------------------
PLC_SLZ:	dc.w ((PLC_SLZ2-PLC_SLZ)/6)-1
		plcm	KosPM_Bomb,      ArtTile_Bomb                     ; bomb enemy
		plcm	KosPM_Orbinaut,  ArtTile_SLZ_Orbinaut             ; orbinaut enemy
		plcm	KosPM_MzFire,    ArtTile_SLZ_Fireball             ; fireballs
		plcm	KosPM_SlzBlock,  ArtTile_SLZ_Collapsing_Floor     ; block
		plcm	KosPM_SlzWall,   ArtTile_GHZ_SLZ_Smashable_Wall+4 ; breakable wall
		plcm	KosPM_Spikes,    ArtTile_Spikes                   ; spikes
		plcm	KosPM_HSpring,   ArtTile_Spring_Horizontal        ; horizontal spring
		plcm	KosPM_VSpring,   ArtTile_Spring_Vertical          ; vertical spring

PLC_SLZ2:	dc.w ((PLC_SLZ2end-PLC_SLZ2)/6)-1
		plcm	KosPM_Seesaw,    ArtTile_SLZ_Seesaw                ; seesaw
		plcm	KosPM_Fan,       ArtTile_SLZ_Fan                   ; fan
		plcm	KosPM_Pylon,     ArtTile_SLZ_Pylon                 ; foreground pylon
		plcm	KosPM_SlzSwing,  ArtTile_SLZ_Swing                 ; swinging platform
		plcm	KosPM_SlzCannon, ArtTile_SLZ_Fireball_Launcher     ; fireball launcher
		plcm	KosPM_SlzSpike,  ArtTile_SLZ_Spikeball             ; spikeball
PLC_SLZ2end:
; ---------------------------------------------------------------------------
; Pattern load cues - Spring Yard
; ---------------------------------------------------------------------------
PLC_SYZ:	dc.w ((PLC_SYZ2-PLC_SYZ)/6)-1
		plcm	KosPM_Crabmeat,  ArtTile_Crabmeat            ; crabmeat enemy
		plcm	KosPM_Buzz,      ArtTile_Buzz_Bomber         ; buzz bomber enemy
		plcm	KosPM_Yadrin,    ArtTile_Yadrin              ; yadrin enemy
		plcm	KosPM_Roller,    ArtTile_Roller              ; roller enemy

PLC_SYZ2:	dc.w ((PLC_SYZ2end-PLC_SYZ2)/6)-1
		plcm	KosPM_Bumper,    ArtTile_SYZ_Bumper          ; bumper
		plcm	KosPM_SyzSpike1, ArtTile_SYZ_Big_Spikeball   ; large spikeball
		plcm	KosPM_SyzSpike2, ArtTile_SYZ_Spikeball_Chain ; small spikeball
		plcm	KosPM_LzSwitch,  ArtTile_Button              ; switch
		plcm	KosPM_Spikes,    ArtTile_Spikes              ; spikes
		plcm	KosPM_HSpring,   ArtTile_Spring_Horizontal   ; horizontal spring
		plcm	KosPM_VSpring,   ArtTile_Spring_Vertical     ; vertical spring
PLC_SYZ2end:
; ---------------------------------------------------------------------------
; Pattern load cues - Scrap Brain
; ---------------------------------------------------------------------------
PLC_SBZ:	dc.w ((PLC_SBZ2-PLC_SBZ)/6)-1
		plcm	KosPM_Stomper,   ArtTile_SBZ_Moving_Block_Short  ; moving platform and stomper
		plcm	KosPM_SbzDoor1,  ArtTile_SBZ_Door                ; door
		plcm	KosPM_Girder,    ArtTile_SBZ_Girder              ; girder
		plcm	KosPM_BallHog,   ArtTile_Ball_Hog                ; ball hog enemy
		plcm	KosPM_SbzWheel1, ArtTile_SBZ_Disc                ; spot on large wheel
		plcm	KosPM_SbzWheel2, ArtTile_SBZ_Junction            ; wheel that grabs Sonic
		plcm	KosPM_SyzSpike1, ArtTile_SBZ_Swing               ; large spikeball
		plcm	KosPM_Cutter,    ArtTile_SBZ_Saw                 ; pizza cutter
		plcm	KosPM_FlamePipe, ArtTile_SBZ_Flamethrower        ; flaming pipe
		plcm	KosPM_SbzFloor,  ArtTile_SBZ_Collapsing_Floor    ; collapsing floor
		plcm	KosPM_SbzBlock,  ArtTile_SBZ_Vanishing_Block     ; vanishing block

PLC_SBZ2:	dc.w ((PLC_SBZ2end-PLC_SBZ2)/6)-1
		plcm	KosPM_Cater,      ArtTile_SBZ_Caterkiller        ; caterkiller enemy
		plcm	KosPM_Bomb,       ArtTile_Bomb                   ; bomb enemy
		plcm	KosPM_Orbinaut,   ArtTile_SBZ_Orbinaut           ; orbinaut enemy
		plcm	KosPM_SlideFloor, ArtTile_SBZ_Moving_Block_Long  ; floor that slides away
		plcm	KosPM_SbzDoor2,   ArtTile_SBZ_Horizontal_Door    ; horizontal door
		plcm	KosPM_Electric,   ArtTile_SBZ_Electric_Orb       ; electric orb
		plcm	KosPM_TrapDoor,   ArtTile_SBZ_Trap_Door          ; trapdoor
		plcm	KosPM_SbzFloor,   ArtTile_SBZ_Collapsing_Floor+4 ; collapsing floor
		plcm	KosPM_SpinPform,  ArtTile_SBZ_Spinning_Platform  ; small spinning platform
		plcm	KosPM_LzSwitch,   ArtTile_Button                 ; switch
		plcm	KosPM_Spikes,     ArtTile_Spikes                 ; spikes
		plcm	KosPM_HSpring,    ArtTile_Spring_Horizontal      ; horizontal spring
		plcm	KosPM_VSpring,    ArtTile_Spring_Vertical        ; vertical spring
PLC_SBZ2end:
; ---------------------------------------------------------------------------
; Pattern load cues - title card
; ---------------------------------------------------------------------------
PLC_TitleCard:	dc.w ((PLC_TitleCardend-PLC_TitleCard)/6)-1
		plcm	KosPM_TitleCard, ArtTile_Title_Card
PLC_TitleCardend:
; ---------------------------------------------------------------------------
; Pattern load cues - act 3 boss
; ---------------------------------------------------------------------------
PLC_Boss:	dc.w ((PLC_Bossend-PLC_Boss)/6)-1
		plcm	KosPM_Eggman,   ArtTile_Eggman           ; Eggman main patterns
		plcm	KosPM_Weapons,  ArtTile_Eggman_Weapons   ; Eggman's weapons
		plcm	KosPM_Prison,   ArtTile_Prison_Capsule   ; prison capsule
		plcm	KosPM_SlzSpike, ArtTile_Eggman_Spikeball ; spikeball (SLZ boss)
		plcm	KosPM_Exhaust,  ArtTile_Eggman_Exhaust   ; exhaust flame
PLC_Bossend:
; ---------------------------------------------------------------------------
; Pattern load cues - act 1/2 signpost
; ---------------------------------------------------------------------------
PLC_Signpost:	dc.w ((PLC_Signpostend-PLC_Signpost)/6)-1
		plcm	KosPM_SignPost, ArtTile_Signpost         ; signpost
		plcm	KosPM_Bonus,    ArtTile_Hidden_Points    ; hidden bonus points
		plcm	KosPM_BigFlash, ArtTile_Giant_Ring_Flash ; giant ring flash effect
PLC_Signpostend:
; ---------------------------------------------------------------------------
; Pattern load cues - GHZ animals
; ---------------------------------------------------------------------------
PLC_GHZAnimals:	dc.w ((PLC_GHZAnimalsend-PLC_GHZAnimals)/6)-1
		plcm	KosPM_Rabbit, ArtTile_Animal_1 ; rabbit
		plcm	KosPM_Flicky, ArtTile_Animal_2 ; flicky
PLC_GHZAnimalsend:
; ---------------------------------------------------------------------------
; Pattern load cues - LZ animals
; ---------------------------------------------------------------------------
PLC_LZAnimals:	dc.w ((PLC_LZAnimalsend-PLC_LZAnimals)/6)-1
		plcm	KosPM_Penguin, ArtTile_Animal_1 ; penguin
		plcm	KosPM_Seal,    ArtTile_Animal_2 ; seal
PLC_LZAnimalsend:
; ---------------------------------------------------------------------------
; Pattern load cues - MZ animals
; ---------------------------------------------------------------------------
PLC_MZAnimals:	dc.w ((PLC_MZAnimalsend-PLC_MZAnimals)/6)-1
		plcm	KosPM_Squirrel, ArtTile_Animal_1 ; squirrel
		plcm	KosPM_Seal,     ArtTile_Animal_2 ; seal
PLC_MZAnimalsend:
; ---------------------------------------------------------------------------
; Pattern load cues - SLZ animals
; ---------------------------------------------------------------------------
PLC_SLZAnimals:	dc.w ((PLC_SLZAnimalsend-PLC_SLZAnimals)/6)-1
		plcm	KosPM_Pig,    ArtTile_Animal_1 ; pig
		plcm	KosPM_Flicky, ArtTile_Animal_2 ; flicky
PLC_SLZAnimalsend:
; ---------------------------------------------------------------------------
; Pattern load cues - SYZ animals
; ---------------------------------------------------------------------------
PLC_SYZAnimals:	dc.w ((PLC_SYZAnimalsend-PLC_SYZAnimals)/6)-1
		plcm	KosPM_Pig,     ArtTile_Animal_1 ; pig
		plcm	KosPM_Chicken, ArtTile_Animal_2 ; chicken
PLC_SYZAnimalsend:
; ---------------------------------------------------------------------------
; Pattern load cues - SBZ animals
; ---------------------------------------------------------------------------
PLC_SBZAnimals:	dc.w ((PLC_SBZAnimalsend-PLC_SBZAnimals)/6)-1
		plcm	KosPM_Rabbit,  ArtTile_Animal_1 ; rabbit
		plcm	KosPM_Chicken, ArtTile_Animal_2 ; chicken
PLC_SBZAnimalsend:
; ---------------------------------------------------------------------------
; Pattern load cues - Eggman on SBZ 2
; ---------------------------------------------------------------------------
PLC_EggmanSBZ2:	dc.w ((PLC_EggmanSBZ2end-PLC_EggmanSBZ2)/6)-1
		plcm	KosPM_SbzBlock,   ArtTile_Eggman_Trap_Floor ; block
		plcm	KosPM_Sbz2Eggman, ArtTile_Eggman            ; Eggman
		plcm	KosPM_LzSwitch,   ArtTile_Eggman_Button-4   ; switch
PLC_EggmanSBZ2end:
; ---------------------------------------------------------------------------
; Pattern load cues - final boss
; ---------------------------------------------------------------------------
PLC_FZBoss:	dc.w ((PLC_FZBossend-PLC_FZBoss)/6)-1
		plcm	KosPM_FzEggman,   ArtTile_FZ_Eggman_Fleeing    ; Eggman after boss
		plcm	KosPM_FzBoss,     ArtTile_FZ_Boss              ; FZ boss
		plcm	KosPM_Eggman,     ArtTile_Eggman               ; Eggman main patterns
		plcm	KosPM_Sbz2Eggman, ArtTile_FZ_Eggman_No_Vehicle ; Eggman without ship
		plcm	KosPM_Exhaust,    ArtTile_Eggman_Exhaust       ; exhaust flame
PLC_FZBossend:

; ---------------------------------------------------------------------------
; Pattern load cue IDs
; ---------------------------------------------------------------------------
plcid_Main:		equ (ptr_PLC_Main-ArtLoadCues)/2	; 0
plcid_Main2:		equ (ptr_PLC_Main2-ArtLoadCues)/2	; 1
plcid_Explode:		equ (ptr_PLC_Explode-ArtLoadCues)/2	; 2
plcid_GameOver:		equ (ptr_PLC_GameOver-ArtLoadCues)/2	; 3
plcid_GHZ:		equ (ptr_PLC_GHZ-ArtLoadCues)/2		; 4
plcid_GHZ2:		equ (ptr_PLC_GHZ2-ArtLoadCues)/2	; 5
plcid_LZ:		equ (ptr_PLC_LZ-ArtLoadCues)/2		; 6
plcid_LZ2:		equ (ptr_PLC_LZ2-ArtLoadCues)/2		; 7
plcid_MZ:		equ (ptr_PLC_MZ-ArtLoadCues)/2		; 8
plcid_MZ2:		equ (ptr_PLC_MZ2-ArtLoadCues)/2		; 9
plcid_SLZ:		equ (ptr_PLC_SLZ-ArtLoadCues)/2		; $A
plcid_SLZ2:		equ (ptr_PLC_SLZ2-ArtLoadCues)/2	; $B
plcid_SYZ:		equ (ptr_PLC_SYZ-ArtLoadCues)/2		; $C
plcid_SYZ2:		equ (ptr_PLC_SYZ2-ArtLoadCues)/2	; $D
plcid_SBZ:		equ (ptr_PLC_SBZ-ArtLoadCues)/2		; $E
plcid_SBZ2:		equ (ptr_PLC_SBZ2-ArtLoadCues)/2	; $F
plcid_TitleCard:	equ (ptr_PLC_TitleCard-ArtLoadCues)/2	; $10
plcid_Boss:		equ (ptr_PLC_Boss-ArtLoadCues)/2	; $11
plcid_Signpost:		equ (ptr_PLC_Signpost-ArtLoadCues)/2	; $12
plcid_GHZAnimals:	equ (ptr_PLC_GHZAnimals-ArtLoadCues)/2	; $13
plcid_LZAnimals:	equ (ptr_PLC_LZAnimals-ArtLoadCues)/2	; $14
plcid_MZAnimals:	equ (ptr_PLC_MZAnimals-ArtLoadCues)/2	; $15
plcid_SLZAnimals:	equ (ptr_PLC_SLZAnimals-ArtLoadCues)/2	; $16
plcid_SYZAnimals:	equ (ptr_PLC_SYZAnimals-ArtLoadCues)/2	; $17
plcid_SBZAnimals:	equ (ptr_PLC_SBZAnimals-ArtLoadCues)/2	; $18
plcid_EggmanSBZ2:	equ (ptr_PLC_EggmanSBZ2-ArtLoadCues)/2	; $19
plcid_FZBoss:		equ (ptr_PLC_FZBoss-ArtLoadCues)/2	; $1A
