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
	.global	__aeabi_i2d
	.global	__aeabi_dadd
	.global	__aeabi_d2iz
	.text
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L6
	ldr	r5, .L6+4
	ldr	r7, .L6+8
	ldr	r6, .L6+12
	ldr	r8, .L6+16
.L3:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L2
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r7
	mov	r3, #1065353216
	mov	r2, #0
	add	r3, r3, #3670016
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r8
	str	r0, [r4, #8]
.L2:
	add	r4, r4, #52
	cmp	r4, r5
	bne	.L3
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	pieces
	.word	pieces+5200
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.word	__aeabi_d2iz
	.size	updateGame, .-updateGame
	.align	2
	.global	initPieces
	.type	initPieces, %function
initPieces:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L26
	ldr	fp, .L26+4
	ldr	r8, .L26+8
	ldr	r9, .L26+12
	mov	r6, #0
	mov	r5, #6
	mov	r7, #12
	mov	sl, #18
.L18:
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
	smull	r2, r3, r9, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #2
	rsb	r3, r3, r3, asl #3
	rsb	r0, r3, r0
	add	r3, r0, #1
	str	r3, [r4, #-8]
	str	r6, [r4, #4]
	str	r6, [r4, #8]
	cmp	r0, #6
	ldrls	pc, [pc, r0, asl #2]
	b	.L9
.L17:
	.word	.L10
	.word	.L19
	.word	.L20
	.word	.L21
	.word	.L22
	.word	.L23
	.word	.L24
.L24:
	ldr	r3, [r4, #-4]
.L16:
	add	r2, r3, #6
	str	r6, [r4, #12]
	str	r3, [r4, #16]
	str	r5, [r4, #20]
	str	r7, [r4, #24]
	str	r5, [r4, #28]
	str	r2, [r4, #32]
	str	r5, [r4, #36]
	str	r7, [r4, #40]
.L9:
	add	r4, r4, #52
	cmp	r4, fp
	bne	.L18
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L23:
	ldr	r3, [r4, #-4]
.L15:
	add	r2, r3, #6
	str	r6, [r4, #12]
	str	r2, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	sl, [r4, #40]
	b	.L16
.L22:
	ldr	r3, [r4, #-4]
.L14:
	add	r2, r3, #6
	str	r6, [r4, #12]
	str	r2, [r4, #16]
	str	r5, [r4, #20]
	str	r7, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	r7, [r4, #40]
	b	.L15
.L21:
	ldr	r3, [r4, #-4]
.L13:
	str	r6, [r4, #12]
	str	r3, [r4, #16]
	str	r7, [r4, #20]
	str	r7, [r4, #24]
	b	.L14
.L20:
	ldr	r3, [r4, #-4]
.L12:
	add	r2, r3, #12
	str	r6, [r4, #12]
	str	r2, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	sl, [r4, #40]
	b	.L13
.L19:
	ldr	r3, [r4, #-4]
.L11:
	str	r6, [r4, #12]
	str	r3, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #32]
	str	r5, [r4, #36]
	str	sl, [r4, #40]
	b	.L12
.L10:
	ldr	r3, [r4, #-4]
	mov	r2, #24
	str	r6, [r4, #12]
	str	r3, [r4, #16]
	str	r5, [r4, #20]
	str	r2, [r4, #24]
	b	.L11
.L27:
	.align	2
.L26:
	.word	pieces+8
	.word	pieces+5208
	.word	rand
	.word	-1840700269
	.size	initPieces, .-initPieces
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	initPieces
	ldr	r0, .L33
	mov	r3, #0
	mov	r2, r0
	b	.L31
.L29:
	add	r3, r3, #1
	cmp	r3, #100
	add	r2, r2, #52
	beq	.L28
.L31:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	bne	.L29
	add	r2, r3, r3, asl #1
	add	r3, r3, r2, asl #2
	add	r0, r0, r3, asl #2
	mov	r3, #1
	str	r3, [r0, #16]
.L28:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	pieces
	.size	initGame, .-initGame
	.align	2
	.global	drawPiece
	.type	drawPiece, %function
drawPiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r1, .L38
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
	bne	.L35
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L37
.L35:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L37:
	add	r0, r4, #20
	ldmia	r0, {r0, r1, r2, r3}	@ phole ldm
	mov	r6, #253
	add	r0, r0, #20
	add	r1, r1, #50
	ldr	r5, .L38+4
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
	b	.L35
.L39:
	.align	2
.L38:
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
	ldr	r0, .L43
	sub	sp, sp, #8
	ldr	r3, .L43+4
	mov	r6, #255
	mov	lr, pc
	bx	r3
	ldr	r4, .L43+8
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
	ldr	r5, .L43+12
	mov	lr, pc
	bx	r4
	mov	r4, #0
.L41:
	add	r0, r4, r4, asl #1
	add	r0, r4, r0, asl #2
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	drawPiece
	cmp	r4, #100
	bne	.L41
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L44:
	.align	2
.L43:
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
	stmfd	sp!, {r4, lr}
	ldr	r3, [r0, #16]
	cmp	r3, #0
	mov	r4, r0
	beq	.L45
	ldr	r0, [r0, #8]
	ldr	r3, .L47
	mov	lr, pc
	bx	r3
	mov	r3, #1065353216
	mov	r2, #0
	add	r3, r3, #3670016
	ldr	ip, .L47+4
	mov	lr, pc
	bx	ip
	ldr	r3, .L47+8
	mov	lr, pc
	bx	r3
	str	r0, [r4, #8]
.L45:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.word	__aeabi_d2iz
	.size	updatePiece, .-updatePiece
	.comm	pieces,5200,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
