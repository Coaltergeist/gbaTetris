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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r3, r1, r0, asl #4
	ldr	r0, .L7
	add	r3, r3, r3, lsr #31
	ldr	ip, [r0, #0]
	bic	r3, r3, #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	andne	r1, r1, #255
	andeq	r1, r1, #65280
	orrne	r2, r1, r2, asl #8
	orreq	r2, r1, r2
	strh	r2, [ip, r3]	@ movhi
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L10:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L10
	mov	r2, #67108864
.L12:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L12
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r3, [r3, #0]
	tst	r3, #16
	movne	r2, #100663296
	ldreq	r2, .L19
	ldrne	r1, .L19
	addne	r2, r2, #40960
	moveq	r1, #100663296
	strne	r2, [r1, #0]
	streq	r1, [r2, #0]
	eor	r3, r3, #16
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L22
	stmfd	sp!, {r4, r5}
	ldr	ip, [ip, #4]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	mov	r5, #0
	str	r5, [r4, #8]
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	mov	r2, #83886080
	mov	r0, #3
	mov	r3, #256
	b	DMANow
	.size	loadPalette, .-loadPalette
	.align	2
	.global	drawFullscreenImage4
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L26
	ldr	r2, [r3, #0]
	mov	r1, r0
	mov	r3, #19200
	mov	r0, #3
	b	DMANow
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	drawFullscreenImage3
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldr	r2, [r3, #0]
	mov	r1, r0
	mov	r3, #38400
	mov	r0, #3
	b	DMANow
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	subs	sl, r2, #0
	ble	.L31
	add	r3, r3, r3, lsr #31
	mov	r8, r3, asr #1
	rsb	r0, r0, r0, asl #4
	ldr	r7, .L35
	ldr	r6, [sp, #32]
	add	r4, r1, r0, asl #4
	mov	r9, r8, asl #1
	mov	r5, #0
.L33:
	add	r3, r4, r4, lsr #31
	ldr	r2, [r7, #0]
	bic	r3, r3, #1
	mov	r1, r6
	add	r2, r2, r3
	mov	r0, #3
	mov	r3, r8
	add	r5, r5, #1
	bl	DMANow
	cmp	sl, r5
	add	r4, r4, #240
	add	r6, r6, r9
	bgt	.L33
.L31:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	subs	sl, r2, #0
	mov	r8, r3
	ble	.L37
	rsb	r0, r0, r0, asl #4
	add	r6, r1, r0, asl #4
	ldr	r7, .L41
	ldr	r5, [sp, #32]
	mov	r6, r6, asl #1
	mov	r9, r3, asl #1
	mov	r4, #0
.L39:
	ldr	r2, [r7, #0]
	mov	r1, r5
	add	r2, r2, r6
	mov	r0, #3
	mov	r3, r8
	add	r4, r4, #1
	bl	DMANow
	cmp	sl, r4
	add	r6, r6, #480
	add	r5, r5, r9
	bgt	.L39
.L37:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	add	r1, sp, #16
	orr	r3, r3, r2, asl #8
	ldr	r2, .L44
	strh	r3, [r1, #-2]!	@ movhi
	mov	r3, #16777216
	mov	r0, #3
	ldr	r2, [r2, #0]
	add	r3, r3, #19200
	bl	DMANow
	add	sp, sp, #20
	ldr	lr, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r2, .L47
	sub	sp, sp, #12
	add	r1, sp, #8
	mov	r3, #16777216
	strh	r0, [r1, #-2]!	@ movhi
	ldr	r2, [r2, #0]
	mov	r0, #3
	add	r3, r3, #38400
	bl	DMANow
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #20
	ldrb	r4, [sp, #56]	@ zero_extendqisi2
	ldrb	ip, [sp, #56]	@ zero_extendqisi2
	cmp	r3, #1
	orr	ip, ip, r4, asl #8
	mov	fp, r3
	mov	r5, r0
	mov	r6, r1
	mov	r4, r2
	strh	ip, [sp, #14]	@ movhi
	beq	.L81
	cmp	r3, #2
	andne	sl, r1, #1
	beq	.L82
.L54:
	ands	r7, fp, #1
	bne	.L56
	cmp	sl, #0
	bne	.L83
	cmp	r4, #0
	ble	.L49
	add	fp, fp, fp, lsr #31
	mov	r8, fp, asr #1
	rsb	r5, r5, r5, asl #4
	ldr	r7, .L85
	orr	r8, r8, #16777216
	add	r6, r6, r5, asl #4
	add	r9, sp, #14
.L59:
	add	r3, r6, r6, lsr #31
	ldr	r2, [r7, #0]
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	mov	r1, r9
	mov	r3, r8
	add	sl, sl, #1
	bl	DMANow
	cmp	r4, sl
	add	r6, r6, #240
	bgt	.L59
.L49:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L56:
	cmp	sl, #0
	bne	.L84
	cmp	r4, #0
	ble	.L49
	sub	r3, fp, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	orr	r3, r3, #16777216
	rsb	r8, r5, r5, asl #4
	ldr	r7, .L85
	str	r3, [sp, #4]
	add	r8, r6, r8, asl #4
	add	r9, sp, #14
.L65:
	add	r3, r8, r8, lsr #31
	ldr	r2, [r7, #0]
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	mov	r1, r9
	ldr	r3, [sp, #4]
	add	sl, sl, #1
	bl	DMANow
	cmp	r4, sl
	add	r8, r8, #240
	bgt	.L65
	sub	r6, r6, #1
	add	fp, r6, fp
	mov	r6, #0
.L66:
	add	r0, r6, r5
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r1, fp
	add	r6, r6, #1
	bl	setPixel4
	cmp	r4, r6
	bgt	.L66
	b	.L49
.L81:
	cmp	r2, #0
	ble	.L49
	mov	r7, #0
.L52:
	add	r0, r7, r5
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r1, r6
	add	r7, r7, #1
	bl	setPixel4
	cmp	r4, r7
	bgt	.L52
	b	.L49
.L82:
	ands	sl, r1, #1
	beq	.L54
	cmp	r2, #0
	movgt	r7, #0
	addgt	sl, r1, #1
	ble	.L49
.L69:
	add	r8, r7, r5
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r0, r8
	mov	r1, r6
	bl	setPixel4
	add	r7, r7, #1
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r0, r8
	mov	r1, sl
	bl	setPixel4
	cmp	r4, r7
	bgt	.L69
	b	.L49
.L83:
	cmp	r4, #0
	ble	.L49
.L60:
	add	r0, r7, r5
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r1, r6
	add	r7, r7, #1
	bl	setPixel4
	cmp	r4, r7
	bgt	.L60
	sub	r3, fp, #2
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	rsb	r8, r5, r5, asl #4
	orr	r3, r3, #16777216
	add	r8, r6, r8, asl #4
	ldr	r7, .L85
	str	r3, [sp, #4]
	add	r8, r8, #1
	mov	sl, #0
	add	r9, sp, #14
.L61:
	add	r3, r8, r8, lsr #31
	ldr	r2, [r7, #0]
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	mov	r1, r9
	ldr	r3, [sp, #4]
	add	sl, sl, #1
	bl	DMANow
	cmp	r4, sl
	add	r8, r8, #240
	bgt	.L61
	sub	r6, r6, #1
	add	fp, r6, fp
	mov	r6, #0
.L62:
	add	r0, r6, r5
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r1, fp
	add	r6, r6, #1
	bl	setPixel4
	cmp	r4, r6
	bgt	.L62
	b	.L49
.L84:
	cmp	r4, #0
	movgt	r7, #0
	ble	.L49
.L67:
	add	r0, r7, r5
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r1, r6
	add	r7, r7, #1
	bl	setPixel4
	cmp	r4, r7
	bgt	.L67
	sub	fp, fp, #1
	add	fp, fp, fp, lsr #31
	rsb	r5, r5, r5, asl #4
	add	r5, r6, r5, asl #4
	mov	r8, fp, asr #1
	ldr	r7, .L85
	orr	r8, r8, #16777216
	add	r5, r5, #1
	mov	r6, #0
	add	r9, sp, #14
.L68:
	add	r3, r5, r5, lsr #31
	ldr	r2, [r7, #0]
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	mov	r1, r9
	mov	r3, r8
	add	r6, r6, #1
	bl	DMANow
	cmp	r4, r6
	add	r5, r5, #240
	bgt	.L68
	b	.L49
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	subs	r8, r2, #0
	ble	.L87
	rsb	r0, r0, r0, asl #4
	add	r5, r1, r0, asl #4
	ldr	r7, .L91
	orr	sl, r3, #16777216
	mov	r5, r5, asl #1
	mov	r4, #0
	add	r6, sp, #32
.L89:
	ldr	r2, [r7, #0]
	mov	r0, #3
	add	r2, r2, r5
	mov	r1, r6
	mov	r3, sl
	add	r4, r4, #1
	bl	DMANow
	cmp	r8, r4
	add	r5, r5, #480
	bgt	.L89
.L87:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	ip, [sp, #8]
	ldr	r5, [sp, #16]
	sub	r4, ip, #1
	add	r4, r4, r5
	cmp	r4, r0
	ldr	r4, [sp, #12]
	ble	.L97
	sub	r0, r0, #1
	add	r2, r0, r2
	cmp	ip, r2
	blt	.L98
.L97:
	mov	r0, #0
.L94:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L98:
	ldr	r2, [sp, #20]
	sub	r0, r4, #1
	add	r2, r0, r2
	cmp	r2, r1
	ble	.L97
	sub	r0, r1, #1
	add	r0, r0, r3
	cmp	r4, r0
	movge	r0, #0
	movlt	r0, #1
	b	.L94
	.size	collision, .-collision
	.global	videoBuffer
	.global	dma
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 31) 4.5.0"
