; Copies nearly word for word (- the comments) from
; https://www.codeproject.com/Questions/5347837/X86-64-assembly-relocated-truncated-to-fit-IMAGE-R
	
	global	main
	extern	printf

	section	.text
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	rcx, message
	xor	rax, rax
	call 	printf 

	add	rsp, 32
	pop	rbp
	ret

	section	.data
message:
	db	'Hello, World', 10, 0
