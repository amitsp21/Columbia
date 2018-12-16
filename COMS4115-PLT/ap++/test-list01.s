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
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$12056, %rsp            ## imm = 0x2F18
	.cfi_def_cfa_offset 12080
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	$0, 8(%rsp)
	leaq	4056(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	$0, 40(%rsp)
	leaq	56(%rsp), %rcx
	movq	%rcx, 48(%rsp)
	movq	%rax, 32(%rsp)
	movq	$0, 24(%rsp)
	leaq	8(%rsp), %rbx
	movl	$101, %esi
	movq	%rbx, %rdi
	callq	_list_pushint
	movl	$102, %esi
	movq	%rbx, %rdi
	callq	_list_pushint
	movl	$103, %esi
	movq	%rbx, %rdi
	callq	_list_pushint
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_list_getint
	movl	%eax, %ecx
	leaq	L_fmt(%rip), %r14
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_list_getint
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	_list_getint
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	leaq	24(%rsp), %rdi
	movl	$1, %esi
	callq	_list_getint
	jmp	LBB15_1
	.p2align	4, 0x90
LBB15_2:                                ## %while_body
                                        ##   in Loop: Header=BB15_1 Depth=1
	movq	%rbx, %rdi
	callq	_list_popint
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movq	%rbx, %rdi
	callq	_list_sizeint
LBB15_1:                                ## %while
                                        ## =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movq	%rbx, %rdi
	callq	_list_sizeint
	testl	%eax, %eax
	jg	LBB15_2
## %bb.3:                               ## %merge
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	callq	_list_sizeint
	movl	%eax, %ecx
	leaq	L_fmt(%rip), %r14
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	xorl	%esi, %esi
	movl	$5, %edx
	movq	%rbx, %rdi
	callq	_list_setint
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_list_getint
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movl	$1, %esi
	movl	$10, %edx
	movq	%rbx, %rdi
	callq	_list_setint
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_list_getint
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	xorl	%eax, %eax
	addq	$12056, %rsp            ## imm = 0x2F18
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


.subsections_via_symbols
