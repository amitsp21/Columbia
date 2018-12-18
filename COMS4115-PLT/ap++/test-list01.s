	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_list_getbool           ## -- Begin function list_getbool
	.p2align	4, 0x90
_list_getbool:                          ## @list_getbool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movslq	-12(%rsp), %rax
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rcx
	movb	(%rcx,%rax), %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_getint            ## -- Begin function list_getint
	.p2align	4, 0x90
_list_getint:                           ## @list_getint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movslq	-12(%rsp), %rax
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rcx
	movl	(%rcx,%rax,4), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_getfloat          ## -- Begin function list_getfloat
	.p2align	4, 0x90
_list_getfloat:                         ## @list_getfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movslq	-12(%rsp), %rax
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rcx
	movsd	(%rcx,%rax,8), %xmm0    ## xmm0 = mem[0],zero
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
	.globl	_list_pushbool          ## -- Begin function list_pushbool
	.p2align	4, 0x90
_list_pushbool:                         ## @list_pushbool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	andl	$1, %esi
	movb	%sil, -9(%rsp)
	movq	8(%rdi), %rax
	movslq	4(%rdi), %rcx
	leal	1(%rcx), %edx
	movl	%edx, 4(%rdi)
	movb	-9(%rsp), %dl
	movb	%dl, (%rax,%rcx)
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
	movq	8(%rdi), %rax
	movslq	4(%rdi), %rcx
	leal	1(%rcx), %edx
	movl	%edx, 4(%rdi)
	movl	-12(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
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
	movq	8(%rdi), %rax
	movslq	4(%rdi), %rcx
	leal	1(%rcx), %edx
	movl	%edx, 4(%rdi)
	movsd	-16(%rsp), %xmm0        ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rax,%rcx,8)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_popbool           ## -- Begin function list_popbool
	.p2align	4, 0x90
