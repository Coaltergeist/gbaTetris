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
	bx	lr
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L3
	sub	sp, sp, #8
	ldr	r3, .L3+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L3+8
	mov	r6, #255
	mov	r0, #14
	mov	r1, #44
	mov	r2, #132
	mov	r3, #72
	mov	r5, #246
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
	mov	r0, #30
	mov	r1, #140
	mov	r2, #60
	mov	r3, #66
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	bgBitmap
	.word	drawFullscreenImage4
	.word	drawRect4
	.size	drawGame, .-drawGame
	.align	2
	.global	initPieces
	.type	initPieces, %function
initPieces:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L24
	ldr	r8, .L24+4
	ldr	fp, .L24+8
	add	r9, r4, #4800
	mov	r6, #0
	mov	r5, #6
	mov	r7, #12
	mov	sl, #18
.L15:
	mov	lr, pc
	bx	r8
	ldr	r1, .L24+12
	smull	r3, r2, r1, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #1
	str	r0, [r4, #-4]
	mov	lr, pc
	bx	r8
	smull	r1, r2, fp, r0
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, asl #3
	rsb	r0, r3, r0
	add	r3, r0, #1
	str	r3, [r4, #-8]
	str	r6, [r4, #0]
	str	r6, [r4, #4]
	cmp	r0, #6
	ldrls	pc, [pc, r0, asl #2]
	b	.L6
.L14:
	.word	.L7
	.word	.L16
	.word	.L17
	.word	.L18
	.word	.L19
	.word	.L20
	.word	.L21
.L21:
	ldr	r3, [r4, #-4]
.L13:
	add	r2, r3, #6
	str	r6, [r4, #8]
	str	r3, [r4, #12]
	str	r5, [r4, #16]
	str	r7, [r4, #20]
	str	r5, [r4, #24]
	str	r2, [r4, #28]
	str	r5, [r4, #32]
	str	r7, [r4, #36]
.L6:
	add	r4, r4, #48
	cmp	r4, r9
	bne	.L15
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L20:
	ldr	r3, [r4, #-4]
.L12:
	add	r2, r3, #6
	str	r6, [r4, #8]
	str	r2, [r4, #12]
	str	r5, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r3, [r4, #28]
	str	r5, [r4, #32]
	str	sl, [r4, #36]
	b	.L13
.L19:
	ldr	r3, [r4, #-4]
.L11:
	add	r2, r3, #6
	str	r6, [r4, #8]
	str	r2, [r4, #12]
	str	r5, [r4, #16]
	str	r7, [r4, #20]
	str	r5, [r4, #24]
	str	r3, [r4, #28]
	str	r5, [r4, #32]
	str	r7, [r4, #36]
	b	.L12
.L18:
	ldr	r3, [r4, #-4]
.L10:
	str	r6, [r4, #8]
	str	r3, [r4, #12]
	str	r7, [r4, #16]
	str	r7, [r4, #20]
	b	.L11
.L17:
	ldr	r3, [r4, #-4]
.L9:
	add	r2, r3, #12
	str	r6, [r4, #8]
	str	r2, [r4, #12]
	str	r5, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r3, [r4, #28]
	str	r5, [r4, #32]
	str	sl, [r4, #36]
	b	.L10
.L16:
	ldr	r3, [r4, #-4]
.L8:
	str	r6, [r4, #8]
	str	r3, [r4, #12]
	str	r5, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r3, [r4, #28]
	str	r5, [r4, #32]
	str	sl, [r4, #36]
	b	.L9
.L7:
	ldr	r3, [r4, #-4]
	mov	r2, #24
	str	r6, [r4, #8]
	str	r3, [r4, #12]
	str	r5, [r4, #16]
	str	r2, [r4, #20]
	b	.L8
.L25:
	.align	2
.L24:
	.word	pieces+8
	.word	rand
	.word	-1840700269
	.word	1717986919
	.size	initPieces, .-initPieces
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	initPieces
	.size	initGame, .-initGame
	.align	2
	.global	drawPiece
	.type	drawPiece, %function
drawPiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #12]
	cmp	r3, #0
	mov	r4, r0
	beq	.L27
	ldr	r0, [r0, #16]
	add	r1, r4, #20
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	mov	r6, #253
	ldr	r5, .L29
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
	add	r0, r4, #32
	ldmia	r0, {r0, r1, r2, r3}	@ phole ldm
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r5
.L27:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	drawRect4
	.size	drawPiece, .-drawPiece
	.align	2
	.global	updatePiece
	.type	updatePiece, %function
updatePiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updatePiece, .-updatePiece
	.comm	pieces,4800,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
