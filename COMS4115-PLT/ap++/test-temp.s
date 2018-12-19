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
	.globl	_list_findbool          ## -- Begin function list_findbool
	.p2align	4, 0x90
_list_findbool:                         ## @list_findbool
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movq	%rdi, 16(%rsp)
	andl	$1, %esi
	movb	%sil, 11(%rsp)
	movb	11(%rsp), %bl
	movq	(%rdi), %rax
	movl	(%rax), %r15d
	movl	$0, 12(%rsp)
	andb	$1, %bl
	cmpl	%r15d, 12(%rsp)
	jl	LBB24_2
	jmp	LBB24_6
	.p2align	4, 0x90
LBB24_5:                                ## %else
                                        ##   in Loop: Header=BB24_2 Depth=1
	incl	12(%rsp)
	cmpl	%r15d, 12(%rsp)
	jge	LBB24_6
LBB24_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %ebp
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_list_getbool
	andb	$1, %al
	cmpb	%bl, %al
	jne	LBB24_5
## %bb.3:                               ## %then
	movl	%ebp, %eax
	jmp	LBB24_4
LBB24_6:                                ## %merge1
	movl	$-1, %eax
LBB24_4:                                ## %then
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_findint           ## -- Begin function list_findint
	.p2align	4, 0x90
_list_findint:                          ## @list_findint
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r14d
	movq	%rdi, %r15
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %ebx
	movl	$0, 8(%rsp)
	cmpl	%ebx, 8(%rsp)
	jl	LBB25_2
	jmp	LBB25_6
	.p2align	4, 0x90
LBB25_5:                                ## %else
                                        ##   in Loop: Header=BB25_2 Depth=1
	incl	8(%rsp)
	cmpl	%ebx, 8(%rsp)
	jge	LBB25_6
LBB25_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	8(%rsp), %ebp
	movq	%r15, %rdi
	movl	%ebp, %esi
	callq	_list_getint
	cmpl	%r14d, %eax
	jne	LBB25_5
## %bb.3:                               ## %then
	movl	%ebp, %eax
	jmp	LBB25_4
LBB25_6:                                ## %merge1
	movl	$-1, %eax
LBB25_4:                                ## %then
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_findfloat         ## -- Begin function list_findfloat
	.p2align	4, 0x90
