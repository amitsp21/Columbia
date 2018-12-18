	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_list_getbool           ## -- Begin function list_getbool
	.p2align	4, 0x90
_list_getbool:                          ## @list_getbool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movb	(%rax,%rcx), %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_getint            ## -- Begin function list_getint
	.p2align	4, 0x90
_list_getint:                           ## @list_getint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_getfloat          ## -- Begin function list_getfloat
	.p2align	4, 0x90
_list_getfloat:                         ## @list_getfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_getstr            ## -- Begin function list_getstr
	.p2align	4, 0x90
_list_getstr:                           ## @list_getstr
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_setbool           ## -- Begin function list_setbool
	.p2align	4, 0x90
_list_setbool:                          ## @list_setbool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %rax
	movslq	%esi, %rcx
	andl	$1, %edx
	movb	%dl, (%rax,%rcx)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_setint            ## -- Begin function list_setint
	.p2align	4, 0x90
_list_setint:                           ## @list_setint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %rax
	movslq	%esi, %rcx
	movl	%edx, (%rax,%rcx,4)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_setfloat          ## -- Begin function list_setfloat
	.p2align	4, 0x90
_list_setfloat:                         ## @list_setfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %rax
	movslq	%esi, %rcx
	movsd	%xmm0, (%rax,%rcx,8)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_setstr            ## -- Begin function list_setstr
	.p2align	4, 0x90
_list_setstr:                           ## @list_setstr
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %rax
	movslq	%esi, %rcx
	movq	%rdx, (%rax,%rcx,8)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_pushbool          ## -- Begin function list_pushbool
	.p2align	4, 0x90
_list_pushbool:                         ## @list_pushbool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	andl	$1, %esi
	movb	%sil, -9(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	movl	%esi, (%rax)
	movb	-9(%rsp), %al
	movb	%al, (%rcx,%rdx)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_pushint           ## -- Begin function list_pushint
	.p2align	4, 0x90
_list_pushint:                          ## @list_pushint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	movl	%esi, (%rax)
	movl	-12(%rsp), %eax
	movl	%eax, (%rcx,%rdx,4)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_pushfloat         ## -- Begin function list_pushfloat
	.p2align	4, 0x90
_list_pushfloat:                        ## @list_pushfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movsd	%xmm0, -16(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	movl	%esi, (%rax)
	movsd	-16(%rsp), %xmm0        ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rcx,%rdx,8)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_pushstr           ## -- Begin function list_pushstr
	.p2align	4, 0x90
_list_pushstr:                          ## @list_pushstr
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	movl	%esi, (%rax)
	movq	-16(%rsp), %rax
	movq	%rax, (%rcx,%rdx,8)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_popbool           ## -- Begin function list_popbool
	.p2align	4, 0x90
_list_popbool:                          ## @list_popbool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rax
	movl	(%rcx), %edx
	decl	%edx
	movslq	%edx, %rdx
	movb	(%rax,%rdx), %al
	movl	%edx, (%rcx)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_popint            ## -- Begin function list_popint
	.p2align	4, 0x90
_list_popint:                           ## @list_popint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rax
	movl	(%rcx), %edx
	decl	%edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%edx, (%rcx)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_popfloat          ## -- Begin function list_popfloat
	.p2align	4, 0x90
_list_popfloat:                         ## @list_popfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movl	(%rax), %edx
	decl	%edx
	movslq	%edx, %rdx
	movsd	(%rcx,%rdx,8), %xmm0    ## xmm0 = mem[0],zero
	movl	%edx, (%rax)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_popstr            ## -- Begin function list_popstr
	.p2align	4, 0x90
_list_popstr:                           ## @list_popstr
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rax
	movl	(%rcx), %edx
	decl	%edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movl	%edx, (%rcx)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_sizebool          ## -- Begin function list_sizebool
	.p2align	4, 0x90
_list_sizebool:                         ## @list_sizebool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_sizeint           ## -- Begin function list_sizeint
	.p2align	4, 0x90
_list_sizeint:                          ## @list_sizeint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_sizefloat         ## -- Begin function list_sizefloat
	.p2align	4, 0x90
_list_sizefloat:                        ## @list_sizefloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_sizestr           ## -- Begin function list_sizestr
	.p2align	4, 0x90
_list_sizestr:                          ## @list_sizestr
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_slicebool         ## -- Begin function list_slicebool
	.p2align	4, 0x90
_list_slicebool:                        ## @list_slicebool
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %ebx
	movl	%edx, %r15d
	movq	%rsi, %r14
	movq	%rdi, %rbp
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 20(%rsp)
	movl	%ecx, 16(%rsp)
	movl	$0, 12(%rsp)
	subl	%edx, %ebx
	cmpl	%ebx, 12(%rsp)
	jg	LBB20_3
	.p2align	4, 0x90