_list_popbool:                          ## @list_popbool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %rax
	movl	4(%rdi), %ecx
	decl	%ecx
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %al
	movl	%ecx, 4(%rdi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_popint            ## -- Begin function list_popint
	.p2align	4, 0x90
_list_popint:                           ## @list_popint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %rax
	movl	4(%rdi), %ecx
	decl	%ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%ecx, 4(%rdi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_popfloat          ## -- Begin function list_popfloat
	.p2align	4, 0x90
_list_popfloat:                         ## @list_popfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %rax
	movl	4(%rdi), %ecx
	decl	%ecx
	movslq	%ecx, %rcx
	movsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	movl	%ecx, 4(%rdi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_sizebool          ## -- Begin function list_sizebool
	.p2align	4, 0x90
_list_sizebool:                         ## @list_sizebool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	4(%rdi), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_sizeint           ## -- Begin function list_sizeint
	.p2align	4, 0x90
_list_sizeint:                          ## @list_sizeint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	4(%rdi), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_sizefloat         ## -- Begin function list_sizefloat
	.p2align	4, 0x90
_list_sizefloat:                        ## @list_sizefloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	4(%rdi), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_slicebool         ## -- Begin function list_slicebool
	.p2align	4, 0x90
_list_slicebool:                        ## @list_slicebool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %r8
	movq	%rsi, -16(%rsp)
	movq	8(%rsi), %rsi
	movl	-20(%rsp), %edi
	movl	%edx, -20(%rsp)
	movl	-24(%rsp), %edx
	movl	%ecx, -24(%rsp)
	movl	$0, -28(%rsp)
	subl	%edi, %edx
	cmpl	%edx, -28(%rsp)
	jg	LBB15_3
	.p2align	4, 0x90
LBB15_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movslq	-28(%rsp), %rcx
	leal	(%rcx,%rdi), %eax
	cltq
	movzbl	(%r8,%rax), %eax
	movb	%al, (%rsi,%rcx)
	incl	-28(%rsp)
	cmpl	%edx, -28(%rsp)
	jle	LBB15_2
LBB15_3:                                ## %merge
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_sliceint          ## -- Begin function list_sliceint
	.p2align	4, 0x90
_list_sliceint:                         ## @list_sliceint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %r8
	movq	%rsi, -16(%rsp)
	movq	8(%rsi), %rsi
	movl	-20(%rsp), %edi
	movl	%edx, -20(%rsp)
	movl	-24(%rsp), %edx
	movl	%ecx, -24(%rsp)
	movl	$0, -28(%rsp)
	subl	%edi, %edx
	cmpl	%edx, -28(%rsp)
	jg	LBB16_3
	.p2align	4, 0x90
LBB16_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movslq	-28(%rsp), %rcx
	leal	(%rcx,%rdi), %eax
	cltq
	movl	(%r8,%rax,4), %eax
	movl	%eax, (%rsi,%rcx,4)
	incl	-28(%rsp)
	cmpl	%edx, -28(%rsp)
	jle	LBB16_2
LBB16_3:                                ## %merge
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_slicefloat        ## -- Begin function list_slicefloat
	.p2align	4, 0x90
_list_slicefloat:                       ## @list_slicefloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movq	8(%rdi), %r8
	movq	%rsi, -16(%rsp)
	movq	8(%rsi), %rsi
	movl	-20(%rsp), %edi
	movl	%edx, -20(%rsp)
	movl	-24(%rsp), %edx
	movl	%ecx, -24(%rsp)
	movl	$0, -28(%rsp)
	subl	%edi, %edx
	cmpl	%edx, -28(%rsp)
	jg	LBB17_3
	.p2align	4, 0x90
LBB17_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movslq	-28(%rsp), %rcx
	leal	(%rcx,%rdi), %eax
	cltq
	movsd	(%r8,%rax,8), %xmm0     ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rsi,%rcx,8)
	incl	-28(%rsp)
	cmpl	%edx, -28(%rsp)
	jle	LBB17_2
LBB17_3:                                ## %merge
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$8056, %rsp             ## imm = 0x1F78
	.cfi_offset %rbx, -24
	leaq	-64(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -64(%rbp)
	leaq	-8064(%rbp), %rax
	movq	%rax, -56(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -48(%rbp)
	leaq	-4064(%rbp), %rax
	movq	%rax, -40(%rbp)
	movl	$0, -12(%rbp)
	cmpl	$9, -12(%rbp)
	jg	LBB18_3
	.p2align	4, 0x90
LBB18_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %esi
	movq	-24(%rbp), %rdi
	callq	_list_pushint
	incl	-12(%rbp)
	cmpl	$9, -12(%rbp)
	jle	LBB18_2
LBB18_3:                                ## %merge
	movq	%rsp, %rax
	leaq	-16(%rax), %rsp
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rdx
	movq	%rdx, %rsp
	movq	%rdx, -16(%rax)
	movq	$0, -16(%rcx)
	movq	%rsp, %rdx
	addq	$-4000, %rdx            ## imm = 0xF060
	movq	%rdx, %rsp
	movq	%rdx, -8(%rcx)
	movq	-16(%rax), %rbx
	movq	-24(%rbp), %rdi
	xorl	%edx, %edx
	movl	$2, %ecx
	movq	%rbx, %rsi
	callq	_list_sliceint
	movq	%rbx, -32(%rbp)
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_list_getint
	movl	%eax, %ecx
	leaq	L_fmt(%rip), %rdi
	xorl	%eax, %eax
	movl	%ecx, %esi
	callq	_printf
	xorl	%eax, %eax
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_test             ## -- Begin function print_test
	.p2align	4, 0x90
_print_test:                            ## @print_test
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$4032, %rsp             ## imm = 0xFC0
	.cfi_def_cfa_offset 4048
	.cfi_offset %rbx, -16
	movq	$0, 16(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	%rdi, (%rsp)
	movl	%esi, 12(%rsp)
	callq	_list_getint
	movl	%eax, %ecx
	leaq	L_fmt.3(%rip), %rbx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	%ecx, %esi
	callq	_printf
	movq	(%rsp), %rdi
	callq	_list_sizeint
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	%ecx, %esi
	callq	_printf
	addq	$4032, %rsp             ## imm = 0xFC0
	popq	%rbx
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

L_fmt.3:                                ## @fmt.3
	.asciz	"%d\n"

L_fmt.4:                                ## @fmt.4
	.asciz	"%g\n"

L_fmt.5:                                ## @fmt.5
	.asciz	"%s\n"


.subsections_via_symbols
