; Copied nearly word for word (- the comments) from
; https://www.codeproject.com/Questions/5347837/X86-64-assembly-relocated-truncated-to-fit-IMAGE-R

	global	main        	;let external elements call main
        extern  printf		;let the linker handle calls to printf


        section .data
message:
        db      'Hello, World', 10, 0


        section .text
main:
				;function initialization
        push    rbp		;save the bottom of the stack
        mov     rbp, rsp	;move the bottom to the top
        sub     rsp, 32		;push 32 bytes onto the stack

				;print helloworld to stdout
        mov     rcx, message	;load the mesage address
        xor     rax, rax	;set rax to 0
        call    printf 		;call printf (libc)

				;function exit
        add     rsp, 32		;pop 32 bytes off the stack
        pop     rbp		;restore the bottom of the stack

				;procedure return
        ret			;return to caller


