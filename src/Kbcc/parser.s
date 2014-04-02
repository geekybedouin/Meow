#This file is part of the Meow project.

#    Meow is a free software: you can redistribute it and/or modify
 #   it under the terms of the GNU General Public License as published by
  #  the Free Software Foundation, version 3 of the License.
#
 #   Meow is distributed in the hope that it will be useful,
  #  but WITHOUT ANY WARRANTY; without even the implied warranty of
   # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    #GNU General Public License for more details.
#
 #   For more info, see <http://www.gnu.org/licenses/>.




	.file	"parse.cpp"
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
	subl	$20, %esp
	movl	12(%ebp), %eax
	movb	%al, -20(%ebp)
	movl	$0, -4(%ebp)
	movl	8(%ebp), %eax
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
.LC3:
	.string	"%c is an operator\n"
	.text
	.globl	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	.type	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_, @function
_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	jmp	.L58
.L81:
	movl	$0, -36(%ebp)
	jmp	.L59
.L62:
	movl	-36(%ebp), %eax
	addl	28(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	-9(%ebp), %al
	jne	.L60
	movsbl	-9(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC3, (%esp)
	call	printf
	movl	op, %eax
	addl	$1, %eax
	movl	%eax, op
	movl	i, %eax
	addl	20(%ebp), %eax
	movb	$0, (%eax)
	movzbl	-9(%ebp), %eax
	movb	%al, -11(%ebp)
	movb	$0, -10(%ebp)
	movl	$111, 4(%esp)
	leal	-11(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	jmp	.L61
.L60:
	addl	$1, -36(%ebp)
.L59:
	cmpl	$14, -36(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L62
	movl	$0, -36(%ebp)
	jmp	.L63
.L79:
	movl	i, %eax
	cmpl	$-1, %eax
	je	.L82
.L64:
	movl	-36(%ebp), %eax
	addl	24(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	-9(%ebp), %al
	jne	.L66
	cmpb	$35, -9(%ebp)
	jne	.L67
	movl	$50, (%esp)
	call	_Znaj
	movl	%eax, -20(%ebp)
	movl	$0, -32(%ebp)
	jmp	.L68
.L69:
	movl	-32(%ebp), %eax
	addl	-20(%ebp), %eax
	movzbl	-9(%ebp), %edx
	movb	%dl, (%eax)
	addl	$1, -32(%ebp)
	movl	36(%ebp), %eax
	movl	%eax, (%esp)
	call	fgetc
	movb	%al, -9(%ebp)
.L68:
	cmpb	$62, -9(%ebp)
	setne	%al
	testb	%al, %al
	jne	.L69
	movl	-32(%ebp), %eax
	addl	-20(%ebp), %eax
	movb	$62, (%eax)
	addl	$1, -32(%ebp)
	movl	-32(%ebp), %eax
	addl	-20(%ebp), %eax
	movb	$0, (%eax)
	movl	$104, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	jmp	.L61
.L67:
	cmpb	$34, -9(%ebp)
	jne	.L70
	movl	$50, (%esp)
	call	_Znaj
	movl	%eax, -16(%ebp)
	movl	$0, -28(%ebp)
	movl	-28(%ebp), %eax
	addl	-16(%ebp), %eax
	movb	$34, (%eax)
	addl	$1, -28(%ebp)
.L71:
	movl	36(%ebp), %eax
	movl	%eax, (%esp)
	call	fgetc
	movb	%al, -9(%ebp)
	movl	-28(%ebp), %eax
	addl	-16(%ebp), %eax
	movzbl	-9(%ebp), %edx
	movb	%dl, (%eax)
	addl	$1, -28(%ebp)
	movsbl	-9(%ebp), %eax
	movl	%eax, (%esp)
	call	putchar
	cmpb	$34, -9(%ebp)
	setne	%al
	testb	%al, %al
	jne	.L71
	addl	$1, -28(%ebp)
	movl	-28(%ebp), %eax
	addl	-16(%ebp), %eax
	movb	$0, (%eax)
	movl	$97, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	%eax, -24(%ebp)
	movl	$-1, i
	movl	-24(%ebp), %eax
	jmp	.L61
.L70:
	cmpb	$40, -9(%ebp)
	jne	.L72
	movb	$40, -11(%ebp)
	movb	$0, -10(%ebp)
	leal	-11(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	$-1, i
	movl	-24(%ebp), %eax
	jmp	.L61
.L72:
	cmpb	$41, -9(%ebp)
	jne	.L73
	movb	$41, -11(%ebp)
	movb	$0, -10(%ebp)
	leal	-11(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	$-1, i
	movl	-24(%ebp), %eax
	jmp	.L61
.L73:
	cmpb	$91, -9(%ebp)
	jne	.L74
	movb	$91, -11(%ebp)
	movb	$0, -10(%ebp)
	leal	-11(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	$-1, i
	movl	-24(%ebp), %eax
	jmp	.L61
.L74:
	cmpb	$93, -9(%ebp)
	jne	.L75
	movb	$93, -11(%ebp)
	movb	$0, -10(%ebp)
	leal	-11(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	$-1, i
	movl	-24(%ebp), %eax
	jmp	.L61
.L75:
	cmpb	$123, -9(%ebp)
	jne	.L76
	movb	$123, -11(%ebp)
	movb	$0, -10(%ebp)
	leal	-11(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	$-1, i
	movl	-24(%ebp), %eax
	jmp	.L61
.L76:
	cmpb	$125, -9(%ebp)
	jne	.L77
	movb	$125, -11(%ebp)
	movb	$0, -10(%ebp)
	leal	-11(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	$-1, i
	movl	-24(%ebp), %eax
	jmp	.L61
.L77:
	cmpb	$59, -9(%ebp)
	jne	.L78
	movb	$59, -11(%ebp)
	movb	$0, -10(%ebp)
	leal	-11(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	$-1, i
	movl	-24(%ebp), %eax
	jmp	.L61
.L78:
	movl	i, %eax
	addl	20(%ebp), %eax
	movb	$0, (%eax)
	movl	44(%ebp), %eax
	addl	$12, %eax
	movl	(%eax), %eax
	movl	%eax, 16(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4keywPcPS_P4nodeS2_S_
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	jmp	.L61
.L66:
	addl	$1, -36(%ebp)
.L63:
	cmpl	$14, -36(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L79
	jmp	.L65
.L82:
	nop
.L65:
	movl	i, %eax
	cmpl	$-1, %eax
	je	.L80
	movl	i, %eax
	addl	20(%ebp), %eax
	movzbl	-9(%ebp), %edx
	movb	%dl, (%eax)
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	jmp	.L58
.L80:
	movl	$0, i
.L58:
	movl	36(%ebp), %eax
	movl	%eax, (%esp)
	call	fgetc
	movb	%al, -9(%ebp)
	cmpb	$-1, -9(%ebp)
	setne	%al
	testb	%al, %al
	jne	.L81
	movl	$0, %eax
.L61:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_, .-_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	.globl	_Z4initPcS_
	.type	_Z4initPcS_, @function
_Z4initPcS_:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	$24, %edx
	movl	$0, %ecx
	movl	%eax, %ebx
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	andl	$1, %ebx
	testl	%ebx, %ebx
	je	.L84
	movb	%cl, (%eax)
	addl	$1, %eax
	subl	$1, %edx
.L84:
	movl	%eax, %ebx
	andl	$2, %ebx
	testl	%ebx, %ebx
	je	.L85
	movw	%cx, (%eax)
	addl	$2, %eax
	subl	$2, %edx
.L85:
	movl	%edx, %esi
	andl	$-4, %esi
	movl	$0, %ebx
.L86:
	movl	%ecx, (%eax,%ebx)
	addl	$4, %ebx
	cmpl	%esi, %ebx
	jb	.L86
	addl	%ebx, %eax
	movl	%edx, %ebx
	andl	$2, %ebx
	testl	%ebx, %ebx
	je	.L88
	movw	%cx, (%eax)
	addl	$2, %eax
.L88:
	andl	$1, %edx
	testl	%edx, %edx
	je	.L89
	movb	%cl, (%eax)
	addl	$1, %eax
.L89:
	movl	$0, i
	movl	$0, -12(%ebp)
	addl	$16, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE9:
	.size	_Z4initPcS_, .-_Z4initPcS_
	.section	.rodata
.LC4:
	.string	"eq"
.LC5:
	.string	"WhiteSpace"
	.align 4
.LC6:
	.string	"Error:\tAssignment used in an condition statement"
.LC7:
	.string	"Error:\tcondition error"
	.text
	.globl	_Z5econdP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z5econdP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z5econdP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$41, %al
	je	.L91
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	jne	.L92
.L91:
	movl	$0, %eax
	jmp	.L90
.L92:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$62, %al
	je	.L93
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$60, %al
	je	.L93
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$61, %al
	je	.L93
	movl	$.LC4, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L94
.L93:
	movl	$.LC4, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L95
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
.L95:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$61, %al
	jne	.L96
.L97:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L98
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L97
.L98:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$61, %al
	jne	.L99
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	jmp	.L96
.L99:
	movl	$.LC6, (%esp)
	call	puts
.L96:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$62, %al
	jne	.L100
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
.L100:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$60, %al
	jne	.L103
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	jmp	.L103
.L94:
	movl	$.LC7, (%esp)
	call	puts
.L103:
.L90:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	_Z5econdP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z5econdP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.section	.rodata
	.align 4
.LC8:
	.string	"Error:\tExpecting a number in a decleration statement"
	.text
	.globl	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	subl	$100, %esp
.L105:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	.cfi_offset 7, -12
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L106
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L105
.L106:
	movl	$0, -36(%ebp)
	jmp	.L107
.L112:
	movl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %ecx
	movl	-36(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L108
.L109:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L110
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L109
.L110:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z5econdP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	$0, %eax
	jmp	.L111
.L108:
	addl	$1, -36(%ebp)
.L107:
	cmpl	$51, -36(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L112
	movl	$0, -32(%ebp)
	jmp	.L113
.L124:
	movl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	16(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %ecx
	movl	-32(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L114
	movl	52(%ebp), %eax
	movl	$-1, -44(%ebp)
	movl	%eax, %edx
	movl	$0, %eax
	movl	-44(%ebp), %ecx
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	movl	%eax, -24(%ebp)
	cmpl	$1, -24(%ebp)
	jle	.L115
	movl	$0, -28(%ebp)
	jmp	.L116
.L119:
	movl	$2, (%esp)
	call	_Znaj
	movl	%eax, -20(%ebp)
	movl	-28(%ebp), %eax
	addl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	-20(%ebp), %eax
	movb	%dl, (%eax)
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, -16(%ebp)
	cmpl	$8, -16(%ebp)
	jg	.L117
	cmpl	$0, -16(%ebp)
	jne	.L117
	movl	-28(%ebp), %eax
	addl	52(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, -12(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L118
	cmpl	$48, -12(%ebp)
	je	.L125
.L118:
	movl	$.LC8, (%esp)
	call	puts
	movl	$0, %eax
	jmp	.L111
.L125:
	nop
.L117:
	addl	$1, -28(%ebp)
.L116:
	movl	-28(%ebp), %eax
	cmpl	-24(%ebp), %eax
	setl	%al
	testb	%al, %al
	jne	.L119
.L120:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L121
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L120
.L121:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z5econdP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	$0, %eax
	jmp	.L111
.L115:
	cmpl	$1, -24(%ebp)
	jne	.L114
.L122:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L123
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L122
.L123:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z5econdP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	$0, %eax
	jmp	.L111
.L114:
	addl	$1, -32(%ebp)
.L113:
	cmpl	$9, -32(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L124
	movl	$1, %eax
.L111:
	addl	$100, %esp
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE11:
	.size	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.section	.rodata
.LC9:
	.string	"else"
	.text
	.globl	_Z7ifprimeP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z7ifprimeP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z7ifprimeP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
.L127:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L128
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L127
.L128:
	movl	$.LC9, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L129
	movl	$.LC9, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
.L129:
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	_Z7ifprimeP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z7ifprimeP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.section	.rodata
	.align 4
.LC10:
	.string	"Error:\tExpecting a number in an assignment statement"
	.align 4
.LC11:
	.string	"Error\tMissing a ) in an assignment statement"
	.align 4
.LC12:
	.string	"Error:\tUnexpected Token in an assignment statement"
	.text
	.globl	_Z1FP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z1FP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z1FP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	subl	$100, %esp
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$48, %al
	je	.L131
	.cfi_offset 7, -12
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$49, %al
	je	.L131
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$50, %al
	je	.L131
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$51, %al
	je	.L131
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$52, %al
	je	.L131
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$53, %al
	je	.L131
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$54, %al
	je	.L131
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$55, %al
	je	.L131
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$56, %al
	je	.L131
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	jne	.L132
.L131:
	movl	$0, -40(%ebp)
	jmp	.L133
.L142:
	movl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	16(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %ecx
	movl	-40(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L134
	movl	52(%ebp), %eax
	movl	$-1, -44(%ebp)
	movl	%eax, %edx
	movl	$0, %eax
	movl	-44(%ebp), %ecx
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	movl	%eax, -24(%ebp)
	cmpl	$1, -24(%ebp)
	jle	.L135
	movl	$0, -36(%ebp)
	jmp	.L136
.L139:
	movl	$2, (%esp)
	call	_Znaj
	movl	%eax, -20(%ebp)
	movl	-36(%ebp), %eax
	addl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	-20(%ebp), %eax
	movb	%dl, (%eax)
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, -16(%ebp)
	cmpl	$8, -16(%ebp)
	jg	.L137
	cmpl	$0, -16(%ebp)
	jne	.L137
	movl	-36(%ebp), %eax
	addl	52(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, -12(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L138
	cmpl	$48, -12(%ebp)
	je	.L154
.L138:
	movl	$.LC10, (%esp)
	call	puts
	movl	$0, %eax
	jmp	.L130
.L154:
	nop
.L137:
	addl	$1, -36(%ebp)
.L136:
	movl	-36(%ebp), %eax
	cmpl	-24(%ebp), %eax
	setl	%al
	testb	%al, %al
	jne	.L139
.L140:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L135
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L140
.L135:
	cmpl	$1, -24(%ebp)
	jne	.L134
.L141:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L134
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L141
.L134:
	addl	$1, -40(%ebp)
.L133:
	cmpl	$9, -40(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L142
	jmp	.L153
.L132:
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$40, %al
	jne	.L144
.L145:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L146
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L145
.L146:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4ExprP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$41, %al
	jne	.L147
.L148:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L153
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L148
.L147:
	movl	$.LC11, (%esp)
	call	puts
	jmp	.L153
.L144:
	movl	$0, -32(%ebp)
	movl	$0, -28(%ebp)
	jmp	.L149
.L152:
	movl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L150
	movl	$1, -32(%ebp)
.L151:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L150
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L151
.L150:
	addl	$1, -28(%ebp)
.L149:
	cmpl	$51, -28(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L152
	cmpl	$0, -32(%ebp)
	jne	.L153
	movl	$.LC12, (%esp)
	call	puts
.L153:
.L130:
	addl	$100, %esp
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE13:
	.size	_Z1FP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z1FP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.section	.rodata
.LC13:
	.string	"*"
.LC14:
	.string	"/"
.LC15:
	.string	"%"
	.text
	.globl	_Z2TpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z2TpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z2TpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$.LC13, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L156
.L157:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L158
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L157
.L158:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z1FP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z2TpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	jmp	.L165
.L156:
	movl	$.LC14, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L160
.L161:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L162
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L161
.L162:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z1FP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z2TpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	jmp	.L165
.L160:
	movl	$.LC15, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L165
.L163:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L164
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L163
.L164:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z1FP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z2TpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
.L165:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	_Z2TpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z2TpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.globl	_Z1TP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z1TP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z1TP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z1FP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z2TpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	_Z1TP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z1TP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.section	.rodata
.LC16:
	.string	"+"
.LC17:
	.string	"-"
	.text
	.globl	_Z2EpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z2EpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z2EpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$.LC16, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L168
.L169:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L170
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L169
.L170:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z1TP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z2EpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	jmp	.L174
.L168:
	movl	$.LC17, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L174
.L172:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L173
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L172
.L173:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z1TP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z2EpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
.L174:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	_Z2EpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z2EpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.globl	_Z4ExprP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z4ExprP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z4ExprP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z1TP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z2EpP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	_Z4ExprP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z4ExprP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.globl	_Z6prefixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z6prefixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z6prefixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	jne	.L177
	movl	$0, %eax
	jmp	.L176
.L177:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L179
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L177
.L179:
.L176:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	_Z6prefixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z6prefixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.globl	_Z7postfixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z7postfixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z7postfixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$41, %al
	jne	.L181
	movl	$0, %eax
	jmp	.L180
.L181:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L183
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L181
.L183:
.L180:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	_Z7postfixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z7postfixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.section	.rodata
.LC18:
	.string	"if"
.LC19:
	.string	"Error:\tCondition not valid"
.LC20:
	.string	"Error\tExpecting )"
.LC21:
	.string	"Error\tExpecting ("
.LC22:
	.string	"Error:\telse missing if"
.LC23:
	.string	"while"
	.align 4
.LC24:
	.string	"Error:\t while condition not valid"
	.align 4
.LC25:
	.string	"Error\tExpecting ) after a while codition"
	.align 4
.LC26:
	.string	"Error\tExpecting ( before a while condition"
.LC27:
	.string	"do"
.LC28:
	.string	"do-while"
	.align 4
.LC29:
	.string	"Error:\t do-while condition not valid"
.LC30:
	.string	"dowhile"
	.align 4
.LC31:
	.string	"Error\tExpecting ) after a do-while codition"
	.align 4
.LC32:
	.string	"Error\tExpecting ( before a do-while condition"
	.align 4
.LC33:
	.string	"Error:\tExpecting a corresponding while for a do statement"
.LC34:
	.string	"switch"
.LC35:
	.string	"for"
	.align 4
.LC36:
	.string	"Error:\tExpecting ) in a for condition"
	.align 4
.LC37:
	.string	"Error:\tExpecting ; in a for condition"
	.align 4
.LC38:
	.string	"Error:\tExpecting ( in a for condition"
.LC39:
	.string	"char"
	.align 4
.LC40:
	.string	"Error:\tDeclaring an already declared variable"
	.align 4
.LC41:
	.string	"Error:\tExpecting a ; in a decleration statement"
	.align 4
.LC42:
	.string	"Error:\tToken isn't defined on this scope"
	.align 4
.LC43:
	.string	"Error:\tExpecting an already declared variable in a declerayion"
	.align 4
.LC44:
	.string	"Error:\tUnexpected token in a decleration statement"
	.align 4
.LC45:
	.string	"Error\tUnexpcted token in a decleration statement"
	.align 4
.LC46:
	.string	"Error:\tExpecting a = ina decleration statement"
	.align 4
.LC47:
	.string	"Error:\tIdentifier name error in a decleration statement"
	.align 4
.LC48:
	.string	"Error:\tMissing a ; in an end of an expression"
.LC49:
	.string	"Error:\tInvalid assignment "
	.text
	.globl	_Z4stmtP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z4stmtP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z4stmtP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	subl	$164, %esp
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	jne	.L185
	.cfi_offset 7, -12
	movl	$0, %eax
	jmp	.L186
.L185:
	movl	$.LC18, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L187
.L188:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L189
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L188
.L189:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$40, %al
	jne	.L190
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	%eax, -56(%ebp)
	cmpl	$1, -56(%ebp)
	jne	.L191
	movl	$.LC19, (%esp)
	call	puts
.L191:
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$41, %al
	jne	.L192
	movl	$.LC18, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	$0, %eax
	jmp	.L186
.L192:
	movl	$.LC20, (%esp)
	call	puts
	jmp	.L193
.L190:
	movl	$.LC21, (%esp)
	call	puts
.L193:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7ifprimeP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	jmp	.L194
.L187:
	movl	$.LC9, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L195
	movl	$.LC22, (%esp)
	call	puts
	jmp	.L194
.L195:
	movl	$.LC23, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L196
.L197:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L198
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L197
.L198:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$40, %al
	jne	.L199
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	%eax, -52(%ebp)
	cmpl	$1, -52(%ebp)
	jne	.L200
	movl	$.LC24, (%esp)
	call	puts
.L200:
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$41, %al
	jne	.L201
	movl	$.LC23, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	$0, %eax
	jmp	.L186
.L201:
	movl	$.LC25, (%esp)
	call	puts
	jmp	.L194
.L199:
	movl	$.LC26, (%esp)
	call	puts
	jmp	.L194
.L196:
	movl	$.LC27, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L202
	movl	$.LC28, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
.L203:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L204
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L203
.L204:
	movl	$.LC23, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L205
.L206:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L207
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L206
.L207:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$40, %al
	jne	.L208
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	%eax, -48(%ebp)
	cmpl	$1, -48(%ebp)
	jne	.L209
	movl	$.LC29, (%esp)
	call	puts
.L209:
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$41, %al
	jne	.L210
	movl	$.LC30, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	$0, %eax
	jmp	.L186
.L210:
	movl	$.LC31, (%esp)
	call	puts
	jmp	.L194
.L208:
	movl	$.LC32, (%esp)
	call	puts
	jmp	.L194
.L205:
	movl	$.LC33, (%esp)
	call	puts
	jmp	.L194
.L202:
	movl	$.LC34, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	je	.L194
	movl	$.LC35, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L211
.L212:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L213
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L212
.L213:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$40, %al
	jne	.L214
.L215:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L216
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L215
.L216:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z6prefixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	jne	.L217
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4condP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	jne	.L218
.L219:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L220
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L219
.L220:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7postfixP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$41, %al
	jne	.L221
	movl	$.LC35, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	$0, %eax
	jmp	.L186
.L221:
	movl	$.LC36, (%esp)
	call	puts
	jmp	.L194
.L218:
	movl	$.LC37, (%esp)
	call	puts
	jmp	.L194
.L217:
	movl	$.LC37, (%esp)
	call	puts
	jmp	.L194
.L214:
	movl	$.LC38, (%esp)
	call	puts
	jmp	.L194
.L211:
	movl	$0, -44(%ebp)
	movl	$0, -96(%ebp)
	jmp	.L222
.L269:
	movl	-96(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$keys, %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L223
	movl	$0, -88(%ebp)
	movl	-88(%ebp), %eax
	movl	%eax, -92(%ebp)
	movl	$.LC39, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L224
	movl	$1, -92(%ebp)
.L224:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L225
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L224
.L225:
	movl	$0, -84(%ebp)
	jmp	.L226
.L267:
	movl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %ecx
	movl	-84(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L227
	movl	$1, -88(%ebp)
	movl	$0, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z14search_in_listPcPP4node
	movl	%eax, -40(%ebp)
	cmpl	$0, -40(%ebp)
	jne	.L228
	movl	$1, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z11add_to_listPcb
	jmp	.L229
.L228:
	movl	$.LC40, (%esp)
	call	puts
	jmp	.L230
.L229:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L231
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L229
.L231:
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$61, %al
	jne	.L232
.L233:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L234
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L233
.L234:
	cmpl	$1, -92(%ebp)
	jne	.L235
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$34, %al
	jne	.L236
.L237:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L238
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L237
.L238:
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	jne	.L239
	movl	$0, %eax
	jmp	.L186
.L239:
	movl	$.LC41, (%esp)
	call	puts
	jmp	.L227
.L236:
	movl	$0, -80(%ebp)
	movl	$0, -76(%ebp)
	jmp	.L240
.L244:
	movl	$0, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z14search_in_listPcPP4node
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	jne	.L241
	movl	$.LC42, (%esp)
	call	puts
	movl	$0, %eax
	jmp	.L186
.L241:
	movl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %ecx
	movl	-76(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L242
	movl	$1, -80(%ebp)
	movl	$0, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z14search_in_listPcPP4node
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	jne	.L243
	movl	$.LC43, (%esp)
	call	puts
	jmp	.L230
.L243:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L242
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L243
.L242:
	addl	$1, -76(%ebp)
.L240:
	cmpl	$51, -76(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L244
	cmpl	$0, -80(%ebp)
	jne	.L227
	movl	$.LC44, (%esp)
	call	puts
	movl	$1, %eax
	jmp	.L186
.L235:
	cmpl	$0, -92(%ebp)
	jne	.L245
.L246:
	movl	$0, -72(%ebp)
	jmp	.L247
.L252:
	movl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %ecx
	movl	-72(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L248
	movl	$0, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z14search_in_listPcPP4node
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jne	.L249
	movl	$.LC42, (%esp)
	call	puts
	movl	$0, %eax
	jmp	.L186
.L249:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L250
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L249
.L250:
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	jne	.L251
	movl	$0, %eax
	jmp	.L186
.L251:
	movl	$.LC41, (%esp)
	call	puts
	movl	$1, %eax
	jmp	.L186
.L248:
	addl	$1, -72(%ebp)
.L247:
	cmpl	$51, -72(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L252
	movl	$0, -68(%ebp)
	jmp	.L253
.L266:
	movl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	16(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %ecx
	movl	-68(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L254
	movl	52(%ebp), %eax
	movl	$-1, -108(%ebp)
	movl	%eax, %edx
	movl	$0, %eax
	movl	-108(%ebp), %ecx
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	movl	%eax, -24(%ebp)
	cmpl	$1, -24(%ebp)
	jle	.L255
	movl	$0, -64(%ebp)
	jmp	.L256
.L259:
	movl	$2, (%esp)
	call	_Znaj
	movl	%eax, -20(%ebp)
	movl	-64(%ebp), %eax
	addl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	-20(%ebp), %eax
	movb	%dl, (%eax)
	movl	-20(%ebp), %eax
	addl	$1, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, -16(%ebp)
	cmpl	$8, -16(%ebp)
	jg	.L257
	cmpl	$0, -16(%ebp)
	jne	.L257
	movl	-64(%ebp), %eax
	addl	52(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, -12(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L258
	cmpl	$48, -12(%ebp)
	je	.L278
.L258:
	movl	$.LC8, (%esp)
	call	puts
	movl	$0, %eax
	jmp	.L186
.L278:
	nop
.L257:
	addl	$1, -64(%ebp)
.L256:
	movl	-64(%ebp), %eax
	cmpl	-24(%ebp), %eax
	setl	%al
	testb	%al, %al
	jne	.L259
.L260:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L261
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L260
.L261:
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	jne	.L262
	movl	$0, %eax
	jmp	.L186
.L262:
	movl	$.LC41, (%esp)
	call	puts
	movl	$1, %eax
	jmp	.L186
.L255:
	cmpl	$1, -24(%ebp)
	jne	.L254
.L263:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L264
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L263
.L264:
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	jne	.L265
	movl	$0, %eax
	jmp	.L186
.L265:
	movl	$.LC41, (%esp)
	call	puts
	movl	$1, %eax
	jmp	.L186
.L254:
	addl	$1, -68(%ebp)
.L253:
	cmpl	$9, -68(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L266
	movl	$1, %eax
	jmp	.L186
.L245:
	movl	$.LC45, (%esp)
	call	puts
	movl	$1, %eax
	jmp	.L186
.L232:
	movl	$.LC46, (%esp)
	call	puts
.L227:
	addl	$1, -84(%ebp)
.L226:
	cmpl	$51, -84(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L267
.L230:
	cmpl	$0, -88(%ebp)
	jne	.L268
	movl	$.LC47, (%esp)
	call	puts
.L268:
	movl	$1, -92(%ebp)
	movl	$0, %eax
	jmp	.L186
.L223:
	addl	$1, -96(%ebp)
.L222:
	cmpl	$31, -96(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L269
	cmpl	$0, -44(%ebp)
	jne	.L194
	movl	$0, -60(%ebp)
	jmp	.L270
.L277:
	movl	52(%ebp), %eax
	movzbl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %ecx
	movl	-60(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L271
.L272:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L273
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L272
.L273:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$61, %al
	jne	.L274
.L275:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L276
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L275
.L276:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4ExprP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$59, %al
	je	.L271
	movl	$.LC48, (%esp)
	call	puts
	jmp	.L271
.L274:
	movl	$.LC49, (%esp)
	call	puts
.L271:
	addl	$1, -60(%ebp)
.L270:
	cmpl	$51, -60(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L277
.L194:
	movl	$1, %eax
.L186:
	addl	$164, %esp
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE20:
	.size	_Z4stmtP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z4stmtP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.globl	_Z6stmtspv
	.type	_Z6stmtspv, @function
_Z6stmtspv:
.LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE21:
	.size	_Z6stmtspv, .-_Z6stmtspv
	.globl	_Z5stmtsP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z5stmtsP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z5stmtsP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
.L281:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L282
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L281
.L282:
	movl	$0, -12(%ebp)
.L283:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4stmtP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L284
.L285:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L286
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L285
.L286:
	movl	52(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4stmtP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	52(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$125, %al
	je	.L289
.L287:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	52(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L288
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L287
.L288:
	call	_Z6stmtspv
	jmp	.L283
.L289:
	nop
.L284:
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	_Z5stmtsP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z5stmtsP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.section	.rodata
	.align 4
.LC50:
	.string	"Error:\tExpecting } after a/an %s statement\n"
	.align 4
.LC51:
	.string	"Error:\tExpecting { before a/an %s statement \n"
	.text
	.globl	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.type	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, @function
_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_:
.LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
.L291:
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 48(%ebp)
	movl	$.LC5, 4(%esp)
	movl	48(%ebp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L292
	movl	48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L291
.L292:
	movl	48(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$123, %al
	jne	.L293
	movl	$20, (%esp)
	call	_Znaj
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 44(%esp)
	movl	48(%ebp), %eax
	movl	%eax, 40(%esp)
	movl	44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	40(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	36(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	32(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	28(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z5stmtsP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$125, %al
	je	.L295
	movl	52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC50, (%esp)
	call	printf
	jmp	.L295
.L293:
	movl	52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC51, (%esp)
	call	printf
.L295:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_, .-_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	.section	.rodata
	.align 4
.LC52:
	.string	"/home/minus/BakWorkspace/source.cpp"
	.align 4
.LC53:
	.string	"/home/minus/BakWorkspace/temp.c"
	.align 4
.LC54:
	.string	"/home/minus/BakWorkspace/symbol.txt"
.LC55:
	.string	"%s"
.LC56:
	.string	"r"
.LC57:
	.string	"file not found"
	.align 4
.LC58:
	.string	"Token \t \t Type \t \t S P E L L I N G \t \t Length \t \t Value \t \t Mem Size \n  "
.LC59:
	.string	"main"
.LC60:
	.string	"main func"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$208, %esp
	movl	12(%ebp), %eax
	movl	%eax, 60(%esp)
	movl	%gs:20, %eax
	movl	%eax, 204(%esp)
	xorl	%eax, %eax
	movl	60(%esp), %eax
	addl	$4, %eax
	movl	$.LC52, (%eax)
	movl	60(%esp), %eax
	addl	$8, %eax
	movl	$.LC53, (%eax)
	movl	60(%esp), %eax
	addl	$12, %eax
	movl	$.LC54, (%eax)
	movl	$0, 76(%esp)
	movl	76(%esp), %eax
	movl	%eax, 80(%esp)
	movl	60(%esp), %eax
	addl	$12, %eax
	movl	(%eax), %eax
	movl	$.LC2, 4(%esp)
	movl	%eax, (%esp)
	.cfi_offset 3, -16
	.cfi_offset 6, -12
	call	fopen
	movl	%eax, ffinal
	movl	$8, (%esp)
	call	_Znaj
	movl	%eax, 84(%esp)
	movl	$62, (%esp)
	call	_Znaj
	movl	%eax, %edx
	movl	84(%esp), %eax
	movl	%edx, (%eax)
	movl	84(%esp), %eax
	leal	4(%eax), %ebx
	movl	$10, (%esp)
	call	_Znaj
	movl	%eax, (%ebx)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	movb	$97, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movb	$98, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$2, %eax
	movb	$99, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$3, %eax
	movb	$100, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$4, %eax
	movb	$101, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$5, %eax
	movb	$102, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$6, %eax
	movb	$103, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$7, %eax
	movb	$104, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$8, %eax
	movb	$105, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$9, %eax
	movb	$106, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$10, %eax
	movb	$107, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$11, %eax
	movb	$108, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$12, %eax
	movb	$109, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$13, %eax
	movb	$110, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$14, %eax
	movb	$111, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$15, %eax
	movb	$112, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$16, %eax
	movb	$113, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$17, %eax
	movb	$114, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$18, %eax
	movb	$115, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$19, %eax
	movb	$116, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$20, %eax
	movb	$117, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$21, %eax
	movb	$118, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$22, %eax
	movb	$119, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$23, %eax
	movb	$120, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$24, %eax
	movb	$121, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$25, %eax
	movb	$122, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$26, %eax
	movb	$65, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$27, %eax
	movb	$66, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$28, %eax
	movb	$67, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$29, %eax
	movb	$68, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$30, %eax
	movb	$69, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$31, %eax
	movb	$70, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$32, %eax
	movb	$71, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$33, %eax
	movb	$72, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$34, %eax
	movb	$73, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$35, %eax
	movb	$74, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$36, %eax
	movb	$75, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$37, %eax
	movb	$76, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$38, %eax
	movb	$77, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$39, %eax
	movb	$78, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$40, %eax
	movb	$79, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$41, %eax
	movb	$80, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$42, %eax
	movb	$81, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$43, %eax
	movb	$82, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$44, %eax
	movb	$83, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$45, %eax
	movb	$84, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$46, %eax
	movb	$85, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$47, %eax
	movb	$86, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$48, %eax
	movb	$87, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$49, %eax
	movb	$88, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$50, %eax
	movb	$89, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$51, %eax
	movb	$90, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$52, %eax
	movb	$48, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$53, %eax
	movb	$49, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$54, %eax
	movb	$50, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$55, %eax
	movb	$51, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$56, %eax
	movb	$52, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$57, %eax
	movb	$53, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$58, %eax
	movb	$54, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$59, %eax
	movb	$55, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$60, %eax
	movb	$56, (%eax)
	movl	84(%esp), %eax
	movl	(%eax), %eax
	addl	$61, %eax
	movb	$57, (%eax)
	movl	84(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movb	$48, (%eax)
	movl	84(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movb	$49, (%eax)
	movl	84(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$2, %eax
	movb	$50, (%eax)
	movl	84(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$3, %eax
	movb	$51, (%eax)
	movl	84(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$4, %eax
	movb	$52, (%eax)
	movl	84(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$5, %eax
	movb	$53, (%eax)
	movl	84(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$6, %eax
	movb	$54, (%eax)
	movl	84(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$7, %eax
	movb	$55, (%eax)
	movl	84(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	addl	$8, %eax
	movb	$56, (%eax)
	movl	84(%esp), %eax
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
	movl	$0, 68(%esp)
	movl	60(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC55, (%esp)
	call	printf
	movl	60(%esp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	$.LC56, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 88(%esp)
	cmpl	$0, 88(%esp)
	jne	.L297
	movl	$.LC57, (%esp)
	call	printf
	movl	$0, %eax
	jmp	.L298
.L297:
	movl	60(%esp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	88(%esp), %eax
	movl	%eax, (%esp)
	call	_Z12preprocesserP8_IO_FILEPc
	movl	60(%esp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$.LC56, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 88(%esp)
	movl	ffinal, %eax
	movl	%eax, 12(%esp)
	movl	$72, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC58, (%esp)
	call	fwrite
.L299:
	movl	68(%esp), %eax
	movl	%eax, 40(%esp)
	movl	60(%esp), %eax
	movl	%eax, 36(%esp)
	leal	96(%esp), %eax
	movl	%eax, 32(%esp)
	movl	88(%esp), %eax
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	leal	188(%esp), %eax
	movl	%eax, 20(%esp)
	leal	171(%esp), %eax
	movl	%eax, 16(%esp)
	leal	146(%esp), %eax
	movl	%eax, 12(%esp)
	movl	84(%esp), %eax
	movl	%eax, 8(%esp)
	movl	80(%esp), %eax
	movl	%eax, 4(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 68(%esp)
	movl	$.LC5, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L300
	movl	68(%esp), %eax
	movl	%eax, 4(%esp)
	leal	146(%esp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	jmp	.L299
.L300:
	movl	68(%esp), %eax
	movb	$35, (%eax)
	movl	$1, %eax
	testb	%al, %al
	je	.L301
.L302:
	movl	68(%esp), %eax
	movl	%eax, 4(%esp)
	leal	146(%esp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	68(%esp), %eax
	movl	%eax, 40(%esp)
	movl	60(%esp), %eax
	movl	%eax, 36(%esp)
	leal	96(%esp), %eax
	movl	%eax, 32(%esp)
	movl	88(%esp), %eax
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	leal	188(%esp), %eax
	movl	%eax, 20(%esp)
	leal	171(%esp), %eax
	movl	%eax, 16(%esp)
	leal	146(%esp), %eax
	movl	%eax, 12(%esp)
	movl	84(%esp), %eax
	movl	%eax, 8(%esp)
	movl	80(%esp), %eax
	movl	%eax, 4(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 68(%esp)
	movl	$.LC5, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L303
	leal	146(%esp), %eax
	movl	$24, %ebx
	movl	$0, %edx
	movl	%eax, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L304
	movw	%dx, (%eax)
	addl	$2, %eax
	subl	$2, %ebx
.L304:
	movl	%ebx, %esi
	andl	$-4, %esi
	movl	$0, %ecx
.L305:
	movl	%edx, (%eax,%ecx)
	addl	$4, %ecx
	cmpl	%esi, %ecx
	jb	.L305
	addl	%ecx, %eax
	movl	%ebx, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L307
	movw	%dx, (%eax)
	addl	$2, %eax
.L307:
	movl	%ebx, %ecx
	andl	$1, %ecx
	testl	%ecx, %ecx
	je	.L308
	movb	%dl, (%eax)
	addl	$1, %eax
.L308:
	movl	$0, i
	movl	$0, 68(%esp)
	jmp	.L302
.L303:
	movl	$0, 72(%esp)
	jmp	.L309
.L336:
	movl	72(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	$keys, %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L310
.L311:
	movl	68(%esp), %eax
	movl	%eax, 4(%esp)
	leal	146(%esp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	68(%esp), %eax
	movl	%eax, 40(%esp)
	movl	60(%esp), %eax
	movl	%eax, 36(%esp)
	leal	96(%esp), %eax
	movl	%eax, 32(%esp)
	movl	88(%esp), %eax
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	leal	188(%esp), %eax
	movl	%eax, 20(%esp)
	leal	171(%esp), %eax
	movl	%eax, 16(%esp)
	leal	146(%esp), %eax
	movl	%eax, 12(%esp)
	movl	84(%esp), %eax
	movl	%eax, 8(%esp)
	movl	80(%esp), %eax
	movl	%eax, 4(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 68(%esp)
	movl	$.LC5, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L312
	leal	146(%esp), %eax
	movl	$24, %ebx
	movl	$0, %edx
	movl	%eax, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L313
	movw	%dx, (%eax)
	addl	$2, %eax
	subl	$2, %ebx
.L313:
	movl	%ebx, %esi
	andl	$-4, %esi
	movl	$0, %ecx
.L314:
	movl	%edx, (%eax,%ecx)
	addl	$4, %ecx
	cmpl	%esi, %ecx
	jb	.L314
	addl	%ecx, %eax
	movl	%ebx, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L316
	movw	%dx, (%eax)
	addl	$2, %eax
.L316:
	movl	%ebx, %ecx
	andl	$1, %ecx
	testl	%ecx, %ecx
	je	.L317
	movb	%dl, (%eax)
	addl	$1, %eax
.L317:
	movl	$0, i
	movl	$0, 68(%esp)
	jmp	.L311
.L312:
	movl	$.LC59, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L318
.L319:
	movl	68(%esp), %eax
	movl	%eax, 4(%esp)
	leal	146(%esp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	68(%esp), %eax
	movl	%eax, 40(%esp)
	movl	60(%esp), %eax
	movl	%eax, 36(%esp)
	leal	96(%esp), %eax
	movl	%eax, 32(%esp)
	movl	88(%esp), %eax
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	leal	188(%esp), %eax
	movl	%eax, 20(%esp)
	leal	171(%esp), %eax
	movl	%eax, 16(%esp)
	leal	146(%esp), %eax
	movl	%eax, 12(%esp)
	movl	84(%esp), %eax
	movl	%eax, 8(%esp)
	movl	80(%esp), %eax
	movl	%eax, 4(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 68(%esp)
	movl	$.LC5, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L320
	leal	146(%esp), %eax
	movl	$24, %ebx
	movl	$0, %edx
	movl	%eax, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L321
	movw	%dx, (%eax)
	addl	$2, %eax
	subl	$2, %ebx
.L321:
	movl	%ebx, %esi
	andl	$-4, %esi
	movl	$0, %ecx
.L322:
	movl	%edx, (%eax,%ecx)
	addl	$4, %ecx
	cmpl	%esi, %ecx
	jb	.L322
	addl	%ecx, %eax
	movl	%ebx, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L324
	movw	%dx, (%eax)
	addl	$2, %eax
.L324:
	movl	%ebx, %ecx
	andl	$1, %ecx
	testl	%ecx, %ecx
	je	.L325
	movb	%dl, (%eax)
	addl	$1, %eax
.L325:
	movl	$0, i
	movl	$0, 68(%esp)
	jmp	.L319
.L320:
	movl	68(%esp), %eax
	movzbl	(%eax), %eax
	cmpb	$40, %al
	jne	.L326
.L327:
	movl	68(%esp), %eax
	movl	%eax, 4(%esp)
	leal	146(%esp), %eax
	movl	%eax, (%esp)
	call	_Z4initPcS_
	movl	68(%esp), %eax
	movl	%eax, 40(%esp)
	movl	60(%esp), %eax
	movl	%eax, 36(%esp)
	leal	96(%esp), %eax
	movl	%eax, 32(%esp)
	movl	88(%esp), %eax
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	leal	188(%esp), %eax
	movl	%eax, 20(%esp)
	leal	171(%esp), %eax
	movl	%eax, 16(%esp)
	leal	146(%esp), %eax
	movl	%eax, 12(%esp)
	movl	84(%esp), %eax
	movl	%eax, 8(%esp)
	movl	80(%esp), %eax
	movl	%eax, 4(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	_Z7lexicalP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_
	movl	%eax, 68(%esp)
	movl	$.LC5, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L328
	leal	146(%esp), %eax
	movl	$24, %ebx
	movl	$0, %edx
	movl	%eax, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L329
	movw	%dx, (%eax)
	addl	$2, %eax
	subl	$2, %ebx
.L329:
	movl	%ebx, %esi
	andl	$-4, %esi
	movl	$0, %ecx
.L330:
	movl	%edx, (%eax,%ecx)
	addl	$4, %ecx
	cmpl	%esi, %ecx
	jb	.L330
	addl	%ecx, %eax
	movl	%ebx, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L332
	movw	%dx, (%eax)
	addl	$2, %eax
.L332:
	movl	%ebx, %ecx
	andl	$1, %ecx
	testl	%ecx, %ecx
	je	.L333
	movb	%dl, (%eax)
	addl	$1, %eax
.L333:
	movl	$0, i
	movl	$0, 68(%esp)
	jmp	.L327
.L328:
	movl	68(%esp), %eax
	movzbl	(%eax), %eax
	cmpb	$41, %al
	jne	.L334
	movl	$.LC60, 44(%esp)
	movl	68(%esp), %eax
	movl	%eax, 40(%esp)
	movl	60(%esp), %eax
	movl	%eax, 36(%esp)
	leal	96(%esp), %eax
	movl	%eax, 32(%esp)
	movl	88(%esp), %eax
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	leal	188(%esp), %eax
	movl	%eax, 20(%esp)
	leal	171(%esp), %eax
	movl	%eax, 16(%esp)
	leal	146(%esp), %eax
	movl	%eax, 12(%esp)
	movl	84(%esp), %eax
	movl	%eax, 8(%esp)
	movl	80(%esp), %eax
	movl	%eax, 4(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	_Z8compoundP4nodeS0_PPcS1_S1_S1_iP8_IO_FILES1_S2_S1_S1_
	jmp	.L335
.L334:
	movl	$1, %eax
	jmp	.L298
.L326:
	movl	$1, %eax
	jmp	.L298
.L318:
	movl	$1, %eax
	jmp	.L298
.L310:
	addl	$1, 72(%esp)
.L309:
	cmpl	$31, 72(%esp)
	setle	%al
	testb	%al, %al
	jne	.L336
.L335:
	leal	146(%esp), %eax
	movl	$24, %ebx
	movl	$0, %edx
	movl	%eax, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L337
	movw	%dx, (%eax)
	addl	$2, %eax
	subl	$2, %ebx
.L337:
	movl	%ebx, %esi
	andl	$-4, %esi
	movl	$0, %ecx
.L338:
	movl	%edx, (%eax,%ecx)
	addl	$4, %ecx
	cmpl	%esi, %ecx
	jb	.L338
	addl	%ecx, %eax
	movl	%ebx, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	.L340
	movw	%dx, (%eax)
	addl	$2, %eax
.L340:
	movl	%ebx, %ecx
	andl	$1, %ecx
	testl	%ecx, %ecx
	je	.L341
	movb	%dl, (%eax)
	addl	$1, %eax
.L341:
	movl	$0, i
	movl	$0, 68(%esp)
	movl	$0, %eax
	jmp	.L298
.L301:
	movl	$1, %eax
.L298:
	movl	204(%esp), %edx
	xorl	%gs:20, %edx
	je	.L342
	call	__stack_chk_fail
.L342:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC61:
	.string	"%s is a ERRORED digit or identifier \n"
.LC62:
	.string	"%s is a number\n"
.LC63:
	.string	"%s is an ERRORED identifier\n"
.LC64:
	.string	"%s is an identifier\n"
	.align 4
.LC65:
	.string	"%s is an exisiting identifier\n"
	.text
	.globl	_Z4keywPcPS_P4nodeS2_S_
	.type	_Z4keywPcPS_P4nodeS2_S_, @function
_Z4keywPcPS_P4nodeS2_S_:
.LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -40(%ebp)
	movl	$0, -32(%ebp)
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L344
	movl	$32, -36(%ebp)
	movl	$1, -32(%ebp)
	movl	$.LC5, -40(%ebp)
.L344:
	movl	$0, -36(%ebp)
	jmp	.L345
.L348:
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
	jne	.L346
	movl	$107, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	%eax, -40(%ebp)
	movl	kw, %eax
	addl	$1, %eax
	movl	%eax, kw
	movl	$1, -32(%ebp)
	movl	-40(%ebp), %eax
	jmp	.L347
.L346:
	addl	$1, -36(%ebp)
.L345:
	cmpl	$31, -36(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L348
	cmpl	$0, -32(%ebp)
	jne	.L349
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	.L350
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_Z10read_digitcPPc
	testb	%al, %al
	je	.L349
	movl	$0, -28(%ebp)
	movl	$0, -24(%ebp)
	jmp	.L351
.L354:
	movl	-24(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_Z10read_digitcPPc
	testb	%al, %al
	je	.L352
	addl	$1, -24(%ebp)
	jmp	.L351
.L352:
	movl	$1, -28(%ebp)
	jmp	.L353
.L351:
	movl	-24(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L354
.L353:
	cmpl	$1, -28(%ebp)
	jne	.L355
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC61, (%esp)
	call	printf
	movl	8(%ebp), %eax
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	jmp	.L347
.L355:
	movl	$99, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	%eax, -40(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC62, (%esp)
	call	printf
	movl	num, %eax
	addl	$1, %eax
	movl	%eax, num
	movl	-40(%ebp), %eax
	jmp	.L347
.L350:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	.L349
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	$0, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_Z9read_charcPPci
	testb	%al, %al
	je	.L349
	movl	$0, -20(%ebp)
	movl	$0, -16(%ebp)
	jmp	.L356
.L359:
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
	je	.L357
	addl	$1, -16(%ebp)
	jmp	.L356
.L357:
	movl	$1, -20(%ebp)
	jmp	.L358
.L356:
	movl	-16(%ebp), %eax
	addl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L359
.L358:
	cmpl	$1, -20(%ebp)
	jne	.L360
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC63, (%esp)
	call	printf
	movl	8(%ebp), %eax
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	jmp	.L347
.L360:
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z14search_in_listPcPP4node
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L361
	movl	$119, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z18symbolmanipulationPcc
	movl	%eax, -40(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC64, (%esp)
	call	printf
	movl	id, %eax
	addl	$1, %eax
	movl	%eax, id
	movl	-40(%ebp), %eax
	jmp	.L347
.L361:
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC65, (%esp)
	call	printf
	movl	8(%ebp), %eax
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	jmp	.L347
.L349:
	movl	$-1, i
	movl	-40(%ebp), %eax
.L347:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	_Z4keywPcPS_P4nodeS2_S_, .-_Z4keywPcPS_P4nodeS2_S_
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
