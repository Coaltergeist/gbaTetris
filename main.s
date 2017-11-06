	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	lr, .L5
	sub	sp, sp, #24
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr, #0]
	ldr	r0, .L5+4
	str	r3, [ip, #0]
	ldr	r3, .L5+8
	mov	lr, pc
	bx	r3
	mov	r3, #83886080
	mov	r1, r3
	add	r1, r1, #508
	add	r3, r3, #488
	add	r2, sp, #2
	add	r3, r3, #2
	add	r1, r1, #2
.L2:
	ldrh	r0, [r2, #2]!
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r1
	bne	.L2
	ldr	r0, .L5+12
	ldr	r4, .L5+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L5+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+24
	mov	lr, pc
	bx	r3
	ldr	r0, .L5+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L5+28
	mov	r3, #254
	mov	r0, #76
	mov	r1, #86
	ldr	ip, .L5+32
	mov	lr, pc
	bx	ip
	ldr	r2, .L5+36
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L5+40
	str	r3, [r2, #0]
	ldr	r3, .L5+44
	mov	r2, #1
	str	r2, [r3, #0]
	add	sp, sp, #24
	ldmfd	sp!, {r4, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.word	bgPal
	.word	loadPalette
	.word	bgBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	.LC0
	.word	drawString4
	.word	state
	.word	seed
	.word	frameCount
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1040
	add	r3, r3, #4
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	b	goToStart
	.size	initialize, .-initialize
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L14
	ldr	r3, [r5, #0]
	ldr	r4, .L14+4
	add	r3, r3, #1
	str	r3, [r5, #0]
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ble	.L9
	add	r3, r3, #1
	cmp	r3, #120
	str	r3, [r4, #0]
	bgt	.L12
.L10:
	ldr	r3, .L14+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L8
	ldr	r3, .L14+16
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L13
.L8:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L13:
	ldr	r0, [r5, #0]
	ldr	r3, .L14+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+24
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L14+28
	mov	lr, pc
	bx	r3
	b	.L8
.L9:
	sub	r3, r3, #1
	cmn	r3, #120
	str	r3, [r4, #0]
	bge	.L10
	ldr	r3, .L14+32
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [r4, #0]
	b	.L10
.L12:
	ldr	r3, .L14+32
	mov	lr, pc
	bx	r3
	mvn	r3, #0
	str	r3, [r4, #0]
	b	.L10
.L15:
	.align	2
.L14:
	.word	seed
	.word	frameCount
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.word	flipPage
	.size	start, .-start
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	mov	r2, #1
	str	r2, [r3, #0]
	bx	lr
.L18:
	.align	2
.L17:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #254
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	ldr	r2, .L20+4
	mov	r0, #77
	mov	r1, #105
	ldr	ip, .L20+8
	mov	r3, #246
	mov	lr, pc
	bx	ip
	ldr	r3, .L20+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+20
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	fillScreen4
	.word	.LC1
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L27
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L23
	ldr	r2, .L27+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L25
.L23:
	tst	r3, #4
	beq	.L22
	ldr	r3, .L27+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L26
.L22:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L25:
	ldr	r3, .L27+12
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L22
.L26:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L28:
	.align	2
.L27:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #251
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r2, .L30+4
	mov	r0, #77
	mov	r1, #111
	ldr	ip, .L30+8
	mov	r3, #246
	mov	lr, pc
	bx	ip
	ldr	r3, .L30+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+20
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	fillScreen4
	.word	.LC2
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L32
	ldr	r3, .L35+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L34
.L32:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L34:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #253
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	ldr	r2, .L38+4
	mov	r0, #77
	mov	r1, #108
	ldr	ip, .L38+8
	mov	r3, #246
	mov	lr, pc
	bx	ip
	ldr	r3, .L38+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+20
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	fillScreen4
	.word	.LC3
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+8
	ldr	r1, .L45+12
	ldr	r2, [r3, #0]
	ldr	r0, .L45+16
	ldr	r3, .L45+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+24
	mov	r0, #32
	mov	r1, #142
	ldr	r2, .L45+16
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+28
	ldr	ip, .L45+32
	ldmia	r3, {r0, r1}
	mov	r2, ip
	str	r0, [ip, #0]
	strh	r1, [ip, #4]	@ movhi
	mov	r0, #42
	mov	r1, #142
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+44
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L41
	ldr	r2, .L45+48
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L43
.L41:
	tst	r3, #2
	beq	.L40
	ldr	r3, .L45+48
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L44
.L40:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L44:
	ldmfd	sp!, {r4, lr}
	b	goToLose
.L43:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L46:
	.align	2
.L45:
	.word	updateGame
	.word	drawGame
	.word	score
	.word	.LC4
	.word	buffer1
	.word	sprintf
	.word	drawString4
	.word	.LC5
	.word	buffer2
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L50
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L47
	ldr	r3, .L50+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L49
.L47:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L49:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L51:
	.align	2
.L50:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r4, .L64
	ldr	r7, .L64+4
	ldr	r6, .L64+8
	add	r5, r5, #256
.L63:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L54:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L54
.L60:
	.word	.L55
	.word	.L56
	.word	.L57
	.word	.L58
	.word	.L59
.L59:
	bl	lose
	b	.L63
.L58:
	bl	win
	b	.L63
.L57:
	bl	pause
	b	.L63
.L56:
	bl	game
	b	.L63
.L55:
	bl	start
	b	.L63
.L65:
	.align	2
.L64:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	score,4,4
	.comm	state,4,4
	.comm	seed,4,4
	.comm	frameCount,4,4
	.comm	buffer1,41,4
	.comm	buffer2,41,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	C.17.3365, %object
	.size	C.17.3365, 20
C.17.3365:
	.short	0
	.short	32736
	.short	31744
	.short	383
	.short	1023
	.short	992
	.short	31767
	.short	31
	.short	32767
	.short	15855
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press Start\000"
.LC1:
	.ascii	"Pause\000"
	.space	2
.LC2:
	.ascii	"Win\000"
.LC3:
	.ascii	"Lose\000"
	.space	3
.LC4:
	.ascii	"Score: %d\000"
	.space	2
.LC5:
	.ascii	"Next:\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"
