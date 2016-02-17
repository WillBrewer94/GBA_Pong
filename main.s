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
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #100663296
	mov	r0, ip
	add	ip, ip, #76800
.L2:
	mov	r2, r0
	mov	r3, #0
.L3:
	add	r3, r3, #1
	mov	r1, #0	@ movhi
	cmp	r3, #240
	strh	r1, [r2], #2	@ movhi
	bne	.L3
	add	r0, r0, #480
	cmp	r0, ip
	bne	.L2
	ldr	r0, .L7
	mov	ip, #10
	str	ip, [r0, #0]
	ldr	r0, .L7+4
	mov	r2, #60
	str	r2, [r0, #0]
	ldr	r0, .L7+8
	add	ip, ip, #210
	str	ip, [r0, #0]
	ldr	r0, .L7+12
	str	r2, [r0, #0]
	ldr	r2, .L7+16
	mov	r0, #120
	str	r0, [r2, #0]
	ldr	r2, .L7+20
	mov	r0, #80
	str	r0, [r2, #0]
	ldr	r2, .L7+24
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r2, .L7+28
	str	r3, [r2, #0]
	ldr	r3, .L7+32
	strb	r1, [r3, #0]
	bx	lr
.L8:
	.align	2
.L7:
	.word	row1
	.word	col1
	.word	row2
	.word	col2
	.word	ballRow
	.word	ballCol
	.word	rowD
	.word	colD
	.word	.LANCHOR0
	.size	initialize, .-initialize
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r3, .L30
	ldr	r4, .L30+4
	ldr	sl, [r3, #0]
	ldr	r2, [r4, #0]
	ldr	r6, .L30+8
	add	sl, r2, sl
	ldr	r9, [r6, #0]
	cmp	sl, #159
	ldr	sl, .L30+12
	ldr	r5, .L30+16
	str	r9, [sl, #0]
	ldr	sl, .L30+20
	ldr	r8, [r5, #0]
	str	r2, [sl, #0]
	ldr	ip, .L30+24
	ldr	sl, .L30+28
	ldr	r7, [ip, #0]
	ldr	r0, .L30+32
	str	r8, [sl, #0]
	ldr	r8, .L30+36
	ldr	r1, .L30+40
	str	r7, [r8, #0]
	ldr	fp, [r0, #0]
	ldr	r7, .L30+44
	ldr	r8, [r1, #0]
	str	fp, [r7, #0]
	ldr	r7, .L30+48
	str	r8, [r7, #0]
	bgt	.L10
	mov	r7, #67108864
	add	r7, r7, #256
	ldrh	r7, [r7, #48]
	tst	r7, #2
	addeq	r2, r2, #1
	streq	r2, [r4, #0]
.L10:
	cmp	r2, #0
	ble	.L11
	mov	r7, #67108864
	add	r7, r7, #256
	ldrh	r7, [r7, #48]
	tst	r7, #1
	subeq	r2, r2, #1
	streq	r2, [r4, #0]
.L11:
	ldr	r2, [ip, #0]
	ldr	r7, [r3, #0]
	add	r7, r2, r7
	cmp	r7, #159
	bgt	.L12
	mov	r7, #67108864
	add	r7, r7, #256
	ldrh	r7, [r7, #48]
	tst	r7, #128
	ldreq	r7, .L30+24
	addeq	r2, r2, #1
	streq	r2, [r7, #0]
.L12:
	cmp	r2, #0
	ble	.L13
	mov	r7, #67108864
	add	r7, r7, #256
	ldrh	r7, [r7, #48]
	tst	r7, #64
	subeq	r2, r2, #1
	streq	r2, [ip, #0]
.L13:
	ldr	r7, [r0, #0]
	ldr	r2, [r3, #4]
	add	r2, r7, r2
	cmp	r2, #240
	bgt	.L14
	cmp	r7, #0
	blt	.L14
.L15:
	ldr	r2, [r1, #0]
	cmp	r2, #0
	blt	.L16
	ldr	r8, [r3, #8]
	add	sl, r8, r2
	cmp	sl, #160
	ldrle	sl, .L30+52
	bgt	.L16
	ldr	r9, [r3, #12]
	ldr	r6, [r6, #0]
	add	r6, r9, r6
	cmp	r7, r6
	ldr	r6, .L30
	blt	.L18
.L29:
	ldr	r9, .L30+56
	ldr	r4, [r9, #0]
.L19:
	ldr	r5, [r5, #0]
	add	r8, r8, r7
	cmp	r8, r5
	ldrle	r2, [r1, #0]
	ble	.L23
	ldr	ip, [ip, #0]
	cmp	r2, ip
	ble	.L28
	ldr	r3, [r3, #0]
	add	ip, ip, r3
	cmp	r2, ip
	rsblt	r4, r4, #0
	strlt	r4, [r9, #0]
	bge	.L28
.L23:
	ldr	r3, [sl, #0]
	add	r7, r4, r7
	add	r2, r2, r3
	str	r7, [r0, #0]
	str	r2, [r1, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L16:
	ldr	sl, .L30+52
	ldr	r9, [r3, #12]
	ldr	r6, [r6, #0]
	ldr	r8, [sl, #0]
	add	r6, r9, r6
	rsb	r8, r8, #0
	cmp	r7, r6
	str	r8, [sl, #0]
	ldr	r6, .L30
	ldr	r8, [r3, #8]
	bge	.L29
.L18:
	ldr	r4, [r4, #0]
	cmp	r2, r4
	ble	.L27
	ldr	r8, [r6, #0]
	add	r4, r4, r8
	cmp	r2, r4
	bge	.L27
	ldr	r9, .L30+56
	ldr	r4, [r9, #0]
	rsb	r4, r4, #0
	str	r4, [r9, #0]
	ldr	r8, [r6, #8]
	b	.L19
.L14:
	ldr	r2, .L30+60
	mov	r8, #1
	strb	r8, [r2, #0]
	b	.L15
.L27:
	ldr	r9, .L30+56
	ldr	r8, [r6, #8]
	ldr	r4, [r9, #0]
	b	.L19
.L28:
	ldr	r4, [r9, #0]
	b	.L23
.L31:
	.align	2
.L30:
	.word	.LANCHOR1
	.word	col1
	.word	row1
	.word	oldRow1
	.word	row2
	.word	oldCol1
	.word	col2
	.word	oldRow2
	.word	ballRow
	.word	oldCol2
	.word	ballCol
	.word	ballOldRow
	.word	ballOldCol
	.word	colD
	.word	rowD
	.word	.LANCHOR0
	.size	update, .-update
	.align	2
	.global	drawBall
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L39
	stmfd	sp!, {r4, r5}
	ldr	r3, [ip, #8]
	cmp	r3, #0
	ble	.L32
	rsb	r1, r1, r1, asl #4
	add	r0, r0, r1, asl #4
	mov	r5, r0, asl #1
	ldr	ip, [ip, #4]
	add	r5, r5, #100663296
	mov	r4, #0
.L34:
	cmp	ip, #0
	movgt	r0, r5
	movgt	r1, #0
	ble	.L36
.L35:
	add	r1, r1, #1
	cmp	r1, ip
	strh	r2, [r0], #2	@ movhi
	bne	.L35
.L36:
	add	r4, r4, #1
	cmp	r4, r3
	add	r5, r5, #480
	bne	.L34
.L32:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR1
	.size	drawBall, .-drawBall
	.align	2
	.global	drawPaddles
	.type	drawPaddles, %function
drawPaddles:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r4, .L54
	ldr	ip, [r4, #0]
	cmp	ip, #0
	ldrh	r5, [sp, #16]
	ble	.L41
	rsb	r1, r1, r1, asl #4
	add	r0, r0, r1, asl #4
	mov	r7, r0, asl #1
	ldr	r0, [r4, #12]
	add	r7, r7, #100663296
	mov	r6, #0
.L43:
	cmp	r0, #0
	movgt	r4, r7
	movgt	r1, #0
	ble	.L46
.L44:
	add	r1, r1, #1
	cmp	r1, r0
	strh	r5, [r4], #2	@ movhi
	bne	.L44
.L46:
	add	r6, r6, #1
	cmp	r6, ip
	add	r7, r7, #480
	bne	.L43
	rsb	r3, r3, r3, asl #4
	add	r2, r2, r3, asl #4
	mov	r4, r2, asl #1
	add	r4, r4, #100663296
	mov	r1, #0
.L47:
	cmp	r0, #0
	movgt	r2, r4
	movgt	r3, #0
	ble	.L49
.L48:
	add	r3, r3, #1
	cmp	r3, r0
	strh	r5, [r2], #2	@ movhi
	bne	.L48
.L49:
	add	r1, r1, #1
	cmp	r1, ip
	add	r4, r4, #480
	bne	.L47
.L41:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR1
	.size	drawPaddles, .-drawPaddles
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L57
	sub	sp, sp, #8
	ldr	r0, [r3, #0]
	ldr	r3, .L57+4
	mov	r2, #0
	ldr	r1, [r3, #0]
	bl	drawBall
	ldr	r3, .L57+8
	ldr	r0, [r3, #0]
	ldr	r3, .L57+12
	ldr	r1, [r3, #0]
	ldr	r3, .L57+16
	ldr	r2, [r3, #0]
	ldr	r3, .L57+20
	mov	ip, #0
	ldr	r3, [r3, #0]
	str	ip, [sp, #0]
	bl	drawPaddles
	ldr	r3, .L57+24
	mov	r4, #32512
	ldr	r0, [r3, #0]
	ldr	r3, .L57+28
	add	r4, r4, #255
	ldr	r1, [r3, #0]
	mov	r2, r4
	bl	drawBall
	ldr	r3, .L57+32
	ldr	r0, [r3, #0]
	ldr	r3, .L57+36
	ldr	r1, [r3, #0]
	ldr	r3, .L57+40
	ldr	r2, [r3, #0]
	ldr	r3, .L57+44
	ldr	r3, [r3, #0]
	str	r4, [sp, #0]
	bl	drawPaddles
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	ballOldRow
	.word	ballOldCol
	.word	oldRow1
	.word	oldCol1
	.word	oldRow2
	.word	oldCol2
	.word	ballRow
	.word	ballCol
	.word	row1
	.word	col1
	.word	row2
	.word	col2
	.size	draw, .-draw
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	mov	r3, #1024
	mov	r4, #67108864
	add	r3, r3, #3
	ldr	r6, .L74
	ldr	sl, .L74+4
	strh	r3, [r4, #0]	@ movhi
	bl	initialize
	ldr	r8, .L74+8
	ldr	r2, [r6, #0]
	ldrb	r5, [sl, #0]	@ zero_extendqisi2
	add	r7, r4, #256
.L71:
	ldrh	r3, [r7, #48]
	cmp	r5, #0
	str	r2, [r8, #0]
	str	r3, [r6, #0]
	beq	.L73
.L61:
	tst	r2, #8
	beq	.L72
	tst	r3, #8
	bne	.L72
	bl	initialize
	ldrb	r5, [sl, #0]	@ zero_extendqisi2
	ldr	r2, [r6, #0]
	ldrh	r3, [r7, #48]
	cmp	r5, #0
	str	r2, [r8, #0]
	str	r3, [r6, #0]
	bne	.L61
.L73:
	bl	update
.L62:
	ldrh	r3, [r4, #6]
	cmp	r3, #160
	bhi	.L62
.L68:
	ldrh	r3, [r4, #6]
	cmp	r3, #159
	bls	.L68
	bl	draw
	ldrb	r3, [sl, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldreq	r2, [r6, #0]
	beq	.L71
	ldr	r2, [r8, #0]
	ldr	r3, [r6, #0]
	b	.L61
.L72:
	ldrb	r5, [sl, #0]	@ zero_extendqisi2
	mov	r2, r3
	b	.L71
.L75:
	.align	2
.L74:
	.word	buttons
	.word	.LANCHOR0
	.word	oldButtons
	.size	main, .-main
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L77:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L77
	mov	r2, #67108864
.L79:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L79
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	mov	r0, r0, asl #1
	add	r0, r0, #100663296
	strh	r2, [r0, #0]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.global	paddleHeight
	.global	paddleWidth
	.global	ballHeight
	.global	ballWidth
	.global	gameOver
	.global	bgColor
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	col1,4,4
	.comm	row1,4,4
	.comm	oldCol1,4,4
	.comm	oldRow1,4,4
	.comm	col2,4,4
	.comm	row2,4,4
	.comm	oldCol2,4,4
	.comm	oldRow2,4,4
	.comm	ballCol,4,4
	.comm	ballRow,4,4
	.comm	ballOldRow,4,4
	.comm	ballOldCol,4,4
	.comm	rowD,4,4
	.comm	colD,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	paddleHeight, %object
	.size	paddleHeight, 4
paddleHeight:
	.word	50
	.type	ballWidth, %object
	.size	ballWidth, 4
ballWidth:
	.word	10
	.type	ballHeight, %object
	.size	ballHeight, 4
ballHeight:
	.word	10
	.type	paddleWidth, %object
	.size	paddleWidth, 4
paddleWidth:
	.word	10
	.bss
	.align	1
	.set	.LANCHOR0,. + 0
	.type	gameOver, %object
	.size	gameOver, 1
gameOver:
	.space	1
	.space	1
	.type	bgColor, %object
	.size	bgColor, 2
bgColor:
	.space	2
	.ident	"GCC: (devkitARM release 31) 4.5.0"