LBB20_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %esi
	addl	%r15d, %esi
	movq	%rbp, %rdi
	callq	_list_getbool
	movzbl	%al, %esi
	movq	%r14, %rdi
	callq	_list_pushbool
	incl	12(%rsp)
	cmpl	%ebx, 12(%rsp)
	jle	LBB20_2
LBB20_3:                                ## %merge
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_sliceint          ## -- Begin function list_sliceint
	.p2align	4, 0x90
_list_sliceint:                         ## @list_sliceint
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %ebx
	movl	%edx, %r15d
	movq	%rsi, %r14
	movq	%rdi, %rbp
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 20(%rsp)
	movl	%ecx, 16(%rsp)
	movl	$0, 12(%rsp)
	subl	%edx, %ebx
	cmpl	%ebx, 12(%rsp)
	jg	LBB21_3
	.p2align	4, 0x90
LBB21_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %esi
	addl	%r15d, %esi
	movq	%rbp, %rdi
	callq	_list_getint
	movq	%r14, %rdi
	movl	%eax, %esi
	callq	_list_pushint
	incl	12(%rsp)
	cmpl	%ebx, 12(%rsp)
	jle	LBB21_2
LBB21_3:                                ## %merge
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_slicefloat        ## -- Begin function list_slicefloat
	.p2align	4, 0x90
_list_slicefloat:                       ## @list_slicefloat
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %ebx
	movl	%edx, %r15d
	movq	%rsi, %r14
	movq	%rdi, %rbp
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 20(%rsp)
	movl	%ecx, 16(%rsp)
	movl	$0, 12(%rsp)
	subl	%edx, %ebx
	cmpl	%ebx, 12(%rsp)
	jg	LBB22_3
	.p2align	4, 0x90
LBB22_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %esi
	addl	%r15d, %esi
	movq	%rbp, %rdi
	callq	_list_getfloat
	movq	%r14, %rdi
	callq	_list_pushfloat
	incl	12(%rsp)
	cmpl	%ebx, 12(%rsp)
	jle	LBB22_2
LBB22_3:                                ## %merge
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_slicestr          ## -- Begin function list_slicestr
	.p2align	4, 0x90
_list_slicestr:                         ## @list_slicestr
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %ebx
	movl	%edx, %r15d
	movq	%rsi, %r14
	movq	%rdi, %rbp
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 20(%rsp)
	movl	%ecx, 16(%rsp)
	movl	$0, 12(%rsp)
	subl	%edx, %ebx
	cmpl	%ebx, 12(%rsp)
	jg	LBB23_3
	.p2align	4, 0x90
LBB23_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %esi
	addl	%r15d, %esi
	movq	%rbp, %rdi
	callq	_list_getstr
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	_list_pushstr
	incl	12(%rsp)
	cmpl	%ebx, 12(%rsp)
	jle	LBB23_2
LBB23_3:                                ## %merge
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI24_0:
	.quad	4614253070214989087     ## double 3.1400000000000001
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$13072, %rsp            ## imm = 0x3310
	.cfi_def_cfa_offset 13104
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$0, 20(%rsp)
	leaq	20(%rsp), %rax
	movq	%rax, 56(%rsp)
	leaq	1072(%rsp), %rax
	movq	%rax, 64(%rsp)
	movl	$0, 16(%rsp)
	leaq	16(%rsp), %rax
	movq	%rax, 40(%rsp)
	leaq	5072(%rsp), %rax
	movq	%rax, 48(%rsp)
	movl	$0, 12(%rsp)
	leaq	12(%rsp), %rax
	movq	%rax, 24(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 32(%rsp)
	leaq	56(%rsp), %rbx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_list_pushint
	leaq	40(%rsp), %r15
	movsd	LCPI24_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	movq	%r15, %rdi
	callq	_list_pushfloat
	leaq	24(%rsp), %r14
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	_list_pushbool
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_list_getint
	movl	%eax, %ecx
	leaq	L_fmt(%rip), %rbx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	%ecx, %esi
	callq	_printf
	xorl	%esi, %esi
	movq	%r15, %rdi
	callq	_list_getfloat
	leaq	L_fmt.1(%rip), %rdi
	movb	$1, %al
	callq	_printf
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	_list_getbool
	movzbl	%al, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	xorl	%eax, %eax
	addq	$13072, %rsp            ## imm = 0x3310
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_fmt:                                  ## @fmt
	.asciz	"%d\n"

L_fmt.1:                                ## @fmt.1
	.asciz	"%g\n"

L_fmt.2:                                ## @fmt.2
	.asciz	"%s\n"


.subsections_via_symbols
