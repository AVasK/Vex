	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.globl	__Z13get_alignmentv     ## -- Begin function _Z13get_alignmentv
	.p2align	4, 0x90
__Z13get_alignmentv:                    ## @_Z13get_alignmentv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$16, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _ZplIsE5ArrayIT_ERKS2_S4_
LCPI1_0:
	.quad	16                      ## 0x10
	.quad	16                      ## 0x10
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI1_1:
	.long	1040187392              ## float 0.125
LCPI1_2:
	.long	1090519040              ## float 8
LCPI1_3:
	.long	1593835520              ## float 9.22337203E+18
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZplIsE5ArrayIT_ERKS2_S4_
	.p2align	4, 0x90
__ZplIsE5ArrayIT_ERKS2_S4_:             ## @_ZplIsE5ArrayIT_ERKS2_S4_
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## %bb.0:
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	24(%rsi), %r13
	movaps	LCPI1_0(%rip), %xmm0    ## xmm0 = [16,16]
	movups	%xmm0, (%rdi)
	testq	%r13, %r13
	js	LBB1_1
## %bb.2:
	xorps	%xmm0, %xmm0
	cvtsi2ss	%r13, %xmm0
	jmp	LBB1_3
LBB1_1:
	movq	%r13, %rax
	shrq	%rax
	movl	%r13d, %ecx
	andl	$1, %ecx
	orq	%rax, %rcx
	xorps	%xmm0, %xmm0
	cvtsi2ss	%rcx, %xmm0
	addss	%xmm0, %xmm0
LBB1_3:
	mulss	LCPI1_1(%rip), %xmm0
	roundss	$10, %xmm0, %xmm0
	mulss	LCPI1_2(%rip), %xmm0
	movss	LCPI1_3(%rip), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm2
	subss	%xmm1, %xmm2
	cvttss2si	%xmm2, %rax
	movabsq	$-9223372036854775808, %rcx ## imm = 0x8000000000000000
	xorq	%rax, %rcx
	cvttss2si	%xmm0, %rdx
	ucomiss	%xmm1, %xmm0
	cmovaeq	%rcx, %rdx
	movq	%rdx, 16(%r14)
	movq	%r13, 24(%r14)
	addq	%rdx, %rdx
	leaq	-48(%rbp), %rdi
	movl	$16, %esi
	callq	_posix_memalign
	testl	%eax, %eax
	jne	LBB1_4
## %bb.6:
	movq	-48(%rbp), %r15
	movq	%r15, 32(%r14)
	testq	%r15, %r15
	je	LBB1_5
## %bb.7:
	movq	16(%rbx), %rax
	addq	%rax, %rax
	cmpq	%rax, 8(%rbx)
	ja	LBB1_21
## %bb.8:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB1_9:                                 ## =>This Inner Loop Header: Depth=1
	movl	%ecx, %eax
	andl	$-8, %eax
	cmpq	%rax, 24(%rbx)
	jb	LBB1_10
## %bb.12:                              ##   in Loop: Header=BB1_9 Depth=1
	cmpq	%rax, 24(%r12)
	jb	LBB1_13
## %bb.14:                              ##   in Loop: Header=BB1_9 Depth=1
	cmpq	%rax, %r13
	jb	LBB1_15
## %bb.20:                              ##   in Loop: Header=BB1_9 Depth=1
	movq	32(%rbx), %rdx
	movdqa	(%rdx,%rax,2), %xmm0
	movq	32(%r12), %rdx
	paddsw	(%rdx,%rax,2), %xmm0
	movdqa	%xmm0, (%r15,%rax,2)
	incq	%rsi
	movq	16(%rbx), %rax
	addq	%rax, %rax
	xorl	%edx, %edx
	divq	8(%rbx)
	addq	$8, %rcx
	cmpq	%rsi, %rax
	ja	LBB1_9
LBB1_21:
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_10:
	movl	$1, %edi
	callq	___cxa_allocate_exception
Ltmp6:
	movq	__ZTI15MemoryException@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	xorl	%edx, %edx
	callq	___cxa_throw
Ltmp7:
	jmp	LBB1_11
LBB1_13:
	movl	$1, %edi
	callq	___cxa_allocate_exception
Ltmp3:
	movq	__ZTI15MemoryException@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	xorl	%edx, %edx
	callq	___cxa_throw
Ltmp4:
	jmp	LBB1_11
LBB1_15:
	movl	$1, %edi
	callq	___cxa_allocate_exception
Ltmp0:
	movq	__ZTI15MemoryException@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	xorl	%edx, %edx
	callq	___cxa_throw
Ltmp1:
LBB1_11:
	ud2
LBB1_4:
	movq	$0, 32(%r14)
LBB1_5:
	movl	$1, %edi
	callq	___cxa_allocate_exception
	movq	__ZTI15MemoryException@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	xorl	%edx, %edx
	callq	___cxa_throw
LBB1_18:
Ltmp2:
	jmp	LBB1_19
LBB1_17:
Ltmp5:
	jmp	LBB1_19
LBB1_16:
Ltmp8:
LBB1_19:
	movq	%rax, %rbx
	movq	%r15, %rdi
	callq	_free
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0 ## >> Call Site 1 <<
	.uleb128 Ltmp6-Lfunc_begin0     ##   Call between Lfunc_begin0 and Ltmp6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin0     ## >> Call Site 2 <<
	.uleb128 Ltmp7-Ltmp6            ##   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp8-Lfunc_begin0     ##     jumps to Ltmp8
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp7-Lfunc_begin0     ## >> Call Site 3 <<
	.uleb128 Ltmp3-Ltmp7            ##   Call between Ltmp7 and Ltmp3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0     ## >> Call Site 4 <<
	.uleb128 Ltmp4-Ltmp3            ##   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin0     ##     jumps to Ltmp5
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp4-Lfunc_begin0     ## >> Call Site 5 <<
	.uleb128 Ltmp0-Ltmp4            ##   Call between Ltmp4 and Ltmp0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 6 <<
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0     ##     jumps to Ltmp2
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0     ## >> Call Site 7 <<
	.uleb128 Lfunc_end0-Ltmp1       ##   Call between Ltmp1 and Lfunc_end0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z12getCPUVendorv      ## -- Begin function _Z12getCPUVendorv
	.p2align	4, 0x90
__Z12getCPUVendorv:                     ## @_Z12getCPUVendorv
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## %bb.0:
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
	subq	$360, %rsp              ## imm = 0x168
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -128(%rbp)        ## 8-byte Spill
	xorl	%eax, %eax
	## InlineAsm Start
	xchgq	%rbx, %r12
	cpuid
	xchgq	%rbx, %r12
	## InlineAsm End
	movl	%ecx, %ebx
	movl	%edx, %r13d
	leaq	-280(%rbp), %rdi
	leaq	-384(%rbp), %r15
	movq	__ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE@GOTPCREL(%rip), %rax
	leaq	24(%rax), %rcx
	movq	%rcx, -392(%rbp)
	addq	$64, %rax
	movq	%rax, -280(%rbp)
Ltmp9:
	movq	%r15, %rsi
	callq	__ZNSt3__18ios_base4initEPv
Ltmp10:
## %bb.1:
	movq	$0, -144(%rbp)
	movl	$-1, -136(%rbp)
	movq	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %r14
	leaq	24(%r14), %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	%rax, -392(%rbp)
	addq	$64, %r14
	movq	%r14, -280(%rbp)
Ltmp12:
	movq	%r15, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
Ltmp13:
## %bb.2:
	movq	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %r15
	addq	$16, %r15
	movq	%r15, -384(%rbp)
	movq	$0, -320(%rbp)
	movq	$0, -312(%rbp)
	movq	$0, -304(%rbp)
	movq	$0, -296(%rbp)
	movl	$16, -288(%rbp)
	movb	$8, -120(%rbp)
	leaq	-119(%rbp), %rsi
	movl	%r12d, -119(%rbp)
	movb	$0, -115(%rbp)
Ltmp15:
	leaq	-392(%rbp), %rdi
	movl	$4, %edx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp16:
## %bb.3:
	movb	$8, -96(%rbp)
	leaq	-95(%rbp), %rsi
	movl	%r13d, -95(%rbp)
	movb	$0, -91(%rbp)
Ltmp18:
	movl	$4, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp19:
## %bb.4:
	movb	$8, -72(%rbp)
	leaq	-71(%rbp), %rsi
	movl	%ebx, -71(%rbp)
	movb	$0, -67(%rbp)
Ltmp21:
	movl	$4, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp22:
	movq	-128(%rbp), %rbx        ## 8-byte Reload
