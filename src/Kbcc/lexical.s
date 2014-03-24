	.file	"lexical.c"
	.globl	ffinal
	.bss
	.align 4
	.type	ffinal, @object
	.size	ffinal, 4
ffinal:
	.zero	4
	.globl	head
	.align 4
	.type	head, @object
	.size	head, 4
head:
	.zero	4
	.globl	curr
	.align 4
	.type	curr, @object
	.size	curr, 4
curr:
	.zero	4
	.section	.rodata
	.align 4
.LC0:
	.string	"\n Symbol-Table Node creation failed "
	.text
	.globl	_Z11create_listPc
	.type	_Z11create_listPc, @function
_Z11create_listPc:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$32, (%esp)
	call	malloc
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L2
	movl	$.LC0, (%esp)
	call	puts
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcpy
	movl	-12(%ebp), %eax
	movl	$0, 28(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, curr
	movl	curr, %eax
	movl	%eax, head
	movl	-12(%ebp), %eax
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_Z11create_listPc, .-_Z11create_listPc
	.globl	_Z11add_to_listPcb
	.type	_Z11add_to_listPcb, @function
_Z11add_to_listPcb:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	12(%ebp), %eax
	movb	%al, -28(%ebp)
	movl	head, %eax
	testl	%eax, %eax
	jne	.L5
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z11create_listPc
	jmp	.L6
.L5:
	movl	$32, (%esp)
	call	malloc
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L7
	movl	$.LC0, (%esp)
	call	puts
	movl	$0, %eax
	jmp	.L6
.L7:
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcpy
	movl	-12(%ebp), %eax
	movl	$0, 28(%eax)
	cmpb	$0, -28(%ebp)
	je	.L8
	movl	curr, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 28(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, curr
	jmp	.L9
.L8:
	movl	head, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 28(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, head
.L9:
	movl	-12(%ebp), %eax
.L6:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z11add_to_listPcb, .-_Z11add_to_listPcb
	.globl	_Z14search_in_listPcPP4node
	.type	_Z14search_in_listPcPP4node, @function
_Z14search_in_listPcPP4node:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	head, %eax
	movl	%eax, -20(%ebp)
	movl	$0, -16(%ebp)
	movb	$0, -9(%ebp)
	jmp	.L11
.L14:
	movl	-20(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L12
	movb	$1, -9(%ebp)
	jmp	.L13
.L12:
	movl	-20(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-20(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, -20(%ebp)
.L11:
	cmpl	$0, -20(%ebp)
	setne	%al
	testb	%al, %al
	jne	.L14
.L13:
	cmpb	$0, -9(%ebp)
	je	.L15
	cmpl	$0, 12(%ebp)
	je	.L16
	movl	12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
.L16:
	movl	-20(%ebp), %eax
	jmp	.L17
.L15:
	movl	$0, %eax
.L17:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z14search_in_listPcPP4node, .-_Z14search_in_listPcPP4node
	.section	.rodata
	.align 4
.LC1:
	.string	"\n Deleting value [%s] from list\n"
	.text
	.globl	_Z16delete_from_listPc
	.type	_Z16delete_from_listPc, @function
_Z16delete_from_listPc:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z14search_in_listPcPP4node
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L19
	movl	$-1, %eax
	jmp	.L20
.L19:
	movl	-16(%ebp), %eax
	testl	%eax, %eax
	je	.L21
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	28(%edx), %edx
	movl	%edx, 28(%eax)
.L21:
	movl	curr, %eax
	cmpl	%eax, -12(%ebp)
	jne	.L22
	movl	-16(%ebp), %eax
	movl	%eax, curr
	jmp	.L23
.L22:
	movl	head, %eax
	cmpl	%eax, -12(%ebp)
	jne	.L23
	movl	-12(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, head
.L23:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	free
	movl	$0, -12(%ebp)
	movl	$0, %eax
.L20:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_Z16delete_from_listPc, .-_Z16delete_from_listPc
	.globl	_Z9read_charcPPci
	.type	_Z9read_charcPPci, @function
_Z9read_charcPPci:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	movl	$0, -4(%ebp)
	cmpl	$1, 16(%ebp)
	jne	.L25
	jmp	.L26
.L31:
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	-20(%ebp), %al
	jne	.L27
	movl	$1, %eax
	jmp	.L28
.L27:
	addl	$1, -4(%ebp)
.L26:
	cmpl	$0, -4(%ebp)
	js	.L29
	cmpl	$61, -4(%ebp)
	jg	.L29
	movl	$1, %eax
	jmp	.L30
.L29:
	movl	$0, %eax
.L30:
	testb	%al, %al
	jne	.L31
.L25:
	cmpl	$0, 16(%ebp)
	jne	.L32
	jmp	.L33
.L37:
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	-20(%ebp), %al
	jne	.L34
	movl	$1, %eax
	jmp	.L28
.L34:
	addl	$1, -4(%ebp)
.L33:
	cmpl	$0, -4(%ebp)
	js	.L35
	cmpl	$51, -4(%ebp)
	jg	.L35
	movl	$1, %eax
	jmp	.L36
.L35:
	movl	$0, %eax
.L36:
	testb	%al, %al
	jne	.L37
.L32:
	movl	$0, %eax
.L28:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_Z9read_charcPPci, .-_Z9read_charcPPci
	.globl	_Z10read_digitcPPc
	.type	_Z10read_digitcPPc, @function
_Z10read_digitcPPc:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L39
.L44:
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	-20(%ebp), %al
	jne	.L40
	movl	$1, %eax
	jmp	.L41
.L40:
	addl	$1, -4(%ebp)
.L39:
	cmpl	$0, -4(%ebp)
	js	.L42
	cmpl	$9, -4(%ebp)
	jg	.L42
	movl	$1, %eax
	jmp	.L43
.L42:
	movl	$0, %eax
.L43:
	testb	%al, %al
	jne	.L44
	movl	$0, %eax
.L41:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	_Z10read_digitcPPc, .-_Z10read_digitcPPc
	.section	.rodata
.LC2:
	.string	"w"
	.text
	.globl	_Z12preprocesserP8_IO_FILEPc
	.type	_Z12preprocesserP8_IO_FILEPc, @function
_Z12preprocesserP8_IO_FILEPc:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$.LC2, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IO_getc
	movb	%al, -9(%ebp)
	jmp	.L46
.L54:
	cmpb	$47, -9(%ebp)
	jne	.L47
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IO_getc
	movb	%al, -9(%ebp)
	cmpb	$47, -9(%ebp)
	jne	.L48
	jmp	.L49
.L50:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IO_getc
.L49:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IO_getc
	movb	%al, -9(%ebp)
	cmpb	$10, -9(%ebp)
	setne	%al
	testb	%al, %al
	jne	.L50
.L48:
	cmpb	$42, -9(%ebp)
	jne	.L47
	jmp	.L53
.L55:
	nop
.L53:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IO_getc
	movb	%al, -9(%ebp)
	cmpb	$42, -9(%ebp)
	jne	.L55
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IO_getc
	movb	%al, -9(%ebp)
	movb	$47, -9(%ebp)
	movl	$1, %eax
	testb	%al, %al
	je	.L55
	nop
.L47:
	movsbl	-9(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fputc
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IO_getc
	movb	%al, -9(%ebp)
.L46:
	cmpb	$-1, -9(%ebp)
	setne	%al
	testb	%al, %al
	jne	.L54
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	fclose
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	fclose
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	_Z12preprocesserP8_IO_FILEPc, .-_Z12preprocesserP8_IO_FILEPc
	.section	.rodata
.LC3:
	.string	"%s \t \t "
.LC4:
	.string	"Keyword \t \t "
.LC5:
	.string	"%c  "
.LC6:
	.string	"\t \t "
.LC7:
	.string	"%d \t \t "
.LC8:
	.string	"-- \t \t "
.LC9:
	.string	"Identifier \t \t "
.LC10:
	.string	"Argument \t \t "
.LC11:
	.string	"Operation \t \t "
.LC12:
	.string	"Constant \t \t "
.LC13:
	.string	"Header \t \t "
	.text
	.globl	_Z18symbolmanipulationPcc
	.type	_Z18symbolmanipulationPcc, @function
_Z18symbolmanipulationPcc:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	12(%ebp), %eax
	movb	%al, -28(%ebp)
	movl	$0, -12(%ebp)
	cmpb	$107, -28(%ebp)
	jne	.L57
	movl	ffinal, %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC3, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$12, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC4, (%esp)
	call	fwrite
	jmp	.L58
.L59:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %edx
	movl	ffinal, %eax
	movl	%edx, 8(%esp)
	movl	$.LC5, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	addl	$1, -12(%ebp)
.L58:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L59
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC6, (%esp)
	call	fwrite
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC7, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	call	fputc
.L57:
	cmpb	$119, -28(%ebp)
	jne	.L60
	movl	ffinal, %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC3, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$15, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC9, (%esp)
	call	fwrite
	jmp	.L61
.L62:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %edx
	movl	ffinal, %eax
	movl	%edx, 8(%esp)
	movl	$.LC5, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	addl	$1, -12(%ebp)
.L61:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L62
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC6, (%esp)
	call	fwrite
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC7, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	call	fputc
.L60:
	cmpb	$97, -28(%ebp)
	jne	.L63
	movl	ffinal, %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC3, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$13, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC10, (%esp)
	call	fwrite
	jmp	.L64
.L65:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %edx
	movl	ffinal, %eax
	movl	%edx, 8(%esp)
	movl	$.LC5, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	addl	$1, -12(%ebp)
.L64:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L65
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC6, (%esp)
	call	fwrite
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC7, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	call	fputc
.L63:
	cmpb	$111, -28(%ebp)
	jne	.L66
	movl	ffinal, %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC3, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$14, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC11, (%esp)
	call	fwrite
	movl	ffinal, %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC5, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC6, (%esp)
	call	fwrite
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC7, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	call	fputc
.L66:
	cmpb	$99, -28(%ebp)
	jne	.L67
	movl	ffinal, %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC3, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$13, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC12, (%esp)
	call	fwrite
	jmp	.L68
.L69:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %edx
	movl	ffinal, %eax
	movl	%edx, 8(%esp)
	movl	$.LC5, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	addl	$1, -12(%ebp)
.L68:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L69
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC6, (%esp)
	call	fwrite
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC7, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	call	fputc
.L67:
	cmpb	$104, -28(%ebp)
	jne	.L56
	movl	ffinal, %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC3, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$11, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC13, (%esp)
	call	fwrite
	jmp	.L71
.L72:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %edx
	movl	ffinal, %eax
	movl	%edx, 8(%esp)
	movl	$.LC5, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	addl	$1, -12(%ebp)
.L71:
	movl	-12(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L72
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC6, (%esp)
	call	fwrite
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC7, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	movl	ffinal, %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	call	fputc
.L56:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	_Z18symbolmanipulationPcc, .-_Z18symbolmanipulationPcc
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	id
	.align 4
	.type	id, @object
	.size	id, 4
id:
	.zero	4
	.globl	kw
	.align 4
	.type	kw, @object
	.size	kw, 4
kw:
	.zero	4
	.globl	num
	.align 4
	.type	num, @object
	.size	num, 4
num:
	.zero	4
	.globl	op
	.align 4
	.type	op, @object
	.size	op, 4
op:
	.zero	4
	.globl	keys
	.data
	.align 32
	.type	keys, @object
	.size	keys, 320
keys:
	.string	"auto"
	.zero	5
	.string	"break"
	.zero	4
	.string	"case"
	.zero	5
	.string	"char"
	.zero	5
	.string	"const"
	.zero	4
	.string	"continue"
	.zero	1
	.string	"default"
	.zero	2
	.string	"do"
	.zero	7
	.string	"double"
	.zero	3
	.string	"else"
	.zero	5
	.string	"enum"
	.zero	5
	.string	"extern"
	.zero	3
	.string	"float"
	.zero	4
	.string	"for"
	.zero	6
	.string	"goto"
	.zero	5
	.string	"if"
	.zero	7
	.string	"int"
	.zero	6
	.string	"long"
	.zero	5
	.string	"register"
	.zero	1
	.string	"return"
	.zero	3
	.string	"short"
	.zero	4
	.string	"signed"
	.zero	3
	.string	"sizeof"
	.zero	3
	.string	"static"
	.zero	3
	.string	"struct"
	.zero	3
	.string	"switch"
	.zero	3
	.string	"typedef"
	.zero	2
	.string	"union"
	.zero	4
	.string	"unsigned"
	.zero	1
	.string	"void"
	.zero	5
	.string	"volatile"
	.zero	1
	.string	"while"
	.zero	4
	.section	.rodata
.LC14:
	.string	"%s"
.LC15:
	.string	"r"
.LC16:
	.string	"file not found"
	.align 4
.LC17:
	.string	"Token \t \t Type \t \t S P E L L I N G \t \t Length \t \t Value \t \t Mem Size \n  "
.LC18:
	.string	"%c is an operator\n"
.LC19:
	.string	"%s is a header file\n"
.LC20:
	.string	"\b is an argument"
	.align 4
.LC21:
	.string	"Keywords: %d\nIdentifiers: %d\nOperators: %d\nNumbers: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	andl	$-16, %esp
	subl	$208, %esp
	movl	12(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	%gs:20, %eax
	movl	%eax, 204(%esp)
	xorl	%eax, %eax
	movl	$0, 68(%esp)
	movl	68(%esp), %eax
	movl	%eax, 72(%esp)
	movl	44(%esp), %eax
	addl	$12, %eax
	movl	(%eax), %eax
	movl	$.LC2, 4(%esp)
	movl	%eax, (%esp)
	.cfi_offset 3, -12
	call	fopen
	movl	%eax, ffinal
	movl	$8, (%esp)
	call	_Znaj
	movl	%eax, 76(%esp)
	movl	$62, (%esp)
	call	_Znaj
	movl	%eax, %edx
	movl	76(%esp), %eax
	movl	%edx, (%eax)
	movl	76(%esp), %eax
	leal	4(%eax), %ebx
	movl	$10, (%esp)
	call	_Znaj
	movl	%eax, (%ebx)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	movb	$97, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movb	$98, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$2, %eax
	movb	$99, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$3, %eax
	movb	$100, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$4, %eax
	movb	$101, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$5, %eax
	movb	$102, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$6, %eax
	movb	$103, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$7, %eax
	movb	$104, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$8, %eax
	movb	$105, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$9, %eax
	movb	$106, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$10, %eax
	movb	$107, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$11, %eax
	movb	$108, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$12, %eax
	movb	$109, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$13, %eax
	movb	$110, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$14, %eax
	movb	$111, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$15, %eax
	movb	$112, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$16, %eax
	movb	$113, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$17, %eax
	movb	$114, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$18, %eax
	movb	$115, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$19, %eax
	movb	$116, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$20, %eax
	movb	$117, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$21, %eax
	movb	$118, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$22, %eax
	movb	$119, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$23, %eax
	movb	$120, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$24, %eax
	movb	$121, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$25, %eax
	movb	$122, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$26, %eax
	movb	$65, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$27, %eax
	movb	$66, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$28, %eax
	movb	$67, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$29, %eax
	movb	$68, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$30, %eax
	movb	$69, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$31, %eax
	movb	$70, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$32, %eax
	movb	$71, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$33, %eax
	movb	$72, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$34, %eax
	movb	$73, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$35, %eax
	movb	$74, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$36, %eax
	movb	$75, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$37, %eax
	movb	$76, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$38, %eax
	movb	$77, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$39, %eax
	movb	$78, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$40, %eax
	movb	$79, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$41, %eax
	movb	$80, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$42, %eax
	movb	$81, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$43, %eax
	movb	$82, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$44, %eax
	movb	$83, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$45, %eax
	movb	$84, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$46, %eax
	movb	$85, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$47, %eax
	movb	$86, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$48, %eax
	movb	$87, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$49, %eax
	movb	$88, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$50, %eax
	movb	$89, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$51, %eax
	movb	$90, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$52, %eax
	movb	$48, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$53, %eax
	movb	$49, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$54, %eax
	movb	$50, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$55, %eax
	movb	$51, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$56, %eax
	movb	$52, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$57, %eax
	movb	$53, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$58, %eax
	movb	$54, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$59, %eax
	movb	$55, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$60, %eax
	movb	$56, (%eax)
	movl	76(%esp), %eax
	movl	(%eax), %eax
	addl	$61, %eax
	movb	$57, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movb	$48, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movb	$49, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$2, %eax
	movb	$50, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$3, %eax
	movb	$51, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$4, %eax
	movb	$52, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$5, %eax
	movb	$53, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$6, %eax
	movb	$54, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$7, %eax
	movb	$55, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$8, %eax
	movb	$56, (%eax)
	movl	76(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$9, %eax
	movb	$57, (%eax)
	movl	$738855200, 171(%esp)
	movl	$2066294843, 175(%esp)
	movl	$593320829, 179(%esp)
	movl	$4078626, 183(%esp)
	movb	$0, 187(%esp)
	movl	$643704097, 188(%esp)
	movl	$1026239786, 192(%esp)
	movl	$1009679486, 196(%esp)
	movl	$4140862, 200(%esp)
	movl	44(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC14, (%esp)
	call	printf
	movl	44(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	$.LC15, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 80(%esp)
	cmpl	$0, 80(%esp)
	jne	.L74
	movl	$.LC16, (%esp)
	call	printf
	movl	$0, %eax
	jmp	.L75
.L74:
	movl	44(%esp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	80(%esp), %eax
	movl	%eax, (%esp)
	call	_Z12preprocesserP8_IO_FILEPc
	movl	44(%esp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$.LC15, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 80(%esp)
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$72, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC17, (%esp)
	call	fwrite
	jmp	.L76
.L91:
	movl	$0, 56(%esp)
	jmp	.L77
.L79:
	leal	188(%esp), %eax
	addl	56(%esp), %eax
	movzbl	(%eax), %eax
	cmpb	95(%esp), %al
	jne	.L78
	movsbl	95(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC18, (%esp)
	call	printf
	movl	op, %eax
	addl	$1, %eax
	movl	%eax, op
	movl	i, %eax
	movb	$0, 146(%esp,%eax)
	movzbl	95(%esp), %eax
	movb	%al, 93(%esp)
	movb	$0, 94(%esp)
	movl	$111, 4(%esp)
	leal	93(%esp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	44(%esp), %eax
	addl	$12, %eax
	movl	(%eax), %eax
	movl	%eax, 16(%esp)
	movl	68(%esp), %eax
	movl	%eax, 12(%esp)
	movl	72(%esp), %eax
	movl	%eax, 8(%esp)
	movl	76(%esp), %eax
	movl	%eax, 4(%esp)
	leal	146(%esp), %eax
	movl	%eax, (%esp)
	call	_Z4keywPcPS_P4nodeS2_S_
.L78:
	addl	$1, 56(%esp)
.L77:
	cmpl	$14, 56(%esp)
	setle	%al
	testb	%al, %al
	jne	.L79
	movl	$0, 56(%esp)
	jmp	.L80
.L89:
	movl	i, %eax
	cmpl	$-1, %eax
	je	.L93
.L81:
	leal	171(%esp), %eax
	addl	56(%esp), %eax
	movzbl	(%eax), %eax
	cmpb	95(%esp), %al
	jne	.L83
	cmpb	$35, 95(%esp)
	jne	.L84
	movl	$50, (%esp)
	call	_Znaj
	movl	%eax, 84(%esp)
	movl	$0, 60(%esp)
	jmp	.L85
.L86:
	movl	60(%esp), %eax
	addl	84(%esp), %eax
	movzbl	95(%esp), %edx
	movb	%dl, (%eax)
	addl	$1, 60(%esp)
	movl	80(%esp), %eax
	movl	%eax, (%esp)
	call	fgetc
	movb	%al, 95(%esp)
.L85:
	cmpb	$62, 95(%esp)
	setne	%al
	testb	%al, %al
	jne	.L86
	movl	60(%esp), %eax
	addl	84(%esp), %eax
	movb	$62, (%eax)
	addl	$1, 60(%esp)
	movl	60(%esp), %eax
	addl	84(%esp), %eax
	movb	$0, (%eax)
	movl	84(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC19, (%esp)
	call	printf
	movl	$104, 4(%esp)
	movl	84(%esp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	$-1, i
	jmp	.L82
.L84:
	cmpb	$34, 95(%esp)
	jne	.L87
	movl	$50, (%esp)
	call	_Znaj
	movl	%eax, 88(%esp)
	movl	$0, 64(%esp)
.L88:
	movl	80(%esp), %eax
	movl	%eax, (%esp)
	call	fgetc
	movb	%al, 95(%esp)
	movl	64(%esp), %eax
	addl	88(%esp), %eax
	movzbl	95(%esp), %edx
	movb	%dl, (%eax)
	addl	$1, 64(%esp)
	movsbl	95(%esp), %eax
	movl	%eax, (%esp)
	call	putchar
	cmpb	$34, 95(%esp)
	setne	%al
	testb	%al, %al
	jne	.L88
	movl	64(%esp), %eax
	addl	88(%esp), %eax
	movb	$34, (%eax)
	addl	$1, 64(%esp)
	movl	64(%esp), %eax
	addl	88(%esp), %eax
	movb	$0, (%eax)
	movl	$97, 4(%esp)
	movl	88(%esp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	$.LC20, (%esp)
	call	puts
	movl	$-1, i
	jmp	.L82
.L87:
	movl	i, %eax
	movb	$0, 146(%esp,%eax)
	movl	44(%esp), %eax
	addl	$12, %eax
	movl	(%eax), %eax
	movl	%eax, 16(%esp)
	movl	68(%esp), %eax
	movl	%eax, 12(%esp)
	movl	72(%esp), %eax
	movl	%eax, 8(%esp)
	movl	76(%esp), %eax
	movl	%eax, 4(%esp)
	leal	146(%esp), %eax
	movl	%eax, (%esp)
	call	_Z4keywPcPS_P4nodeS2_S_
.L83:
	addl	$1, 56(%esp)
.L80:
	cmpl	$14, 56(%esp)
	setle	%al
	testb	%al, %al
	jne	.L89
	jmp	.L82
.L93:
	nop
.L82:
	movl	i, %eax
	cmpl	$-1, %eax
	je	.L90
	movl	i, %eax
	movzbl	95(%esp), %edx
	movb	%dl, 146(%esp,%eax)
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	jmp	.L76
.L90:
	movl	$0, i
.L76:
	movl	80(%esp), %eax
	movl	%eax, (%esp)
	call	fgetc
	movb	%al, 95(%esp)
	cmpb	$-1, 95(%esp)
	setne	%al
	testb	%al, %al
	jne	.L91
	movl	num, %ebx
	movl	op, %ecx
	movl	id, %edx
	movl	kw, %eax
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC21, (%esp)
	call	printf
	movl	$0, %eax
.L75:
	movl	204(%esp), %edx
	xorl	%gs:20, %edx
	je	.L92
	call	__stack_chk_fail
.L92:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
.LC22:
	.string	"%s is a keyword\n"
	.align 4
.LC23:
	.string	"%s is a ERRORED digit or identifier \n"
.LC24:
	.string	"%s is a number\n"
.LC25:
	.string	"%s is an ERRORED identifier\n"
.LC26:
	.string	"%s is an identifier\n"
	.align 4
.LC27:
	.string	"%s is an exisiting identifier\n"
	.text
	.globl	_Z4keywPcPS_P4nodeS2_S_
	.type	_Z4keywPcPS_P4nodeS2_S_, @function
_Z4keywPcPS_P4nodeS2_S_:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -32(%ebp)
	movl	$0, -36(%ebp)
	jmp	.L95
.L98:
	movl	-36(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	leal	keys(%eax), %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L96
	movl	$107, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC22, (%esp)
	call	printf
	movl	kw, %eax
	addl	$1, %eax
	movl	%eax, kw
	movl	$1, -32(%ebp)
	jmp	.L97
.L96:
	addl	$1, -36(%ebp)
.L95:
	cmpl	$31, -36(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L98
.L97:
	cmpl	$0, -32(%ebp)
	jne	.L99
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	.L100
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_Z10read_digitcPPc
	testb	%al, %al
	je	.L99
	movl	$0, -28(%ebp)
	movl	$0, -24(%ebp)
	jmp	.L101
.L104:
	movl	-24(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_Z10read_digitcPPc
	testb	%al, %al
	je	.L102
	addl	$1, -24(%ebp)
	jmp	.L101
.L102:
	movl	$1, -28(%ebp)
	jmp	.L103
.L101:
	movl	-24(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L104
.L103:
	cmpl	$1, -28(%ebp)
	jne	.L105
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC23, (%esp)
	call	printf
	jmp	.L99
.L105:
	movl	$99, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC24, (%esp)
	call	printf
	movl	num, %eax
	addl	$1, %eax
	movl	%eax, num
	jmp	.L99
.L100:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	.L99
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	$0, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_Z9read_charcPPci
	testb	%al, %al
	je	.L99
	movl	$0, -20(%ebp)
	movl	$0, -16(%ebp)
	jmp	.L106
.L109:
	movl	-16(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	$1, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_Z9read_charcPPci
	testb	%al, %al
	je	.L107
	addl	$1, -16(%ebp)
	jmp	.L106
.L107:
	movl	$1, -20(%ebp)
	jmp	.L108
.L106:
	movl	-16(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L109
.L108:
	cmpl	$1, -20(%ebp)
	jne	.L110
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC25, (%esp)
	call	printf
	jmp	.L99
.L110:
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z14search_in_listPcPP4node
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L111
	movl	$1, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z11add_to_listPcb
	movl	$119, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC26, (%esp)
	call	printf
	movl	id, %eax
	addl	$1, %eax
	movl	%eax, id
	jmp	.L99
.L111:
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC27, (%esp)
	call	printf
.L99:
	movl	$-1, i
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	_Z4keywPcPS_P4nodeS2_S_, .-_Z4keywPcPS_P4nodeS2_S_
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