_list_findfloat:                        ## @list_findfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movq	%rdi, 24(%rsp)
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movsd	%xmm0, 16(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %ebx
	movl	$0, 4(%rsp)
	cmpl	%ebx, 4(%rsp)
	jl	LBB26_2
	jmp	LBB26_6
	.p2align	4, 0x90
LBB26_5:                                ## %else
                                        ##   in Loop: Header=BB26_2 Depth=1
	incl	4(%rsp)
	cmpl	%ebx, 4(%rsp)
	jge	LBB26_6
LBB26_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	4(%rsp), %ebp
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_list_getfloat
	ucomisd	8(%rsp), %xmm0          ## 8-byte Folded Reload
	jne	LBB26_5
	jp	LBB26_5
## %bb.3:                               ## %then
	movl	%ebp, %eax
	jmp	LBB26_4
LBB26_6:                                ## %merge1
	movl	$-1, %eax
LBB26_4:                                ## %then
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_removebool        ## -- Begin function list_removebool
	.p2align	4, 0x90
_list_removebool:                       ## @list_removebool
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	%rdi, -64(%rbp)
	andl	$1, %esi
	movb	%sil, -41(%rbp)
	movq	(%rdi), %rbx
	movl	(%rbx), %r13d
	movzbl	-41(%rbp), %esi
	callq	_list_findbool
	testl	%eax, %eax
	js	LBB27_5
## %bb.1:                               ## %then
	movq	%rbx, -56(%rbp)         ## 8-byte Spill
	movq	%rsp, %rcx
	leaq	-16(%rcx), %r12
	movq	%r12, %rsp
	incl	%eax
	movl	%eax, -16(%rcx)
	cmpl	%r13d, (%r12)
	jge	LBB27_4
	.p2align	4, 0x90
LBB27_3:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	(%r12), %ebx
	leal	-1(%rbx), %r15d
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_list_getbool
	movzbl	%al, %edx
	movq	%r14, %rdi
	movl	%r15d, %esi
	callq	_list_setbool
	incl	%ebx
	movl	%ebx, (%r12)
	cmpl	%r13d, (%r12)
	jl	LBB27_3
LBB27_4:                                ## %merge2
	decl	%r13d
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movl	%r13d, (%rax)
LBB27_5:                                ## %else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_removeint         ## -- Begin function list_removeint
	.p2align	4, 0x90
_list_removeint:                        ## @list_removeint
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	%rdi, -64(%rbp)
	movl	%esi, -52(%rbp)
	movq	(%rdi), %rbx
	movl	(%rbx), %r13d
	callq	_list_findint
	testl	%eax, %eax
	js	LBB28_5
## %bb.1:                               ## %then
	movq	%rbx, -48(%rbp)         ## 8-byte Spill
	movq	%rsp, %rcx
	leaq	-16(%rcx), %r12
	movq	%r12, %rsp
	incl	%eax
	movl	%eax, -16(%rcx)
	cmpl	%r13d, (%r12)
	jge	LBB28_4
	.p2align	4, 0x90
LBB28_3:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	(%r12), %ebx
	leal	-1(%rbx), %r15d
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_list_getint
	movq	%r14, %rdi
	movl	%r15d, %esi
	movl	%eax, %edx
	callq	_list_setint
	incl	%ebx
	movl	%ebx, (%r12)
	cmpl	%r13d, (%r12)
	jl	LBB28_3
LBB28_4:                                ## %merge2
	decl	%r13d
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movl	%r13d, (%rax)
LBB28_5:                                ## %else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_removefloat       ## -- Begin function list_removefloat
	.p2align	4, 0x90
_list_removefloat:                      ## @list_removefloat
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	%rdi, -64(%rbp)
	movsd	%xmm0, -56(%rbp)
	movq	(%rdi), %rbx
	movl	(%rbx), %r13d
	callq	_list_findfloat
	testl	%eax, %eax
	js	LBB29_5
## %bb.1:                               ## %then
	movq	%rbx, -48(%rbp)         ## 8-byte Spill
	movq	%rsp, %rcx
	leaq	-16(%rcx), %r12
	movq	%r12, %rsp
	incl	%eax
	movl	%eax, -16(%rcx)
	cmpl	%r13d, (%r12)
	jge	LBB29_4
	.p2align	4, 0x90
LBB29_3:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	(%r12), %ebx
	leal	-1(%rbx), %r15d
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_list_getfloat
	movq	%r14, %rdi
	movl	%r15d, %esi
	callq	_list_setfloat
	incl	%ebx
	movl	%ebx, (%r12)
	cmpl	%r13d, (%r12)
	jl	LBB29_3
LBB29_4:                                ## %merge2
	decl	%r13d
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movl	%r13d, (%rax)
LBB29_5:                                ## %else
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_insertbool        ## -- Begin function list_insertbool
	.p2align	4, 0x90
_list_insertbool:                       ## @list_insertbool
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r14d
	movq	%rdi, %r15
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	andl	$1, %edx
	movb	%dl, 7(%rsp)
	movb	7(%rsp), %al
	movb	%al, 6(%rsp)            ## 1-byte Spill
	movq	(%rdi), %r12
	movl	(%r12), %r13d
	leal	-1(%r13), %eax
	movl	%eax, 8(%rsp)
	cmpl	%r14d, 8(%rsp)
	jl	LBB30_3
	.p2align	4, 0x90
LBB30_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	8(%rsp), %ebp
	leal	1(%rbp), %ebx
	movq	%r15, %rdi
	movl	%ebp, %esi
	callq	_list_getbool
	movzbl	%al, %edx
	movq	%r15, %rdi
	movl	%ebx, %esi
	callq	_list_setbool
	decl	%ebp
	movl	%ebp, 8(%rsp)
	cmpl	%r14d, 8(%rsp)
	jge	LBB30_2
LBB30_3:                                ## %merge
	movzbl	6(%rsp), %edx           ## 1-byte Folded Reload
	movq	%r15, %rdi
	movl	%r14d, %esi
	callq	_list_setbool
	incl	%r13d
	movl	%r13d, (%r12)
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_insertint         ## -- Begin function list_insertint
	.p2align	4, 0x90
_list_insertint:                        ## @list_insertint
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r15d
	movq	%rdi, %r12
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movl	%edx, 4(%rsp)           ## 4-byte Spill
	movl	%edx, 8(%rsp)
	movq	(%rdi), %r13
	movl	(%r13), %r14d
	leal	-1(%r14), %eax
	movl	%eax, (%rsp)
	cmpl	%r15d, (%rsp)
	jl	LBB31_3
	.p2align	4, 0x90
LBB31_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	(%rsp), %ebp
	leal	1(%rbp), %ebx
	movq	%r12, %rdi
	movl	%ebp, %esi
	callq	_list_getint
	movq	%r12, %rdi
	movl	%ebx, %esi
	movl	%eax, %edx
	callq	_list_setint
	decl	%ebp
	movl	%ebp, (%rsp)
	cmpl	%r15d, (%rsp)
	jge	LBB31_2
LBB31_3:                                ## %merge
	movq	%r12, %rdi
	movl	%r15d, %esi
	movl	4(%rsp), %edx           ## 4-byte Reload
	callq	_list_setint
	incl	%r14d
	movl	%r14d, (%r13)
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_insertfloat       ## -- Begin function list_insertfloat
	.p2align	4, 0x90
_list_insertfloat:                      ## @list_insertfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r14d
	movq	%rdi, %r15
	movq	%rdi, 32(%rsp)
	movl	%esi, 20(%rsp)
	movsd	%xmm0, 8(%rsp)          ## 8-byte Spill
	movsd	%xmm0, 24(%rsp)
	movq	(%rdi), %r12
	movl	(%r12), %r13d
	leal	-1(%r13), %eax
	movl	%eax, 4(%rsp)
	cmpl	%r14d, 4(%rsp)
	jl	LBB32_3
	.p2align	4, 0x90
LBB32_2:                                ## %while_body
                                        ## =>This Inner Loop Header: Depth=1
	movl	4(%rsp), %ebp
	leal	1(%rbp), %ebx
	movq	%r15, %rdi
	movl	%ebp, %esi
	callq	_list_getfloat
	movq	%r15, %rdi
	movl	%ebx, %esi
	callq	_list_setfloat
	decl	%ebp
	movl	%ebp, 4(%rsp)
	cmpl	%r14d, 4(%rsp)
	jge	LBB32_2
LBB32_3:                                ## %merge
	movq	%r15, %rdi
	movl	%r14d, %esi
	movsd	8(%rsp), %xmm0          ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	callq	_list_setfloat
	incl	%r13d
	movl	%r13d, (%r12)
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_reversebool       ## -- Begin function list_reversebool
	.p2align	4, 0x90
_list_reversebool:                      ## @list_reversebool
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movq	%rdi, 16(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	movl	$0, 12(%rsp)
	decl	%eax
	movl	%eax, 8(%rsp)
	jmp	LBB33_1
	.p2align	4, 0x90
LBB33_2:                                ## %while_body
                                        ##   in Loop: Header=BB33_1 Depth=1
	movl	12(%rsp), %ebp
	movl	8(%rsp), %ebx
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_list_getbool
	movl	%eax, %r15d
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_list_getbool
	movzbl	%al, %edx
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_list_setbool
	movzbl	%r15b, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_list_setbool
	incl	%ebp
	movl	%ebp, 12(%rsp)
	decl	%ebx
	movl	%ebx, 8(%rsp)
LBB33_1:                                ## %while
                                        ## =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %eax
	cmpl	8(%rsp), %eax
	jl	LBB33_2
## %bb.3:                               ## %merge
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_reverseint        ## -- Begin function list_reverseint
	.p2align	4, 0x90
_list_reverseint:                       ## @list_reverseint
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movq	%rdi, 16(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	movl	$0, 12(%rsp)
	decl	%eax
	movl	%eax, 8(%rsp)
	jmp	LBB34_1
	.p2align	4, 0x90
LBB34_2:                                ## %while_body
                                        ##   in Loop: Header=BB34_1 Depth=1
	movl	12(%rsp), %ebp
	movl	8(%rsp), %ebx
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_list_getint
	movl	%eax, %r15d
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_list_getint
	movq	%r14, %rdi
	movl	%ebp, %esi
	movl	%eax, %edx
	callq	_list_setint
	movq	%r14, %rdi
	movl	%ebx, %esi
	movl	%r15d, %edx
	callq	_list_setint
	incl	%ebp
	movl	%ebp, 12(%rsp)
	decl	%ebx
	movl	%ebx, 8(%rsp)
LBB34_1:                                ## %while
                                        ## =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %eax
	cmpl	8(%rsp), %eax
	jl	LBB34_2
## %bb.3:                               ## %merge
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_list_reversefloat      ## -- Begin function list_reversefloat
	.p2align	4, 0x90
_list_reversefloat:                     ## @list_reversefloat
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movq	%rdi, 24(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	movl	$0, 12(%rsp)
	decl	%eax
	movl	%eax, 8(%rsp)
	jmp	LBB35_1
	.p2align	4, 0x90
LBB35_2:                                ## %while_body
                                        ##   in Loop: Header=BB35_1 Depth=1
	movl	12(%rsp), %ebp
	movl	8(%rsp), %ebx
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_list_getfloat
	movsd	%xmm0, 16(%rsp)         ## 8-byte Spill
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_list_getfloat
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_list_setfloat
	movq	%r14, %rdi
	movl	%ebx, %esi
	movsd	16(%rsp), %xmm0         ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	callq	_list_setfloat
	incl	%ebp
	movl	%ebp, 12(%rsp)
	decl	%ebx
	movl	%ebx, 8(%rsp)
LBB35_1:                                ## %while
                                        ## =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %eax
	cmpl	8(%rsp), %eax
	jl	LBB35_2
## %bb.3:                               ## %merge
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	_test
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_test                   ## -- Begin function test
	.p2align	4, 0x90
_test:                                  ## @test
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	L_fmt.3(%rip), %rdi
	movl	$100, %esi
	xorl	%eax, %eax
	callq	_printf
	popq	%rax
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
