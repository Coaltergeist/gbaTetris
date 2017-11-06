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
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, .L5
	sub	sp, sp, #28
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldrh	lr, [lr, #0]
	ldr	r3, .L5+4
	ldr	r0, .L5+8
	strh	lr, [ip, #0]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #83886080
	mov	r3, r1
	add	r1, r1, #508
	add	r2, sp, #2
	add	r3, r3, #492
	add	r1, r1, #2
.L2:
	ldrh	r0, [r2, #2]!
	strh	r0, [r3, #2]!	@ movhi
	cmp	r3, r1
	bne	.L2
	add	sp, sp, #28
	ldr	lr, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.word	loadPalette
	.word	bgPal
	.size	initGame, .-initGame
	.comm	pieces,1200,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	C.0.1989, %object
	.size	C.0.1989, 18
C.0.1989:
	.short	0
	.short	32736
	.short	31744
	.short	383
	.short	1023
	.short	992
	.short	31767
	.short	31
	.short	32767
	.ident	"GCC: (devkitARM release 31) 4.5.0"
