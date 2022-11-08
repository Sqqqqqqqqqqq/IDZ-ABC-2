	.file	"string.c"
	.intel_syntax noprefix
	.text
	.globl	compare
	.type	compare, @function
compare:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	edx, edi
	mov	eax, esi
	mov	BYTE PTR -4[rbp], dl
	mov	BYTE PTR -8[rbp], al
	movzx	eax, BYTE PTR -4[rbp]
	cmp	al, BYTE PTR -8[rbp]
	sete	al
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	compare, .-compare
	.section	.rodata
.LC0:
	.string	"0x%x"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rdx, QWORD PTR stdin[rip]
	lea	rax, -64[rbp]
	mov	esi, 50
	mov	rdi, rax
	call	fgets@PLT
	mov	DWORD PTR -68[rbp], 0
	jmp	.L4
.L8:
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	esi, 101
	mov	edi, eax
	call	compare
	test	al, al
	jne	.L5
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	esi, 121
	mov	edi, eax
	call	compare
	test	al, al
	jne	.L5
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	esi, 117
	mov	edi, eax
	call	compare
	test	al, al
	jne	.L5
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	esi, 105
	mov	edi, eax
	call	compare
	test	al, al
	jne	.L5
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	esi, 111
	mov	edi, eax
	call	compare
	test	al, al
	jne	.L5
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	esi, 97
	mov	edi, eax
	call	compare
	test	al, al
	je	.L6
.L5:
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L7
.L6:
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	movzx	eax, BYTE PTR -64[rbp+rax]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
.L7:
	add	DWORD PTR -68[rbp], 1
.L4:
	mov	eax, DWORD PTR -68[rbp]
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
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
