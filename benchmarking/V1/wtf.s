	.text
	.cstring
	.align 3
lC0:
	.ascii "basic_string::_M_construct null not valid\0"
	.text
	.align 1,0x90
	.p2align 4
__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_.isra.0:
LFB9578:
	pushq	%r13
LCFI0:
	leaq	16(%rdi), %r13
	pushq	%r12
LCFI1:
	pushq	%rbp
LCFI2:
	pushq	%rbx
LCFI3:
	subq	$24, %rsp
LCFI4:
	testq	%rsi, %rsi
	movq	%r13, (%rdi)
	je	L2
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	movq	%rsi, %rbp
	call	_strlen
	cmpq	$15, %rax
	movq	%rax, %r12
	movq	%rax, 8(%rsp)
	ja	L14
	cmpq	$1, %rax
	jne	L6
	movzbl	0(%rbp), %eax
	movb	%al, 16(%rbx)
L7:
	movq	8(%rsp), %rax
	movq	(%rbx), %rdx
	movq	%rax, 8(%rbx)
	movb	$0, (%rdx,%rax)
	addq	$24, %rsp
LCFI5:
	popq	%rbx
LCFI6:
	popq	%rbp
LCFI7:
	popq	%r12
LCFI8:
	popq	%r13
LCFI9:
	ret
L6:
LCFI10:
	testq	%rax, %rax
	je	L7
	jmp	L5
L14:
	leaq	8(%rsp), %rsi
	xorl	%edx, %edx
	movq	%rbx, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	movq	%rax, %r13
	movq	%rax, (%rbx)
	movq	8(%rsp), %rax
	movq	%rax, 16(%rbx)
L5:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	_memcpy
	jmp	L7
L2:
	leaq	lC0(%rip), %rdi
	call	__ZSt19__throw_logic_errorPKc
LFE9578:
	.p2align 4
	.globl __ZN5CPUID13getProcLeavesEv
__ZN5CPUID13getProcLeavesEv:
LFB8942:
	xorl	%esi, %esi
	pushq	%rbx
LCFI11:
	movl	%esi, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %edi
	movl	%esi, %ecx
	movl	$-2147483648, %eax
	movd	%edi, %xmm0
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movd	%eax, %xmm1
	popq	%rbx
LCFI12:
	punpckldq	%xmm1, %xmm0
	movq	%xmm0, %rax
	ret
LFE8942:
	.align 1,0x90
	.p2align 4
	.globl __ZN3VexIsEpLERKS0_
__ZN3VexIsEpLERKS0_:
LFB8992:
	pushq	%rbp
LCFI13:
	movq	%rsp, %rbp
LCFI14:
	pushq	%r15
	pushq	%r14
	pushq	%r13
LCFI15:
	movq	%rsi, %r13
	pushq	%r12
LCFI16:
	movq	%rdi, %r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
LCFI17:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r14
	movzbl	(%r14), %eax
	testb	%al, %al
	je	L18
L55:
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r15
L19:
	cmpb	$0, 16(%r15)
	jns	L23
	movq	8(%r12), %rax
	xorl	%edx, %edx
	movq	(%r12), %rsi
	leaq	(%rax,%rax), %rcx
	movq	%rcx, %rax
	divq	%rsi
	cmpq	%rcx, %rsi
	ja	L24
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
L25:
	movq	24(%r12), %rcx
	movq	%rdx, %rsi
	addq	$1, %rdx
	movq	24(%r13), %rdi
	salq	$5, %rsi
	addq	%rsi, %rcx
	cmpq	%rdx, %rax
	vmovdqa	(%rdi,%rsi), %ymm0
	vpaddw	(%rcx), %ymm0, %ymm0
	vmovdqa	%ymm0, (%rcx)
	ja	L25
	vzeroupper
L24:
	leaq	-40(%rbp), %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
LCFI18:
	ret
	.p2align 4,,10
	.p2align 3
L23:
LCFI19:
	movzbl	(%r14), %eax
	testb	%al, %al
	je	L57
L27:
	testb	$2, 16(%r15)
	je	L24
	movq	8(%r12), %rax
	xorl	%edx, %edx
	movq	(%r12), %rsi
	leaq	(%rax,%rax), %rcx
	movq	%rcx, %rax
	divq	%rsi
	cmpq	%rsi, %rcx
	jb	L24
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
L31:
	movq	24(%r12), %rcx
	movq	%rdx, %rsi
	addq	$1, %rdx
	movq	24(%r13), %rdi
	salq	$4, %rsi
	addq	%rsi, %rcx
	cmpq	%rdx, %rax
	vmovdqa	(%rdi,%rsi), %xmm0
	vpaddw	(%rcx), %xmm0, %xmm0
	vmovdqa	%xmm0, (%rcx)
	ja	L31
	jmp	L24
	.p2align 4,,10
	.p2align 3