## %bb.5:
	testb	$1, -72(%rbp)
	jne	LBB2_6
## %bb.7:
	testb	$1, -96(%rbp)
	jne	LBB2_8
LBB2_9:
	testb	$1, -120(%rbp)
	je	LBB2_11
LBB2_10:
	movq	-104(%rbp), %rdi
	callq	__ZdlPv
LBB2_11:
Ltmp24:
	movq	%rbx, %rdi
	leaq	-384(%rbp), %rsi
	callq	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
Ltmp25:
## %bb.12:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -392(%rbp)
	movq	%r14, -280(%rbp)
	movq	%r15, -384(%rbp)
	testb	$1, -320(%rbp)
	je	LBB2_14
## %bb.13:
	movq	-304(%rbp), %rdi
	callq	__ZdlPv
LBB2_14:
	leaq	-384(%rbp), %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	leaq	-392(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	leaq	-280(%rbp), %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	movq	%rbx, %rax
	addq	$360, %rsp              ## imm = 0x168
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB2_6:
	movq	-56(%rbp), %rdi
	callq	__ZdlPv
	testb	$1, -96(%rbp)
	je	LBB2_9
LBB2_8:
	movq	-80(%rbp), %rdi
	callq	__ZdlPv
	testb	$1, -120(%rbp)
	jne	LBB2_10
	jmp	LBB2_11
LBB2_25:
Ltmp26:
	movq	%rax, %rbx
	jmp	LBB2_26
LBB2_19:
Ltmp23:
	movq	%rax, %rbx
	testb	$1, -72(%rbp)
	jne	LBB2_20
## %bb.21:
	testb	$1, -96(%rbp)
	jne	LBB2_22
LBB2_23:
	testb	$1, -120(%rbp)
	je	LBB2_26
LBB2_24:
	movq	-104(%rbp), %rdi
	callq	__ZdlPv
LBB2_26:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -392(%rbp)
	movq	%r14, -280(%rbp)
	movq	%r15, -384(%rbp)
	testb	$1, -320(%rbp)
	je	LBB2_28
## %bb.27:
	movq	-304(%rbp), %rdi
	callq	__ZdlPv
LBB2_28:
	leaq	-384(%rbp), %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	jmp	LBB2_29
LBB2_20:
	movq	-56(%rbp), %rdi
	callq	__ZdlPv
	testb	$1, -96(%rbp)
	je	LBB2_23
	jmp	LBB2_22
LBB2_18:
Ltmp20:
	movq	%rax, %rbx
	testb	$1, -96(%rbp)
	je	LBB2_23
LBB2_22:
	movq	-80(%rbp), %rdi
	callq	__ZdlPv
	testb	$1, -120(%rbp)
	jne	LBB2_24
	jmp	LBB2_26
LBB2_17:
Ltmp17:
	movq	%rax, %rbx
	testb	$1, -120(%rbp)
	jne	LBB2_24
	jmp	LBB2_26
LBB2_16:
Ltmp14:
	movq	%rax, %rbx
LBB2_29:
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	leaq	-392(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
LBB2_30:
	leaq	-280(%rbp), %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB2_15:
Ltmp11:
	movq	%rax, %rbx
	jmp	LBB2_30
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table2:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Ltmp9-Lfunc_begin1     ## >> Call Site 1 <<
	.uleb128 Ltmp10-Ltmp9           ##   Call between Ltmp9 and Ltmp10
	.uleb128 Ltmp11-Lfunc_begin1    ##     jumps to Ltmp11
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp12-Lfunc_begin1    ## >> Call Site 2 <<
	.uleb128 Ltmp13-Ltmp12          ##   Call between Ltmp12 and Ltmp13
	.uleb128 Ltmp14-Lfunc_begin1    ##     jumps to Ltmp14
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp15-Lfunc_begin1    ## >> Call Site 3 <<
	.uleb128 Ltmp16-Ltmp15          ##   Call between Ltmp15 and Ltmp16
	.uleb128 Ltmp17-Lfunc_begin1    ##     jumps to Ltmp17
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp18-Lfunc_begin1    ## >> Call Site 4 <<
	.uleb128 Ltmp19-Ltmp18          ##   Call between Ltmp18 and Ltmp19
	.uleb128 Ltmp20-Lfunc_begin1    ##     jumps to Ltmp20
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp21-Lfunc_begin1    ## >> Call Site 5 <<
	.uleb128 Ltmp22-Ltmp21          ##   Call between Ltmp21 and Ltmp22
	.uleb128 Ltmp23-Lfunc_begin1    ##     jumps to Ltmp23
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp24-Lfunc_begin1    ## >> Call Site 6 <<
	.uleb128 Ltmp25-Ltmp24          ##   Call between Ltmp24 and Ltmp25
	.uleb128 Ltmp26-Lfunc_begin1    ##     jumps to Ltmp26
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp25-Lfunc_begin1    ## >> Call Site 7 <<
	.uleb128 Lfunc_end1-Ltmp25      ##   Call between Ltmp25 and Lfunc_end1
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end1:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev ## -- Begin function _ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.p2align	4, 0x90
__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev: ## @_ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rbx
	movq	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rax
	leaq	24(%rax), %rcx
	movq	%rcx, (%rdi)
	leaq	112(%rdi), %r14
	addq	$64, %rax
	movq	%rax, 112(%rdi)
	leaq	8(%rdi), %r15
	movq	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, 8(%rdi)
	testb	$1, 72(%rdi)
	je	LBB3_2
## %bb.1:
	movq	88(%rbx), %rdi
	callq	__ZdlPv
LBB3_2:
	movq	%r15, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	movq	%r14, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__Z13getProcLeavesv     ## -- Begin function _Z13getProcLeavesv
	.p2align	4, 0x90
__Z13getProcLeavesv:                    ## @_Z13getProcLeavesv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	## InlineAsm Start
	xchgq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi
	## InlineAsm End
	movl	%eax, %esi
	movl	$-2147483648, %eax      ## imm = 0x80000000
	## InlineAsm Start
	xchgq	%rbx, %rdi
	cpuid
	xchgq	%rbx, %rdi
	## InlineAsm End
                                        ## kill: def $eax killed $eax def $rax
	shlq	$32, %rax
	movl	%esi, %ecx
	orq	%rcx, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z14getCPUFeaturesv    ## -- Begin function _Z14getCPUFeaturesv
	.p2align	4, 0x90
__Z14getCPUFeaturesv:                   ## @_Z14getCPUFeaturesv
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
## %bb.0:
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
	subq	$296, %rsp              ## imm = 0x128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	movl	$1, %eax
	## InlineAsm Start
	xchgq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi
	## InlineAsm End
	movl	%ecx, %r13d
	movl	%edx, %r14d
	leaq	-216(%rbp), %rdi
	leaq	-320(%rbp), %rbx
	movq	__ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE@GOTPCREL(%rip), %rax
	leaq	24(%rax), %rcx
	movq	%rcx, -328(%rbp)
	addq	$64, %rax
	movq	%rax, -216(%rbp)
Ltmp27:
	movq	%rbx, %rsi
	callq	__ZNSt3__18ios_base4initEPv
Ltmp28:
## %bb.1:
	movq	$0, -80(%rbp)
	movl	$-1, -72(%rbp)
	movq	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %r15
	leaq	24(%r15), %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	%rax, -328(%rbp)
	addq	$64, %r15
	movq	%r15, -216(%rbp)
Ltmp30:
	movq	%rbx, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
Ltmp31:
## %bb.2:
	movq	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	%rax, -320(%rbp)
	movq	$0, -256(%rbp)
	movq	$0, -248(%rbp)
	movq	$0, -240(%rbp)
	movq	$0, -232(%rbp)
	movl	$16, -224(%rbp)
Ltmp33:
	leaq	L_.str(%rip), %rsi
	leaq	-328(%rbp), %rdi
	movl	$18, %edx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp34:
## %bb.3:
	xorl	%edx, %edx
	testl	$268435456, %r14d       ## imm = 0x10000000
	sete	%dl
	leaq	L_.str.17(%rip), %r12
	leaq	L_.str.16(%rip), %rbx
	movq	%rbx, %rsi
	cmoveq	%r12, %rsi
	addq	$7, %rdx
Ltmp35:
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp36:
## %bb.4:
Ltmp37:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp38:
## %bb.5:
Ltmp39:
	leaq	L_.str.2(%rip), %rsi
	movl	$11, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp40:
## %bb.6:
	xorl	%edx, %edx
	testl	$8388608, %r14d         ## imm = 0x800000
	sete	%dl
	movq	%rbx, %rsi
	cmoveq	%r12, %rsi
	addq	$7, %rdx
Ltmp41:
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp42:
## %bb.7:
Ltmp43:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp44:
## %bb.8:
Ltmp45:
	leaq	L_.str.3(%rip), %rsi
	movl	$11, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp46:
## %bb.9:
	xorl	%edx, %edx
	testl	$33554432, %r14d        ## imm = 0x2000000
	sete	%dl
	movq	%rbx, %rsi
	cmoveq	%r12, %rsi
	addq	$7, %rdx
Ltmp47:
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp48:
## %bb.10:
Ltmp49:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp50:
## %bb.11:
Ltmp51:
	leaq	L_.str.4(%rip), %rsi
	movl	$11, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp52:
## %bb.12:
	xorl	%edx, %edx
	testl	$67108864, %r14d        ## imm = 0x4000000
	sete	%dl
	movq	%rbx, %rsi
	cmoveq	%r12, %rsi
	addq	$7, %rdx
Ltmp53:
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp54:
## %bb.13:
Ltmp55:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp56:
## %bb.14:
Ltmp57:
	leaq	L_.str.5(%rip), %rsi
	movl	$11, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp58:
## %bb.15:
	andl	$1, %r14d
	movq	%rbx, %rsi
	cmoveq	%r12, %rsi
	movl	$8, %edx
	subq	%r14, %rdx
Ltmp59:
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp60:
## %bb.16:
Ltmp61:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp62:
## %bb.17:
Ltmp63:
	leaq	L_.str.6(%rip), %rsi
	movl	$11, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp64:
## %bb.18:
	xorl	%edx, %edx
	testl	$524288, %r13d          ## imm = 0x80000
	sete	%dl
	movq	%rbx, %rsi
	cmoveq	%r12, %rsi
	addq	$7, %rdx
Ltmp65:
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp66:
## %bb.19:
Ltmp67:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp68:
## %bb.20:
Ltmp69:
	leaq	L_.str.7(%rip), %rsi
	movl	$11, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp70:
## %bb.21:
	xorl	%edx, %edx
	testl	$1048576, %r13d         ## imm = 0x100000
	sete	%dl
	movq	%rbx, %rsi
	cmoveq	%r12, %rsi
	addq	$7, %rdx
Ltmp71:
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp72:
## %bb.22:
Ltmp73:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp74:
## %bb.23:
Ltmp75:
	leaq	L_.str.8(%rip), %rsi
	movl	$11, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp76:
## %bb.24:
	xorl	%edx, %edx
	testl	$268435456, %r13d       ## imm = 0x10000000
	sete	%dl
	movq	%rbx, %rsi
	cmoveq	%r12, %rsi
	addq	$7, %rdx
Ltmp77:
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp78:
## %bb.25:
Ltmp79:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp80:
## %bb.26:
Ltmp81:
	leaq	L_.str.9(%rip), %rsi
	movl	$11, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp82:
## %bb.27:
	xorl	%edx, %edx
	testl	$8388608, %r13d         ## imm = 0x800000
	sete	%dl
	cmoveq	%r12, %rbx
	addq	$7, %rdx
Ltmp83:
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp84:
## %bb.28:
Ltmp85:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp86:
## %bb.29:
Ltmp87:
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	leaq	-320(%rbp), %rsi
	callq	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
Ltmp88:
## %bb.30:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -328(%rbp)
	movq	%r15, -216(%rbp)
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -320(%rbp)
	testb	$1, -256(%rbp)
	je	LBB5_32
## %bb.31:
	movq	-240(%rbp), %rdi
	callq	__ZdlPv
LBB5_32:
	leaq	-320(%rbp), %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	leaq	-328(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	leaq	-216(%rbp), %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	movq	-64(%rbp), %rax         ## 8-byte Reload
	addq	$296, %rsp              ## imm = 0x128
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB5_34:
Ltmp32:
	movq	%rax, %rbx
	jmp	LBB5_38
LBB5_33:
Ltmp29:
	movq	%rax, %rbx
	jmp	LBB5_39
LBB5_35:
Ltmp89:
	movq	%rax, %rbx
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -328(%rbp)
	movq	%r15, -216(%rbp)
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -320(%rbp)
	testb	$1, -256(%rbp)
	je	LBB5_37
## %bb.36:
	movq	-240(%rbp), %rdi
	callq	__ZdlPv
LBB5_37:
	leaq	-320(%rbp), %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
LBB5_38:
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	leaq	-328(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
LBB5_39:
	leaq	-216(%rbp), %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table5:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Ltmp27-Lfunc_begin2    ## >> Call Site 1 <<
	.uleb128 Ltmp28-Ltmp27          ##   Call between Ltmp27 and Ltmp28
	.uleb128 Ltmp29-Lfunc_begin2    ##     jumps to Ltmp29
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp30-Lfunc_begin2    ## >> Call Site 2 <<
	.uleb128 Ltmp31-Ltmp30          ##   Call between Ltmp30 and Ltmp31
	.uleb128 Ltmp32-Lfunc_begin2    ##     jumps to Ltmp32
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp33-Lfunc_begin2    ## >> Call Site 3 <<
	.uleb128 Ltmp88-Ltmp33          ##   Call between Ltmp33 and Ltmp88
	.uleb128 Ltmp89-Lfunc_begin2    ##     jumps to Ltmp89
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp88-Lfunc_begin2    ## >> Call Site 4 <<
	.uleb128 Lfunc_end2-Ltmp88      ##   Call between Ltmp88 and Lfunc_end2
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end2:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z11L2CacheDatav       ## -- Begin function _Z11L2CacheDatav
	.p2align	4, 0x90
__Z11L2CacheDatav:                      ## @_Z11L2CacheDatav
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
## %bb.0:
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
	subq	$280, %rsp              ## imm = 0x118
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movl	$-2147483642, %eax      ## imm = 0x80000006
	## InlineAsm Start
	xchgq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi
	## InlineAsm End
	movl	%ecx, %r12d
	leaq	-200(%rbp), %rdi
	leaq	-304(%rbp), %rbx
	movq	__ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE@GOTPCREL(%rip), %rax
	leaq	24(%rax), %rcx
	movq	%rcx, -312(%rbp)
	addq	$64, %rax
	movq	%rax, -200(%rbp)
Ltmp90:
	movq	%rbx, %rsi
	callq	__ZNSt3__18ios_base4initEPv
Ltmp91:
## %bb.1:
	movq	$0, -64(%rbp)
	movl	$-1, -56(%rbp)
	movq	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %r13
	leaq	24(%r13), %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	%rax, -312(%rbp)
	addq	$64, %r13
	movq	%r13, -200(%rbp)
Ltmp93:
	movq	%rbx, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
Ltmp94:
## %bb.2:
	movq	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %r15
	addq	$16, %r15
	movq	%r15, -304(%rbp)
	movq	$0, -240(%rbp)
	movq	$0, -232(%rbp)
	movq	$0, -224(%rbp)
	movq	$0, -216(%rbp)
	movl	$16, -208(%rbp)
Ltmp96:
	leaq	L_.str.10(%rip), %rsi
	leaq	-312(%rbp), %rdi
	movl	$10, %edx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp97:
## %bb.3:
Ltmp98:
	leaq	L_.str.11(%rip), %rsi
	movl	$18, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp99:
## %bb.4:
	movzbl	%r12b, %esi
Ltmp100:
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
Ltmp101:
## %bb.5:
Ltmp102:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp103:
## %bb.6:
Ltmp104:
	leaq	L_.str.12(%rip), %rsi
	movl	$18, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp105:
## %bb.7:
	movl	%r12d, %esi
	shrl	$12, %esi
	andl	$7, %esi
Ltmp106:
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
Ltmp107:
## %bb.8:
Ltmp108:
	leaq	L_.str.13(%rip), %rsi
	movl	$2, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp109:
## %bb.9:
Ltmp110:
	leaq	L_.str.14(%rip), %rsi
	movl	$17, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp111:
## %bb.10:
	shrl	$16, %r12d
Ltmp112:
	movq	%rax, %rdi
	movl	%r12d, %esi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
Ltmp113:
## %bb.11:
Ltmp114:
	leaq	L_.str.1(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp115:
## %bb.12:
Ltmp116:
	movq	%r14, %rdi
	leaq	-304(%rbp), %rsi
	callq	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
Ltmp117:
## %bb.13:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -312(%rbp)
	movq	%r13, -200(%rbp)
	movq	%r15, -304(%rbp)
	testb	$1, -240(%rbp)
	je	LBB6_15
## %bb.14:
	movq	-224(%rbp), %rdi
	callq	__ZdlPv
LBB6_15:
	leaq	-304(%rbp), %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	leaq	-312(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	leaq	-200(%rbp), %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	movq	%r14, %rax
	addq	$280, %rsp              ## imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB6_17:
Ltmp95:
	movq	%rax, %rbx
	jmp	LBB6_21
LBB6_16:
Ltmp92:
	movq	%rax, %rbx
	jmp	LBB6_22
LBB6_18:
Ltmp118:
	movq	%rax, %rbx
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -312(%rbp)
	movq	%r13, -200(%rbp)
	movq	%r15, -304(%rbp)
	testb	$1, -240(%rbp)
	je	LBB6_20
## %bb.19:
	movq	-224(%rbp), %rdi
	callq	__ZdlPv
LBB6_20:
	leaq	-304(%rbp), %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
LBB6_21:
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	leaq	-312(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
LBB6_22:
	leaq	-200(%rbp), %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table6:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Ltmp90-Lfunc_begin3    ## >> Call Site 1 <<
	.uleb128 Ltmp91-Ltmp90          ##   Call between Ltmp90 and Ltmp91
	.uleb128 Ltmp92-Lfunc_begin3    ##     jumps to Ltmp92
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp93-Lfunc_begin3    ## >> Call Site 2 <<
	.uleb128 Ltmp94-Ltmp93          ##   Call between Ltmp93 and Ltmp94
	.uleb128 Ltmp95-Lfunc_begin3    ##     jumps to Ltmp95
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp96-Lfunc_begin3    ## >> Call Site 3 <<
	.uleb128 Ltmp117-Ltmp96         ##   Call between Ltmp96 and Ltmp117
	.uleb128 Ltmp118-Lfunc_begin3   ##     jumps to Ltmp118
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp117-Lfunc_begin3   ## >> Call Site 4 <<
	.uleb128 Lfunc_end3-Ltmp117     ##   Call between Ltmp117 and Lfunc_end3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end3:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z11CPUNumCoresv       ## -- Begin function _Z11CPUNumCoresv
	.p2align	4, 0x90
__Z11CPUNumCoresv:                      ## @_Z11CPUNumCoresv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$4, %eax
	## InlineAsm Start
	xchgq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi
	## InlineAsm End
	shrl	$26, %eax
	incl	%eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z13CPUNumThreadsv     ## -- Begin function _Z13CPUNumThreadsv
	.p2align	4, 0x90
__Z13CPUNumThreadsv:                    ## @_Z13CPUNumThreadsv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	jmp	__ZNSt3__16thread20hardware_concurrencyEv ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	$200000, %edi           ## imm = 0x30D40
	callq	__Znwm
	movq	%rax, %r14
	leaq	L_.memset_pattern.25(%rip), %rsi
	movl	$200000, %edx           ## imm = 0x30D40
	movq	%rax, %rdi
	callq	_memset_pattern16
Ltmp119:
	movl	$200000, %edi           ## imm = 0x30D40
	callq	__Znwm
Ltmp120:
## %bb.1:
	movq	%rax, %r15
	leaq	L_.memset_pattern(%rip), %rsi
	movl	$200000, %edx           ## imm = 0x30D40
	movq	%rax, %rdi
	callq	_memset_pattern16
Ltmp122:
	movl	$200000, %edi           ## imm = 0x30D40
	callq	__Znwm
Ltmp123:
## %bb.2:
	movq	%rax, %rbx
	movl	$200000, %esi           ## imm = 0x30D40
	movq	%rax, %rdi
	callq	___bzero
	callq	__ZNSt3__16chrono12steady_clock3nowEv
	movq	%rax, -48(%rbp)
	leaq	L_.str.15(%rip), %rax
	movq	%rax, -40(%rbp)
	movl	$24, %eax
	.p2align	4, 0x90
LBB9_3:                                 ## =>This Inner Loop Header: Depth=1
	movdqu	-48(%r14,%rax,2), %xmm0
	movdqu	-32(%r14,%rax,2), %xmm1
	movdqu	-48(%r15,%rax,2), %xmm2
	paddw	%xmm0, %xmm2
	movdqu	-32(%r15,%rax,2), %xmm0
	paddw	%xmm1, %xmm0
	movdqu	%xmm2, -48(%rbx,%rax,2)
	movdqu	%xmm0, -32(%rbx,%rax,2)
	movdqu	-16(%r14,%rax,2), %xmm0
	movdqu	(%r14,%rax,2), %xmm1
	movdqu	-16(%r15,%rax,2), %xmm2
	paddw	%xmm0, %xmm2
	movdqu	(%r15,%rax,2), %xmm0
	paddw	%xmm1, %xmm0
	movdqu	%xmm2, -16(%rbx,%rax,2)
	movdqu	%xmm0, (%rbx,%rax,2)
	addq	$32, %rax
	cmpq	$100024, %rax           ## imm = 0x186B8
	jne	LBB9_3
## %bb.4:
Ltmp125:
	leaq	L_.str.19(%rip), %rsi
	leaq	-48(%rbp), %rdi
	callq	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000000000EEEEEE4timeEPKc
Ltmp126:
## %bb.5:
	movswl	(%rbx), %esi
Ltmp128:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEs
Ltmp129:
## %bb.6:
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__ZdlPv
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB9_10:
Ltmp130:
	movq	%rax, %r12
	movq	%rbx, %rdi
	callq	__ZdlPv
	jmp	LBB9_11
LBB9_9:
Ltmp127:
	movq	%rax, %rdi
	callq	___clang_call_terminate
LBB9_8:
Ltmp124:
	movq	%rax, %r12
LBB9_11:
	movq	%r15, %rdi
	callq	__ZdlPv
	jmp	LBB9_12
LBB9_7:
Ltmp121:
	movq	%rax, %r12
LBB9_12:
	movq	%r14, %rdi
	callq	__ZdlPv
	movq	%r12, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table9:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4 ## >> Call Site 1 <<
	.uleb128 Ltmp119-Lfunc_begin4   ##   Call between Lfunc_begin4 and Ltmp119
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp119-Lfunc_begin4   ## >> Call Site 2 <<
	.uleb128 Ltmp120-Ltmp119        ##   Call between Ltmp119 and Ltmp120
	.uleb128 Ltmp121-Lfunc_begin4   ##     jumps to Ltmp121
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp120-Lfunc_begin4   ## >> Call Site 3 <<
	.uleb128 Ltmp122-Ltmp120        ##   Call between Ltmp120 and Ltmp122
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp122-Lfunc_begin4   ## >> Call Site 4 <<
	.uleb128 Ltmp123-Ltmp122        ##   Call between Ltmp122 and Ltmp123
	.uleb128 Ltmp124-Lfunc_begin4   ##     jumps to Ltmp124
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp123-Lfunc_begin4   ## >> Call Site 5 <<
	.uleb128 Ltmp125-Ltmp123        ##   Call between Ltmp123 and Ltmp125
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp125-Lfunc_begin4   ## >> Call Site 6 <<
	.uleb128 Ltmp126-Ltmp125        ##   Call between Ltmp125 and Ltmp126
	.uleb128 Ltmp127-Lfunc_begin4   ##     jumps to Ltmp127
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp128-Lfunc_begin4   ## >> Call Site 7 <<
	.uleb128 Ltmp129-Ltmp128        ##   Call between Ltmp128 and Ltmp129
	.uleb128 Ltmp130-Lfunc_begin4   ##     jumps to Ltmp130
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp129-Lfunc_begin4   ## >> Call Site 8 <<
	.uleb128 Lfunc_end4-Ltmp129     ##   Call between Ltmp129 and Lfunc_end4
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end4:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase0:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	___clang_call_terminate ## -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## %bb.0:
	pushq	%rax
	callq	___cxa_begin_catch
	callq	__ZSt9terminatev
                                        ## -- End function
	.globl	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev ## -- Begin function _ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.weak_def_can_be_hidden	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.p2align	4, 0x90
__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev: ## @_ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	leaq	(%rdi,%rax), %r15
	movq	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rcx
	leaq	24(%rcx), %rdx
	movq	%rdx, (%rdi,%rax)
	leaq	112(%rdi,%rax), %r14
	addq	$64, %rcx
	movq	%rcx, 112(%rdi,%rax)
	leaq	8(%rdi,%rax), %rbx
	movq	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rcx
	addq	$16, %rcx
	movq	%rcx, 8(%rdi,%rax)
	testb	$1, 72(%rdi,%rax)
	je	LBB11_2
## %bb.1:
	movq	88(%r15), %rdi
	callq	__ZdlPv
LBB11_2:
	movq	%rbx, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	movq	%r15, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	movq	%r14, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev ## -- Begin function _ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.p2align	4, 0x90
__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev: ## @_ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rbx
	movq	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rax
	leaq	24(%rax), %rcx
	movq	%rcx, (%rdi)
	leaq	112(%rdi), %r14
	addq	$64, %rax
	movq	%rax, 112(%rdi)
	leaq	8(%rdi), %r15
	movq	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, 8(%rdi)
	testb	$1, 72(%rdi)
	je	LBB12_2
## %bb.1:
	movq	88(%rbx), %rdi
	callq	__ZdlPv
LBB12_2:
	movq	%r15, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	movq	%r14, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev ## -- Begin function _ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.weak_def_can_be_hidden	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.p2align	4, 0x90
__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev: ## @_ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	leaq	(%rdi,%rax), %rbx
	movq	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rcx
	leaq	24(%rcx), %rdx
	movq	%rdx, (%rdi,%rax)
	leaq	112(%rdi,%rax), %r14
	addq	$64, %rcx
	movq	%rcx, 112(%rdi,%rax)
	leaq	8(%rdi,%rax), %r15
	movq	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rcx
	addq	$16, %rcx
	movq	%rcx, 8(%rdi,%rax)
	testb	$1, 72(%rdi,%rax)
	je	LBB13_2
## %bb.1:
	movq	88(%rbx), %rdi
	callq	__ZdlPv
LBB13_2:
	movq	%r15, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	movq	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	movq	%r14, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, (%rdi)
	testb	$1, 64(%rdi)
	je	LBB14_2
## %bb.1:
	movq	80(%rbx), %rdi
	callq	__ZdlPv
LBB14_2:
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, (%rdi)
	testb	$1, 64(%rdi)
	je	LBB15_2
## %bb.1:
	movq	80(%rbx), %rdi
	callq	__ZdlPv
LBB15_2:
	movq	%rbx, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	.cfi_offset %rbx, -24
	movq	%rdi, %rax
	movq	48(%rsi), %rdi
	movq	88(%rsi), %r10
	cmpq	%rdi, %r10
	jae	LBB16_2
## %bb.1:
	movq	%rdi, 88(%rsi)
	movq	%rdi, %r10
LBB16_2:
	movl	%r8d, %ebx
	movq	$-1, %r9
	andl	$24, %ebx
	je	LBB16_31
## %bb.3:
	cmpl	$1, %ecx
	jne	LBB16_5
## %bb.4:
	cmpl	$24, %ebx
	je	LBB16_31
LBB16_5:
	testq	%r10, %r10
	je	LBB16_6
## %bb.7:
	testb	$1, 64(%rsi)
	jne	LBB16_8
## %bb.9:
	leaq	64(%rsi), %rbx
	incq	%rbx
	jmp	LBB16_10
LBB16_6:
	xorl	%r11d, %r11d
	testl	%ecx, %ecx
	jne	LBB16_13
LBB16_12:
	xorl	%ecx, %ecx
	addq	%rdx, %rcx
	jns	LBB16_20
	jmp	LBB16_31
LBB16_8:
	movq	80(%rsi), %rbx
LBB16_10:
	movq	%r10, %r11
	subq	%rbx, %r11
	testl	%ecx, %ecx
	je	LBB16_12
LBB16_13:
	cmpl	$2, %ecx
	je	LBB16_18
## %bb.14:
	cmpl	$1, %ecx
	jne	LBB16_31
## %bb.15:
	testb	$8, %r8b
	jne	LBB16_16
## %bb.17:
	movq	%rdi, %rcx
	subq	40(%rsi), %rcx
	addq	%rdx, %rcx
	jns	LBB16_20
	jmp	LBB16_31
LBB16_18:
	movq	%r11, %rcx
	addq	%rdx, %rcx
	jns	LBB16_20
	jmp	LBB16_31
LBB16_16:
	movq	24(%rsi), %rcx
	subq	16(%rsi), %rcx
	addq	%rdx, %rcx
	js	LBB16_31
LBB16_20:
	cmpq	%rcx, %r11
	jl	LBB16_31
## %bb.21:
	testq	%rcx, %rcx
	je	LBB16_26
## %bb.22:
	testb	$8, %r8b
	je	LBB16_24
## %bb.23:
	cmpq	$0, 24(%rsi)
	je	LBB16_31
LBB16_24:
	testb	$16, %r8b
	je	LBB16_26
## %bb.25:
	testq	%rdi, %rdi
	je	LBB16_31
LBB16_26:
	testb	$8, %r8b
	je	LBB16_28
## %bb.27:
	movq	16(%rsi), %rdx
	addq	%rcx, %rdx
	movq	%rdx, 24(%rsi)
	movq	%r10, 32(%rsi)
LBB16_28:
	testb	$16, %r8b
	je	LBB16_30
## %bb.29:
	movslq	%ecx, %rdx
	addq	40(%rsi), %rdx
	movq	%rdx, 48(%rsi)
LBB16_30:
	movq	%rcx, %r9
LBB16_31:
	movq	$0, 120(%rax)
	movq	$0, 112(%rax)
	movq	$0, 104(%rax)
	movq	$0, 96(%rax)
	movq	$0, 88(%rax)
	movq	$0, 80(%rax)
	movq	$0, 72(%rax)
	movq	$0, 64(%rax)
	movq	$0, 56(%rax)
	movq	$0, 48(%rax)
	movq	$0, 40(%rax)
	movq	$0, 32(%rax)
	movq	$0, 24(%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movq	$0, (%rax)
	movq	%r9, 128(%rax)
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekposENS_4fposI11__mbstate_tEEj
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekposENS_4fposI11__mbstate_tEEj: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edx, %r8d
	movq	%rdi, %rbx
	movq	144(%rbp), %rdx
	movq	(%rsi), %rax
	xorl	%ecx, %ecx
	callq	*32(%rax)
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	48(%rdi), %rax
	movq	88(%rdi), %rcx
	cmpq	%rax, %rcx
	jae	LBB18_2
## %bb.1:
	movq	%rax, 88(%rdi)
	movq	%rax, %rcx
LBB18_2:
	movl	$-1, %eax
	testb	$8, 96(%rdi)
	je	LBB18_7
## %bb.3:
	movq	32(%rdi), %rdx
	cmpq	%rcx, %rdx
	jae	LBB18_5
## %bb.4:
	movq	%rcx, 32(%rdi)
	movq	%rcx, %rdx
LBB18_5:
	movq	24(%rdi), %rcx
	cmpq	%rdx, %rcx
	jae	LBB18_7
## %bb.6:
	movzbl	(%rcx), %eax
LBB18_7:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	48(%rdi), %rax
	movq	88(%rdi), %rcx
	cmpq	%rax, %rcx
	jae	LBB19_2
## %bb.1:
	movq	%rax, 88(%rdi)
	movq	%rax, %rcx
LBB19_2:
	movq	24(%rdi), %rdx
	movl	$-1, %eax
	cmpq	%rdx, 16(%rdi)
	jae	LBB19_8
## %bb.3:
	cmpl	$-1, %esi
	je	LBB19_4
## %bb.5:
	testb	$16, 96(%rdi)
	jne	LBB19_7
## %bb.6:
	cmpb	%sil, -1(%rdx)
	jne	LBB19_8
LBB19_7:
	leaq	-1(%rdx), %rax
	movq	%rax, 24(%rdi)
	movq	%rcx, 32(%rdi)
	movb	%sil, -1(%rdx)
	movl	%esi, %eax
LBB19_8:
	popq	%rbp
	retq
LBB19_4:
	decq	%rdx
	movq	%rdx, 24(%rdi)
	movq	%rcx, 32(%rdi)
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
## %bb.0:
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
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpl	$-1, %esi
	je	LBB20_1
## %bb.2:
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movq	24(%rdi), %r15
	movq	48(%rdi), %r13
	subq	16(%rdi), %r15
	movq	56(%rdi), %rax
	cmpq	%rax, %r13
	je	LBB20_4
## %bb.3:
	movq	88(%rbx), %rsi
	jmp	LBB20_13
LBB20_1:
	xorl	%r12d, %r12d
	jmp	LBB20_20
LBB20_4:
	movl	$-1, %r12d
	testb	$16, 96(%rbx)
	je	LBB20_20
## %bb.5:
	movq	40(%rbx), %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	88(%rbx), %rax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	leaq	64(%rbx), %rdi
Ltmp131:
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	xorl	%esi, %esi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9push_backEc
Ltmp132:
## %bb.6:
	movl	$22, %esi
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	testb	$1, (%rdi)
	je	LBB20_8
## %bb.7:
	movq	(%rdi), %rsi
	andq	$-2, %rsi
	decq	%rsi
LBB20_8:
Ltmp133:
	xorl	%edx, %edx
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeEmc
Ltmp134:
## %bb.9:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	subq	%rax, %r13
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	subq	%rax, %rsi
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movzbl	(%rcx), %eax
	testb	$1, %al
	jne	LBB20_10
## %bb.11:
	incq	%rcx
	shrq	%rax
	jmp	LBB20_12
LBB20_10:
	movq	72(%rbx), %rax
	movq	80(%rbx), %rcx
LBB20_12:
	addq	%rcx, %rax
	movq	%rcx, 40(%rbx)
	movq	%rax, 56(%rbx)
	addq	%rcx, %r13
	movq	%r13, 48(%rbx)
	addq	%rcx, %rsi
	movq	%rsi, 88(%rbx)
LBB20_13:
	leaq	1(%r13), %rcx
	movq	%rcx, -72(%rbp)
	leaq	88(%rbx), %rdx
	cmpq	%rsi, %rcx
	leaq	-72(%rbp), %rsi
	cmovbq	%rdx, %rsi
	movq	(%rsi), %rdx
	movq	%rdx, 88(%rbx)
	testb	$8, 96(%rbx)
	je	LBB20_18
## %bb.14:
	testb	$1, 64(%rbx)
	jne	LBB20_15
## %bb.16:
	leaq	64(%rbx), %rsi
	incq	%rsi
	jmp	LBB20_17
LBB20_15:
	movq	80(%rbx), %rsi
LBB20_17:
	addq	%rsi, %r15
	movq	%rsi, 16(%rbx)
	movq	%r15, 24(%rbx)
	movq	%rdx, 32(%rbx)
LBB20_18:
	cmpq	%rax, %r13
	je	LBB20_22
## %bb.19:
	movq	%rcx, 48(%rbx)
	movb	%r14b, (%r13)
	movzbl	%r14b, %r12d
LBB20_20:
	movl	%r12d, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB20_22:
	movzbl	%r14b, %esi
	movq	(%rbx), %rax
	movq	104(%rax), %rax
	movq	%rbx, %rdi
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmpq	*%rax                   ## TAILCALL
LBB20_21:
Ltmp135:
	movq	%rax, %rdi
	callq	___cxa_begin_catch
	callq	___cxa_end_catch
	jmp	LBB20_20
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table20:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp131-Lfunc_begin5   ## >> Call Site 1 <<
	.uleb128 Ltmp134-Ltmp131        ##   Call between Ltmp131 and Ltmp134
	.uleb128 Ltmp135-Lfunc_begin5   ##     jumps to Ltmp135
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp134-Lfunc_begin5   ## >> Call Site 2 <<
	.uleb128 Lfunc_end5-Ltmp134     ##   Call between Ltmp134 and Lfunc_end5
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end5:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase1:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
## %bb.0:
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
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
Ltmp136:
	leaq	-80(%rbp), %rdi
	movq	%rbx, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp137:
## %bb.1:
	cmpb	$0, -80(%rbp)
	je	LBB21_10
## %bb.2:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %r12
	movq	40(%rbx,%rax), %rdi
	movl	8(%rbx,%rax), %r13d
	movl	144(%rbx,%rax), %eax
	cmpl	$-1, %eax
	jne	LBB21_7
## %bb.3:
Ltmp139:
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	leaq	-56(%rbp), %rdi
	movq	%r12, %rsi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp140:
## %bb.4:
Ltmp141:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	leaq	-56(%rbp), %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp142:
## %bb.5:
	movq	(%rax), %rcx
Ltmp143:
	movq	%rax, %rdi
	movl	$32, %esi
	callq	*56(%rcx)
	movb	%al, -41(%rbp)          ## 1-byte Spill
Ltmp144:
## %bb.6:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	-41(%rbp), %eax         ## 1-byte Folded Reload
	movl	%eax, 144(%r12)
	movq	-64(%rbp), %rdi         ## 8-byte Reload
LBB21_7:
	addq	%r15, %r14
	andl	$176, %r13d
	cmpl	$32, %r13d
	movq	%r15, %rdx
	cmoveq	%r14, %rdx
Ltmp146:
	movsbl	%al, %r9d
	movq	%r15, %rsi
	movq	%r14, %rcx
	movq	%r12, %r8
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp147:
## %bb.8:
	testq	%rax, %rax
	jne	LBB21_10
## %bb.9:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %rdi
	movl	32(%rbx,%rax), %esi
	orl	$5, %esi
Ltmp149:
	callq	__ZNSt3__18ios_base5clearEj
Ltmp150:
LBB21_10:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB21_11:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB21_12:
Ltmp151:
	jmp	LBB21_15
LBB21_13:
Ltmp145:
	movq	%rax, %r14
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	jmp	LBB21_16
LBB21_14:
Ltmp148:
LBB21_15:
	movq	%rax, %r14
LBB21_16:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	jmp	LBB21_18
LBB21_17:
Ltmp138:
	movq	%rax, %r14
LBB21_18:
	movq	%r14, %rdi
	callq	___cxa_begin_catch
	movq	(%rbx), %rax
	movq	-24(%rax), %rdi
	addq	%rbx, %rdi
Ltmp152:
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp153:
## %bb.19:
	callq	___cxa_end_catch
	jmp	LBB21_11
LBB21_20:
Ltmp154:
	movq	%rax, %rbx
Ltmp155:
	callq	___cxa_end_catch
Ltmp156:
## %bb.21:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB21_22:
Ltmp157:
	movq	%rax, %rdi
	callq	___clang_call_terminate
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table21:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Ltmp136-Lfunc_begin6   ## >> Call Site 1 <<
	.uleb128 Ltmp137-Ltmp136        ##   Call between Ltmp136 and Ltmp137
	.uleb128 Ltmp138-Lfunc_begin6   ##     jumps to Ltmp138
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp139-Lfunc_begin6   ## >> Call Site 2 <<
	.uleb128 Ltmp140-Ltmp139        ##   Call between Ltmp139 and Ltmp140
	.uleb128 Ltmp148-Lfunc_begin6   ##     jumps to Ltmp148
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp141-Lfunc_begin6   ## >> Call Site 3 <<
	.uleb128 Ltmp144-Ltmp141        ##   Call between Ltmp141 and Ltmp144
	.uleb128 Ltmp145-Lfunc_begin6   ##     jumps to Ltmp145
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp146-Lfunc_begin6   ## >> Call Site 4 <<
	.uleb128 Ltmp147-Ltmp146        ##   Call between Ltmp146 and Ltmp147
	.uleb128 Ltmp148-Lfunc_begin6   ##     jumps to Ltmp148
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp149-Lfunc_begin6   ## >> Call Site 5 <<
	.uleb128 Ltmp150-Ltmp149        ##   Call between Ltmp149 and Ltmp150
	.uleb128 Ltmp151-Lfunc_begin6   ##     jumps to Ltmp151
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp150-Lfunc_begin6   ## >> Call Site 6 <<
	.uleb128 Ltmp152-Ltmp150        ##   Call between Ltmp150 and Ltmp152
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp152-Lfunc_begin6   ## >> Call Site 7 <<
	.uleb128 Ltmp153-Ltmp152        ##   Call between Ltmp152 and Ltmp153
	.uleb128 Ltmp154-Lfunc_begin6   ##     jumps to Ltmp154
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp153-Lfunc_begin6   ## >> Call Site 8 <<
	.uleb128 Ltmp155-Ltmp153        ##   Call between Ltmp153 and Ltmp155
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp155-Lfunc_begin6   ## >> Call Site 9 <<
	.uleb128 Ltmp156-Ltmp155        ##   Call between Ltmp155 and Ltmp156
	.uleb128 Ltmp157-Lfunc_begin6   ##     jumps to Ltmp157
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp156-Lfunc_begin6   ## >> Call Site 10 <<
	.uleb128 Lfunc_end6-Ltmp156     ##   Call between Ltmp156 and Lfunc_end6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end6:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase2:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ## -- Begin function _ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	4, 0x90
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
## %bb.0:
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
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testq	%rdi, %rdi
	je	LBB22_20
## %bb.1:
	movq	%r8, %r12
	movq	%rcx, %r15
	movq	%rdi, %r13
	movl	%r9d, -68(%rbp)         ## 4-byte Spill
	movq	%rcx, %rax
	subq	%rsi, %rax
	movq	24(%r8), %rcx
	xorl	%r14d, %r14d
	subq	%rax, %rcx
	cmovgq	%rcx, %r14
	movq	%rdx, -88(%rbp)         ## 8-byte Spill
	movq	%rdx, %rbx
	subq	%rsi, %rbx
	testq	%rbx, %rbx
	jle	LBB22_3
## %bb.2:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%rbx, %rdx
	callq	*96(%rax)
	cmpq	%rbx, %rax
	jne	LBB22_20
LBB22_3:
	testq	%r14, %r14
	jle	LBB22_16
## %bb.4:
	movq	%r12, -80(%rbp)         ## 8-byte Spill
	cmpq	$23, %r14
	jae	LBB22_8
## %bb.5:
	leal	(%r14,%r14), %eax
	movb	%al, -64(%rbp)
	leaq	-64(%rbp), %rbx
	leaq	-63(%rbp), %r12
	jmp	LBB22_9
LBB22_8:
	leaq	16(%r14), %rbx
	andq	$-16, %rbx
	movq	%rbx, %rdi
	callq	__Znwm
	movq	%rax, %r12
	movq	%rax, -48(%rbp)
	orq	$1, %rbx
	movq	%rbx, -64(%rbp)
	movq	%r14, -56(%rbp)
	leaq	-64(%rbp), %rbx
LBB22_9:
	movzbl	-68(%rbp), %esi         ## 1-byte Folded Reload
	movq	%r12, %rdi
	movq	%r14, %rdx
	callq	_memset
	movb	$0, (%r12,%r14)
	testb	$1, -64(%rbp)
	je	LBB22_11
## %bb.10:
	movq	-48(%rbp), %rbx
	jmp	LBB22_12
LBB22_11:
	incq	%rbx
LBB22_12:
	movq	-80(%rbp), %r12         ## 8-byte Reload
	movq	(%r13), %rax
Ltmp158:
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	*96(%rax)
Ltmp159:
## %bb.13:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB22_15
## %bb.14:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB22_15:
	cmpq	%r14, %rbx
	jne	LBB22_20
LBB22_16:
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	subq	%rsi, %r15
	testq	%r15, %r15
	jle	LBB22_18
## %bb.17:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%r15, %rdx
	callq	*96(%rax)
	cmpq	%r15, %rax
	jne	LBB22_20
LBB22_18:
	movq	$0, 24(%r12)
	jmp	LBB22_21
LBB22_20:
	xorl	%r13d, %r13d
LBB22_21:
	movq	%r13, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB22_22:
Ltmp160:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB22_24
## %bb.23:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB22_24:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table22:
Lexception7:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Lfunc_begin7-Lfunc_begin7 ## >> Call Site 1 <<
	.uleb128 Ltmp158-Lfunc_begin7   ##   Call between Lfunc_begin7 and Ltmp158
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp158-Lfunc_begin7   ## >> Call Site 2 <<
	.uleb128 Ltmp159-Ltmp158        ##   Call between Ltmp158 and Ltmp159
	.uleb128 Ltmp160-Lfunc_begin7   ##     jumps to Ltmp160
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp159-Lfunc_begin7   ## >> Call Site 3 <<
	.uleb128 Lfunc_end7-Ltmp159     ##   Call between Ltmp159 and Lfunc_end7
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end7:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv ## -- Begin function _ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
	.weak_def_can_be_hidden	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
	.p2align	4, 0x90
__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv: ## @_ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
	.cfi_startproc
## %bb.0:
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movl	96(%rsi), %eax
	testb	$16, %al
	jne	LBB23_3
## %bb.1:
	testb	$8, %al
	jne	LBB23_8
## %bb.2:
	movq	$0, 16(%r14)
	movq	$0, 8(%r14)
	movq	$0, (%r14)
	jmp	LBB23_41
LBB23_3:
	movq	48(%rsi), %rax
	movq	88(%rsi), %r12
	cmpq	%rax, %r12
	jae	LBB23_5
## %bb.4:
	movq	%rax, 88(%rsi)
	movq	%rax, %r12
LBB23_5:
	movq	40(%rsi), %rbx
	movq	%r12, %r13
	subq	%rbx, %r13
	cmpq	$-16, %r13
	jae	LBB23_42
## %bb.6:
	cmpq	$22, %r13
	ja	LBB23_11
## %bb.7:
	leal	(%r13,%r13), %eax
	movb	%al, (%r14)
	movq	%r14, %rax
	incq	%rax
	cmpq	%r12, %rbx
	jne	LBB23_12
	jmp	LBB23_40
LBB23_8:
	movq	16(%rsi), %rbx
	movq	32(%rsi), %r12
	movq	%r12, %r13
	subq	%rbx, %r13
	cmpq	$-16, %r13
	jae	LBB23_42
## %bb.9:
	cmpq	$22, %r13
	ja	LBB23_17
## %bb.10:
	leal	(%r13,%r13), %eax
	movb	%al, (%r14)
	movq	%r14, %rax
	incq	%rax
	cmpq	%r12, %rbx
	jne	LBB23_18
	jmp	LBB23_40
LBB23_11:
	leaq	16(%r13), %r15
	andq	$-16, %r15
	movq	%r15, %rdi
	callq	__Znwm
	movq	%rax, 16(%r14)
	orq	$1, %r15
	movq	%r15, (%r14)
	movq	%r13, 8(%r14)
	cmpq	%r12, %rbx
	je	LBB23_40
LBB23_12:
	cmpq	$32, %r13
	jb	LBB23_30
## %bb.13:
	cmpq	%r12, %rax
	jae	LBB23_15
## %bb.14:
	leaq	(%rax,%r13), %rcx
	cmpq	%rcx, %rbx
	jb	LBB23_30
LBB23_15:
	movq	%r13, %rcx
	andq	$-32, %rcx
	leaq	-32(%rcx), %rsi
	movq	%rsi, %rdi
	shrq	$5, %rdi
	incq	%rdi
	movl	%edi, %edx
	andl	$3, %edx
	cmpq	$96, %rsi
	jae	LBB23_23
## %bb.16:
	xorl	%esi, %esi
	jmp	LBB23_25
LBB23_17:
	leaq	16(%r13), %r15
	andq	$-16, %r15
	movq	%r15, %rdi
	callq	__Znwm
	movq	%rax, 16(%r14)
	orq	$1, %r15
	movq	%r15, (%r14)
	movq	%r13, 8(%r14)
	cmpq	%r12, %rbx
	je	LBB23_40
LBB23_18:
	cmpq	$32, %r13
	jb	LBB23_39
## %bb.19:
	cmpq	%r12, %rax
	jae	LBB23_21
## %bb.20:
	leaq	(%rax,%r13), %rcx
	cmpq	%rcx, %rbx
	jb	LBB23_39
LBB23_21:
	movq	%r13, %rcx
	andq	$-32, %rcx
	leaq	-32(%rcx), %rdi
	movq	%rdi, %rsi
	shrq	$5, %rsi
	incq	%rsi
	movl	%esi, %edx
	andl	$3, %edx
	cmpq	$96, %rdi
	jae	LBB23_32
## %bb.22:
	xorl	%esi, %esi
	jmp	LBB23_34
LBB23_23:
	subq	%rdx, %rdi
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB23_24:                               ## =>This Inner Loop Header: Depth=1
	movups	(%rbx,%rsi), %xmm0
	movups	16(%rbx,%rsi), %xmm1
	movups	%xmm0, (%rax,%rsi)
	movups	%xmm1, 16(%rax,%rsi)
	movups	32(%rbx,%rsi), %xmm0
	movups	48(%rbx,%rsi), %xmm1
	movups	%xmm0, 32(%rax,%rsi)
	movups	%xmm1, 48(%rax,%rsi)
	movups	64(%rbx,%rsi), %xmm0
	movups	80(%rbx,%rsi), %xmm1
	movups	%xmm0, 64(%rax,%rsi)
	movups	%xmm1, 80(%rax,%rsi)
	movups	96(%rbx,%rsi), %xmm0
	movups	112(%rbx,%rsi), %xmm1
	movups	%xmm0, 96(%rax,%rsi)
	movups	%xmm1, 112(%rax,%rsi)
	subq	$-128, %rsi
	addq	$-4, %rdi
	jne	LBB23_24
LBB23_25:
	testq	%rdx, %rdx
	je	LBB23_28
## %bb.26:
	addq	$16, %rsi
	negq	%rdx
	.p2align	4, 0x90
LBB23_27:                               ## =>This Inner Loop Header: Depth=1
	movups	-16(%rbx,%rsi), %xmm0
	movups	(%rbx,%rsi), %xmm1
	movups	%xmm0, -16(%rax,%rsi)
	movups	%xmm1, (%rax,%rsi)
	addq	$32, %rsi
	incq	%rdx
	jne	LBB23_27
LBB23_28:
	addq	%rcx, %rax
	cmpq	%r13, %rcx
	je	LBB23_40
## %bb.29:
	addq	%rcx, %rbx
	.p2align	4, 0x90
LBB23_30:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%rbx), %ecx
	movb	%cl, (%rax)
	incq	%rbx
	incq	%rax
	cmpq	%rbx, %r12
	jne	LBB23_30
	jmp	LBB23_40
LBB23_32:
	movq	%rdx, %rdi
	subq	%rsi, %rdi
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB23_33:                               ## =>This Inner Loop Header: Depth=1
	movups	(%rbx,%rsi), %xmm0
	movups	16(%rbx,%rsi), %xmm1
	movups	%xmm0, (%rax,%rsi)
	movups	%xmm1, 16(%rax,%rsi)
	movups	32(%rbx,%rsi), %xmm0
	movups	48(%rbx,%rsi), %xmm1
	movups	%xmm0, 32(%rax,%rsi)
	movups	%xmm1, 48(%rax,%rsi)
	movups	64(%rbx,%rsi), %xmm0
	movups	80(%rbx,%rsi), %xmm1
	movups	%xmm0, 64(%rax,%rsi)
	movups	%xmm1, 80(%rax,%rsi)
	movups	96(%rbx,%rsi), %xmm0
	movups	112(%rbx,%rsi), %xmm1
	movups	%xmm0, 96(%rax,%rsi)
	movups	%xmm1, 112(%rax,%rsi)
	subq	$-128, %rsi
	addq	$4, %rdi
	jne	LBB23_33
LBB23_34:
	testq	%rdx, %rdx
	je	LBB23_37
## %bb.35:
	addq	$16, %rsi
	negq	%rdx
	.p2align	4, 0x90
LBB23_36:                               ## =>This Inner Loop Header: Depth=1
	movups	-16(%rbx,%rsi), %xmm0
	movups	(%rbx,%rsi), %xmm1
	movups	%xmm0, -16(%rax,%rsi)
	movups	%xmm1, (%rax,%rsi)
	addq	$32, %rsi
	incq	%rdx
	jne	LBB23_36
LBB23_37:
	addq	%rcx, %rax
	cmpq	%rcx, %r13
	je	LBB23_40
## %bb.38:
	addq	%rcx, %rbx
	.p2align	4, 0x90
LBB23_39:                               ## =>This Inner Loop Header: Depth=1
	movzbl	(%rbx), %ecx
	movb	%cl, (%rax)
	incq	%rbx
	incq	%rax
	cmpq	%rbx, %r12
	jne	LBB23_39
LBB23_40:
	movb	$0, (%rax)
LBB23_41:
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB23_42:
	movq	%r14, %rdi
	callq	__ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000000000EEEEEE4timeEPKc ## -- Begin function _ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000000000EEEEEE4timeEPKc
	.weak_def_can_be_hidden	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000000000EEEEEE4timeEPKc
	.p2align	4, 0x90
__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000000000EEEEEE4timeEPKc: ## @_ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000000000EEEEEE4timeEPKc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, %rbx
	callq	__ZNSt3__16chrono12steady_clock3nowEv
	movq	%rax, %r14
	subq	(%rbx), %r14
	movb	(%r15), %r12b
	movq	8(%rbx), %rbx
	movq	%rbx, %rdi
	callq	_strlen
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	testb	%r12b, %r12b
	je	LBB24_2
## %bb.1:
	leaq	L_.str.20(%rip), %rsi
	movl	$10, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rbx
	movq	%r15, %rdi
	callq	_strlen
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	leaq	L_.str.21(%rip), %rsi
	movl	$8, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEx
	leaq	L_.str.22(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movb	$110, -34(%rbp)
	leaq	-34(%rbp), %rsi
	jmp	LBB24_3
LBB24_2:
	leaq	L_.str.24(%rip), %rsi
	movl	$13, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEx
	leaq	L_.str.22(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movb	$110, -33(%rbp)
	leaq	-33(%rbp), %rsi
LBB24_3:
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	leaq	L_.str.23(%rip), %rsi
	movl	$2, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Hyper Threading : "

L_.str.1:                               ## @.str.1
	.asciz	"\n"

L_.str.2:                               ## @.str.2
	.asciz	"MMX      : "

L_.str.3:                               ## @.str.3
	.asciz	"SSE      : "

L_.str.4:                               ## @.str.4
	.asciz	"SSE2     : "

L_.str.5:                               ## @.str.5
	.asciz	"FPU      : "

L_.str.6:                               ## @.str.6
	.asciz	"SSE4_1   : "

L_.str.7:                               ## @.str.7
	.asciz	"SSE4_2   : "

L_.str.8:                               ## @.str.8
	.asciz	"AVX      : "

L_.str.9:                               ## @.str.9
	.asciz	"popcount : "

L_.str.10:                              ## @.str.10
	.asciz	"L2 Cache:\n"

L_.str.11:                              ## @.str.11
	.asciz	"Line size (B)   : "

L_.str.12:                              ## @.str.12
	.asciz	"Assoc. Type     : "

L_.str.13:                              ## @.str.13
	.asciz	"x\n"

L_.str.14:                              ## @.str.14
	.asciz	"Cache Size (KB) :"

L_.str.15:                              ## @.str.15
	.asciz	"loop"

	.section	__DATA,__const
	.globl	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE ## @_ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.weak_def_can_be_hidden	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.p2align	3
__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE:
	.quad	112
	.quad	0
	.quad	__ZTINSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.quad	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.quad	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.quad	-112
	.quad	-112
	.quad	__ZTINSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.quad	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.quad	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev

	.globl	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE ## @_ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.weak_def_can_be_hidden	__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.p2align	3
__ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE:
	.quad	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE+24
	.quad	__ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE+24
	.quad	__ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE+64
	.quad	__ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE+64

	.globl	__ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE ## @_ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE
	.weak_def_can_be_hidden	__ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE
	.p2align	3
__ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE:
	.quad	112
	.quad	0
	.quad	__ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE
	.quad	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev
	.quad	-112
	.quad	-112
	.quad	__ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE
	.quad	__ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev

	.section	__TEXT,__const
	.globl	__ZTSNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE ## @_ZTSNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.weak_definition	__ZTSNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
__ZTSNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE:
	.asciz	"NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE"

	.section	__DATA,__const
	.globl	__ZTINSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE ## @_ZTINSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.weak_definition	__ZTINSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.p2align	3
__ZTINSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.quad	__ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE

	.globl	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE ## @_ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.weak_def_can_be_hidden	__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.p2align	3
__ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE:
	.quad	0
	.quad	__ZTINSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.quad	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.quad	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6setbufEPcl
	.quad	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj
	.quad	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4syncEv
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl
	.quad	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5uflowEv
	.quad	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsputnEPKcl
	.quad	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi

	.section	__TEXT,__const
	.globl	__ZTSNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE ## @_ZTSNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.weak_definition	__ZTSNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE
__ZTSNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE:
	.asciz	"NSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE"

	.section	__DATA,__const
	.globl	__ZTINSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE ## @_ZTINSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.weak_definition	__ZTINSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.p2align	3
__ZTINSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE
	.quad	__ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE

	.section	__TEXT,__cstring,cstring_literals
L_.str.16:                              ## @.str.16
	.asciz	"Enabled"

L_.str.17:                              ## @.str.17
	.asciz	"Disabled"

	.section	__TEXT,__const
	.globl	__ZTS15MemoryException  ## @_ZTS15MemoryException
	.weak_definition	__ZTS15MemoryException
__ZTS15MemoryException:
	.asciz	"15MemoryException"

	.section	__DATA,__const
	.globl	__ZTI15MemoryException  ## @_ZTI15MemoryException
	.weak_definition	__ZTI15MemoryException
	.p2align	3
__ZTI15MemoryException:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTS15MemoryException

	.section	__TEXT,__cstring,cstring_literals
L_.str.19:                              ## @.str.19
	.space	1

L_.str.20:                              ## @.str.20
	.asciz	" timer @ ["

L_.str.21:                              ## @.str.21
	.asciz	"] time: "

L_.str.22:                              ## @.str.22
	.asciz	" "

L_.str.23:                              ## @.str.23
	.asciz	"s\n"

L_.str.24:                              ## @.str.24
	.asciz	" timer time: "

	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## @.memset_pattern
L_.memset_pattern:
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7

	.p2align	4               ## @.memset_pattern.25
L_.memset_pattern.25:
	.short	1                       ## 0x1
	.short	1                       ## 0x1
	.short	1                       ## 0x1
	.short	1                       ## 0x1
	.short	1                       ## 0x1
	.short	1                       ## 0x1
	.short	1                       ## 0x1
	.short	1                       ## 0x1

.subsections_via_symbols
