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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L2
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L2+8
	ldr	r3, .L2+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L2+24
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L2+28
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	bgPal
	.word	loadPalette
	.word	bgBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
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
	stmfd	sp!, {r4, lr}
	ldr	r4, .L9
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	str	r3, [r4, #0]
	ldr	r3, .L9+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L5
	ldr	r3, .L9+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L8
.L5:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L8:
	ldr	r0, [r4, #0]
	ldr	r3, .L9+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+20
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L9+24
	mov	lr, pc
	bx	r3
	b	.L5
.L10:
	.align	2
.L9:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	mov	r2, #1
	str	r2, [r3, #0]
	bx	lr
.L13:
	.align	2
.L12:
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
	mov	r0, #255
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	ldr	r2, .L15+4
	mov	r0, #77
	mov	r1, #105
	ldr	ip, .L15+8
	mov	r3, #247
	mov	lr, pc
	bx	ip
	ldr	r3, .L15+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+20
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	fillScreen4
	.word	.LC0
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
	ldr	r3, .L22
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L18
	ldr	r2, .L22+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L20
.L18:
	tst	r3, #4
	beq	.L17
	ldr	r3, .L22+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L21
.L17:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L20:
	ldr	r3, .L22+12
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L17
.L21:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L23:
	.align	2
.L22:
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
	mov	r0, #252
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	ldr	r2, .L25+4
	mov	r0, #77
	mov	r1, #111
	ldr	ip, .L25+8
	mov	r3, #247
	mov	lr, pc
	bx	ip
	ldr	r3, .L25+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+20
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	fillScreen4
	.word	.LC1
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
	ldr	r3, .L30
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L30+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L29
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L29:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L31:
	.align	2
.L30:
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
	mov	r0, #254
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	ldr	r2, .L33+4
	mov	r0, #77
	mov	r1, #108
	ldr	ip, .L33+8
	mov	r3, #247
	mov	lr, pc
	bx	ip
	ldr	r3, .L33+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+20
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	fillScreen4
	.word	.LC2
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
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L36
	ldr	r2, .L40+12
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L38
.L36:
	tst	r3, #2
	beq	.L35
	ldr	r3, .L40+12
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L39
.L35:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L39:
	ldmfd	sp!, {r4, lr}
	b	goToLose
.L38:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L41:
	.align	2
.L40:
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
	ldr	r3, .L45
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L42
	ldr	r3, .L45+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L44
.L42:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L44:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L46:
	.align	2
.L45:
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
	ldr	r4, .L59
	ldr	r7, .L59+4
	ldr	r6, .L59+8
	add	r5, r5, #256
.L58:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L49:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L49
.L55:
	.word	.L50
	.word	.L51
	.word	.L52
	.word	.L53
	.word	.L54
.L54:
	bl	lose
	b	.L58
.L53:
	bl	win
	b	.L58
.L52:
	bl	pause
	b	.L58
.L51:
	bl	game
	b	.L58
.L50:
	bl	start
	b	.L58
.L60:
	.align	2
.L59:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	seed,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Pause\000"
	.space	2
.LC1:
	.ascii	"Win\000"
.LC2:
	.ascii	"Lose\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"