L18:
	movq	%r14, %rdi
	call	___cxa_guard_acquire
	testl	%eax, %eax
	je	L55
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r15
	xorl	%esi, %esi
	movl	%esi, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 24(%rsp)
	testq	%rax, %rax
	movl	%edx, 28(%rsp)
	movq	%rax, (%r15)
	je	L21
	movl	$-2147483648, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, (%r15)
	movl	%eax, %eax
	movl	%ebx, 20(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	movq	%rax, 8(%r15)
	jbe	L21
	movl	$7, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 16(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	jne	L58
L21:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r15)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 16(%rsp)
	movl	%ebx, 20(%rsp)
L22:
	movq	%r14, %rdi
	call	___cxa_guard_release
	jmp	L19
	.p2align 4,,10
	.p2align 3
L57:
	movq	%r14, %rdi
	call	___cxa_guard_acquire
	testl	%eax, %eax
	je	L27
	xorl	%esi, %esi
	movl	%esi, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 24(%rsp)
	testq	%rax, %rax
	movl	%edx, 28(%rsp)
	movq	%rax, (%r15)
	je	L29
	movl	$-2147483648, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, (%r15)
	movl	%eax, %eax
	movl	%ebx, 20(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	movq	%rax, 8(%r15)
	jbe	L29
	movl	$7, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 16(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	jne	L59
L29:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r15)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 16(%rsp)
	movl	%ebx, 20(%rsp)
L30:
	movq	%r14, %rdi
	call	___cxa_guard_release
	jmp	L27
L58:
	movb	$-1, 16(%r15)
	jmp	L22
L59:
	movb	$-1, 16(%r15)
	jmp	L30
LFE8992:
	.align 1,0x90
	.p2align 4
	.globl __ZN3VexIsEpLEs
__ZN3VexIsEpLEs:
LFB8993:
	pushq	%rbp
LCFI20:
	xorl	%edx, %edx
	movq	%rsp, %rbp
LCFI21:
	pushq	%r15
	pushq	%r14
	pushq	%r13
LCFI22:
	movl	%esi, %r13d
	pushq	%r12
LCFI23:
	movq	%rdi, %r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
LCFI24:
	movq	8(%rdi), %rax
	movq	(%rdi), %r15
	leaq	(%rax,%rax), %rsi
	movq	%rsi, %rax
	divq	%r15
	movq	%rax, %r14
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	L61
L101:
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r9
L62:
	cmpb	$0, 16(%r9)
	jns	L66
	vmovd	%r13d, %xmm1
	xorl	%edx, %edx
	cmpq	%r15, %rsi
	vpbroadcastw	%xmm1, %ymm1
	jb	L99
	.p2align 4,,10
	.p2align 3
L69:
	movq	%rdx, %rax
	addq	$1, %rdx
	salq	$5, %rax
	addq	24(%r12), %rax
	cmpq	%r14, %rdx
	vpaddw	(%rax), %ymm1, %ymm0
	vmovdqa	%ymm0, (%rax)
	jb	L69
L99:
	vzeroupper
L83:
	leaq	-40(%rbp), %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
LCFI25:
	ret
	.p2align 4,,10
	.p2align 3
L66:
LCFI26:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	L102
L71:
	testb	$2, 16(%r9)
	je	L83
	cmpq	%r15, %rsi
	jb	L83
	vmovd	%r13d, %xmm0
	xorl	%edx, %edx
	vpbroadcastw	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
L75:
	movq	%rdx, %rax
	addq	$1, %rdx
	salq	$4, %rax
	addq	24(%r12), %rax
	cmpq	%r14, %rdx
	vpaddw	(%rax), %xmm0, %xmm1
	vmovdqa	%xmm1, (%rax)
	jb	L75
	jmp	L83
	.p2align 4,,10
	.p2align 3
L61:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	movq	%rsi, 8(%rsp)
	call	___cxa_guard_acquire
	movq	8(%rsp), %rsi
	testl	%eax, %eax
	je	L101
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r9
	xorl	%edi, %edi
	movl	%edi, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 24(%rsp)
	testq	%rax, %rax
	movl	%edx, 28(%rsp)
	movq	%rax, (%r9)
	je	L64
	movl	$-2147483648, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, (%r9)
	movl	%eax, %eax
	movl	%ebx, 20(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	movq	%rax, 8(%r9)
	jbe	L64
	movl	$7, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 16(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	jne	L103
L64:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r9)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 16(%rsp)
	movl	%ebx, 20(%rsp)
L65:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	movq	%r9, (%rsp)
	movq	%rsi, 8(%rsp)
	call	___cxa_guard_release
	movq	(%rsp), %r9
	movq	8(%rsp), %rsi
	jmp	L62
	.p2align 4,,10
	.p2align 3
L102:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	movq	%r9, (%rsp)
	movq	%rsi, 8(%rsp)
	call	___cxa_guard_acquire
	movq	8(%rsp), %rsi
	testl	%eax, %eax
	movq	(%rsp), %r9
	je	L71
	xorl	%edi, %edi
	movl	%edi, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 24(%rsp)
	testq	%rax, %rax
	movl	%edx, 28(%rsp)
	movq	%rax, (%r9)
	je	L73
	movl	$-2147483648, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, (%r9)
	movl	%eax, %eax
	movl	%ebx, 20(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	movq	%rax, 8(%r9)
	jbe	L73
	movl	$7, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 16(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	jne	L104
L73:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r9)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 16(%rsp)
	movl	%ebx, 20(%rsp)
L74:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	movq	%r9, (%rsp)
	movq	%rsi, 8(%rsp)
	call	___cxa_guard_release
	movq	(%rsp), %r9
	movq	8(%rsp), %rsi
	jmp	L71
L103:
	movb	$-1, 16(%r9)
	jmp	L65
L104:
	movb	$-1, 16(%r9)
	jmp	L74
LFE8993:
	.cstring
lC5:
	.ascii "HERE!\12\0"
	.text
	.p2align 4
	.globl __ZplIsE3VexIT_ERKS2_S4_
__ZplIsE3VexIT_ERKS2_S4_:
LFB8994:
	pushq	%rbp
LCFI27:
	movq	%rsp, %rbp
LCFI28:
	pushq	%r15
LCFI29:
	movq	%rdx, %r15
	movl	$6, %edx
	pushq	%r14
LCFI30:
	movq	%rsi, %r14
	pushq	%r13
	leaq	lC5(%rip), %rsi
	pushq	%r12
LCFI31:
	movq	%rdi, %r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
LCFI32:
	movq	__ZSt4cerr@GOTPCREL(%rip), %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
# 71 "vex.hh" 1
	#here
# 0 "" 2
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rax
	movq	16(%r14), %r8
	movzbl	(%rax), %eax
	testb	%al, %al
	je	L106
L163:
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r13
L107:
	testb	$64, 16(%r13)
	jne	L129
	vmovsd	lC3(%rip), %xmm1
	movq	$-16, %rdx
	movl	$16, %ebx
	vmovss	lC4(%rip), %xmm2
L111:
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtusi2ssq	%r8, %xmm0, %xmm0
	movq	%rbx, (%r12)
	movq	%r8, 16(%r12)
	vdivss	%xmm2, %xmm0, %xmm0
	vrndscaless	$10, %xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvttsd2usi	%xmm0, %rdi
	movq	%rdi, 8(%r12)
	addq	%rdi, %rdi
	je	L164
	addq	%rbx, %rdi
	movq	%rdx, 8(%rsp)
	call	_malloc
	movq	8(%rsp), %rdx
	testq	%rax, %rax
	je	L164
	addq	%rax, %rbx
	andq	%rdx, %rbx
	movq	%rax, -8(%rbx)
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rax
	movq	%rbx, 24(%r12)
	movzbl	(%rax), %eax
	testb	%al, %al
	je	L165
L116:
	cmpb	$0, 16(%r13)
	jns	L120
	movq	8(%r14), %rax
	xorl	%edx, %edx
	movq	(%r14), %rsi
	leaq	(%rax,%rax), %rcx
	movq	%rcx, %rax
	divq	%rsi
	xorl	%edx, %edx
	cmpq	%rcx, %rsi
	ja	L105
	.p2align 4,,10
	.p2align 3
L121:
	movq	24(%r15), %r8
	movq	%rdx, %rcx
	addq	$1, %rdx
	movq	24(%r14), %rdi
	salq	$5, %rcx
	cmpq	%rdx, %rax
	movq	24(%r12), %rsi
	vmovdqa	(%r8,%rcx), %ymm0
	vpaddw	(%rdi,%rcx), %ymm0, %ymm0
	vmovdqa	%ymm0, (%rsi,%rcx)
	ja	L121
	vzeroupper
L105:
	leaq	-40(%rbp), %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
LCFI33:
	ret
	.p2align 4,,10
	.p2align 3
L129:
LCFI34:
	vmovsd	lC1(%rip), %xmm1
	movq	$-32, %rdx
	movl	$32, %ebx
	vmovss	lC2(%rip), %xmm2
	jmp	L111
	.p2align 4,,10
	.p2align 3
L120:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	L166
L124:
	testb	$2, 16(%r13)
	je	L105
	movq	8(%r14), %rax
	xorl	%edx, %edx
	movq	(%r14), %rsi
	leaq	(%rax,%rax), %rcx
	movq	%rcx, %rax
	divq	%rsi
	cmpq	%rsi, %rcx
	jb	L105
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
L128:
	movq	24(%r15), %r8
	movq	%rdx, %rcx
	addq	$1, %rdx
	movq	24(%r14), %rdi
	salq	$4, %rcx
	cmpq	%rax, %rdx
	movq	24(%r12), %rsi
	vmovdqa	(%r8,%rcx), %xmm0
	vpaddw	(%rdi,%rcx), %xmm0, %xmm0
	vmovdqa	%xmm0, (%rsi,%rcx)
	jb	L128
	jmp	L105
	.p2align 4,,10
	.p2align 3
L165:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	call	___cxa_guard_acquire
	testl	%eax, %eax
	je	L116
	xorl	%edi, %edi
	movl	%edi, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 24(%rsp)
	testq	%rax, %rax
	movl	%edx, 28(%rsp)
	movq	%rax, 0(%r13)
	je	L118
	movl	$-2147483648, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, 0(%r13)
	movl	%eax, %eax
	movl	%ebx, 20(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	movq	%rax, 8(%r13)
	jbe	L118
	movl	$7, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 16(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	jne	L167
L118:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r13)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 16(%rsp)
	movl	%ebx, 20(%rsp)
L119:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	call	___cxa_guard_release
	jmp	L116
	.p2align 4,,10
	.p2align 3
L106:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	movq	%r8, 8(%rsp)
	call	___cxa_guard_acquire
	movq	8(%rsp), %r8
	testl	%eax, %eax
	je	L163
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r13
	xorl	%edi, %edi
	movl	%edi, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 24(%rsp)
	testq	%rax, %rax
	movl	%edx, 28(%rsp)
	movq	%rax, 0(%r13)
	je	L109
	movl	$-2147483648, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, 0(%r13)
	movl	%eax, %eax
	movl	%ebx, 20(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	movq	%rax, 8(%r13)
	jbe	L109
	movl	$7, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 16(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	jne	L168
L109:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r13)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 16(%rsp)
	movl	%ebx, 20(%rsp)
L110:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	movq	%r8, 8(%rsp)
	call	___cxa_guard_release
	movq	8(%rsp), %r8
	jmp	L107
	.p2align 4,,10
	.p2align 3
L164:
	movq	$0, 24(%r12)
	movl	$1, %edi
	call	___cxa_allocate_exception
	movq	__ZTI15MemoryException@GOTPCREL(%rip), %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	___cxa_throw
	.p2align 4,,10
	.p2align 3
L166:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	call	___cxa_guard_acquire
	testl	%eax, %eax
	je	L124
	xorl	%edi, %edi
	movl	%edi, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 24(%rsp)
	testq	%rax, %rax
	movl	%edx, 28(%rsp)
	movq	%rax, 0(%r13)
	je	L126
	movl	$-2147483648, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, 0(%r13)
	movl	%eax, %eax
	movl	%ebx, 20(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	movq	%rax, 8(%r13)
	jbe	L126
	movl	$7, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 16(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%edx, 28(%rsp)
	jne	L169
L126:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r13)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 16(%rsp)
	movl	%ebx, 20(%rsp)
L127:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	call	___cxa_guard_release
	jmp	L124
L167:
	movb	$-1, 16(%r13)
	jmp	L119
L168:
	movb	$-1, 16(%r13)
	jmp	L110
L169:
	movb	$-1, 16(%r13)
	jmp	L127
LFE8994:
	.p2align 4
	.globl __ZplIsE3VexIT_ERKS2_S1_
__ZplIsE3VexIT_ERKS2_S1_:
LFB8998:
	pushq	%rbp
LCFI35:
	movq	%rsp, %rbp
LCFI36:
	pushq	%r15
	pushq	%r14
	pushq	%r13
LCFI37:
	movq	%rsi, %r13
	pushq	%r12
LCFI38:
	movq	%rdi, %r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$64, %rsp
LCFI39:
	movq	8(%rsi), %rax
	movq	(%rsi), %rsi
	movl	%edx, 28(%rsp)
	xorl	%edx, %edx
	movq	16(%r13), %r9
	addq	%rax, %rax
	movq	%rax, 40(%rsp)
	divq	%rsi
	movq	%rax, %r15
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rax
	movq	%rsi, 32(%rsp)
	movzbl	(%rax), %eax
	testb	%al, %al
	je	L171
L229:
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r14
L172:
	testb	$64, 16(%r14)
	jne	L195
	vmovsd	lC3(%rip), %xmm1
	movq	$-16, %rdx
	movl	$16, %ebx
	vmovss	lC4(%rip), %xmm2
L176:
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtusi2ssq	%r9, %xmm0, %xmm0
	movq	%rbx, (%r12)
	movq	%r9, 16(%r12)
	vdivss	%xmm2, %xmm0, %xmm0
	vrndscaless	$10, %xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvttsd2usi	%xmm0, %rdi
	movq	%rdi, 8(%r12)
	addq	%rdi, %rdi
	je	L230
	addq	%rbx, %rdi
	movq	%rdx, 16(%rsp)
	call	_malloc
	movq	16(%rsp), %rdx
	testq	%rax, %rax
	je	L230
	addq	%rax, %rbx
	andq	%rbx, %rdx
	movq	%rax, -8(%rdx)
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rax
	movq	%rdx, 24(%r12)
	movzbl	(%rax), %eax
	testb	%al, %al
	je	L231
L181:
	cmpb	$0, 16(%r14)
	jns	L185
	movq	32(%rsp), %rsi
	xorl	%eax, %eax
	cmpq	%rsi, 40(%rsp)
	vpbroadcastw	28(%rsp), %ymm1
	jb	L227
	.p2align 4,,10
	.p2align 3
L188:
	movq	24(%r13), %rdi
	movq	%rax, %rdx
	addq	$1, %rax
	movq	24(%r12), %rcx
	salq	$5, %rdx
	cmpq	%r15, %rax
	vpaddw	(%rdi,%rdx), %ymm1, %ymm0
	vmovdqa	%ymm0, (%rcx,%rdx)
	jb	L188
L227:
	vzeroupper
L170:
	leaq	-40(%rbp), %rsp
	movq	%r12, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
LCFI40:
	ret
	.p2align 4,,10
	.p2align 3
L195:
LCFI41:
	vmovsd	lC1(%rip), %xmm1
	movq	$-32, %rdx
	movl	$32, %ebx
	vmovss	lC2(%rip), %xmm2
	jmp	L176
	.p2align 4,,10
	.p2align 3
L185:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	L232
L190:
	testb	$2, 16(%r14)
	je	L170
	movq	32(%rsp), %rbx
	cmpq	%rbx, 40(%rsp)
	jb	L170
	vpbroadcastw	28(%rsp), %ymm0
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
L194:
	movq	24(%r13), %rdi
	movq	%rax, %rdx
	addq	$1, %rax
	movq	24(%r12), %rcx
	salq	$4, %rdx
	cmpq	%r15, %rax
	vpaddw	(%rdi,%rdx), %ymm0, %ymm1
	vmovdqa	%ymm1, (%rcx,%rdx)
	jb	L194
	jmp	L227
	.p2align 4,,10
	.p2align 3
L231:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	call	___cxa_guard_acquire
	testl	%eax, %eax
	je	L181
	xorl	%edi, %edi
	movl	%edi, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 56(%rsp)
	testq	%rax, %rax
	movl	%edx, 60(%rsp)
	movq	%rax, (%r14)
	je	L183
	movl	$-2147483648, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, (%r14)
	movl	%eax, %eax
	movl	%ebx, 52(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%edx, 60(%rsp)
	movq	%rax, 8(%r14)
	jbe	L183
	movl	$7, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 48(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%edx, 60(%rsp)
	jne	L233
L183:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r14)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 48(%rsp)
	movl	%ebx, 52(%rsp)
L184:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	call	___cxa_guard_release
	jmp	L181
	.p2align 4,,10
	.p2align 3
L171:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	movq	%r9, 16(%rsp)
	call	___cxa_guard_acquire
	movq	16(%rsp), %r9
	testl	%eax, %eax
	je	L229
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r14
	xorl	%edi, %edi
	movl	%edi, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 56(%rsp)
	testq	%rax, %rax
	movl	%edx, 60(%rsp)
	movq	%rax, (%r14)
	je	L174
	movl	$-2147483648, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, (%r14)
	movl	%eax, %eax
	movl	%ebx, 52(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%edx, 60(%rsp)
	movq	%rax, 8(%r14)
	jbe	L174
	movl	$7, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 48(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%edx, 60(%rsp)
	jne	L234
L174:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r14)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 48(%rsp)
	movl	%ebx, 52(%rsp)
L175:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	movq	%r9, 16(%rsp)
	call	___cxa_guard_release
	movq	16(%rsp), %r9
	jmp	L172
	.p2align 4,,10
	.p2align 3
L230:
	movq	$0, 24(%r12)
	movl	$1, %edi
	call	___cxa_allocate_exception
	movq	__ZTI15MemoryException@GOTPCREL(%rip), %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	___cxa_throw
	.p2align 4,,10
	.p2align 3
L232:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	call	___cxa_guard_acquire
	testl	%eax, %eax
	je	L190
	xorl	%edi, %edi
	movl	%edi, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 56(%rsp)
	testq	%rax, %rax
	movl	%edx, 60(%rsp)
	movq	%rax, (%r14)
	je	L192
	movl	$-2147483648, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, (%r14)
	movl	%eax, %eax
	movl	%ebx, 52(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%edx, 60(%rsp)
	movq	%rax, 8(%r14)
	jbe	L192
	movl	$7, %eax
	movl	%edi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, 48(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%edx, 60(%rsp)
	jne	L235
L192:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r14)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 48(%rsp)
	movl	%ebx, 52(%rsp)
L193:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %rdi
	call	___cxa_guard_release
	jmp	L190
L233:
	movb	$-1, 16(%r14)
	jmp	L184
L234:
	movb	$-1, 16(%r14)
	jmp	L175
L235:
	movb	$-1, 16(%r14)
	jmp	L193
LFE8998:
	.p2align 4
	.globl __ZplIsE3VexIT_ES1_RKS2_
__ZplIsE3VexIT_ES1_RKS2_:
LFB8999:
	movl	%esi, %r8d
	pushq	%r12
LCFI42:
	movq	%rdx, %rsi
	movq	%rdi, %r12
	movswl	%r8w, %edx
	call	__ZplIsE3VexIT_ERKS2_S1_
	movq	%r12, %rax
	popq	%r12
LCFI43:
	ret
LFE8999:
	.p2align 4
	.globl __ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
	.weak_definition __ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
__ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_:
LFB9208:
	pushq	%r13
LCFI44:
	movq	%rsi, %r13
	pushq	%r12
LCFI45:
	movq	%rdi, %r12
	movq	%rsi, %rdi
	pushq	%rbp
LCFI46:
	movq	%rdx, %rbp
	call	_strlen
	xorl	%edx, %edx
	movq	%r13, %rcx
	xorl	%esi, %esi
	movq	%rax, %r8
	movq	%rbp, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
	leaq	16(%r12), %rdx
	movq	%rdx, (%r12)
	movq	(%rax), %rcx
	leaq	16(%rax), %rdx
	cmpq	%rdx, %rcx
	je	L242
	movq	%rcx, (%r12)
	movq	16(%rax), %rcx
	movq	%rcx, 16(%r12)
L240:
	movq	8(%rax), %rcx
	movq	%rdx, (%rax)
	movq	$0, 8(%rax)
	movq	%rcx, 8(%r12)
	movb	$0, 16(%rax)
	movq	%r12, %rax
	popq	%rbp
LCFI47:
	popq	%r12
LCFI48:
	popq	%r13
LCFI49:
	ret
	.p2align 4,,10
	.p2align 3
L242:
LCFI50:
	movdqu	16(%rax), %xmm0
	movups	%xmm0, 16(%r12)
	jmp	L240
LFE9208:
	.align 1,0x90
	.p2align 4
	.globl __ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	.weak_definition __ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
__ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev:
LFB9226:
	movq	__ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	pushq	%rbx
LCFI51:
	movq	%rdi, %rbx
	addq	$16, %rax
	movq	%rax, (%rdi)
	movq	72(%rdi), %rdi
	leaq	88(%rbx), %rax
	cmpq	%rax, %rdi
	je	L244
	call	__ZdlPv
L244:
	movq	__ZTVSt15basic_streambufIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	leaq	56(%rbx), %rdi
	addq	$16, %rax
	movq	%rax, (%rbx)
	popq	%rbx
LCFI52:
	jmp	__ZNSt6localeD1Ev
LFE9226:
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB6:
	.text
LHOTB6:
	.p2align 4
	.globl __ZN5CPUID18getCPUVendorStringB5cxx11Ev
__ZN5CPUID18getCPUVendorStringB5cxx11Ev:
LFB8940:
	pushq	%r15
LCFI53:
	xorl	%eax, %eax
	pushq	%r14
LCFI54:
	movl	%eax, %ecx
	pushq	%r13
LCFI55:
	pushq	%r12
LCFI56:
	movq	%rdi, %r12
	pushq	%rbp
LCFI57:
	pushq	%rbx
LCFI58:
	subq	$552, %rsp
LCFI59:
	leaq	272(%rsp), %r15
	leaq	160(%rsp), %r13
	movq	%r15, %rdi
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movq	%r13, 8(%rsp)
	movl	%edx, %r14d
	movl	%eax, 48(%rsp)
	movl	%ecx, 28(%rsp)
	call	__ZNSt8ios_baseC2Ev
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	pxor	%xmm0, %xmm0
	xorl	%esi, %esi
	movups	%xmm0, 504(%rsp)
	movups	%xmm0, 520(%rsp)
	movq	$0, 488(%rsp)
	addq	$16, %rax
	movq	%rax, 272(%rsp)
	xorl	%eax, %eax
	movw	%ax, 496(%rsp)
	movq	__ZTTNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	8(%rax), %rbp
	movq	16(%rax), %rax
	movq	-24(%rbp), %rdi
	movq	%rbp, 160(%rsp)
	movq	%rax, (%rsp)
	addq	%r13, %rdi
	movq	%rax, (%rdi)
LEHB0:
	call	__ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
LEHE0:
	movq	__ZTVNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	leaq	168(%rsp), %r13
	leaq	24(%rax), %rdx
	addq	$64, %rax
	movq	%rax, 272(%rsp)
	movq	__ZTVSt15basic_streambufIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	%rdx, %xmm0
	movq	%rdx, 16(%rsp)
	addq	$16, %rax
	movq	%rax, %xmm1
	leaq	224(%rsp), %rax
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, 160(%rsp)
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	movq	%rax, 40(%rsp)
	movaps	%xmm0, 176(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	call	__ZNSt6localeC1Ev
	movq	__ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	%r13, %rsi
	movq	%r15, %rdi
	movl	$16, 232(%rsp)
	movq	$0, 248(%rsp)
	movb	$0, 256(%rsp)
	addq	$16, %rax
	movq	%rax, 168(%rsp)
	leaq	256(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	%rax, 240(%rsp)
LEHB1:
	call	__ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
LEHE1:
	movq	8(%rsp), %rdi
	leaq	80(%rsp), %r13
	movl	$4, %edx
	movl	%ebx, 80(%rsp)
	movq	%r13, %rsi
	movq	%r13, 64(%rsp)
	movq	$4, 72(%rsp)
	movb	$0, 84(%rsp)
LEHB2:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
LEHE2:
	leaq	112(%rsp), %rbx
	movq	%rax, %rdi
	movl	$4, %edx
	movl	%r14d, 112(%rsp)
	movq	%rbx, %rsi
	movq	%rbx, 96(%rsp)
	movq	$4, 104(%rsp)
	movb	$0, 116(%rsp)
LEHB3:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
LEHE3:
	movq	%rax, %rdi
	movl	28(%rsp), %eax
	movl	$4, %edx
	movq	$4, 136(%rsp)
	leaq	144(%rsp), %r14
	movb	$0, 148(%rsp)
	movq	%r14, %rsi
	movq	%r14, 128(%rsp)
	movl	%eax, 144(%rsp)
LEHB4:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
LEHE4:
	movq	128(%rsp), %rdi
	cmpq	%r14, %rdi
	je	L250
	call	__ZdlPv
L250:
	movq	96(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	L251
	call	__ZdlPv
L251:
	movq	64(%rsp), %rdi
	cmpq	%r13, %rdi
	je	L252
	call	__ZdlPv
L252:
	movq	208(%rsp), %rax
	leaq	16(%r12), %rbx
	movq	$0, 8(%r12)
	movq	%rbx, (%r12)
	movb	$0, 16(%r12)
	testq	%rax, %rax
	je	L253
	movq	192(%rsp), %r8
	movq	200(%rsp), %rcx
	cmpq	%r8, %rax
	ja	L276
	subq	%rcx, %r8
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
LEHB5:
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
L255:
	movq	__ZTVNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	240(%rsp), %rdi
	movq	16(%rsp), %xmm0
	addq	$64, %rax
	movq	%rax, 272(%rsp)
	movq	__ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	cmpq	32(%rsp), %rdi
	movq	%rax, %xmm2
	punpcklqdq	%xmm2, %xmm0
	movaps	%xmm0, 160(%rsp)
	je	L257
	call	__ZdlPv
L257:
	movq	__ZTVSt15basic_streambufIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	40(%rsp), %rdi
	addq	$16, %rax
	movq	%rax, 168(%rsp)
	call	__ZNSt6localeD1Ev
	movq	-24(%rbp), %rax
	movq	%rbp, 160(%rsp)
	movq	%r15, %rdi
	movq	(%rsp), %rsi
	movq	%rsi, 160(%rsp,%rax)
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, 272(%rsp)
	call	__ZNSt8ios_baseD2Ev
	addq	$552, %rsp
LCFI60:
	movq	%r12, %rax
	popq	%rbx
LCFI61:
	popq	%rbp
LCFI62:
	popq	%r12
LCFI63:
	popq	%r13
LCFI64:
	popq	%r14
LCFI65:
	popq	%r15
LCFI66:
	ret
	.p2align 4,,10
	.p2align 3
L276:
LCFI67:
	subq	%rcx, %rax
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movq	%r12, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
	jmp	L255
	.p2align 4,,10
	.p2align 3
L253:
	leaq	240(%rsp), %rsi
	movq	%r12, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
LEHE5:
	jmp	L255
L272:
	movq	%rax, %rbp
	jmp	L258
L269:
	movq	%rax, %rbp
	jmp	L261
L268:
	movq	%rax, %rbp
	jmp	L263
L267:
	movq	%rax, %rbx
	jmp	L265
L271:
	movq	%rax, %rbx
	jmp	L248
L270:
	movq	%rax, %rbp
	jmp	L249
	.section __DATA,__gcc_except_tab
GCC_except_table0:
LLSDA8940:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x4e
	.set L$set$0,LEHB0-LFB8940
	.long L$set$0
	.set L$set$1,LEHE0-LEHB0
	.long L$set$1
	.set L$set$2,L270-LFB8940
	.long L$set$2
	.byte	0
	.set L$set$3,LEHB1-LFB8940
	.long L$set$3
	.set L$set$4,LEHE1-LEHB1
	.long L$set$4
	.set L$set$5,L271-LFB8940
	.long L$set$5
	.byte	0
	.set L$set$6,LEHB2-LFB8940
	.long L$set$6
	.set L$set$7,LEHE2-LEHB2
	.long L$set$7
	.set L$set$8,L267-LFB8940
	.long L$set$8
	.byte	0
	.set L$set$9,LEHB3-LFB8940
	.long L$set$9
	.set L$set$10,LEHE3-LEHB3
	.long L$set$10
	.set L$set$11,L268-LFB8940
	.long L$set$11
	.byte	0
	.set L$set$12,LEHB4-LFB8940
	.long L$set$12
	.set L$set$13,LEHE4-LEHB4
	.long L$set$13
	.set L$set$14,L269-LFB8940
	.long L$set$14
	.byte	0
	.set L$set$15,LEHB5-LFB8940
	.long L$set$15
	.set L$set$16,LEHE5-LEHB5
	.long L$set$16
	.set L$set$17,L272-LFB8940
	.long L$set$17
	.byte	0
	.text
	.section __TEXT,__text_cold,regular,pure_instructions
__ZN5CPUID18getCPUVendorStringB5cxx11Ev.cold:
LFSB8940:
L258:
LCFI68:
	movq	(%r12), %rdi
	cmpq	%rdi, %rbx
	je	L260
	call	__ZdlPv
L260:
	movq	8(%rsp), %rdi
	call	__ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbp, %rdi
LEHB6:
	call	__Unwind_Resume
L261:
	movq	128(%rsp), %rdi
	cmpq	%r14, %rdi
	je	L263
	call	__ZdlPv
L263:
	movq	96(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	L264
	call	__ZdlPv
L264:
	movq	%rbp, %rbx
L265:
	movq	64(%rsp), %rdi
	cmpq	%r13, %rdi
	je	L266
	call	__ZdlPv
L266:
	movq	%rbx, %rbp
	jmp	L260
L248:
	movq	%r13, %rdi
	call	__ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	-24(%rbp), %rax
	movq	%rbp, 160(%rsp)
	movq	%rbx, %rbp
	movq	(%rsp), %rcx
	movq	%rcx, 160(%rsp,%rax)
L249:
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	%r15, %rdi
	addq	$16, %rax
	movq	%rax, 272(%rsp)
	call	__ZNSt8ios_baseD2Ev
	movq	%rbp, %rdi
	call	__Unwind_Resume
LEHE6:
LFE8940:
	.section __DATA,__gcc_except_tab
GCC_except_table1:
LLSDAC8940:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0xd
	.set L$set$18,LEHB6-LCOLDB6
	.long L$set$18
	.set L$set$19,LEHE6-LEHB6
	.long L$set$19
	.long	0
	.byte	0
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE6:
	.text
LHOTE6:
	.section __TEXT,__text_cold,regular,pure_instructions
	.cstring
lC7:
	.ascii "Enabled\0"
lC8:
	.ascii "Disabled\0"
lC9:
	.ascii "Hyper Threading : \0"
lC10:
	.ascii "\12\0"
lC11:
	.ascii "MMX      : \0"
lC12:
	.ascii "SSE      : \0"
lC13:
	.ascii "SSE2     : \0"
lC14:
	.ascii "FPU      : \0"
lC15:
	.ascii "SSE4_1   : \0"
lC16:
	.ascii "SSE4_2   : \0"
lC17:
	.ascii "AVX      : \0"
lC18:
	.ascii "AVX2     : \0"
lC19:
	.ascii "popcount : \0"
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB20:
	.text
LHOTB20:
	.p2align 4
	.globl __ZN5CPUID16printCPUFeaturesB5cxx11Ev
__ZN5CPUID16printCPUFeaturesB5cxx11Ev:
LFB8961:
	pushq	%r15
LCFI69:
	xorl	%esi, %esi
	movl	$1, %eax
	pushq	%r14
LCFI70:
	movl	%esi, %ecx
	pushq	%r13
LCFI71:
	pushq	%r12
LCFI72:
	movq	%rdi, %r12
	pushq	%rbp
LCFI73:
	pushq	%rbx
LCFI74:
	subq	$456, %rsp
LCFI75:
	leaq	176(%rsp), %r14
	leaq	64(%rsp), %rbp
	movq	%r14, %rdi
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%ecx, 16(%rsp)
	movl	%edx, %r13d
	movl	%esi, %ecx
	movl	%eax, 48(%rsp)
	movl	$7, %eax
	movl	%ebx, 52(%rsp)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%ebx, 20(%rsp)
	movl	%eax, 64(%rsp)
	movl	%ecx, 72(%rsp)
	movl	%edx, 76(%rsp)
	call	__ZNSt8ios_baseC2Ev
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	pxor	%xmm0, %xmm0
	xorl	%esi, %esi
	movups	%xmm0, 408(%rsp)
	movups	%xmm0, 424(%rsp)
	movq	$0, 392(%rsp)
	addq	$16, %rax
	movq	%rax, 176(%rsp)
	xorl	%eax, %eax
	movw	%ax, 400(%rsp)
	movq	__ZTTNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	8(%rax), %r15
	movq	16(%rax), %rbx
	movq	-24(%r15), %rdi
	movq	%r15, 64(%rsp)
	addq	%rbp, %rdi
	movq	%rbx, (%rdi)
LEHB7:
	call	__ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
LEHE7:
	movq	__ZTVNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	leaq	24(%rax), %rcx
	addq	$64, %rax
	movq	%rax, 176(%rsp)
	movq	__ZTVSt15basic_streambufIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	%rcx, %xmm0
	movq	%rcx, 8(%rsp)
	addq	$16, %rax
	movq	%rax, %xmm1
	leaq	128(%rsp), %rax
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, 64(%rsp)
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	movq	%rax, 32(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 112(%rsp)
	call	__ZNSt6localeC1Ev
	movq	__ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	%r14, %rdi
	movl	$16, 136(%rsp)
	movq	$0, 152(%rsp)
	movb	$0, 160(%rsp)
	addq	$16, %rax
	movq	%rax, 72(%rsp)
	leaq	160(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	%rax, 144(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, %rsi
	movq	%rax, 40(%rsp)
LEHB8:
	call	__ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
LEHE8:
	leaq	lC9(%rip), %rsi
	movl	$18, %edx
	movq	%rbp, %rdi
LEHB9:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r13d, %eax
	movl	$8, %edx
	movq	%rbp, %rdi
	leaq	lC7(%rip), %rsi
	andl	$268435456, %eax
	cmpl	$1, %eax
	adcq	$-1, %rdx
	testl	%eax, %eax
	leaq	lC8(%rip), %rax
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC11(%rip), %rsi
	movl	$11, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r13d, %eax
	movl	$8, %edx
	movq	%rbp, %rdi
	leaq	lC7(%rip), %rsi
	andl	$8388608, %eax
	cmpl	$1, %eax
	adcq	$-1, %rdx
	testl	%eax, %eax
	leaq	lC8(%rip), %rax
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC12(%rip), %rsi
	movl	$11, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r13d, %eax
	movl	$8, %edx
	movq	%rbp, %rdi
	leaq	lC7(%rip), %rsi
	andl	$33554432, %eax
	cmpl	$1, %eax
	adcq	$-1, %rdx
	testl	%eax, %eax
	leaq	lC8(%rip), %rax
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC13(%rip), %rsi
	movl	$11, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r13d, %eax
	movl	$8, %edx
	movq	%rbp, %rdi
	leaq	lC7(%rip), %rsi
	andl	$67108864, %eax
	cmpl	$1, %eax
	adcq	$-1, %rdx
	testl	%eax, %eax
	leaq	lC8(%rip), %rax
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC14(%rip), %rsi
	movl	$11, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC7(%rip), %rsi
	movq	%r13, %rdx
	movq	%rbp, %rdi
	leaq	lC8(%rip), %rax
	salq	$63, %rdx
	sarq	$63, %rdx
	addq	$8, %rdx
	andl	$1, %r13d
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC15(%rip), %rsi
	movl	$11, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	16(%rsp), %r13d
	movl	$8, %edx
	movq	%rbp, %rdi
	leaq	lC7(%rip), %rsi
	movl	%r13d, %eax
	andl	$524288, %eax
	cmpl	$1, %eax
	adcq	$-1, %rdx
	testl	%eax, %eax
	leaq	lC8(%rip), %rax
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC16(%rip), %rsi
	movl	$11, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r13d, %eax
	movl	$8, %edx
	movq	%rbp, %rdi
	leaq	lC7(%rip), %rsi
	andl	$1048576, %eax
	cmpl	$1, %eax
	adcq	$-1, %rdx
	testl	%eax, %eax
	leaq	lC8(%rip), %rax
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC17(%rip), %rsi
	movl	$11, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r13d, %eax
	movl	$8, %edx
	movq	%rbp, %rdi
	leaq	lC7(%rip), %rsi
	andl	$268435456, %eax
	cmpl	$1, %eax
	adcq	$-1, %rdx
	testl	%eax, %eax
	leaq	lC8(%rip), %rax
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC18(%rip), %rsi
	movl	$11, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	20(%rsp), %eax
	movl	$8, %edx
	movq	%rbp, %rdi
	leaq	lC7(%rip), %rsi
	andl	$32, %eax
	cmpl	$1, %eax
	adcq	$-1, %rdx
	testl	%eax, %eax
	leaq	lC8(%rip), %rax
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC19(%rip), %rsi
	movl	$11, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r13d, %eax
	movl	$8, %edx
	movq	%rbp, %rdi
	leaq	lC7(%rip), %rsi
	andl	$8388608, %eax
	cmpl	$1, %eax
	adcq	$-1, %rdx
	testl	%eax, %eax
	leaq	lC8(%rip), %rax
	cmove	%rax, %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%rbp, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
LEHE9:
	movq	112(%rsp), %rax
	leaq	16(%r12), %r13
	movq	$0, 8(%r12)
	movq	%r13, (%r12)
	movb	$0, 16(%r12)
	testq	%rax, %rax
	je	L298
	movq	96(%rsp), %r8
	movq	104(%rsp), %rcx
	cmpq	%r8, %rax
	ja	L333
	subq	%rcx, %r8
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
LEHB10:
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
L300:
	movq	__ZTVNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	144(%rsp), %rdi
	movq	8(%rsp), %xmm0
	addq	$64, %rax
	movq	%rax, 176(%rsp)
	movq	__ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	cmpq	24(%rsp), %rdi
	movq	%rax, %xmm2
	punpcklqdq	%xmm2, %xmm0
	movaps	%xmm0, 64(%rsp)
	je	L302
	call	__ZdlPv
L302:
	movq	__ZTVSt15basic_streambufIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	32(%rsp), %rdi
	addq	$16, %rax
	movq	%rax, 72(%rsp)
	call	__ZNSt6localeD1Ev
	movq	-24(%r15), %rax
	movq	%r15, 64(%rsp)
	movq	%r14, %rdi
	movq	%rbx, 64(%rsp,%rax)
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, 176(%rsp)
	call	__ZNSt8ios_baseD2Ev
	addq	$456, %rsp
LCFI76:
	movq	%r12, %rax
	popq	%rbx
LCFI77:
	popq	%rbp
LCFI78:
	popq	%r12
LCFI79:
	popq	%r13
LCFI80:
	popq	%r14
LCFI81:
	popq	%r15
LCFI82:
	ret
	.p2align 4,,10
	.p2align 3
L333:
LCFI83:
	subq	%rcx, %rax
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movq	%r12, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
	jmp	L300
	.p2align 4,,10
	.p2align 3
L298:
	leaq	144(%rsp), %rsi
	movq	%r12, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
LEHE10:
	jmp	L300
L329:
	movq	%rax, %rbx
	jmp	L303
L326:
	movq	%rax, %r12
	jmp	L305
L328:
	movq	%rax, %rbp
	jmp	L279
L327:
	movq	%rax, %rbp
	jmp	L280
	.section __DATA,__gcc_except_tab
GCC_except_table2:
LLSDA8961:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x34
	.set L$set$20,LEHB7-LFB8961
	.long L$set$20
	.set L$set$21,LEHE7-LEHB7
	.long L$set$21
	.set L$set$22,L327-LFB8961
	.long L$set$22
	.byte	0
	.set L$set$23,LEHB8-LFB8961
	.long L$set$23
	.set L$set$24,LEHE8-LEHB8
	.long L$set$24
	.set L$set$25,L328-LFB8961
	.long L$set$25
	.byte	0
	.set L$set$26,LEHB9-LFB8961
	.long L$set$26
	.set L$set$27,LEHE9-LEHB9
	.long L$set$27
	.set L$set$28,L326-LFB8961
	.long L$set$28
	.byte	0
	.set L$set$29,LEHB10-LFB8961
	.long L$set$29
	.set L$set$30,LEHE10-LEHB10
	.long L$set$30
	.set L$set$31,L329-LFB8961
	.long L$set$31
	.byte	0
	.text
	.section __TEXT,__text_cold,regular,pure_instructions
__ZN5CPUID16printCPUFeaturesB5cxx11Ev.cold:
LFSB8961:
L303:
LCFI84:
	movq	(%r12), %rdi
	cmpq	%rdi, %r13
	je	L304
	call	__ZdlPv
L304:
	movq	%rbx, %r12
L305:
	movq	%rbp, %rdi
	call	__ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%r12, %rdi
LEHB11:
	call	__Unwind_Resume
L279:
	movq	40(%rsp), %rdi
	call	__ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	-24(%r15), %rax
	movq	%r15, 64(%rsp)
	movq	%rbx, 64(%rsp,%rax)
L280:
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	%r14, %rdi
	addq	$16, %rax
	movq	%rax, 176(%rsp)
	call	__ZNSt8ios_baseD2Ev
	movq	%rbp, %rdi
	call	__Unwind_Resume
LEHE11:
LFE8961:
	.section __DATA,__gcc_except_tab
GCC_except_table3:
LLSDAC8961:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0xd
	.set L$set$32,LEHB11-LCOLDB20
	.long L$set$32
	.set L$set$33,LEHE11-LEHB11
	.long L$set$33
	.long	0
	.byte	0
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE20:
	.text
LHOTE20:
	.section __TEXT,__text_cold,regular,pure_instructions
	.cstring
lC21:
	.ascii "L2 Cache:\12\0"
lC22:
	.ascii "Line size (B)   : \0"
lC23:
	.ascii "Assoc. Type     : \0"
lC24:
	.ascii "x\12\0"
lC25:
	.ascii "Cache Size (KB) :\0"
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB26:
	.text
LHOTB26:
	.p2align 4
	.globl __ZN5CPUID11L2CacheDataB5cxx11Ev
__ZN5CPUID11L2CacheDataB5cxx11Ev:
LFB8965:
	pushq	%r15
LCFI85:
	movl	$-2147483642, %eax
	xorl	%ecx, %ecx
	pushq	%r14
LCFI86:
	pushq	%r13
LCFI87:
	pushq	%r12
LCFI88:
	movq	%rdi, %r12
	pushq	%rbp
LCFI89:
	pushq	%rbx
LCFI90:
	subq	$440, %rsp
LCFI91:
	leaq	160(%rsp), %r15
	leaq	48(%rsp), %r14
	movq	%r15, %rdi
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, 32(%rsp)
	movl	%ecx, %ebp
	movl	%ebx, 36(%rsp)
	movl	%edx, 44(%rsp)
	call	__ZNSt8ios_baseC2Ev
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	pxor	%xmm0, %xmm0
	xorl	%esi, %esi
	movups	%xmm0, 392(%rsp)
	movups	%xmm0, 408(%rsp)
	movq	$0, 376(%rsp)
	addq	$16, %rax
	movq	%rax, 160(%rsp)
	xorl	%eax, %eax
	movw	%ax, 384(%rsp)
	movq	__ZTTNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	8(%rax), %rbx
	movq	16(%rax), %rax
	movq	-24(%rbx), %rdi
	movq	%rbx, 48(%rsp)
	movq	%rax, (%rsp)
	addq	%r14, %rdi
	movq	%rax, (%rdi)
LEHB12:
	call	__ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
LEHE12:
	movq	__ZTVNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	leaq	56(%rsp), %r13
	leaq	24(%rax), %rcx
	addq	$64, %rax
	movq	%rax, 160(%rsp)
	movq	__ZTVSt15basic_streambufIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	%rcx, %xmm0
	movq	%rcx, 8(%rsp)
	addq	$16, %rax
	movq	%rax, %xmm1
	leaq	112(%rsp), %rax
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, 48(%rsp)
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	movq	%rax, 24(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 96(%rsp)
	call	__ZNSt6localeC1Ev
	movq	__ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	%r13, %rsi
	movq	%r15, %rdi
	movl	$16, 120(%rsp)
	movq	$0, 136(%rsp)
	movb	$0, 144(%rsp)
	addq	$16, %rax
	movq	%rax, 56(%rsp)
	leaq	144(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	%rax, 128(%rsp)
LEHB13:
	call	__ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
LEHE13:
	leaq	lC21(%rip), %rsi
	movl	$10, %edx
	movq	%r14, %rdi
LEHB14:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC22(%rip), %rsi
	movl	$18, %edx
	movq	%r14, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movzbl	%bpl, %esi
	movq	%r14, %rdi
	call	__ZNSo9_M_insertImEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r13
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC23(%rip), %rsi
	movl	$18, %edx
	movq	%r13, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%ebp, %esi
	movq	%r13, %rdi
	shrl	$12, %esi
	andl	$7, %esi
	call	__ZNSo9_M_insertImEERSoT_
	movl	$2, %edx
	movq	%rax, %rdi
	movq	%rax, %r13
	leaq	lC24(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC25(%rip), %rsi
	movl	$17, %edx
	movq	%r13, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	shrl	$16, %ebp
	movq	%r13, %rdi
	movl	%ebp, %esi
	call	__ZNSo9_M_insertImEERSoT_
	leaq	lC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %edx
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
LEHE14:
	movq	96(%rsp), %rax
	leaq	16(%r12), %rbp
	movq	$0, 8(%r12)
	movq	%rbp, (%r12)
	movb	$0, 16(%r12)
	testq	%rax, %rax
	je	L338
	movq	80(%rsp), %r8
	movq	88(%rsp), %rcx
	cmpq	%r8, %rax
	ja	L353
	subq	%rcx, %r8
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
LEHB15:
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
L340:
	movq	__ZTVNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	128(%rsp), %rdi
	movq	8(%rsp), %xmm0
	addq	$64, %rax
	movq	%rax, 160(%rsp)
	movq	__ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	cmpq	16(%rsp), %rdi
	movq	%rax, %xmm2
	punpcklqdq	%xmm2, %xmm0
	movaps	%xmm0, 48(%rsp)
	je	L342
	call	__ZdlPv
L342:
	movq	__ZTVSt15basic_streambufIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	24(%rsp), %rdi
	addq	$16, %rax
	movq	%rax, 56(%rsp)
	call	__ZNSt6localeD1Ev
	movq	-24(%rbx), %rax
	movq	%rbx, 48(%rsp)
	movq	%r15, %rdi
	movq	(%rsp), %rbx
	movq	%rbx, 48(%rsp,%rax)
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, 160(%rsp)
	call	__ZNSt8ios_baseD2Ev
	addq	$440, %rsp
LCFI92:
	movq	%r12, %rax
	popq	%rbx
LCFI93:
	popq	%rbp
LCFI94:
	popq	%r12
LCFI95:
	popq	%r13
LCFI96:
	popq	%r14
LCFI97:
	popq	%r15
LCFI98:
	ret
	.p2align 4,,10
	.p2align 3
L353:
LCFI99:
	subq	%rcx, %rax
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movq	%r12, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
	jmp	L340
	.p2align 4,,10
	.p2align 3
L338:
	leaq	128(%rsp), %rsi
	movq	%r12, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
LEHE15:
	jmp	L340
L349:
	movq	%rax, %rbx
	jmp	L343
L346:
	movq	%rax, %rbp
	jmp	L345
L348:
	movq	%rax, %rbp
	jmp	L336
L347:
	movq	%rax, %rbp
	jmp	L337
	.section __DATA,__gcc_except_tab
GCC_except_table4:
LLSDA8965:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x34
	.set L$set$34,LEHB12-LFB8965
	.long L$set$34
	.set L$set$35,LEHE12-LEHB12
	.long L$set$35
	.set L$set$36,L347-LFB8965
	.long L$set$36
	.byte	0
	.set L$set$37,LEHB13-LFB8965
	.long L$set$37
	.set L$set$38,LEHE13-LEHB13
	.long L$set$38
	.set L$set$39,L348-LFB8965
	.long L$set$39
	.byte	0
	.set L$set$40,LEHB14-LFB8965
	.long L$set$40
	.set L$set$41,LEHE14-LEHB14
	.long L$set$41
	.set L$set$42,L346-LFB8965
	.long L$set$42
	.byte	0
	.set L$set$43,LEHB15-LFB8965
	.long L$set$43
	.set L$set$44,LEHE15-LEHB15
	.long L$set$44
	.set L$set$45,L349-LFB8965
	.long L$set$45
	.byte	0
	.text
	.section __TEXT,__text_cold,regular,pure_instructions
__ZN5CPUID11L2CacheDataB5cxx11Ev.cold:
LFSB8965:
L343:
LCFI100:
	movq	(%r12), %rdi
	cmpq	%rdi, %rbp
	je	L344
	call	__ZdlPv
L344:
	movq	%rbx, %rbp
L345:
	movq	%r14, %rdi
	call	__ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbp, %rdi
LEHB16:
	call	__Unwind_Resume
L336:
	movq	%r13, %rdi
	call	__ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	-24(%rbx), %rax
	movq	%rbx, 48(%rsp)
	movq	(%rsp), %rbx
	movq	%rbx, 48(%rsp,%rax)
L337:
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	%r15, %rdi
	addq	$16, %rax
	movq	%rax, 160(%rsp)
	call	__ZNSt8ios_baseD2Ev
	movq	%rbp, %rdi
	call	__Unwind_Resume
LEHE16:
LFE8965:
	.section __DATA,__gcc_except_tab
GCC_except_table5:
LLSDAC8965:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0xd
	.set L$set$46,LEHB16-LCOLDB26
	.long L$set$46
	.set L$set$47,LEHE16-LEHB16
	.long L$set$47
	.long	0
	.byte	0
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE26:
	.text
LHOTE26:
	.section __TEXT,__text_cold,regular,pure_instructions
	.text
	.align 1,0x90
	.p2align 4
	.globl __ZN10ContiguousIsEC1ERKS0_
	.weak_definition __ZN10ContiguousIsEC1ERKS0_
__ZN10ContiguousIsEC1ERKS0_:
LFB9245:
	pushq	%r13
LCFI101:
	pushq	%r12
LCFI102:
	movq	%rdi, %r12
	pushq	%rbp
LCFI103:
	pushq	%rbx
LCFI104:
	subq	$8, %rsp
LCFI105:
	movq	(%rsi), %rdi
	movq	8(%rsi), %rax
	movq	16(%rsi), %r13
	movdqu	(%rsi), %xmm0
	leaq	-1(%rdi), %rdx
	addq	%rax, %rax
	testq	%rdi, %rdx
	movups	%xmm0, (%r12)
	movq	%r13, 16(%r12)
	jne	L363
	testq	%rax, %rax
	je	L358
	cmpq	$16, %rdi
	movl	$16, %ebx
	movq	%rsi, %rbp
	cmovnb	%rdi, %rbx
	leaq	(%rax,%rbx), %rdi
	call	_malloc
	testq	%rax, %rax
	movq	%rax, %rdx
	je	L358
	addq	%rbx, %rax
	negq	%rbx
	movq	%rbx, %rdi
	andq	%rax, %rdi
	movq	%rdx, -8(%rdi)
	movq	24(%rbp), %rsi
	leaq	(%r13,%r13), %rdx
	movq	%rdi, 24(%r12)
	addq	$8, %rsp
LCFI106:
	popq	%rbx
LCFI107:
	popq	%rbp
LCFI108:
	popq	%r12
LCFI109:
	popq	%r13
LCFI110:
	jmp	_memcpy
	.p2align 4,,10
	.p2align 3
L358:
LCFI111:
	movq	$0, 24(%r12)
L356:
	movl	$1, %edi
	call	___cxa_allocate_exception
	movq	__ZTI15MemoryException@GOTPCREL(%rip), %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	___cxa_throw
	.p2align 4,,10
	.p2align 3
L363:
	call	___error
	movq	$0, 24(%r12)
	movl	$22, (%rax)
	jmp	L356
LFE9245:
	.align 1,0x90
	.p2align 4
	.globl __ZN3VexIsEC1Ems
	.weak_definition __ZN3VexIsEC1Ems
__ZN3VexIsEC1Ems:
LFB9279:
	pushq	%r15
LCFI112:
	pushq	%r14
LCFI113:
	pushq	%r13
LCFI114:
	movl	%edx, %r13d
	pushq	%r12
LCFI115:
	movq	%rdi, %r12
	pushq	%rbp
LCFI116:
	movq	%rsi, %rbp
	pushq	%rbx
LCFI117:
	subq	$24, %rsp
LCFI118:
	movq	__ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r14
	movzbl	(%r14), %eax
	testb	%al, %al
	je	L365
L399:
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r15
L366:
	testb	$64, 16(%r15)
	jne	L387
	movl	$16, %ebx
	testq	%rbp, %rbp
	movsd	lC3(%rip), %xmm4
	movq	$-16, %r14
	movss	lC4(%rip), %xmm0
	movq	%rbx, (%r12)
	js	L371
L401:
	pxor	%xmm1, %xmm1
	cvtsi2ssq	%rbp, %xmm1
L372:
	divss	%xmm0, %xmm1
	movss	lC28(%rip), %xmm2
	movss	lC27(%rip), %xmm5
	movaps	%xmm1, %xmm3
	movaps	%xmm1, %xmm0
	andps	%xmm2, %xmm3
	ucomiss	%xmm3, %xmm5
	jbe	L373
	cvttss2sil	%xmm1, %eax
	pxor	%xmm3, %xmm3
	movss	lC29(%rip), %xmm5
	andnps	%xmm1, %xmm2
	cvtsi2ssl	%eax, %xmm3
	cmpnless	%xmm3, %xmm0
	andps	%xmm5, %xmm0
	addss	%xmm3, %xmm0
	orps	%xmm2, %xmm0
L373:
	cvtss2sd	%xmm0, %xmm0
	mulsd	%xmm4, %xmm0
	movsd	lC30(%rip), %xmm1
	comisd	%xmm1, %xmm0
	jnb	L374
	cvttsd2siq	%xmm0, %rdi
	movq	%rbp, 16(%r12)
	movq	%rdi, 8(%r12)
	addq	%rdi, %rdi
	je	L400
L376:
	addq	%rbx, %rdi
	call	_malloc
	testq	%rax, %rax
	je	L400
	leaq	(%rax,%rbx), %rdx
	andq	%r14, %rdx
	testq	%rbp, %rbp
	movq	%rax, -8(%rdx)
	movq	%rdx, 24(%r12)
	je	L364
	leaq	-1(%rbp), %rsi
	cmpq	$6, %rsi
	jbe	L388
	movq	%rbp, %rcx
	movd	%r13d, %xmm0
	movq	%rdx, %rax
	shrq	$3, %rcx
	punpcklwd	%xmm0, %xmm0
	pshufd	$0, %xmm0, %xmm0
	salq	$4, %rcx
	addq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
L382:
	movups	%xmm0, (%rax)
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	L382
	movq	%rbp, %rax
	andq	$-8, %rax
	testb	$7, %bpl
	je	L364
L380:
	movq	%rbp, %rdi
	subq	%rax, %rsi
	subq	%rax, %rdi
	cmpq	$2, %rsi
	jbe	L385
	movq	%rdi, %rcx
	movd	%r13d, %xmm6
	andq	$-4, %rcx
	pshuflw	$0, %xmm6, %xmm0
	movq	%xmm0, (%rdx,%rax,2)
	addq	%rcx, %rax
	cmpq	%rcx, %rdi
	je	L364
L385:
	leaq	1(%rax), %rcx
	movw	%r13w, (%rdx,%rax,2)
	cmpq	%rcx, %rbp
	jbe	L364
	addq	$2, %rax
	movw	%r13w, (%rdx,%rcx,2)
	cmpq	%rax, %rbp
	jbe	L364
	movw	%r13w, (%rdx,%rax,2)
L364:
	addq	$24, %rsp
LCFI119:
	popq	%rbx
LCFI120:
	popq	%rbp
LCFI121:
	popq	%r12
LCFI122:
	popq	%r13
LCFI123:
	popq	%r14
LCFI124:
	popq	%r15
LCFI125:
	ret
	.p2align 4,,10
	.p2align 3
L374:
LCFI126:
	subsd	%xmm1, %xmm0
	movq	%rbp, 16(%r12)
	cvttsd2siq	%xmm0, %rdi
	btcq	$63, %rdi
	movq	%rdi, 8(%r12)
	addq	%rdi, %rdi
	jne	L376
L400:
	movq	$0, 24(%r12)
	movl	$1, %edi
	call	___cxa_allocate_exception
	movq	__ZTI15MemoryException@GOTPCREL(%rip), %rsi
	xorl	%edx, %edx
	movq	%rax, %rdi
	call	___cxa_throw
	.p2align 4,,10
	.p2align 3
L387:
	movl	$32, %ebx
	testq	%rbp, %rbp
	movsd	lC1(%rip), %xmm4
	movq	$-32, %r14
	movss	lC2(%rip), %xmm0
	movq	%rbx, (%r12)
	jns	L401
L371:
	movq	%rbp, %rax
	movq	%rbp, %rdx
	pxor	%xmm1, %xmm1
	shrq	%rax
	andl	$1, %edx
	orq	%rdx, %rax
	cvtsi2ssq	%rax, %xmm1
	addss	%xmm1, %xmm1
	jmp	L372
	.p2align 4,,10
	.p2align 3
L365:
	movq	%r14, %rdi
	call	___cxa_guard_acquire
	testl	%eax, %eax
	je	L399
	movq	__ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL(%rip), %r15
	xorl	%esi, %esi
	movl	%esi, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, %eax
	movl	%ecx, 8(%rsp)
	testq	%rax, %rax
	movl	%edx, 12(%rsp)
	movq	%rax, (%r15)
	je	L368
	movl	$-2147483648, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	cmpq	$6, (%r15)
	movl	%eax, %eax
	movl	%ebx, 4(%rsp)
	movl	%ecx, 8(%rsp)
	movl	%edx, 12(%rsp)
	movq	%rax, 8(%r15)
	jbe	L368
	movl	$7, %eax
	movl	%esi, %ecx
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	andl	$32, %ebx
	movl	%eax, (%rsp)
	movl	%ecx, 8(%rsp)
	movl	%edx, 12(%rsp)
	jne	L402
L368:
	movl	$1, %eax
	xorl	%ecx, %ecx
	movb	$1, 16(%r15)
# 132 "x86_cpuid.hpp" 1
	cpuid
# 0 "" 2
	movl	%eax, (%rsp)
	movl	%ebx, 4(%rsp)
L369:
	movq	%r14, %rdi
	call	___cxa_guard_release
	jmp	L366
L388:
	xorl	%eax, %eax
	jmp	L380
L402:
	movb	$-1, 16(%r15)
	jmp	L369
LFE9279:
	.cstring
lC31:
	.ascii "size mismatch\12\0"
lC32:
	.ascii " != \0"
	.text
	.p2align 4
	.globl __Z5equalIsEbRK3VexIT_ERKSt6vectorIS1_SaIS1_EE
	.weak_definition __Z5equalIsEbRK3VexIT_ERKSt6vectorIS1_SaIS1_EE
__Z5equalIsEbRK3VexIT_ERKSt6vectorIS1_SaIS1_EE:
LFB9280:
	pushq	%r12
LCFI127:
	pushq	%rbp
LCFI128:
	pushq	%rbx
LCFI129:
	movq	(%rsi), %rcx
	movq	8(%rsi), %rdx
	subq	%rcx, %rdx
	sarq	%rdx
	cmpq	%rdx, 16(%rdi)
	jne	L411
	testq	%rdx, %rdx
	je	L408
	movq	24(%rdi), %rdi
	movq	%rsi, %rbp
	xorl	%eax, %eax
	jmp	L407
	.p2align 4,,10
	.p2align 3
L406:
	addq	$1, %rax
	cmpq	%rdx, %rax
	je	L408
L407:
	movswl	(%rdi,%rax,2), %esi
	leaq	(%rax,%rax), %rbx
	cmpw	(%rcx,%rax,2), %si
	je	L406
	movq	__ZSt4cerr@GOTPCREL(%rip), %rdi
	call	__ZNSolsEs
	movl	$4, %edx
	leaq	lC32(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	0(%rbp), %rax
	movq	%r12, %rdi
	movswl	(%rax,%rbx), %esi
	call	__ZNSolsEs
	movl	$1, %edx
	leaq	lC10(%rip), %rsi
	movq	%rax, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	popq	%rbx
LCFI130:
	xorl	%eax, %eax
	popq	%rbp
LCFI131:
	popq	%r12
LCFI132:
	ret
	.p2align 4,,10
	.p2align 3
L408:
LCFI133:
	popq	%rbx
LCFI134:
	movl	$1, %eax
	popq	%rbp
LCFI135:
	popq	%r12
LCFI136:
	ret
	.p2align 4,,10
	.p2align 3
L411:
LCFI137:
	movq	__ZSt4cerr@GOTPCREL(%rip), %rdi
	movl	$14, %edx
	leaq	lC31(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	popq	%rbx
LCFI138:
	xorl	%eax, %eax
	popq	%rbp
LCFI139:
	popq	%r12
LCFI140:
	ret
LFE9280:
	.cstring
	.align 3
lC33:
	.ascii "*--------------------------------\12\0"
lC34:
	.ascii "| Capacity: \0"
lC35:
	.ascii "| Used:     \0"
lC36:
	.ascii "| @:        \0"
lC37:
	.ascii "| (long) @: \0"
lC38:
	.ascii "| @ % 16    \0"
lC39:
	.ascii "| @ % 32    \0"
lC40:
	.ascii "| @ % 64    \0"
lC41:
	.ascii "| sizeof(T)=\0"
lC42:
	.ascii "| reg_size =\0"
lC43:
	.ascii "| elems/reg \0"
lC44:
	.ascii "| # regs    \0"
lC45:
	.ascii "| \0"
lC46:
	.ascii " \0"
lC47:
	.ascii "# \0"
	.text
	.align 1,0x90
	.p2align 4
	.globl __ZNK10ContiguousIsE8toStringB5cxx11Ev
	.weak_definition __ZNK10ContiguousIsE8toStringB5cxx11Ev
__ZNK10ContiguousIsE8toStringB5cxx11Ev:
LFB9407:
	pushq	%r15
LCFI141:
	movq	%rdi, %r15
	pushq	%r14
LCFI142:
	pushq	%r13
LCFI143:
	pushq	%r12
LCFI144:
	pushq	%rbp
LCFI145:
	movq	%rsi, %rbp
	pushq	%rbx
LCFI146:
	subq	$440, %rsp
LCFI147:
	leaq	160(%rsp), %rbx
	movq	%rbx, 16(%rsp)
	leaq	48(%rsp), %r13
	movq	%rbx, %rdi
	call	__ZNSt8ios_baseC2Ev
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	pxor	%xmm0, %xmm0
	xorl	%esi, %esi
	movups	%xmm0, 392(%rsp)
	movups	%xmm0, 408(%rsp)
	movq	$0, 376(%rsp)
	addq	$16, %rax
	movq	%rax, 160(%rsp)
	xorl	%eax, %eax
	movw	%ax, 384(%rsp)
	movq	__ZTTNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	8(%rax), %rcx
	movq	16(%rax), %rax
	movq	-24(%rcx), %rdi
	movq	%rcx, 48(%rsp)
	movq	%rcx, (%rsp)
	movq	%rax, 8(%rsp)
	addq	%r13, %rdi
	movq	%rax, (%rdi)
LEHB17:
	call	__ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
LEHE17:
	movq	__ZTVNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	leaq	56(%rsp), %r12
	leaq	24(%rax), %rcx
	addq	$64, %rax
	movq	%rax, 160(%rsp)
	movq	__ZTVSt15basic_streambufIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	%rcx, %xmm0
	movq	%rcx, 24(%rsp)
	addq	$16, %rax
	movq	%rax, %xmm1
	leaq	112(%rsp), %rax
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, 48(%rsp)
	pxor	%xmm0, %xmm0
	movq	%rax, %rdi
	movq	%rax, 32(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 96(%rsp)
	call	__ZNSt6localeC1Ev
	movq	__ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movl	$16, 120(%rsp)
	movq	$0, 136(%rsp)
	movb	$0, 144(%rsp)
	addq	$16, %rax
	movq	%rax, 56(%rsp)
	leaq	144(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	%rax, 128(%rsp)
LEHB18:
	call	__ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
LEHE18:
	leaq	lC33(%rip), %rsi
	movl	$34, %edx
	movq	%r13, %rdi
LEHB19:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC34(%rip), %rsi
	movl	$12, %edx
	movq	%r13, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	8(%rbp), %rsi
	movq	%r13, %rdi
	call	__ZNSo9_M_insertImEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC35(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	16(%rbp), %rsi
	movq	%r12, %rdi
	call	__ZNSo9_M_insertImEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC36(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	24(%rbp), %rsi
	movq	%r12, %rdi
	call	__ZNSo9_M_insertIPKvEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC37(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	24(%rbp), %rsi
	movq	%r12, %rdi
	call	__ZNSo9_M_insertIlEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC38(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	24(%rbp), %rax
	movq	%r12, %rdi
	cqto
	shrq	$60, %rdx
	leaq	(%rax,%rdx), %rsi
	andl	$15, %esi
	subq	%rdx, %rsi
	call	__ZNSo9_M_insertIlEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC39(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	24(%rbp), %rax
	movq	%r12, %rdi
	cqto
	shrq	$59, %rdx
	leaq	(%rax,%rdx), %rsi
	andl	$31, %esi
	subq	%rdx, %rsi
	call	__ZNSo9_M_insertIlEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC40(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	24(%rbp), %rax
	movq	%r12, %rdi
	cqto
	shrq	$58, %rdx
	leaq	(%rax,%rdx), %rsi
	andl	$63, %esi
	subq	%rdx, %rsi
	call	__ZNSo9_M_insertIlEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC41(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$2, %esi
	movq	%r12, %rdi
	call	__ZNSo9_M_insertImEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC42(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	0(%rbp), %rsi
	movq	%r12, %rdi
	call	__ZNSo9_M_insertImEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC43(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	0(%rbp), %rsi
	movq	%r12, %rdi
	shrq	%rsi
	call	__ZNSo9_M_insertImEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC44(%rip), %rsi
	movl	$12, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	8(%rbp), %rax
	xorl	%edx, %edx
	movq	%r12, %rdi
	addq	%rax, %rax
	divq	0(%rbp)
	movq	%rax, %rsi
	call	__ZNSo9_M_insertImEERSoT_
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%rax, %r12
	leaq	lC10(%rip), %rsi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC33(%rip), %rsi
	movl	$34, %edx
	movq	%r12, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	0(%rbp), %r12
	leaq	lC47(%rip), %r14
	xorl	%ebx, %ebx
	shrq	%r12
	cmpq	$0, 8(%rbp)
	je	L421
	.p2align 4,,10
	.p2align 3
L416:
	cmpq	%rbx, 16(%rbp)
	jbe	L419
L442:
	movq	24(%rbp), %rax
	movq	%r13, %rdi
	movswl	(%rax,%rbx,2), %esi
	call	__ZNSolsEs
	leaq	lC46(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %edx
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	addq	$1, %rbx
	cmpq	%rbx, 8(%rbp)
	jbe	L421
L439:
	xorl	%edx, %edx
	movq	%rbx, %rax
	divq	%r12
	testq	%rdx, %rdx
	jne	L416
	leaq	lC45(%rip), %rsi
	movl	$2, %edx
	movq	%r13, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	cmpq	%rbx, 16(%rbp)
	ja	L442
	.p2align 4,,10
	.p2align 3
L419:
	movl	$2, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	addq	$1, %rbx
	cmpq	%rbx, 8(%rbp)
	ja	L439
L421:
	leaq	lC10(%rip), %rsi
	movl	$1, %edx
	movq	%r13, %rdi
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
LEHE19:
	movq	96(%rsp), %rax
	leaq	16(%r15), %rbx
	movb	$0, 16(%r15)
	movq	%rbx, (%r15)
	movq	$0, 8(%r15)
	testq	%rax, %rax
	je	L423
	movq	80(%rsp), %r8
	movq	88(%rsp), %rcx
	cmpq	%r8, %rax
	ja	L443
	subq	%rcx, %r8
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%r15, %rdi
LEHB20:
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
L425:
	movq	__ZTVNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	movq	128(%rsp), %rdi
	movq	24(%rsp), %xmm0
	addq	$64, %rax
	movq	%rax, 160(%rsp)
	movq	__ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	cmpq	40(%rsp), %rdi
	movq	%rax, %xmm2
	punpcklqdq	%xmm2, %xmm0
	movaps	%xmm0, 48(%rsp)
	je	L427
	call	__ZdlPv
L427:
	movq	__ZTVSt15basic_streambufIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	32(%rsp), %rdi
	addq	$16, %rax
	movq	%rax, 56(%rsp)
	call	__ZNSt6localeD1Ev
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdi
	movq	%rax, 48(%rsp)
	movq	-24(%rax), %rax
	movq	%rcx, 48(%rsp,%rax)
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, 160(%rsp)
	call	__ZNSt8ios_baseD2Ev
	addq	$440, %rsp
LCFI148:
	movq	%r15, %rax
	popq	%rbx
LCFI149:
	popq	%rbp
LCFI150:
	popq	%r12
LCFI151:
	popq	%r13
LCFI152:
	popq	%r14
LCFI153:
	popq	%r15
LCFI154:
	ret
	.p2align 4,,10
	.p2align 3
L443:
LCFI155:
	subq	%rcx, %rax
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rax, %r8
	movq	%r15, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
	jmp	L425
	.p2align 4,,10
	.p2align 3
L423:
	leaq	128(%rsp), %rsi
	movq	%r15, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_
LEHE20:
	jmp	L425
L435:
	movq	%rax, %rbp
	jmp	L428
L432:
	movq	%rax, %rbp
	jmp	L430
L428:
	movq	(%r15), %rdi
	cmpq	%rdi, %rbx
	je	L430
	call	__ZdlPv
L430:
	movq	%r13, %rdi
	call	__ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbp, %rdi
LEHB21:
	call	__Unwind_Resume
L434:
	movq	%rax, %rbp
	jmp	L414
L433:
	movq	%rax, %rbp
	jmp	L415
L414:
	movq	%r12, %rdi
	call	__ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED1Ev
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rax, 48(%rsp)
	movq	-24(%rax), %rax
	movq	%rcx, 48(%rsp,%rax)
L415:
	movq	__ZTVSt9basic_iosIcSt11char_traitsIcEE@GOTPCREL(%rip), %rax
	movq	16(%rsp), %rdi
	addq	$16, %rax
	movq	%rax, 160(%rsp)
	call	__ZNSt8ios_baseD2Ev
	movq	%rbp, %rdi
	call	__Unwind_Resume
LEHE21:
LFE9407:
	.section __DATA,__gcc_except_tab
GCC_except_table6:
LLSDA9407:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x41
	.set L$set$48,LEHB17-LFB9407
	.long L$set$48
	.set L$set$49,LEHE17-LEHB17
	.long L$set$49
	.set L$set$50,L433-LFB9407
	.long L$set$50
	.byte	0
	.set L$set$51,LEHB18-LFB9407
	.long L$set$51
	.set L$set$52,LEHE18-LEHB18
	.long L$set$52
	.set L$set$53,L434-LFB9407
	.long L$set$53
	.byte	0
	.set L$set$54,LEHB19-LFB9407
	.long L$set$54
	.set L$set$55,LEHE19-LEHB19
	.long L$set$55
	.set L$set$56,L432-LFB9407
	.long L$set$56
	.byte	0
	.set L$set$57,LEHB20-LFB9407
	.long L$set$57
	.set L$set$58,LEHE20-LEHB20
	.long L$set$58
	.set L$set$59,L435-LFB9407
	.long L$set$59
	.byte	0
	.set L$set$60,LEHB21-LFB9407
	.long L$set$60
	.set L$set$61,LEHE21-LEHB21
	.long L$set$61
	.long	0
	.byte	0
	.text
	.cstring
lC49:
	.ascii "vex3 == vec3 : \0"
lC50:
	.ascii "PASSED\0"
lC51:
	.ascii "FAIL!\12\0"
lC52:
	.ascii "preparing to fail!\12\0"
lC53:
	.ascii "vex2 += vex1 == vec3 : \0"
lC54:
	.ascii "vex1 + i16(2) == vec3 : \0"
lC55:
	.ascii "vex1 += 2 == vec3 : \0"
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDB56:
	.section __TEXT,__text_startup,regular,pure_instructions
LHOTB56:
	.p2align 4
	.globl _main
_main:
LFB9002:
	pushq	%r15
LCFI156:
	movl	$20, %edi
	pxor	%xmm0, %xmm0
	pushq	%r14
LCFI157:
	pushq	%r13
LCFI158:
	pushq	%r12
LCFI159:
	pushq	%rbp
LCFI160:
	pushq	%rbx
LCFI161:
	subq	$312, %rsp
LCFI162:
	movaps	%xmm0, 16(%rsp)
	leaq	48(%rsp), %rbp
	movq	$0, 32(%rsp)
LEHB22:
	call	__Znwm
LEHE22:
	movl	$10, %esi
	movq	%rbp, %rdi
	leaq	20(%rax), %rdx
	movq	%rax, %xmm1
	movl	$196611, 16(%rax)
	movddup	%xmm1, %xmm0
	movaps	%xmm0, 16(%rsp)
	movdqa	lC48(%rip), %xmm0
	movq	%rdx, 32(%rsp)
	movq	%rdx, 24(%rsp)
	movl	$3, %edx
	movups	%xmm0, (%rax)
LEHB23:
	call	__ZN3VexIsEC1Ems
LEHE23:
	leaq	240(%rsp), %r12
	movq	%rbp, %rsi
	movq	%r12, %rdi
LEHB24:
	call	__ZN10ContiguousIsEC1ERKS0_
LEHE24:
	movq	__ZSt4cout@GOTPCREL(%rip), %rbp
	movl	$15, %edx
	leaq	lC49(%rip), %rsi
	movq	%rbp, %rdi
LEHB25:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	16(%rsp), %r15
	movq	%r12, %rdi
	movq	%r15, %rsi
	call	__Z5equalIsEbRK3VexIT_ERKSt6vectorIS1_SaIS1_EE
	testb	%al, %al
	je	L445
	leaq	80(%rsp), %rdi
	leaq	lC50(%rip), %rsi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_.isra.0
LEHE25:
	xorl	%ebx, %ebx
L446:
	movq	88(%rsp), %rdx
	movq	%rbp, %rdi
	movq	80(%rsp), %rsi
LEHB26:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movq	%rax, %rdi
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
LEHE26:
	movq	80(%rsp), %rdi
	leaq	96(%rsp), %rax
	cmpq	%rax, %rdi
	je	L447
	call	__ZdlPv
L447:
	testb	%bl, %bl
	je	L448
	movq	272(%rsp), %rdi
	leaq	288(%rsp), %rax
	cmpq	%rax, %rdi
	je	L448
	call	__ZdlPv
L448:
	movq	264(%rsp), %rax
	testq	%rax, %rax
	je	L450
	movq	-8(%rax), %rdi
	call	_free
L450:
	leaq	112(%rsp), %r14
	movl	$1, %edx
	movl	$10, %esi
	movq	%r14, %rdi
LEHB27:
	call	__ZN3VexIsEC1Ems
LEHE27:
	leaq	144(%rsp), %r13
	movl	$2, %edx
	movl	$10, %esi
	movq	%r13, %rdi
LEHB28:
	call	__ZN3VexIsEC1Ems
LEHE28:
	movq	__ZSt4cerr@GOTPCREL(%rip), %rdi
	leaq	lC52(%rip), %rsi
LEHB29:
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
# 47 "test.cpp" 1
	#wtf?
# 0 "" 2
	leaq	176(%rsp), %rdi
	movq	%r13, %rdx
	movq	%r14, %rsi
	call	__ZplIsE3VexIT_ERKS2_S4_
	movq	200(%rsp), %rax
	testq	%rax, %rax
	je	L451
	movq	-8(%rax), %rdi
	call	_free
L451:
# 49 "test.cpp" 1
	#wtf?
# 0 "" 2
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	__ZN3VexIsEpLERKS0_
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	__ZN10ContiguousIsEC1ERKS0_
LEHE29:
	leaq	lC53(%rip), %rsi
	movl	$23, %edx
	movq	%rbp, %rdi
LEHB30:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	__Z5equalIsEbRK3VexIT_ERKSt6vectorIS1_SaIS1_EE
	testb	%al, %al
	je	L452
	leaq	208(%rsp), %r13
	leaq	lC50(%rip), %rsi
	movq	%r13, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_.isra.0
LEHE30:
	xorl	%ebx, %ebx
L453:
	movq	216(%rsp), %rdx
	movq	%rbp, %rdi
	movq	208(%rsp), %rsi
LEHB31:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movq	%rax, %rdi
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
LEHE31:
	movq	208(%rsp), %rdi
	leaq	224(%rsp), %rax
	cmpq	%rax, %rdi
	je	L454
	call	__ZdlPv
L454:
	testb	%bl, %bl
	je	L455
	movq	272(%rsp), %rdi
	leaq	288(%rsp), %rax
	cmpq	%rax, %rdi
	je	L455
	call	__ZdlPv
L455:
	movq	264(%rsp), %rax
	testq	%rax, %rax
	je	L457
	movq	-8(%rax), %rdi
	call	_free
L457:
	movl	$2, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
LEHB32:
	call	__ZplIsE3VexIT_ERKS2_S1_
LEHE32:
	leaq	lC54(%rip), %rsi
	movl	$24, %edx
	movq	%rbp, %rdi
LEHB33:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	__Z5equalIsEbRK3VexIT_ERKSt6vectorIS1_SaIS1_EE
	testb	%al, %al
	je	L458
	leaq	lC50(%rip), %rsi
	movq	%r12, %rdi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_.isra.0
LEHE33:
	xorl	%ebx, %ebx
L459:
	movq	248(%rsp), %rdx
	movq	%rbp, %rdi
	movq	240(%rsp), %rsi
LEHB34:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movq	%rax, %rdi
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
LEHE34:
	movq	240(%rsp), %rdi
	leaq	256(%rsp), %rax
	movq	%rax, 8(%rsp)
	cmpq	%rax, %rdi
	je	L460
	call	__ZdlPv
L460:
	testb	%bl, %bl
	je	L461
	movq	272(%rsp), %rdi
	leaq	288(%rsp), %rax
	cmpq	%rax, %rdi
	je	L461
	call	__ZdlPv
L461:
	movq	232(%rsp), %rax
	testq	%rax, %rax
	je	L463
	movq	-8(%rax), %rdi
	call	_free
L463:
	movl	$2, %esi
	movq	%r14, %rdi
	call	__ZN3VexIsEpLEs
	movq	%r13, %rdi
	movq	%rax, %rsi
LEHB35:
	call	__ZN10ContiguousIsEC1ERKS0_
LEHE35:
	leaq	lC55(%rip), %rsi
	movl	$20, %edx
	movq	%rbp, %rdi
LEHB36:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	__Z5equalIsEbRK3VexIT_ERKSt6vectorIS1_SaIS1_EE
	testb	%al, %al
	je	L464
	leaq	272(%rsp), %rdi
	leaq	lC50(%rip), %rsi
	call	__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_.isra.0
LEHE36:
	xorl	%ebx, %ebx
L465:
	movq	280(%rsp), %rdx
	movq	%rbp, %rdi
	movq	272(%rsp), %rsi
LEHB37:
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	lC10(%rip), %rsi
	movq	%rax, %rdi
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
LEHE37:
	movq	272(%rsp), %rdi
	leaq	288(%rsp), %rax
	cmpq	%rax, %rdi
	je	L466
	call	__ZdlPv
L466:
	testb	%bl, %bl
	je	L467
	movq	240(%rsp), %rdi
	cmpq	8(%rsp), %rdi
	je	L467
	call	__ZdlPv
L467:
	movq	232(%rsp), %rax
	testq	%rax, %rax
	je	L469
	movq	-8(%rax), %rdi
	call	_free
L469:
	movq	168(%rsp), %rax
	testq	%rax, %rax
	je	L470
	movq	-8(%rax), %rdi
	call	_free
L470:
	movq	136(%rsp), %rax
	testq	%rax, %rax
	je	L471
	movq	-8(%rax), %rdi
	call	_free
L471:
	movq	72(%rsp), %rax
	testq	%rax, %rax
	je	L472
	movq	-8(%rax), %rdi
	call	_free
L472:
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	je	L555
	call	__ZdlPv
L555:
	addq	$312, %rsp
LCFI163:
	xorl	%eax, %eax
	popq	%rbx
LCFI164:
	popq	%rbp
LCFI165:
	popq	%r12
LCFI166:
	popq	%r13
LCFI167:
	popq	%r14
LCFI168:
	popq	%r15
LCFI169:
	ret
L464:
LCFI170:
	movq	%r13, %rsi
	movq	%r12, %rdi
LEHB38:
	call	__ZNK10ContiguousIsE8toStringB5cxx11Ev
LEHE38:
	leaq	272(%rsp), %rdi
	movq	%r12, %rdx
	leaq	lC51(%rip), %rsi
LEHB39:
	call	__ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
LEHE39:
	movl	$1, %ebx
	jmp	L465
L458:
	leaq	272(%rsp), %rbx
	movq	%r13, %rsi
	movq	%rbx, %rdi
LEHB40:
	call	__ZNK10ContiguousIsE8toStringB5cxx11Ev
LEHE40:
	leaq	lC51(%rip), %rsi
	movq	%rbx, %rdx
	movq	%r12, %rdi
LEHB41:
	call	__ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
LEHE41:
	movl	$1, %ebx
	jmp	L459
L452:
	leaq	272(%rsp), %rbx
	movq	%r12, %rsi
	movq	%rbx, %rdi
LEHB42:
	call	__ZNK10ContiguousIsE8toStringB5cxx11Ev
LEHE42:
	leaq	208(%rsp), %r13
	movq	%rbx, %rdx
	leaq	lC51(%rip), %rsi
	movq	%r13, %rdi
LEHB43:
	call	__ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
LEHE43:
	movl	$1, %ebx
	jmp	L453
L445:
	leaq	272(%rsp), %rbx
	movq	%r12, %rsi
	movq	%rbx, %rdi
LEHB44:
	call	__ZNK10ContiguousIsE8toStringB5cxx11Ev
LEHE44:
	leaq	80(%rsp), %rdi
	movq	%rbx, %rdx
	leaq	lC51(%rip), %rsi
LEHB45:
	call	__ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_
LEHE45:
	movl	$1, %ebx
	jmp	L446
L521:
	movq	%rax, %rbp
	jmp	L482
L518:
	movq	%rax, %rbx
	jmp	L505
L516:
	movq	%rax, %rbp
	jmp	L474
L515:
	movq	%rax, %rbx
	jmp	L479
L525:
	movq	%rax, %rbp
	jmp	L497
L524:
	movq	%rax, %rbx
	jmp	L502
L529:
	movq	%rax, %rbp
	jmp	L477
L520:
	movq	%rax, %rbx
	jmp	L487
L519:
	movq	%rax, %rbx
	jmp	L489
L523:
	movq	%rax, %rbp
	jmp	L490
L522:
	movq	%rax, %rbx
	jmp	L495
L517:
	movq	%rax, %rbx
	jmp	L481
L514:
	movq	%rax, %rbx
	jmp	L508
L527:
	movq	%rax, %rbp
	jmp	L493
L526:
	movq	%rax, %rbp
	jmp	L500
L528:
	movq	%rax, %rbp
	jmp	L485
	.section __DATA,__gcc_except_tab
GCC_except_table7:
LLSDA9002:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0xb8,0x2
	.set L$set$62,LEHB22-LFB9002
	.long L$set$62
	.set L$set$63,LEHE22-LEHB22
	.long L$set$63
	.long	0
	.byte	0
	.set L$set$64,LEHB23-LFB9002
	.long L$set$64
	.set L$set$65,LEHE23-LEHB23
	.long L$set$65
	.set L$set$66,L514-LFB9002
	.long L$set$66
	.byte	0
	.set L$set$67,LEHB24-LFB9002
	.long L$set$67
	.set L$set$68,LEHE24-LEHB24
	.long L$set$68
	.set L$set$69,L517-LFB9002
	.long L$set$69
	.byte	0
	.set L$set$70,LEHB25-LFB9002
	.long L$set$70
	.set L$set$71,LEHE25-LEHB25
	.long L$set$71
	.set L$set$72,L515-LFB9002
	.long L$set$72
	.byte	0
	.set L$set$73,LEHB26-LFB9002
	.long L$set$73
	.set L$set$74,LEHE26-LEHB26
	.long L$set$74
	.set L$set$75,L516-LFB9002
	.long L$set$75
	.byte	0
	.set L$set$76,LEHB27-LFB9002
	.long L$set$76
	.set L$set$77,LEHE27-LEHB27
	.long L$set$77
	.set L$set$78,L517-LFB9002
	.long L$set$78
	.byte	0
	.set L$set$79,LEHB28-LFB9002
	.long L$set$79
	.set L$set$80,LEHE28-LEHB28
	.long L$set$80
	.set L$set$81,L518-LFB9002
	.long L$set$81
	.byte	0
	.set L$set$82,LEHB29-LFB9002
	.long L$set$82
	.set L$set$83,LEHE29-LEHB29
	.long L$set$83
	.set L$set$84,L519-LFB9002
	.long L$set$84
	.byte	0
	.set L$set$85,LEHB30-LFB9002
	.long L$set$85
	.set L$set$86,LEHE30-LEHB30
	.long L$set$86
	.set L$set$87,L520-LFB9002
	.long L$set$87
	.byte	0
	.set L$set$88,LEHB31-LFB9002
	.long L$set$88
	.set L$set$89,LEHE31-LEHB31
	.long L$set$89
	.set L$set$90,L521-LFB9002
	.long L$set$90
	.byte	0
	.set L$set$91,LEHB32-LFB9002
	.long L$set$91
	.set L$set$92,LEHE32-LEHB32
	.long L$set$92
	.set L$set$93,L519-LFB9002
	.long L$set$93
	.byte	0
	.set L$set$94,LEHB33-LFB9002
	.long L$set$94
	.set L$set$95,LEHE33-LEHB33
	.long L$set$95
	.set L$set$96,L522-LFB9002
	.long L$set$96
	.byte	0
	.set L$set$97,LEHB34-LFB9002
	.long L$set$97
	.set L$set$98,LEHE34-LEHB34
	.long L$set$98
	.set L$set$99,L523-LFB9002
	.long L$set$99
	.byte	0
	.set L$set$100,LEHB35-LFB9002
	.long L$set$100
	.set L$set$101,LEHE35-LEHB35
	.long L$set$101
	.set L$set$102,L519-LFB9002
	.long L$set$102
	.byte	0
	.set L$set$103,LEHB36-LFB9002
	.long L$set$103
	.set L$set$104,LEHE36-LEHB36
	.long L$set$104
	.set L$set$105,L524-LFB9002
	.long L$set$105
	.byte	0
	.set L$set$106,LEHB37-LFB9002
	.long L$set$106
	.set L$set$107,LEHE37-LEHB37
	.long L$set$107
	.set L$set$108,L525-LFB9002
	.long L$set$108
	.byte	0
	.set L$set$109,LEHB38-LFB9002
	.long L$set$109
	.set L$set$110,LEHE38-LEHB38
	.long L$set$110
	.set L$set$111,L524-LFB9002
	.long L$set$111
	.byte	0
	.set L$set$112,LEHB39-LFB9002
	.long L$set$112
	.set L$set$113,LEHE39-LEHB39
	.long L$set$113
	.set L$set$114,L526-LFB9002
	.long L$set$114
	.byte	0
	.set L$set$115,LEHB40-LFB9002
	.long L$set$115
	.set L$set$116,LEHE40-LEHB40
	.long L$set$116
	.set L$set$117,L522-LFB9002
	.long L$set$117
	.byte	0
	.set L$set$118,LEHB41-LFB9002
	.long L$set$118
	.set L$set$119,LEHE41-LEHB41
	.long L$set$119
	.set L$set$120,L527-LFB9002
	.long L$set$120
	.byte	0
	.set L$set$121,LEHB42-LFB9002
	.long L$set$121
	.set L$set$122,LEHE42-LEHB42
	.long L$set$122
	.set L$set$123,L520-LFB9002
	.long L$set$123
	.byte	0
	.set L$set$124,LEHB43-LFB9002
	.long L$set$124
	.set L$set$125,LEHE43-LEHB43
	.long L$set$125
	.set L$set$126,L528-LFB9002
	.long L$set$126
	.byte	0
	.set L$set$127,LEHB44-LFB9002
	.long L$set$127
	.set L$set$128,LEHE44-LEHB44
	.long L$set$128
	.set L$set$129,L515-LFB9002
	.long L$set$129
	.byte	0
	.set L$set$130,LEHB45-LFB9002
	.long L$set$130
	.set L$set$131,LEHE45-LEHB45
	.long L$set$131
	.set L$set$132,L529-LFB9002
	.long L$set$132
	.byte	0
	.section __TEXT,__text_startup,regular,pure_instructions
	.section __TEXT,__text_cold,regular,pure_instructions
_main.cold:
LFSB9002:
L482:
LCFI171:
	movq	208(%rsp), %rdi
	leaq	224(%rsp), %rax
	cmpq	%rax, %rdi
	je	L483
	call	__ZdlPv
L483:
	testb	%bl, %bl
	je	L484
L485:
	movq	272(%rsp), %rdi
	leaq	288(%rsp), %rax
	cmpq	%rax, %rdi
	je	L484
	call	__ZdlPv
L484:
	movq	%rbp, %rbx
L487:
	movq	264(%rsp), %rax
	testq	%rax, %rax
	je	L489
	movq	-8(%rax), %rdi
	call	_free
L489:
	movq	168(%rsp), %rax
	testq	%rax, %rax
	je	L505
	movq	-8(%rax), %rdi
	call	_free
L505:
	movq	136(%rsp), %rax
	testq	%rax, %rax
	je	L481
	movq	-8(%rax), %rdi
	call	_free
L481:
	movq	72(%rsp), %rax
	testq	%rax, %rax
	je	L508
	movq	-8(%rax), %rdi
	call	_free
L508:
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	je	L509
	call	__ZdlPv
L509:
	movq	%rbx, %rdi
LEHB46:
	call	__Unwind_Resume
LEHE46:
L474:
	movq	80(%rsp), %rdi
	leaq	96(%rsp), %rax
	cmpq	%rax, %rdi
	je	L475
	call	__ZdlPv
L475:
	testb	%bl, %bl
	je	L476
L477:
	movq	272(%rsp), %rdi
	leaq	288(%rsp), %rax
	cmpq	%rax, %rdi
	je	L476
	call	__ZdlPv
L476:
	movq	%rbp, %rbx
L479:
	movq	264(%rsp), %rax
	testq	%rax, %rax
	je	L481
	movq	-8(%rax), %rdi
	call	_free
	jmp	L481
L497:
	movq	272(%rsp), %rdi
	leaq	288(%rsp), %rax
	cmpq	%rax, %rdi
	je	L498
	call	__ZdlPv
L498:
	testb	%bl, %bl
	je	L499
L500:
	movq	240(%rsp), %rdi
	cmpq	8(%rsp), %rdi
	je	L499
	call	__ZdlPv
L499:
	movq	%rbp, %rbx
L502:
	movq	232(%rsp), %rax
	testq	%rax, %rax
	je	L489
	movq	-8(%rax), %rdi
	call	_free
	jmp	L489
L490:
	movq	240(%rsp), %rdi
	leaq	256(%rsp), %rax
	cmpq	%rax, %rdi
	je	L491
	call	__ZdlPv
L491:
	testb	%bl, %bl
	je	L492
L493:
	movq	272(%rsp), %rdi
	leaq	288(%rsp), %rax
	cmpq	%rax, %rdi
	je	L492
	call	__ZdlPv
L492:
	movq	%rbp, %rbx
L495:
	movq	232(%rsp), %rax
	testq	%rax, %rax
	je	L489
	movq	-8(%rax), %rdi
	call	_free
	jmp	L489
LFE9002:
	.section __DATA,__gcc_except_tab
GCC_except_table8:
LLSDAC9002:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0xd
	.set L$set$133,LEHB46-LCOLDB56
	.long L$set$133
	.set L$set$134,LEHE46-LEHB46
	.long L$set$134
	.long	0
	.byte	0
	.section __TEXT,__text_cold,regular,pure_instructions
LCOLDE56:
	.section __TEXT,__text_startup,regular,pure_instructions
LHOTE56:
	.section __TEXT,__text_cold,regular,pure_instructions
	.section __TEXT,__text_startup,regular,pure_instructions
	.p2align 4
__GLOBAL__sub_I_test.cpp:
LFB9573:
	leaq	__ZStL8__ioinit(%rip), %rdi
	subq	$8, %rsp
LCFI172:
	call	__ZNSt8ios_base4InitC1Ev
	movq	__ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	addq	$8, %rsp
LCFI173:
	leaq	___dso_handle(%rip), %rdx
	leaq	__ZStL8__ioinit(%rip), %rsi
	jmp	___cxa_atexit
LFE9573:
	.globl __ZTS15MemoryException
	.weak_definition __ZTS15MemoryException
	.const
	.align 4
__ZTS15MemoryException:
	.ascii "15MemoryException\0"
	.globl __ZTI15MemoryException
	.weak_definition __ZTI15MemoryException
	.const_data
	.align 3
__ZTI15MemoryException:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTS15MemoryException
	.globl __ZGVZN3VexIsE10simd_flagsEvE3cpu
	.weak_definition __ZGVZN3VexIsE10simd_flagsEvE3cpu
	.data
	.align	3
	.globl __ZGVZN3VexIsE10simd_flagsEvE3cpu
__ZGVZN3VexIsE10simd_flagsEvE3cpu:
	.space 8
	.globl __ZZN3VexIsE10simd_flagsEvE3cpu
	.weak_definition __ZZN3VexIsE10simd_flagsEvE3cpu
	.align	3
	.globl __ZZN3VexIsE10simd_flagsEvE3cpu
__ZZN3VexIsE10simd_flagsEvE3cpu:
	.space 24
	.static_data
__ZStL8__ioinit:
	.space	1
	.literal8
	.align 3
lC1:
	.long	0
	.long	1076887552
	.literal4
	.align 2
lC2:
	.long	1098907648
	.literal8
	.align 3
lC3:
	.long	0
	.long	1075838976
	.literal4
	.align 2
lC4:
	.long	1090519040
	.align 2
lC27:
	.long	1258291200
	.literal16
	.align 4
lC28:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.literal4
	.align 2
lC29:
	.long	1065353216
	.literal8
	.align 3
lC30:
	.long	0
	.long	1138753536
	.literal16
	.align 4
lC48:
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$135,LECIE1-LSCIE1
	.long L$set$135
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zPLR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x7
	.byte	0x9b
	.long	___gxx_personality_v0+4@GOTPCREL
	.byte	0x10
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$136,LEFDE1-LASFDE1
	.long L$set$136
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB9578-.
	.set L$set$137,LFE9578-LFB9578
	.quad L$set$137
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$138,LCFI0-LFB9578
	.long L$set$138
	.byte	0xe
	.byte	0x10
	.byte	0x8d
	.byte	0x2
	.byte	0x4
	.set L$set$139,LCFI1-LCFI0
	.long L$set$139
	.byte	0xe
	.byte	0x18
	.byte	0x8c
	.byte	0x3
	.byte	0x4
	.set L$set$140,LCFI2-LCFI1
	.long L$set$140
	.byte	0xe
	.byte	0x20
	.byte	0x86
	.byte	0x4
	.byte	0x4
	.set L$set$141,LCFI3-LCFI2
	.long L$set$141
	.byte	0xe
	.byte	0x28
	.byte	0x83
	.byte	0x5
	.byte	0x4
	.set L$set$142,LCFI4-LCFI3
	.long L$set$142
	.byte	0xe
	.byte	0x40
	.byte	0x4
	.set L$set$143,LCFI5-LCFI4
	.long L$set$143
	.byte	0xa
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$144,LCFI6-LCFI5
	.long L$set$144
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$145,LCFI7-LCFI6
	.long L$set$145
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$146,LCFI8-LCFI7
	.long L$set$146
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$147,LCFI9-LCFI8
	.long L$set$147
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$148,LCFI10-LCFI9
	.long L$set$148
	.byte	0xb
	.align 3
LEFDE1:
LSFDE3:
	.set L$set$149,LEFDE3-LASFDE3
	.long L$set$149
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB8942-.
	.set L$set$150,LFE8942-LFB8942
	.quad L$set$150
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$151,LCFI11-LFB8942
	.long L$set$151
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$152,LCFI12-LCFI11
	.long L$set$152
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE3:
LSFDE5:
	.set L$set$153,LEFDE5-LASFDE5
	.long L$set$153
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB8992-.
	.set L$set$154,LFE8992-LFB8992
	.quad L$set$154
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$155,LCFI13-LFB8992
	.long L$set$155
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$156,LCFI14-LCFI13
	.long L$set$156
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$157,LCFI15-LCFI14
	.long L$set$157
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x4
	.set L$set$158,LCFI16-LCFI15
	.long L$set$158
	.byte	0x8c
	.byte	0x6
	.byte	0x4
	.set L$set$159,LCFI17-LCFI16
	.long L$set$159
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$160,LCFI18-LCFI17
	.long L$set$160
	.byte	0xa
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x4
	.set L$set$161,LCFI19-LCFI18
	.long L$set$161
	.byte	0xb
	.align 3
LEFDE5:
LSFDE7:
	.set L$set$162,LEFDE7-LASFDE7
	.long L$set$162
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB8993-.
	.set L$set$163,LFE8993-LFB8993
	.quad L$set$163
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$164,LCFI20-LFB8993
	.long L$set$164
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$165,LCFI21-LCFI20
	.long L$set$165
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$166,LCFI22-LCFI21
	.long L$set$166
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x4
	.set L$set$167,LCFI23-LCFI22
	.long L$set$167
	.byte	0x8c
	.byte	0x6
	.byte	0x4
	.set L$set$168,LCFI24-LCFI23
	.long L$set$168
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$169,LCFI25-LCFI24
	.long L$set$169
	.byte	0xa
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x4
	.set L$set$170,LCFI26-LCFI25
	.long L$set$170
	.byte	0xb
	.align 3
LEFDE7:
LSFDE9:
	.set L$set$171,LEFDE9-LASFDE9
	.long L$set$171
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB8994-.
	.set L$set$172,LFE8994-LFB8994
	.quad L$set$172
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$173,LCFI27-LFB8994
	.long L$set$173
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$174,LCFI28-LCFI27
	.long L$set$174
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$175,LCFI29-LCFI28
	.long L$set$175
	.byte	0x8f
	.byte	0x3
	.byte	0x4
	.set L$set$176,LCFI30-LCFI29
	.long L$set$176
	.byte	0x8e
	.byte	0x4
	.byte	0x4
	.set L$set$177,LCFI31-LCFI30
	.long L$set$177
	.byte	0x8d
	.byte	0x5
	.byte	0x8c
	.byte	0x6
	.byte	0x4
	.set L$set$178,LCFI32-LCFI31
	.long L$set$178
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$179,LCFI33-LCFI32
	.long L$set$179
	.byte	0xa
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x4
	.set L$set$180,LCFI34-LCFI33
	.long L$set$180
	.byte	0xb
	.align 3
LEFDE9:
LSFDE11:
	.set L$set$181,LEFDE11-LASFDE11
	.long L$set$181
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB8998-.
	.set L$set$182,LFE8998-LFB8998
	.quad L$set$182
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$183,LCFI35-LFB8998
	.long L$set$183
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$184,LCFI36-LCFI35
	.long L$set$184
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$185,LCFI37-LCFI36
	.long L$set$185
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x4
	.set L$set$186,LCFI38-LCFI37
	.long L$set$186
	.byte	0x8c
	.byte	0x6
	.byte	0x4
	.set L$set$187,LCFI39-LCFI38
	.long L$set$187
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$188,LCFI40-LCFI39
	.long L$set$188
	.byte	0xa
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x4
	.set L$set$189,LCFI41-LCFI40
	.long L$set$189
	.byte	0xb
	.align 3
LEFDE11:
LSFDE13:
	.set L$set$190,LEFDE13-LASFDE13
	.long L$set$190
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB8999-.
	.set L$set$191,LFE8999-LFB8999
	.quad L$set$191
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$192,LCFI42-LFB8999
	.long L$set$192
	.byte	0xe
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.byte	0x4
	.set L$set$193,LCFI43-LCFI42
	.long L$set$193
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE13:
LSFDE15:
	.set L$set$194,LEFDE15-LASFDE15
	.long L$set$194
LASFDE15:
	.long	LASFDE15-EH_frame1
	.quad	LFB9208-.
	.set L$set$195,LFE9208-LFB9208
	.quad L$set$195
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$196,LCFI44-LFB9208
	.long L$set$196
	.byte	0xe
	.byte	0x10
	.byte	0x8d
	.byte	0x2
	.byte	0x4
	.set L$set$197,LCFI45-LCFI44
	.long L$set$197
	.byte	0xe
	.byte	0x18
	.byte	0x8c
	.byte	0x3
	.byte	0x4
	.set L$set$198,LCFI46-LCFI45
	.long L$set$198
	.byte	0xe
	.byte	0x20
	.byte	0x86
	.byte	0x4
	.byte	0x4
	.set L$set$199,LCFI47-LCFI46
	.long L$set$199
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$200,LCFI48-LCFI47
	.long L$set$200
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$201,LCFI49-LCFI48
	.long L$set$201
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$202,LCFI50-LCFI49
	.long L$set$202
	.byte	0xb
	.align 3
LEFDE15:
LSFDE17:
	.set L$set$203,LEFDE17-LASFDE17
	.long L$set$203
LASFDE17:
	.long	LASFDE17-EH_frame1
	.quad	LFB9226-.
	.set L$set$204,LFE9226-LFB9226
	.quad L$set$204
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$205,LCFI51-LFB9226
	.long L$set$205
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$206,LCFI52-LCFI51
	.long L$set$206
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE17:
LSFDE19:
	.set L$set$207,LEFDE19-LASFDE19
	.long L$set$207
LASFDE19:
	.long	LASFDE19-EH_frame1
	.quad	LFB8940-.
	.set L$set$208,LHOTE6-LFB8940
	.quad L$set$208
	.byte	0x8
	.quad	LLSDA8940-.
	.byte	0x4
	.set L$set$209,LCFI53-LFB8940
	.long L$set$209
	.byte	0xe
	.byte	0x10
	.byte	0x8f
	.byte	0x2
	.byte	0x4
	.set L$set$210,LCFI54-LCFI53
	.long L$set$210
	.byte	0xe
	.byte	0x18
	.byte	0x8e
	.byte	0x3
	.byte	0x4
	.set L$set$211,LCFI55-LCFI54
	.long L$set$211
	.byte	0xe
	.byte	0x20
	.byte	0x8d
	.byte	0x4
	.byte	0x4
	.set L$set$212,LCFI56-LCFI55
	.long L$set$212
	.byte	0xe
	.byte	0x28
	.byte	0x8c
	.byte	0x5
	.byte	0x4
	.set L$set$213,LCFI57-LCFI56
	.long L$set$213
	.byte	0xe
	.byte	0x30
	.byte	0x86
	.byte	0x6
	.byte	0x4
	.set L$set$214,LCFI58-LCFI57
	.long L$set$214
	.byte	0xe
	.byte	0x38
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$215,LCFI59-LCFI58
	.long L$set$215
	.byte	0xe
	.byte	0xe0,0x4
	.byte	0x4
	.set L$set$216,LCFI60-LCFI59
	.long L$set$216
	.byte	0xa
	.byte	0xe
	.byte	0x38
	.byte	0x4
	.set L$set$217,LCFI61-LCFI60
	.long L$set$217
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$218,LCFI62-LCFI61
	.long L$set$218
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$219,LCFI63-LCFI62
	.long L$set$219
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$220,LCFI64-LCFI63
	.long L$set$220
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$221,LCFI65-LCFI64
	.long L$set$221
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$222,LCFI66-LCFI65
	.long L$set$222
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$223,LCFI67-LCFI66
	.long L$set$223
	.byte	0xb
	.align 3
LEFDE19:
LSFDE21:
	.set L$set$224,LEFDE21-LASFDE21
	.long L$set$224
LASFDE21:
	.long	LASFDE21-EH_frame1
	.quad	LFSB8940-.
	.set L$set$225,LCOLDE6-LFSB8940
	.quad L$set$225
	.byte	0x8
	.quad	LLSDAC8940-.
	.byte	0x4
	.set L$set$226,LCFI68-LFSB8940
	.long L$set$226
	.byte	0xe
	.byte	0xe0,0x4
	.byte	0x83
	.byte	0x7
	.byte	0x86
	.byte	0x6
	.byte	0x8c
	.byte	0x5
	.byte	0x8d
	.byte	0x4
	.byte	0x8e
	.byte	0x3
	.byte	0x8f
	.byte	0x2
	.align 3
LEFDE21:
LSFDE23:
	.set L$set$227,LEFDE23-LASFDE23
	.long L$set$227
LASFDE23:
	.long	LASFDE23-EH_frame1
	.quad	LFB8961-.
	.set L$set$228,LHOTE20-LFB8961
	.quad L$set$228
	.byte	0x8
	.quad	LLSDA8961-.
	.byte	0x4
	.set L$set$229,LCFI69-LFB8961
	.long L$set$229
	.byte	0xe
	.byte	0x10
	.byte	0x8f
	.byte	0x2
	.byte	0x4
	.set L$set$230,LCFI70-LCFI69
	.long L$set$230
	.byte	0xe
	.byte	0x18
	.byte	0x8e
	.byte	0x3
	.byte	0x4
	.set L$set$231,LCFI71-LCFI70
	.long L$set$231
	.byte	0xe
	.byte	0x20
	.byte	0x8d
	.byte	0x4
	.byte	0x4
	.set L$set$232,LCFI72-LCFI71
	.long L$set$232
	.byte	0xe
	.byte	0x28
	.byte	0x8c
	.byte	0x5
	.byte	0x4
	.set L$set$233,LCFI73-LCFI72
	.long L$set$233
	.byte	0xe
	.byte	0x30
	.byte	0x86
	.byte	0x6
	.byte	0x4
	.set L$set$234,LCFI74-LCFI73
	.long L$set$234
	.byte	0xe
	.byte	0x38
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$235,LCFI75-LCFI74
	.long L$set$235
	.byte	0xe
	.byte	0x80,0x4
	.byte	0x4
	.set L$set$236,LCFI76-LCFI75
	.long L$set$236
	.byte	0xa
	.byte	0xe
	.byte	0x38
	.byte	0x4
	.set L$set$237,LCFI77-LCFI76
	.long L$set$237
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$238,LCFI78-LCFI77
	.long L$set$238
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$239,LCFI79-LCFI78
	.long L$set$239
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$240,LCFI80-LCFI79
	.long L$set$240
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$241,LCFI81-LCFI80
	.long L$set$241
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$242,LCFI82-LCFI81
	.long L$set$242
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$243,LCFI83-LCFI82
	.long L$set$243
	.byte	0xb
	.align 3
LEFDE23:
LSFDE25:
	.set L$set$244,LEFDE25-LASFDE25
	.long L$set$244
LASFDE25:
	.long	LASFDE25-EH_frame1
	.quad	LFSB8961-.
	.set L$set$245,LCOLDE20-LFSB8961
	.quad L$set$245
	.byte	0x8
	.quad	LLSDAC8961-.
	.byte	0x4
	.set L$set$246,LCFI84-LFSB8961
	.long L$set$246
	.byte	0xe
	.byte	0x80,0x4
	.byte	0x83
	.byte	0x7
	.byte	0x86
	.byte	0x6
	.byte	0x8c
	.byte	0x5
	.byte	0x8d
	.byte	0x4
	.byte	0x8e
	.byte	0x3
	.byte	0x8f
	.byte	0x2
	.align 3
LEFDE25:
LSFDE27:
	.set L$set$247,LEFDE27-LASFDE27
	.long L$set$247
LASFDE27:
	.long	LASFDE27-EH_frame1
	.quad	LFB8965-.
	.set L$set$248,LHOTE26-LFB8965
	.quad L$set$248
	.byte	0x8
	.quad	LLSDA8965-.
	.byte	0x4
	.set L$set$249,LCFI85-LFB8965
	.long L$set$249
	.byte	0xe
	.byte	0x10
	.byte	0x8f
	.byte	0x2
	.byte	0x4
	.set L$set$250,LCFI86-LCFI85
	.long L$set$250
	.byte	0xe
	.byte	0x18
	.byte	0x8e
	.byte	0x3
	.byte	0x4
	.set L$set$251,LCFI87-LCFI86
	.long L$set$251
	.byte	0xe
	.byte	0x20
	.byte	0x8d
	.byte	0x4
	.byte	0x4
	.set L$set$252,LCFI88-LCFI87
	.long L$set$252
	.byte	0xe
	.byte	0x28
	.byte	0x8c
	.byte	0x5
	.byte	0x4
	.set L$set$253,LCFI89-LCFI88
	.long L$set$253
	.byte	0xe
	.byte	0x30
	.byte	0x86
	.byte	0x6
	.byte	0x4
	.set L$set$254,LCFI90-LCFI89
	.long L$set$254
	.byte	0xe
	.byte	0x38
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$255,LCFI91-LCFI90
	.long L$set$255
	.byte	0xe
	.byte	0xf0,0x3
	.byte	0x4
	.set L$set$256,LCFI92-LCFI91
	.long L$set$256
	.byte	0xa
	.byte	0xe
	.byte	0x38
	.byte	0x4
	.set L$set$257,LCFI93-LCFI92
	.long L$set$257
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$258,LCFI94-LCFI93
	.long L$set$258
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$259,LCFI95-LCFI94
	.long L$set$259
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$260,LCFI96-LCFI95
	.long L$set$260
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$261,LCFI97-LCFI96
	.long L$set$261
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$262,LCFI98-LCFI97
	.long L$set$262
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$263,LCFI99-LCFI98
	.long L$set$263
	.byte	0xb
	.align 3
LEFDE27:
LSFDE29:
	.set L$set$264,LEFDE29-LASFDE29
	.long L$set$264
LASFDE29:
	.long	LASFDE29-EH_frame1
	.quad	LFSB8965-.
	.set L$set$265,LCOLDE26-LFSB8965
	.quad L$set$265
	.byte	0x8
	.quad	LLSDAC8965-.
	.byte	0x4
	.set L$set$266,LCFI100-LFSB8965
	.long L$set$266
	.byte	0xe
	.byte	0xf0,0x3
	.byte	0x83
	.byte	0x7
	.byte	0x86
	.byte	0x6
	.byte	0x8c
	.byte	0x5
	.byte	0x8d
	.byte	0x4
	.byte	0x8e
	.byte	0x3
	.byte	0x8f
	.byte	0x2
	.align 3
LEFDE29:
LSFDE31:
	.set L$set$267,LEFDE31-LASFDE31
	.long L$set$267
LASFDE31:
	.long	LASFDE31-EH_frame1
	.quad	LFB9245-.
	.set L$set$268,LFE9245-LFB9245
	.quad L$set$268
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$269,LCFI101-LFB9245
	.long L$set$269
	.byte	0xe
	.byte	0x10
	.byte	0x8d
	.byte	0x2
	.byte	0x4
	.set L$set$270,LCFI102-LCFI101
	.long L$set$270
	.byte	0xe
	.byte	0x18
	.byte	0x8c
	.byte	0x3
	.byte	0x4
	.set L$set$271,LCFI103-LCFI102
	.long L$set$271
	.byte	0xe
	.byte	0x20
	.byte	0x86
	.byte	0x4
	.byte	0x4
	.set L$set$272,LCFI104-LCFI103
	.long L$set$272
	.byte	0xe
	.byte	0x28
	.byte	0x83
	.byte	0x5
	.byte	0x4
	.set L$set$273,LCFI105-LCFI104
	.long L$set$273
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$274,LCFI106-LCFI105
	.long L$set$274
	.byte	0xa
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$275,LCFI107-LCFI106
	.long L$set$275
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$276,LCFI108-LCFI107
	.long L$set$276
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$277,LCFI109-LCFI108
	.long L$set$277
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$278,LCFI110-LCFI109
	.long L$set$278
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$279,LCFI111-LCFI110
	.long L$set$279
	.byte	0xb
	.align 3
LEFDE31:
LSFDE33:
	.set L$set$280,LEFDE33-LASFDE33
	.long L$set$280
LASFDE33:
	.long	LASFDE33-EH_frame1
	.quad	LFB9279-.
	.set L$set$281,LFE9279-LFB9279
	.quad L$set$281
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$282,LCFI112-LFB9279
	.long L$set$282
	.byte	0xe
	.byte	0x10
	.byte	0x8f
	.byte	0x2
	.byte	0x4
	.set L$set$283,LCFI113-LCFI112
	.long L$set$283
	.byte	0xe
	.byte	0x18
	.byte	0x8e
	.byte	0x3
	.byte	0x4
	.set L$set$284,LCFI114-LCFI113
	.long L$set$284
	.byte	0xe
	.byte	0x20
	.byte	0x8d
	.byte	0x4
	.byte	0x4
	.set L$set$285,LCFI115-LCFI114
	.long L$set$285
	.byte	0xe
	.byte	0x28
	.byte	0x8c
	.byte	0x5
	.byte	0x4
	.set L$set$286,LCFI116-LCFI115
	.long L$set$286
	.byte	0xe
	.byte	0x30
	.byte	0x86
	.byte	0x6
	.byte	0x4
	.set L$set$287,LCFI117-LCFI116
	.long L$set$287
	.byte	0xe
	.byte	0x38
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$288,LCFI118-LCFI117
	.long L$set$288
	.byte	0xe
	.byte	0x50
	.byte	0x4
	.set L$set$289,LCFI119-LCFI118
	.long L$set$289
	.byte	0xa
	.byte	0xe
	.byte	0x38
	.byte	0x4
	.set L$set$290,LCFI120-LCFI119
	.long L$set$290
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$291,LCFI121-LCFI120
	.long L$set$291
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$292,LCFI122-LCFI121
	.long L$set$292
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$293,LCFI123-LCFI122
	.long L$set$293
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$294,LCFI124-LCFI123
	.long L$set$294
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$295,LCFI125-LCFI124
	.long L$set$295
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$296,LCFI126-LCFI125
	.long L$set$296
	.byte	0xb
	.align 3
LEFDE33:
LSFDE35:
	.set L$set$297,LEFDE35-LASFDE35
	.long L$set$297
LASFDE35:
	.long	LASFDE35-EH_frame1
	.quad	LFB9280-.
	.set L$set$298,LFE9280-LFB9280
	.quad L$set$298
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$299,LCFI127-LFB9280
	.long L$set$299
	.byte	0xe
	.byte	0x10
	.byte	0x8c
	.byte	0x2
	.byte	0x4
	.set L$set$300,LCFI128-LCFI127
	.long L$set$300
	.byte	0xe
	.byte	0x18
	.byte	0x86
	.byte	0x3
	.byte	0x4
	.set L$set$301,LCFI129-LCFI128
	.long L$set$301
	.byte	0xe
	.byte	0x20
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$302,LCFI130-LCFI129
	.long L$set$302
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$303,LCFI131-LCFI130
	.long L$set$303
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$304,LCFI132-LCFI131
	.long L$set$304
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$305,LCFI133-LCFI132
	.long L$set$305
	.byte	0xb
	.byte	0x4
	.set L$set$306,LCFI134-LCFI133
	.long L$set$306
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$307,LCFI135-LCFI134
	.long L$set$307
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$308,LCFI136-LCFI135
	.long L$set$308
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$309,LCFI137-LCFI136
	.long L$set$309
	.byte	0xb
	.byte	0x4
	.set L$set$310,LCFI138-LCFI137
	.long L$set$310
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$311,LCFI139-LCFI138
	.long L$set$311
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$312,LCFI140-LCFI139
	.long L$set$312
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE35:
LSFDE37:
	.set L$set$313,LEFDE37-LASFDE37
	.long L$set$313
LASFDE37:
	.long	LASFDE37-EH_frame1
	.quad	LFB9407-.
	.set L$set$314,LFE9407-LFB9407
	.quad L$set$314
	.byte	0x8
	.quad	LLSDA9407-.
	.byte	0x4
	.set L$set$315,LCFI141-LFB9407
	.long L$set$315
	.byte	0xe
	.byte	0x10
	.byte	0x8f
	.byte	0x2
	.byte	0x4
	.set L$set$316,LCFI142-LCFI141
	.long L$set$316
	.byte	0xe
	.byte	0x18
	.byte	0x8e
	.byte	0x3
	.byte	0x4
	.set L$set$317,LCFI143-LCFI142
	.long L$set$317
	.byte	0xe
	.byte	0x20
	.byte	0x8d
	.byte	0x4
	.byte	0x4
	.set L$set$318,LCFI144-LCFI143
	.long L$set$318
	.byte	0xe
	.byte	0x28
	.byte	0x8c
	.byte	0x5
	.byte	0x4
	.set L$set$319,LCFI145-LCFI144
	.long L$set$319
	.byte	0xe
	.byte	0x30
	.byte	0x86
	.byte	0x6
	.byte	0x4
	.set L$set$320,LCFI146-LCFI145
	.long L$set$320
	.byte	0xe
	.byte	0x38
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$321,LCFI147-LCFI146
	.long L$set$321
	.byte	0xe
	.byte	0xf0,0x3
	.byte	0x4
	.set L$set$322,LCFI148-LCFI147
	.long L$set$322
	.byte	0xa
	.byte	0xe
	.byte	0x38
	.byte	0x4
	.set L$set$323,LCFI149-LCFI148
	.long L$set$323
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$324,LCFI150-LCFI149
	.long L$set$324
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$325,LCFI151-LCFI150
	.long L$set$325
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$326,LCFI152-LCFI151
	.long L$set$326
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$327,LCFI153-LCFI152
	.long L$set$327
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$328,LCFI154-LCFI153
	.long L$set$328
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$329,LCFI155-LCFI154
	.long L$set$329
	.byte	0xb
	.align 3
LEFDE37:
LSFDE39:
	.set L$set$330,LEFDE39-LASFDE39
	.long L$set$330
LASFDE39:
	.long	LASFDE39-EH_frame1
	.quad	LFB9002-.
	.set L$set$331,LHOTE56-LFB9002
	.quad L$set$331
	.byte	0x8
	.quad	LLSDA9002-.
	.byte	0x4
	.set L$set$332,LCFI156-LFB9002
	.long L$set$332
	.byte	0xe
	.byte	0x10
	.byte	0x8f
	.byte	0x2
	.byte	0x4
	.set L$set$333,LCFI157-LCFI156
	.long L$set$333
	.byte	0xe
	.byte	0x18
	.byte	0x8e
	.byte	0x3
	.byte	0x4
	.set L$set$334,LCFI158-LCFI157
	.long L$set$334
	.byte	0xe
	.byte	0x20
	.byte	0x8d
	.byte	0x4
	.byte	0x4
	.set L$set$335,LCFI159-LCFI158
	.long L$set$335
	.byte	0xe
	.byte	0x28
	.byte	0x8c
	.byte	0x5
	.byte	0x4
	.set L$set$336,LCFI160-LCFI159
	.long L$set$336
	.byte	0xe
	.byte	0x30
	.byte	0x86
	.byte	0x6
	.byte	0x4
	.set L$set$337,LCFI161-LCFI160
	.long L$set$337
	.byte	0xe
	.byte	0x38
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$338,LCFI162-LCFI161
	.long L$set$338
	.byte	0xe
	.byte	0xf0,0x2
	.byte	0x4
	.set L$set$339,LCFI163-LCFI162
	.long L$set$339
	.byte	0xa
	.byte	0xe
	.byte	0x38
	.byte	0x4
	.set L$set$340,LCFI164-LCFI163
	.long L$set$340
	.byte	0xe
	.byte	0x30
	.byte	0x4
	.set L$set$341,LCFI165-LCFI164
	.long L$set$341
	.byte	0xe
	.byte	0x28
	.byte	0x4
	.set L$set$342,LCFI166-LCFI165
	.long L$set$342
	.byte	0xe
	.byte	0x20
	.byte	0x4
	.set L$set$343,LCFI167-LCFI166
	.long L$set$343
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$344,LCFI168-LCFI167
	.long L$set$344
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$345,LCFI169-LCFI168
	.long L$set$345
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$346,LCFI170-LCFI169
	.long L$set$346
	.byte	0xb
	.align 3
LEFDE39:
LSFDE41:
	.set L$set$347,LEFDE41-LASFDE41
	.long L$set$347
LASFDE41:
	.long	LASFDE41-EH_frame1
	.quad	LFSB9002-.
	.set L$set$348,LCOLDE56-LFSB9002
	.quad L$set$348
	.byte	0x8
	.quad	LLSDAC9002-.
	.byte	0x4
	.set L$set$349,LCFI171-LFSB9002
	.long L$set$349
	.byte	0xe
	.byte	0xf0,0x2
	.byte	0x83
	.byte	0x7
	.byte	0x86
	.byte	0x6
	.byte	0x8c
	.byte	0x5
	.byte	0x8d
	.byte	0x4
	.byte	0x8e
	.byte	0x3
	.byte	0x8f
	.byte	0x2
	.align 3
LEFDE41:
LSFDE43:
	.set L$set$350,LEFDE43-LASFDE43
	.long L$set$350
LASFDE43:
	.long	LASFDE43-EH_frame1
	.quad	LFB9573-.
	.set L$set$351,LFE9573-LFB9573
	.quad L$set$351
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$352,LCFI172-LFB9573
	.long L$set$352
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$353,LCFI173-LCFI172
	.long L$set$353
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE43:
	.ident	"GCC: (Homebrew GCC 10.2.0) 10.2.0"
	.mod_init_func
	.align 3
	.quad	__GLOBAL__sub_I_test.cpp
	.subsections_via_symbols
