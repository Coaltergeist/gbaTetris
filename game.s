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
	.file	"game.c"
	.text
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldr	r1, .L11+4
	mov	r0, #0
	b	.L6
.L2:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L8
	ldr	r2, [r3, #36]
	ldr	ip, [r3, #20]
	add	r2, r2, #6
	cmp	r2, #113
	add	ip, ip, #6
	strgt	r0, [r3, #12]
	str	ip, [r3, #20]
	str	r2, [r3, #36]
	add	r3, r3, #52
	cmp	r3, r1
	beq	.L10
.L6:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L2
.L8:
	ldr	r2, [r3, #36]
	cmp	r2, #113
	strgt	r0, [r3, #12]
	add	r3, r3, #52
	cmp	r3, r1
	bne	.L6
.L10:
	bx	lr
.L12:
	.align	2
.L11:
	.word	pieces
	.word	pieces+5200
	.size	updateGame, .-updateGame
	.align	2
	.global	activatePieces
	.type	activatePieces, %function
activatePieces:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L19
	mov	r3, #0
	mov	r2, r0
	b	.L16
.L14:
	add	r3, r3, #1
	cmp	r3, #100
	add	r2, r2, #52
	beq	.L18
.L16:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	bne	.L14
	add	r2, r3, #1
	add	ip, r2, r2, asl #1
	add	r1, r3, r3, asl #1
	add	r3, r3, r1, asl #2
	add	r2, r2, ip, asl #2
	ldr	r2, [r0, r2, asl #2]
	add	r0, r0, r3, asl #2
	mov	r3, #1
	str	r3, [r0, #16]
	ldr	r3, .L19+4
	str	r2, [r3, #0]
	bx	lr
.L18:
	bx	lr
.L20:
	.align	2
.L19:
	.word	pieces
	.word	nextPiece
	.size	activatePieces, .-activatePieces
	.align	2
	.global	initPieces
	.type	initPieces, %function
initPieces:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L39
	ldr	r8, .L39+4
	ldr	fp, .L39+8
	mov	r6, #0
	mov	r9, #1
	mov	r5, #6
	mov	r7, #12
	mov	sl, #18
.L31:
	mov	lr, pc
	bx	r8
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #29
	add	r0, r0, r3
	and	r0, r0, #7
	rsb	r0, r3, r0
	add	r0, r0, r0, asl #1
	mov	r0, r0, asl #1
	stmda	r4, {r0, r6}	@ phole stm
	mov	lr, pc
	bx	r8
	smull	r3, r2, fp, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, asl #3
	rsb	r0, r3, r0
	add	r3, r0, #1
	str	r3, [r4, #-8]
	str	r9, [r4, #4]
	str	r6, [r4, #8]
	cmp	r0, #6
	ldrls	pc, [pc, r0, asl #2]
	b	.L22
.L30:
	.word	.L23
	.word	.L32
	.word	.L33
	.word	.L34
	.word	.L35
	.word	.L36
	.word	.L37
.L37:
	ldr	r3, [r4, #-4]
.L29:
	add	r2, r3, #6
	str	r6, [r4, #12]
	str	r3, [r4, #16]
	str	r5, [r4, #20]
	str	r7, [r4, #24]
	str	r5, [r4, #28]
	str	r2, [r4, #32]
	str	r5, [r4, #36]
	str	r7, [r4, #40]
.L22:
	ldr	r3, .L39+12
	add	r4, r4, #52
	cmp	r4, r3
	bne	.L31
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L36:
	ldr	r3, [r4, #-4]
.L28:
	add	r2, r3, #6
	str	r6, [r4, #12]
	str	r2, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	sl, [r4, #40]
	b	.L29
.L35:
	ldr	r3, [r4, #-4]
.L27:
	add	r2, r3, #6
	str	r6, [r4, #12]
	str	r2, [r4, #16]
	str	r5, [r4, #20]
	str	r7, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	r7, [r4, #40]
	b	.L28
.L34:
	ldr	r3, [r4, #-4]
.L26:
	str	r6, [r4, #12]
	str	r3, [r4, #16]
	str	r5, [r4, #20]
	str	r7, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	r7, [r4, #40]
	b	.L27
.L33:
	ldr	r3, [r4, #-4]
.L25:
	add	r2, r3, #12
	str	r6, [r4, #12]
	str	r2, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	sl, [r4, #40]
	b	.L26
.L32:
	ldr	r3, [r4, #-4]
.L24:
	str	r6, [r4, #12]
	str	r3, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	sl, [r4, #40]
	b	.L25
.L23:
	ldr	r3, [r4, #-4]
	mov	r2, #24
	str	r6, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	r2, [r4, #40]
	b	.L24
.L40:
	.align	2
.L39:
	.word	pieces+8
	.word	rand
	.word	-1840700269
	.word	pieces+5208
	.size	initPieces, .-initPieces
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	initPieces
	ldmfd	sp!, {r4, lr}
	b	activatePieces
	.size	initGame, .-initGame
	.align	2
	.global	drawPiece
	.type	drawPiece, %function
drawPiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r1, .L45
	sub	sp, sp, #8
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #8]
	mov	r4, r0
	smull	ip, r0, r1, r2
	smull	ip, r1, r3, r1
	sub	r0, r0, r2, asr #31
	sub	r1, r1, r3, asr #31
	add	r0, r0, r0, asl #1
	add	r1, r1, r1, asl #1
	sub	r2, r2, r0, asl #1
	sub	r3, r3, r1, asl #1
	orrs	r3, r2, r3
	bne	.L42
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L44
.L42:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L44:
	add	r0, r4, #20
	ldmia	r0, {r0, r1, r2, r3}	@ phole ldm
	mov	r6, #253
	add	r0, r0, #20
	add	r1, r1, #50
	ldr	r5, .L45+4
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #36
	ldmia	r0, {r0, r1, r2, r3}	@ phole ldm
	add	r0, r0, #20
	add	r1, r1, #50
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	b	.L42
.L46:
	.align	2
.L45:
	.word	715827883
	.word	drawRect4
	.size	drawPiece, .-drawPiece
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L50
	sub	sp, sp, #8
	ldr	r3, .L50+4
	mov	r6, #255
	mov	lr, pc
	bx	r3
	ldr	r4, .L50+8
	mov	r5, #246
	mov	r0, #14
	mov	r1, #44
	mov	r2, #132
	mov	r3, #72
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r0, #20
	mov	r1, #50
	mov	r2, #120
	mov	r3, #60
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	r0, #24
	mov	r1, #134
	mov	r2, #72
	mov	r3, #78
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r4
	str	r5, [sp, #0]
	mov	r0, #30
	mov	r1, #140
	mov	r2, #60
	mov	r3, #66
	ldr	r5, .L50+12
	mov	lr, pc
	bx	r4
	mov	r4, #0
.L48:
	add	r0, r4, r4, asl #1
	add	r0, r4, r0, asl #2
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	drawPiece
	cmp	r4, #100
	bne	.L48
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	bgBitmap
	.word	drawFullscreenImage4
	.word	drawRect4
	.word	pieces
	.size	drawGame, .-drawGame
	.align	2
	.global	updatePiece
	.type	updatePiece, %function
updatePiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [r0, #12]
	cmp	r3, #0
	bne	.L55
.L57:
	ldr	r3, [r0, #36]
	cmp	r3, #113
	movgt	r3, #0
	strgt	r3, [r0, #12]
	bx	lr
.L55:
	ldr	r3, [r0, #36]
	ldr	r2, [r0, #20]
	add	r3, r3, #6
	cmp	r3, #113
	add	r2, r2, #6
	str	r3, [r0, #36]
	movgt	r3, #0
	str	r2, [r0, #20]
	strgt	r3, [r0, #12]
	bx	lr
	.size	updatePiece, .-updatePiece
	.global	frameCount
	.comm	pieces,5200,4
	.comm	displayedPiece,52,4
	.comm	nextPiece,4,4
	.data
	.align	2
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.word	1
	.ident	"GCC: (devkitARM release 31) 4.5.0"
