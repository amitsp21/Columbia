	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_list_get               ## -- Begin function list_get
	.p2align	4, 0x90
_list_get:                              ## @list_get
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
	.globl	_list_push_int32        ## -- Begin function list_push_int32
	.p2align	4, 0x90
_list_push_int32:                       ## @list_push_int32
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
	.globl	_list_size_int32        ## -- Begin function list_size_int32
	.p2align	4, 0x90
_list_size_int32:                       ## @list_size_int32
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$8032, %rsp             ## imm = 0x1F60
	.cfi_def_cfa_offset 8064
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$0, 16(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	%rax, 8(%rsp)
	movq	$0, (%rsp)
	leaq	16(%rsp), %rbx
	movl	$101, %esi
	movq	%rbx, %rdi
	callq	_list_push_int32
	movl	$102, %esi
	movq	%rbx, %rdi
	callq	_list_push_int32
	movl	$103, %esi
	movq	%rbx, %rdi
	callq	_list_push_int32
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_list_get
	movl	%eax, %ecx
	leaq	L_fmt(%rip), %r14
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_list_get
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	_list_get
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movq	%rsp, %r15
	movl	$1, %esi
	movq	%r15, %rdi
	callq	_list_get
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	leaq	L_fmt.2(%rip), %rdi
	leaq	L_strptr(%rip), %rsi
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	callq	_list_size_int32
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	movq	%r15, %rdi
	callq	_list_size_int32
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ecx, %esi
	callq	_printf
	xorl	%eax, %eax
	addq	$8032, %rsp             ## imm = 0x1F60
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

L_strptr:                               ## @strptr
	.asciz	"list size:"


.subsections_via_symbols
