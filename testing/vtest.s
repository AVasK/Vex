	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 11, 0
	.globl	__Z10vex_to_str13vectorization ## -- Begin function _Z10vex_to_str13vectorization
	.p2align	4, 0x90
__Z10vex_to_str13vectorization:         ## @_Z10vex_to_str13vectorization
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	movl	%esi, %ecx
	leaq	LJTI0_0(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rcx
	addq	%rdx, %rcx
	jmpq	*%rcx
LBB0_1:
	movb	$6, (%rax)
	movl	$6710895, 1(%rax)       ## imm = 0x66666F
	popq	%rbp
	retq
LBB0_3:
	movb	$6, (%rax)
	movl	$6648691, 1(%rax)       ## imm = 0x657373
	popq	%rbp
	retq
LBB0_4:
	movb	$14, (%rax)
	movl	$1634629988, 1(%rax)    ## imm = 0x616E7964
	movl	$1667853665, 4(%rax)    ## imm = 0x63696D61
	movb	$0, 8(%rax)
	popq	%rbp
	retq
LBB0_2:
	movb	$6, (%rax)
	movl	$7894625, 1(%rax)       ## imm = 0x787661
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L0_0_set_1, LBB0_1-LJTI0_0
.set L0_0_set_2, LBB0_2-LJTI0_0
.set L0_0_set_3, LBB0_3-LJTI0_0
.set L0_0_set_4, LBB0_4-LJTI0_0
LJTI0_0:
	.long	L0_0_set_1
	.long	L0_0_set_2
	.long	L0_0_set_3
	.long	L0_0_set_4
	.end_data_region
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function main
LCPI1_0:
	.quad	999999999               ## 0x3b9ac9ff
	.quad	999999999               ## 0x3b9ac9ff
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
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
	pushq	%r14
	pushq	%rbx
	subq	$48, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	callq	__ZNSt3__16chrono12steady_clock3nowEv
	movq	%rax, -64(%rbp)
	leaq	L_.str.4(%rip), %rax
	movq	%rax, -56(%rbp)
	movaps	LCPI1_0(%rip), %xmm0    ## xmm0 = [999999999,999999999]
	movaps	%xmm0, -48(%rbp)
Ltmp0:
	movl	$3999999996, %edi       ## imm = 0xEE6B27FC
	callq	__Znam
Ltmp1:
## %bb.1:
	movq	%rax, -32(%rbp)
	movl	$3999999996, %esi       ## imm = 0xEE6B27FC
	movq	%rax, %rdi
	callq	___bzero
Ltmp3:
	leaq	L_.str.5(%rip), %rsi
	leaq	-64(%rbp), %rdi
	callq	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp4:
## %bb.2:
Ltmp5:
	leaq	-48(%rbp), %rdi
	xorl	%esi, %esi
	callq	__ZN3VecIiL13vectorization0EEixEm
Ltmp6:
## %bb.3:
	movl	(%rax), %esi
Ltmp7:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
Ltmp8:
## %bb.4:
	movq	-32(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB1_6
## %bb.5:
	callq	__ZdaPv
LBB1_6:
Ltmp13:
	leaq	L_.str.8(%rip), %rsi
	leaq	-64(%rbp), %rdi
	callq	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp14:
## %bb.7:
	callq	__ZNSt3__16chrono12steady_clock3nowEv
	movq	%rax, -48(%rbp)
	leaq	L_.str.6(%rip), %rax
	movq	%rax, -40(%rbp)
Ltmp16:
	movl	$3999999996, %edi       ## imm = 0xEE6B27FC
	callq	__Znwm
Ltmp17:
## %bb.8:
	movq	%rax, %rbx
	movl	$3999999996, %esi       ## imm = 0xEE6B27FC
	movq	%rax, %rdi
	callq	___bzero
Ltmp19:
	leaq	L_.str.5(%rip), %rsi
	leaq	-48(%rbp), %rdi
	callq	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp20:
## %bb.9:
	movl	(%rbx), %esi
Ltmp21:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
Ltmp22:
## %bb.10:
	movq	%rbx, %rdi
	callq	__ZdlPv
Ltmp27:
	leaq	L_.str.8(%rip), %rsi
	leaq	-48(%rbp), %rdi
	callq	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp28:
## %bb.11:
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB1_21:
Ltmp29:
	movq	%rax, %rdi
	callq	___clang_call_terminate
LBB1_20:
Ltmp18:
	movq	%rax, %r14
	jmp	LBB1_17
LBB1_19:
Ltmp15:
	movq	%rax, %rdi
	callq	___clang_call_terminate
LBB1_12:
Ltmp2:
	movq	%rax, %r14
	jmp	LBB1_15
LBB1_16:
Ltmp23:
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB1_17:
Ltmp24:
	leaq	L_.str.8(%rip), %rsi
	leaq	-48(%rbp), %rdi
	callq	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp25:
	jmp	LBB1_18
LBB1_23:
Ltmp26:
	movq	%rax, %rdi
	callq	___clang_call_terminate
LBB1_13:
Ltmp9:
	movq	%rax, %r14
	movq	-32(%rbp), %rdi
	testq	%rdi, %rdi
	je	LBB1_15
## %bb.14:
	callq	__ZdaPv
LBB1_15:
Ltmp10:
	leaq	L_.str.8(%rip), %rsi
	leaq	-64(%rbp), %rdi
	callq	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp11:
LBB1_18:
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
LBB1_22:
Ltmp12:
	movq	%rax, %rdi
	callq	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 1 <<
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0     ##     jumps to Ltmp2
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0     ## >> Call Site 2 <<
	.uleb128 Ltmp3-Ltmp1            ##   Call between Ltmp1 and Ltmp3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0     ## >> Call Site 3 <<
	.uleb128 Ltmp8-Ltmp3            ##   Call between Ltmp3 and Ltmp8
	.uleb128 Ltmp9-Lfunc_begin0     ##     jumps to Ltmp9
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp13-Lfunc_begin0    ## >> Call Site 4 <<
	.uleb128 Ltmp14-Ltmp13          ##   Call between Ltmp13 and Ltmp14
	.uleb128 Ltmp15-Lfunc_begin0    ##     jumps to Ltmp15
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp16-Lfunc_begin0    ## >> Call Site 5 <<
	.uleb128 Ltmp17-Ltmp16          ##   Call between Ltmp16 and Ltmp17
	.uleb128 Ltmp18-Lfunc_begin0    ##     jumps to Ltmp18
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp17-Lfunc_begin0    ## >> Call Site 6 <<
	.uleb128 Ltmp19-Ltmp17          ##   Call between Ltmp17 and Ltmp19
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp19-Lfunc_begin0    ## >> Call Site 7 <<
	.uleb128 Ltmp22-Ltmp19          ##   Call between Ltmp19 and Ltmp22
	.uleb128 Ltmp23-Lfunc_begin0    ##     jumps to Ltmp23
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp27-Lfunc_begin0    ## >> Call Site 8 <<
	.uleb128 Ltmp28-Ltmp27          ##   Call between Ltmp27 and Ltmp28
	.uleb128 Ltmp29-Lfunc_begin0    ##     jumps to Ltmp29
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp24-Lfunc_begin0    ## >> Call Site 9 <<
	.uleb128 Ltmp25-Ltmp24          ##   Call between Ltmp24 and Ltmp25
	.uleb128 Ltmp26-Lfunc_begin0    ##     jumps to Ltmp26
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp10-Lfunc_begin0    ## >> Call Site 10 <<
	.uleb128 Ltmp11-Ltmp10          ##   Call between Ltmp10 and Ltmp11
	.uleb128 Ltmp12-Lfunc_begin0    ##     jumps to Ltmp12
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp11-Lfunc_begin0    ## >> Call Site 11 <<
	.uleb128 Lfunc_end0-Ltmp11      ##   Call between Ltmp11 and Lfunc_end0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end0:
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
	.globl	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc ## -- Begin function _ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
	.weak_def_can_be_hidden	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
	.p2align	4, 0x90
__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc: ## @_ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
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
	movq	%rsi, %r14
	movq	%rdi, %r15
	callq	__ZNSt3__16chrono12steady_clock3nowEv
	subq	(%r15), %rax
	movabsq	$4835703278458516699, %rcx ## imm = 0x431BDE82D7B634DB
	imulq	%rcx
	movq	%rdx, %r12
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$18, %r12
	addq	%rax, %r12
	movb	(%r14), %r13b
	movq	8(%r15), %rbx
	movq	%rbx, %rdi
	callq	_strlen
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	testb	%r13b, %r13b
	je	LBB2_2
## %bb.1:
	leaq	L_.str.9(%rip), %rsi
	movl	$10, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rbx
	movq	%r14, %rdi
	callq	_strlen
	movq	%rbx, %rdi
	movq	%r14, %rsi
	movq	%rax, %rdx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	leaq	L_.str.10(%rip), %rsi
	movl	$8, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEx
	leaq	L_.str.11(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movb	$109, -42(%rbp)
	leaq	-42(%rbp), %rsi
	jmp	LBB2_3
LBB2_2:
	leaq	L_.str.13(%rip), %rsi
	movl	$13, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEx
	leaq	L_.str.11(%rip), %rsi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movb	$109, -41(%rbp)
	leaq	-41(%rbp), %rsi
LBB2_3:
	movl	$1, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	leaq	L_.str.12(%rip), %rsi
	movl	$2, %edx
	movq	%rax, %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN3VecIiL13vectorization0EEixEm ## -- Begin function _ZN3VecIiL13vectorization0EEixEm
	.weak_def_can_be_hidden	__ZN3VecIiL13vectorization0EEixEm
	.p2align	4, 0x90
__ZN3VecIiL13vectorization0EEixEm:      ## @_ZN3VecIiL13vectorization0EEixEm
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
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpq	%rsi, (%rdi)
	jb	LBB3_1
## %bb.9:
	movq	%rsi, %rax
	shlq	$2, %rax
	addq	16(%rdi), %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB3_1:
	movl	$24, %edi
	callq	___cxa_allocate_exception
	movq	%rax, %rbx
	movb	$26, -48(%rbp)
	movabsq	$4764920895790937423, %rax ## imm = 0x4220664F2074754F
	movq	%rax, -47(%rbp)
	movabsq	$8314892262689611878, %rax ## imm = 0x73646E756F422066
	movq	%rax, -42(%rbp)
	movb	$0, -34(%rbp)
	movb	$1, %r15b
Ltmp30:
	leaq	-48(%rbp), %rsi
	movq	%rbx, %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_
Ltmp31:
## %bb.2:
	xorl	%r15d, %r15d
Ltmp32:
	movq	__ZTI10IndexError@GOTPCREL(%rip), %rsi
	movq	__ZN10IndexErrorD1Ev@GOTPCREL(%rip), %rdx
	movq	%rbx, %rdi
	callq	___cxa_throw
Ltmp33:
## %bb.8:
	ud2
LBB3_3:
Ltmp34:
	movq	%rax, %r14
	testb	$1, -48(%rbp)
	je	LBB3_5
## %bb.4:
	movq	-32(%rbp), %rdi
	callq	__ZdlPv
LBB3_5:
	testb	%r15b, %r15b
	je	LBB3_7
## %bb.6:
	movq	%rbx, %rdi
	callq	___cxa_free_exception
LBB3_7:
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table3:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1 ## >> Call Site 1 <<
	.uleb128 Ltmp30-Lfunc_begin1    ##   Call between Lfunc_begin1 and Ltmp30
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp30-Lfunc_begin1    ## >> Call Site 2 <<
	.uleb128 Ltmp33-Ltmp30          ##   Call between Ltmp30 and Ltmp33
	.uleb128 Ltmp34-Lfunc_begin1    ##     jumps to Ltmp34
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp33-Lfunc_begin1    ## >> Call Site 3 <<
	.uleb128 Lfunc_end1-Ltmp33      ##   Call between Ltmp33 and Lfunc_end1
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end1:
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
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
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
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
Ltmp35:
	leaq	-80(%rbp), %rdi
	movq	%rbx, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp36:
## %bb.1:
	cmpb	$0, -80(%rbp)
	je	LBB5_10
## %bb.2:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %r12
	movq	40(%rbx,%rax), %rdi
	movl	8(%rbx,%rax), %r13d
	movl	144(%rbx,%rax), %eax
	cmpl	$-1, %eax
	jne	LBB5_7
## %bb.3:
Ltmp38:
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	leaq	-56(%rbp), %rdi
	movq	%r12, %rsi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp39:
## %bb.4:
Ltmp40:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	leaq	-56(%rbp), %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp41:
## %bb.5:
	movq	(%rax), %rcx
Ltmp42:
	movq	%rax, %rdi
	movl	$32, %esi
	callq	*56(%rcx)
	movb	%al, -41(%rbp)          ## 1-byte Spill
Ltmp43:
## %bb.6:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	-41(%rbp), %eax         ## 1-byte Folded Reload
	movl	%eax, 144(%r12)
	movq	-64(%rbp), %rdi         ## 8-byte Reload
LBB5_7:
	addq	%r15, %r14
	andl	$176, %r13d
	cmpl	$32, %r13d
	movq	%r15, %rdx
	cmoveq	%r14, %rdx
Ltmp45:
	movsbl	%al, %r9d
	movq	%r15, %rsi
	movq	%r14, %rcx
	movq	%r12, %r8
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp46:
## %bb.8:
	testq	%rax, %rax
	jne	LBB5_10
## %bb.9:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %rdi
	movl	32(%rbx,%rax), %esi
	orl	$5, %esi
Ltmp48:
	callq	__ZNSt3__18ios_base5clearEj
Ltmp49:
LBB5_10:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB5_11:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB5_12:
Ltmp50:
	jmp	LBB5_15
LBB5_13:
Ltmp44:
	movq	%rax, %r14
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	jmp	LBB5_16
LBB5_14:
Ltmp47:
LBB5_15:
	movq	%rax, %r14
LBB5_16:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	jmp	LBB5_18
LBB5_17:
Ltmp37:
	movq	%rax, %r14
LBB5_18:
	movq	%r14, %rdi
	callq	___cxa_begin_catch
	movq	(%rbx), %rax
	movq	-24(%rax), %rdi
	addq	%rbx, %rdi
Ltmp51:
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp52:
## %bb.19:
	callq	___cxa_end_catch
	jmp	LBB5_11
LBB5_20:
Ltmp53:
	movq	%rax, %rbx
Ltmp54:
	callq	___cxa_end_catch
Ltmp55:
## %bb.21:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB5_22:
Ltmp56:
	movq	%rax, %rdi
	callq	___clang_call_terminate
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table5:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Ltmp35-Lfunc_begin2    ## >> Call Site 1 <<
	.uleb128 Ltmp36-Ltmp35          ##   Call between Ltmp35 and Ltmp36
	.uleb128 Ltmp37-Lfunc_begin2    ##     jumps to Ltmp37
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp38-Lfunc_begin2    ## >> Call Site 2 <<
	.uleb128 Ltmp39-Ltmp38          ##   Call between Ltmp38 and Ltmp39
	.uleb128 Ltmp47-Lfunc_begin2    ##     jumps to Ltmp47
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp40-Lfunc_begin2    ## >> Call Site 3 <<
	.uleb128 Ltmp43-Ltmp40          ##   Call between Ltmp40 and Ltmp43
	.uleb128 Ltmp44-Lfunc_begin2    ##     jumps to Ltmp44
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp45-Lfunc_begin2    ## >> Call Site 4 <<
	.uleb128 Ltmp46-Ltmp45          ##   Call between Ltmp45 and Ltmp46
	.uleb128 Ltmp47-Lfunc_begin2    ##     jumps to Ltmp47
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp48-Lfunc_begin2    ## >> Call Site 5 <<
	.uleb128 Ltmp49-Ltmp48          ##   Call between Ltmp48 and Ltmp49
	.uleb128 Ltmp50-Lfunc_begin2    ##     jumps to Ltmp50
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp49-Lfunc_begin2    ## >> Call Site 6 <<
	.uleb128 Ltmp51-Ltmp49          ##   Call between Ltmp49 and Ltmp51
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp51-Lfunc_begin2    ## >> Call Site 7 <<
	.uleb128 Ltmp52-Ltmp51          ##   Call between Ltmp51 and Ltmp52
	.uleb128 Ltmp53-Lfunc_begin2    ##     jumps to Ltmp53
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp52-Lfunc_begin2    ## >> Call Site 8 <<
	.uleb128 Ltmp54-Ltmp52          ##   Call between Ltmp52 and Ltmp54
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp54-Lfunc_begin2    ## >> Call Site 9 <<
	.uleb128 Ltmp55-Ltmp54          ##   Call between Ltmp54 and Ltmp55
	.uleb128 Ltmp56-Lfunc_begin2    ##     jumps to Ltmp56
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp55-Lfunc_begin2    ## >> Call Site 10 <<
	.uleb128 Lfunc_end2-Ltmp55      ##   Call between Ltmp55 and Lfunc_end2
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end2:
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
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ## -- Begin function _ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	4, 0x90
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
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
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testq	%rdi, %rdi
	je	LBB6_20
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
	jle	LBB6_3
## %bb.2:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%rbx, %rdx
	callq	*96(%rax)
	cmpq	%rbx, %rax
	jne	LBB6_20
LBB6_3:
	testq	%r14, %r14
	jle	LBB6_16
## %bb.4:
	movq	%r12, -80(%rbp)         ## 8-byte Spill
	cmpq	$23, %r14
	jae	LBB6_8
## %bb.5:
	leal	(%r14,%r14), %eax
	movb	%al, -64(%rbp)
	leaq	-64(%rbp), %rbx
	leaq	-63(%rbp), %r12
	jmp	LBB6_9
LBB6_8:
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
LBB6_9:
	movzbl	-68(%rbp), %esi         ## 1-byte Folded Reload
	movq	%r12, %rdi
	movq	%r14, %rdx
	callq	_memset
	movb	$0, (%r12,%r14)
	testb	$1, -64(%rbp)
	je	LBB6_11
## %bb.10:
	movq	-48(%rbp), %rbx
	jmp	LBB6_12
LBB6_11:
	incq	%rbx
LBB6_12:
	movq	-80(%rbp), %r12         ## 8-byte Reload
	movq	(%r13), %rax
Ltmp57:
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	*96(%rax)
Ltmp58:
## %bb.13:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB6_15
## %bb.14:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB6_15:
	cmpq	%r14, %rbx
	jne	LBB6_20
LBB6_16:
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	subq	%rsi, %r15
	testq	%r15, %r15
	jle	LBB6_18
## %bb.17:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%r15, %rdx
	callq	*96(%rax)
	cmpq	%r15, %rax
	jne	LBB6_20
LBB6_18:
	movq	$0, 24(%r12)
	jmp	LBB6_21
LBB6_20:
	xorl	%r13d, %r13d
LBB6_21:
	movq	%r13, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB6_22:
Ltmp59:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB6_24
## %bb.23:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB6_24:
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
	.uleb128 Lfunc_begin3-Lfunc_begin3 ## >> Call Site 1 <<
	.uleb128 Ltmp57-Lfunc_begin3    ##   Call between Lfunc_begin3 and Ltmp57
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp57-Lfunc_begin3    ## >> Call Site 2 <<
	.uleb128 Ltmp58-Ltmp57          ##   Call between Ltmp57 and Ltmp58
	.uleb128 Ltmp59-Lfunc_begin3    ##     jumps to Ltmp59
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp58-Lfunc_begin3    ## >> Call Site 3 <<
	.uleb128 Lfunc_end3-Ltmp58      ##   Call between Ltmp58 and Lfunc_end3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end3:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN10IndexErrorD1Ev    ## -- Begin function _ZN10IndexErrorD1Ev
	.weak_def_can_be_hidden	__ZN10IndexErrorD1Ev
	.p2align	4, 0x90
__ZN10IndexErrorD1Ev:                   ## @_ZN10IndexErrorD1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testb	$1, (%rdi)
	jne	LBB7_2
## %bb.1:
	popq	%rbp
	retq
LBB7_2:
	movq	16(%rdi), %rdi
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"off"

L_.str.1:                               ## @.str.1
	.asciz	"avx"

L_.str.2:                               ## @.str.2
	.asciz	"sse"

L_.str.3:                               ## @.str.3
	.asciz	"dynamic"

L_.str.4:                               ## @.str.4
	.asciz	"My vector"

L_.str.5:                               ## @.str.5
	.asciz	"constructed"

L_.str.6:                               ## @.str.6
	.asciz	"std::vector"

L_.str.8:                               ## @.str.8
	.space	1

L_.str.9:                               ## @.str.9
	.asciz	" timer @ ["

L_.str.10:                              ## @.str.10
	.asciz	"] time: "

L_.str.11:                              ## @.str.11
	.asciz	" "

L_.str.12:                              ## @.str.12
	.asciz	"s\n"

L_.str.13:                              ## @.str.13
	.asciz	" timer time: "

L_.str.14:                              ## @.str.14
	.asciz	"Out Of Bounds"

	.section	__TEXT,__const
	.globl	__ZTS10IndexError       ## @_ZTS10IndexError
	.weak_definition	__ZTS10IndexError
__ZTS10IndexError:
	.asciz	"10IndexError"

	.section	__DATA,__const
	.globl	__ZTI10IndexError       ## @_ZTI10IndexError
	.weak_definition	__ZTI10IndexError
	.p2align	3
__ZTI10IndexError:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTS10IndexError

.subsections_via_symbols
