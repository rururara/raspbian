
	.equ  STACK, 0x8000
	.section .init
	.global _start
_start:
	mov     sp, #STACK
	mov	r0, #0
	ldr	r4, =frame_buffer	
	mov	r5, #8

looop:
	mov	r6, #8
	mov	r1, #10	
	udiv 	r3, r0, r1	@ N % 10 = 各桁の値の取り出し
	mul	r1, r3, r1
	sub	r1, r0, r1

	mul	r1, r5,r1	@ 1の位の数値の先頭番地に加算する数
	mul	r3, r5,r3	@ 10の位の数値の先頭番地に加算する数

	mov	r10, r1
	mov	r11, r3

loop:
	mov	r9, #80
	mov	r1, r10
	mov	r3, r11
	subs	r6, r6, #1
	add	r1, r1, r6
	add	r3, r3, r6
	ldrb	r7, [r4, r1]
	ldrb	r8, [r4, r3]
	add	r7, r7, r8, lsl #4
	add	r9, r9, r6
	strb	r7,[r4, r9]
	bne	loop

	ldr	r2, =frame_buffer
	add	r2, r2, #80

	
	mov     r1, #0x250
lp:
	bl	disp
	subs    r1, r1, #1        @ 何もしないまま 0x80000 から 0 までカウントダウン
        bne     lp

	add	r0, r0, #1
	cmp	r0, #100
	moveq	r0, #0

	b	looop

loop1:	b 	loop1
	
	.section .data
frame_buffer:
	.byte	0, 14, 10, 10, 10, 14, 0, 0	@ num0
	.byte 	0, 4, 12, 4, 4, 14, 0, 0	@ num1
	.byte 	0, 14, 2, 14, 8, 14, 0, 0	@ num2
	.byte 	0, 14, 2, 14, 2, 14, 0, 0	@ num3
	.byte 	0, 10, 10, 14, 2, 2, 0, 0	@ num4
	.byte 	0, 14, 8, 14, 2, 14, 0, 0	@ num5
	.byte 	0, 14, 8, 14, 10, 14, 0, 0	@ num6
	.byte 	0, 14, 10, 2, 2, 2, 0, 0	@ num7
	.byte 	0, 14, 10, 14, 10, 14, 0, 0	@ num8
	.byte 	0, 14, 10, 14, 2, 14, 0, 0	@ num9	
	.byte 	0, 14, 10, 14, 2, 14, 0, 0		@ num