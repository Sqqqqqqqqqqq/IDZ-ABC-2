	.file	"string.c"
	.intel_syntax noprefix
	.text
	.globl	compare
	.type	compare, @function
compare:
	push	rbp
	mov	rbp, rsp 
	mov	edx, edi #a (1st parameter)
	mov	eax, esi #b (2nd parameter) 
	cmp     al, dl #cmp a and b   // dl = BYTE PTR -8[rbp] from prev program
	sete	al  #if (a == b) al = true
	pop	rbp
	ret
	.size	compare, .-compare
	.section	.rodata
.LC0:
	.string	"0x%x"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rdx, QWORD PTR stdin[rip]
	lea	rax, -64[rbp] #char a[50]
	mov	esi, 50
	mov	rdi, rax
	call	fgets@PLT
	mov	ebx, 0 #int i = DWORD PTR -68[rbp] from previos program
	jmp	.L4
.L8:
	mov	eax, ebx
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	esi, 101 #esi = 'e'
	mov	edi, eax #edi = 'a[i]'
	call	compare 
	test	al, al
	jne	.L5
	mov	eax, ebx
	cdqe
	mov	esi, 121 #esi = 'y'
	call	compare
	test	al, al
	jne	.L5
	mov	eax, ebx
	cdqe
	mov	esi, 117 #esi = 'u'
	call	compare
	test	al, al
	jne	.L5
	mov	eax, ebx
	cdqe
	mov	esi, 105 #esi = 'i'
	call	compare
	test	al, al
	jne	.L5
	mov	eax, ebx
	cdqe
	mov	esi, 111 #esi = 'o'
	call	compare
	test	al, al
	jne	.L5
	mov	eax, ebx
	cdqe
	mov	esi, 97  #esi = 'a'
	call	compare
	test	al, al
	je	.L6
.L5:
	mov	eax, ebx
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT #print vowel symbol
	jmp	.L7
.L6:
	mov	eax, ebx
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT #print consonant symbol
.L7:
	add	ebx, 1 #++i
.L4:
	mov	eax, ebx
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	test	al, al
	jne	.L8
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
