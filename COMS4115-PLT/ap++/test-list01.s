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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %ebp
	movl	%edx, %r14d
	movq	%rsi, %r15
	movq	%rdi, %r12
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movl	%edx, 12(%rsp)
	movl	%ecx, 8(%rsp)
	movl	$0, 4(%rsp)
	subl	%edx, %ebp
	cmpl	%ebp, 4(%rsp)
	jg	LBB15_3
	.p2align	4, 0x90
LBB15_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	4(%rsp), %ebx
	leal	(%rbx,%r14), %esi
	movq	%r12, %rdi
	callq	_list_getbool
	movzbl	%al, %edx
	movq	%r15, %rdi
	movl	%ebx, %esi
	callq	_list_setbool
	incl	4(%rsp)
	cmpl	%ebp, 4(%rsp)
	jle	LBB15_2
LBB15_3:                                ## %merge
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %ebp
	movl	%edx, %r14d
	movq	%rsi, %r15
	movq	%rdi, %r12
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movl	%edx, 12(%rsp)
	movl	%ecx, 8(%rsp)
	movl	$0, 4(%rsp)
	subl	%edx, %ebp
	cmpl	%ebp, 4(%rsp)
	jg	LBB16_3
	.p2align	4, 0x90
LBB16_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	4(%rsp), %ebx
	leal	(%rbx,%r14), %esi
	movq	%r12, %rdi
	callq	_list_getint
	movq	%r15, %rdi
	movl	%ebx, %esi
	movl	%eax, %edx
	callq	_list_setint
	incl	4(%rsp)
	cmpl	%ebp, 4(%rsp)
	jle	LBB16_2
LBB16_3:                                ## %merge
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%ecx, %ebp
	movl	%edx, %r14d
	movq	%rsi, %r15
	movq	%rdi, %r12
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movl	%edx, 12(%rsp)
	movl	%ecx, 8(%rsp)
	movl	$0, 4(%rsp)
	subl	%edx, %ebp
	cmpl	%ebp, 4(%rsp)
	jg	LBB17_3
	.p2align	4, 0x90
LBB17_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	4(%rsp), %ebx
	leal	(%rbx,%r14), %esi
	movq	%r12, %rdi
	callq	_list_getfloat
	movq	%r15, %rdi
	movl	%ebx, %esi
	callq	_list_setfloat
	incl	4(%rsp)
	cmpl	%ebp, 4(%rsp)
	jle	LBB17_2
LBB17_3:                                ## %merge
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
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
	pushq	%r14
	pushq	%rbx
	subq	$12064, %rsp            ## imm = 0x2F20
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	$0, -32(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, -48(%rbp)
	leaq	-12080(%rbp), %rax
	movq	%rax, -40(%rbp)
	movl	$0, -28(%rbp)
	leaq	-28(%rbp), %rax
	movq	%rax, -80(%rbp)
	leaq	-8080(%rbp), %rax
	movq	%rax, -72(%rbp)
	movl	$0, -24(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -64(%rbp)
	leaq	-4080(%rbp), %rax
	movq	%rax, -56(%rbp)
	movl	$0, -20(%rbp)
	leaq	-48(%rbp), %rbx
	cmpl	$4, -20(%rbp)
	jg	LBB18_3
	.p2align	4, 0x90
LBB18_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %esi
	movq	%rbx, %rdi
	callq	_list_pushint
	incl	-20(%rbp)
	cmpl	$4, -20(%rbp)
	jle	LBB18_2
LBB18_3:                                ## %merge
	movq	%rsp, %rbx
	leaq	-16(%rbx), %rsi
	movq	%rsi, %rsp
	movq	%rsp, %rax
	leaq	-16(%rax), %rcx
	movq	%rcx, %rsp
	movl	$0, -16(%rax)
	movq	%rcx, -16(%rbx)
	movq	%rsp, %rax
	addq	$-4000, %rax            ## imm = 0xF060
	movq	%rax, %rsp
	movq	%rax, -8(%rbx)
	leaq	-48(%rbp), %rdi
	movl	$2, %edx
	movl	$5, %ecx
	callq	_list_sliceint
	movq	-16(%rbx), %rax
	movq	-8(%rbx), %rcx
	movq	%rcx, -72(%rbp)
	movq	%rax, -80(%rbp)
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rcx, -56(%rbp)
	movq	%rax, -64(%rbp)
	leaq	-80(%rbp), %r14
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	_list_getint
	movl	%eax, %ecx
	leaq	L_fmt(%rip), %rbx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	%ecx, %esi
	callq	_printf
	movq	%r14, %rdi
	callq	_list_sizeint
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	%ecx, %esi
	callq	_printf
	leaq	-64(%rbp), %rdi
	callq	_list_sizeint
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	%ecx, %esi
	callq	_printf
	xorl	%eax, %eax
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_test             ## -- Begin function print_test
	.p2align	4, 0x90
_print_test:                            ## @print_test
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$4024, %rsp             ## imm = 0xFB8
	.cfi_def_cfa_offset 4048
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$0, 4(%rsp)
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movl	%edx, (%rsp)
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	movl	%edx, %esi
	callq	_list_getint
	movl	%eax, %ecx
	leaq	L_fmt.3(%rip), %r14
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movq	%rbx, %rdi
	callq	_list_sizeint
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	addq	$4024, %rsp             ## imm = 0xFB8
	popq	%rbx
	popq	%r14
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
