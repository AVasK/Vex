	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.intel_syntax noprefix
	.globl	__ZN5CPUID18getCPUVendorStringEv ## -- Begin function _ZN5CPUID18getCPUVendorStringEv
	.p2align	4, 0x90
__ZN5CPUID18getCPUVendorStringEv:       ## @_ZN5CPUID18getCPUVendorStringEv
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 360
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	qword ptr [rbp - 128], rdi ## 8-byte Spill
	xor	eax, eax
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
	mov	r13d, ecx
	mov	r14d, edx
	lea	rdi, [rbp - 280]
	lea	r15, [rbp - 384]
	mov	rax, qword ptr [rip + __ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE@GOTPCREL]
	lea	rcx, [rax + 24]
	mov	qword ptr [rbp - 392], rcx
	add	rax, 64
	mov	qword ptr [rbp - 280], rax
Ltmp0:
	mov	rsi, r15
	call	__ZNSt3__18ios_base4initEPv
Ltmp1:
## %bb.1:
	mov	qword ptr [rbp - 144], 0
	mov	dword ptr [rbp - 136], -1
	mov	r12, qword ptr [rip + __ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	lea	rax, [r12 + 24]
	mov	qword ptr [rbp - 48], rax ## 8-byte Spill
	mov	qword ptr [rbp - 392], rax
	add	r12, 64
	mov	qword ptr [rbp - 280], r12
Ltmp3:
	mov	rdi, r15
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
Ltmp4:
## %bb.2:
	mov	r15, qword ptr [rip + __ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	r15, 16
	mov	qword ptr [rbp - 384], r15
	mov	qword ptr [rbp - 320], 0
	mov	qword ptr [rbp - 312], 0
	mov	qword ptr [rbp - 304], 0
	mov	qword ptr [rbp - 296], 0
	mov	dword ptr [rbp - 288], 16
	mov	byte ptr [rbp - 120], 8
	lea	rsi, [rbp - 119]
	mov	dword ptr [rbp - 119], ebx
	mov	byte ptr [rbp - 115], 0
Ltmp6:
	lea	rdi, [rbp - 392]
	mov	edx, 4
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp7:
## %bb.3:
	mov	byte ptr [rbp - 96], 8
	lea	rsi, [rbp - 95]
	mov	dword ptr [rbp - 95], r14d
	mov	byte ptr [rbp - 91], 0
Ltmp9:
	mov	edx, 4
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp10:
## %bb.4:
	mov	byte ptr [rbp - 72], 8
	lea	rsi, [rbp - 71]
	mov	dword ptr [rbp - 71], r13d
	mov	byte ptr [rbp - 67], 0
Ltmp12:
	mov	edx, 4
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp13:
## %bb.5:
	test	byte ptr [rbp - 72], 1
	mov	rbx, qword ptr [rbp - 128] ## 8-byte Reload
	jne	LBB0_6
## %bb.7:
	test	byte ptr [rbp - 96], 1
	jne	LBB0_8
LBB0_9:
	test	byte ptr [rbp - 120], 1
	je	LBB0_11
LBB0_10:
	mov	rdi, qword ptr [rbp - 104]
	call	__ZdlPv
LBB0_11:
Ltmp15:
	mov	rdi, rbx
	lea	rsi, [rbp - 384]
	call	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
Ltmp16:
## %bb.12:
	mov	rax, qword ptr [rbp - 48] ## 8-byte Reload
	mov	qword ptr [rbp - 392], rax
	mov	qword ptr [rbp - 280], r12
	mov	qword ptr [rbp - 384], r15
	test	byte ptr [rbp - 320], 1
	je	LBB0_14
## %bb.13:
	mov	rdi, qword ptr [rbp - 304]
	call	__ZdlPv
LBB0_14:
	lea	rdi, [rbp - 384]
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	lea	rdi, [rbp - 392]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	lea	rdi, [rbp - 280]
	call	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	rax, rbx
	add	rsp, 360
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB0_6:
	mov	rdi, qword ptr [rbp - 56]
	call	__ZdlPv
	test	byte ptr [rbp - 96], 1
	je	LBB0_9
LBB0_8:
	mov	rdi, qword ptr [rbp - 80]
	call	__ZdlPv
	test	byte ptr [rbp - 120], 1
	jne	LBB0_10
	jmp	LBB0_11
LBB0_25:
Ltmp17:
	mov	rbx, rax
	jmp	LBB0_26
LBB0_19:
Ltmp14:
	mov	rbx, rax
	test	byte ptr [rbp - 72], 1
	jne	LBB0_20
## %bb.21:
	test	byte ptr [rbp - 96], 1
	jne	LBB0_22
LBB0_23:
	test	byte ptr [rbp - 120], 1
	je	LBB0_26
LBB0_24:
	mov	rdi, qword ptr [rbp - 104]
	call	__ZdlPv
LBB0_26:
	mov	rax, qword ptr [rbp - 48] ## 8-byte Reload
	mov	qword ptr [rbp - 392], rax
	mov	qword ptr [rbp - 280], r12
	mov	qword ptr [rbp - 384], r15
	test	byte ptr [rbp - 320], 1
	je	LBB0_28
## %bb.27:
	mov	rdi, qword ptr [rbp - 304]
	call	__ZdlPv
LBB0_28:
	lea	rdi, [rbp - 384]
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	jmp	LBB0_29
LBB0_20:
	mov	rdi, qword ptr [rbp - 56]
	call	__ZdlPv
	test	byte ptr [rbp - 96], 1
	je	LBB0_23
	jmp	LBB0_22
LBB0_18:
Ltmp11:
	mov	rbx, rax
	test	byte ptr [rbp - 96], 1
	je	LBB0_23
LBB0_22:
	mov	rdi, qword ptr [rbp - 80]
	call	__ZdlPv
	test	byte ptr [rbp - 120], 1
	jne	LBB0_24
	jmp	LBB0_26
LBB0_17:
Ltmp8:
	mov	rbx, rax
	test	byte ptr [rbp - 120], 1
	jne	LBB0_24
	jmp	LBB0_26
LBB0_16:
Ltmp5:
	mov	rbx, rax
LBB0_29:
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	lea	rdi, [rbp - 392]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
LBB0_30:
	lea	rdi, [rbp - 280]
	call	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	rdi, rbx
	call	__Unwind_Resume
	ud2
LBB0_15:
Ltmp2:
	mov	rbx, rax
	jmp	LBB0_30
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 1 <<
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0     ##     jumps to Ltmp2
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0     ## >> Call Site 2 <<
	.uleb128 Ltmp4-Ltmp3            ##   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin0     ##     jumps to Ltmp5
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin0     ## >> Call Site 3 <<
	.uleb128 Ltmp7-Ltmp6            ##   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp8-Lfunc_begin0     ##     jumps to Ltmp8
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp9-Lfunc_begin0     ## >> Call Site 4 <<
	.uleb128 Ltmp10-Ltmp9           ##   Call between Ltmp9 and Ltmp10
	.uleb128 Ltmp11-Lfunc_begin0    ##     jumps to Ltmp11
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp12-Lfunc_begin0    ## >> Call Site 5 <<
	.uleb128 Ltmp13-Ltmp12          ##   Call between Ltmp12 and Ltmp13
	.uleb128 Ltmp14-Lfunc_begin0    ##     jumps to Ltmp14
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp15-Lfunc_begin0    ## >> Call Site 6 <<
	.uleb128 Ltmp16-Ltmp15          ##   Call between Ltmp15 and Ltmp16
	.uleb128 Ltmp17-Lfunc_begin0    ##     jumps to Ltmp17
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp16-Lfunc_begin0    ## >> Call Site 7 <<
	.uleb128 Lfunc_end0-Ltmp16      ##   Call between Ltmp16 and Lfunc_end0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev ## -- Begin function _ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.p2align	4, 0x90
__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev: ## @_ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	rbx
	push	rax
	.cfi_offset rbx, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rbx, rdi
	mov	rax, qword ptr [rip + __ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	lea	rcx, [rax + 24]
	mov	qword ptr [rdi], rcx
	lea	r14, [rdi + 112]
	add	rax, 64
	mov	qword ptr [rdi + 112], rax
	lea	r15, [rdi + 8]
	mov	rax, qword ptr [rip + __ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rax, 16
	mov	qword ptr [rdi + 8], rax
	test	byte ptr [rdi + 72], 1
	je	LBB1_2
## %bb.1:
	mov	rdi, qword ptr [rbx + 88]
	call	__ZdlPv
LBB1_2:
	mov	rdi, r15
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	mov	rdi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	mov	rdi, r14
	add	rsp, 8
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	jmp	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5CPUID13getProcLeavesEv ## -- Begin function _ZN5CPUID13getProcLeavesEv
	.p2align	4, 0x90
__ZN5CPUID13getProcLeavesEv:            ## @_ZN5CPUID13getProcLeavesEv
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	.cfi_offset rbx, -24
	xor	eax, eax
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
	mov	esi, eax
	mov	eax, -2147483648
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
                                        ## kill: def $eax killed $eax def $rax
	shl	rax, 32
	mov	ecx, esi
	or	rax, rcx
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5CPUID16printCPUFeaturesEv ## -- Begin function _ZN5CPUID16printCPUFeaturesEv
	.p2align	4, 0x90
__ZN5CPUID16printCPUFeaturesEv:         ## @_ZN5CPUID16printCPUFeaturesEv
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 296
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	qword ptr [rbp - 72], rdi ## 8-byte Spill
	mov	eax, 1
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
	mov	r13d, edx
	mov	r12d, ecx
	mov	eax, 7
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
	lea	rdi, [rbp - 224]
	lea	r15, [rbp - 328]
	mov	rax, qword ptr [rip + __ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE@GOTPCREL]
	lea	rcx, [rax + 24]
	mov	qword ptr [rbp - 336], rcx
	add	rax, 64
	mov	qword ptr [rbp - 224], rax
Ltmp18:
	mov	rsi, r15
	call	__ZNSt3__18ios_base4initEPv
Ltmp19:
## %bb.1:
	mov	dword ptr [rbp - 44], ebx ## 4-byte Spill
	mov	qword ptr [rbp - 88], 0
	mov	dword ptr [rbp - 80], -1
	mov	r14, qword ptr [rip + __ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	lea	rax, [r14 + 24]
	mov	qword ptr [rbp - 64], rax ## 8-byte Spill
	mov	qword ptr [rbp - 336], rax
	add	r14, 64
	mov	qword ptr [rbp - 224], r14
Ltmp21:
	mov	rdi, r15
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
Ltmp22:
## %bb.2:
	mov	rax, qword ptr [rip + __ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rax, 16
	mov	qword ptr [rbp - 56], rax ## 8-byte Spill
	mov	qword ptr [rbp - 328], rax
	mov	qword ptr [rbp - 264], 0
	mov	qword ptr [rbp - 256], 0
	mov	qword ptr [rbp - 248], 0
	mov	qword ptr [rbp - 240], 0
	mov	dword ptr [rbp - 232], 16
Ltmp24:
	lea	rsi, [rip + L_.str]
	lea	rdi, [rbp - 336]
	mov	edx, 18
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp25:
## %bb.3:
	xor	edx, edx
	test	r13d, 268435456
	sete	dl
	lea	rbx, [rip + L_.str.24]
	lea	r15, [rip + L_.str.23]
	mov	rsi, r15
	cmove	rsi, rbx
	add	rdx, 7
Ltmp26:
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp27:
## %bb.4:
Ltmp28:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp29:
## %bb.5:
Ltmp30:
	lea	rsi, [rip + L_.str.2]
	mov	edx, 11
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp31:
## %bb.6:
	xor	edx, edx
	test	r13d, 8388608
	sete	dl
	mov	rsi, r15
	cmove	rsi, rbx
	add	rdx, 7
Ltmp32:
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp33:
## %bb.7:
Ltmp34:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp35:
## %bb.8:
Ltmp36:
	lea	rsi, [rip + L_.str.3]
	mov	edx, 11
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp37:
## %bb.9:
	xor	edx, edx
	test	r13d, 33554432
	sete	dl
	mov	rsi, r15
	cmove	rsi, rbx
	add	rdx, 7
Ltmp38:
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp39:
## %bb.10:
Ltmp40:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp41:
## %bb.11:
Ltmp42:
	lea	rsi, [rip + L_.str.4]
	mov	edx, 11
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp43:
## %bb.12:
	xor	edx, edx
	test	r13d, 67108864
	sete	dl
	mov	rsi, r15
	cmove	rsi, rbx
	add	rdx, 7
Ltmp44:
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp45:
## %bb.13:
Ltmp46:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp47:
## %bb.14:
Ltmp48:
	lea	rsi, [rip + L_.str.5]
	mov	edx, 11
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp49:
## %bb.15:
	and	r13d, 1
	mov	rsi, r15
	cmove	rsi, rbx
	mov	edx, 8
	sub	rdx, r13
Ltmp50:
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp51:
## %bb.16:
Ltmp52:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp53:
## %bb.17:
Ltmp54:
	lea	rsi, [rip + L_.str.6]
	mov	edx, 11
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp55:
## %bb.18:
	xor	edx, edx
	test	r12d, 524288
	sete	dl
	mov	rsi, r15
	cmove	rsi, rbx
	add	rdx, 7
Ltmp56:
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp57:
## %bb.19:
Ltmp58:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp59:
## %bb.20:
Ltmp60:
	lea	rsi, [rip + L_.str.7]
	mov	edx, 11
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp61:
## %bb.21:
	xor	edx, edx
	test	r12d, 1048576
	sete	dl
	mov	rsi, r15
	cmove	rsi, rbx
	add	rdx, 7
Ltmp62:
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp63:
## %bb.22:
Ltmp64:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp65:
## %bb.23:
Ltmp66:
	lea	rsi, [rip + L_.str.8]
	mov	edx, 11
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp67:
## %bb.24:
	xor	edx, edx
	test	r12d, 268435456
	sete	dl
	mov	rsi, r15
	cmove	rsi, rbx
	add	rdx, 7
Ltmp68:
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp69:
## %bb.25:
Ltmp70:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp71:
## %bb.26:
Ltmp72:
	lea	rsi, [rip + L_.str.9]
	mov	edx, 11
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp73:
## %bb.27:
	xor	edx, edx
	test	byte ptr [rbp - 44], 32 ## 1-byte Folded Reload
	sete	dl
	mov	rsi, r15
	cmove	rsi, rbx
	add	rdx, 7
Ltmp74:
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp75:
## %bb.28:
Ltmp76:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp77:
## %bb.29:
Ltmp78:
	lea	rsi, [rip + L_.str.10]
	mov	edx, 11
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp79:
## %bb.30:
	xor	edx, edx
	test	r12d, 8388608
	sete	dl
	cmove	r15, rbx
	add	rdx, 7
Ltmp80:
	mov	rdi, rax
	mov	rsi, r15
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp81:
## %bb.31:
Ltmp82:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp83:
## %bb.32:
Ltmp84:
	mov	rdi, qword ptr [rbp - 72] ## 8-byte Reload
	lea	rsi, [rbp - 328]
	call	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
Ltmp85:
## %bb.33:
	mov	rax, qword ptr [rbp - 64] ## 8-byte Reload
	mov	qword ptr [rbp - 336], rax
	mov	qword ptr [rbp - 224], r14
	mov	rax, qword ptr [rbp - 56] ## 8-byte Reload
	mov	qword ptr [rbp - 328], rax
	test	byte ptr [rbp - 264], 1
	je	LBB3_35
## %bb.34:
	mov	rdi, qword ptr [rbp - 248]
	call	__ZdlPv
LBB3_35:
	lea	rdi, [rbp - 328]
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	lea	rdi, [rbp - 336]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	lea	rdi, [rbp - 224]
	call	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	rax, qword ptr [rbp - 72] ## 8-byte Reload
	add	rsp, 296
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB3_37:
Ltmp23:
	mov	r15, rax
	jmp	LBB3_41
LBB3_36:
Ltmp20:
	mov	r15, rax
	jmp	LBB3_42
LBB3_38:
Ltmp86:
	mov	r15, rax
	mov	rax, qword ptr [rbp - 64] ## 8-byte Reload
	mov	qword ptr [rbp - 336], rax
	mov	qword ptr [rbp - 224], r14
	mov	rax, qword ptr [rbp - 56] ## 8-byte Reload
	mov	qword ptr [rbp - 328], rax
	test	byte ptr [rbp - 264], 1
	je	LBB3_40
## %bb.39:
	mov	rdi, qword ptr [rbp - 248]
	call	__ZdlPv
LBB3_40:
	lea	rdi, [rbp - 328]
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
LBB3_41:
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	lea	rdi, [rbp - 336]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
LBB3_42:
	lea	rdi, [rbp - 224]
	call	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	rdi, r15
	call	__Unwind_Resume
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
	.uleb128 Ltmp18-Lfunc_begin1    ## >> Call Site 1 <<
	.uleb128 Ltmp19-Ltmp18          ##   Call between Ltmp18 and Ltmp19
	.uleb128 Ltmp20-Lfunc_begin1    ##     jumps to Ltmp20
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp21-Lfunc_begin1    ## >> Call Site 2 <<
	.uleb128 Ltmp22-Ltmp21          ##   Call between Ltmp21 and Ltmp22
	.uleb128 Ltmp23-Lfunc_begin1    ##     jumps to Ltmp23
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp24-Lfunc_begin1    ## >> Call Site 3 <<
	.uleb128 Ltmp85-Ltmp24          ##   Call between Ltmp24 and Ltmp85
	.uleb128 Ltmp86-Lfunc_begin1    ##     jumps to Ltmp86
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp85-Lfunc_begin1    ## >> Call Site 4 <<
	.uleb128 Lfunc_end1-Ltmp85      ##   Call between Ltmp85 and Lfunc_end1
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end1:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN5CPUID11L2CacheDataEv ## -- Begin function _ZN5CPUID11L2CacheDataEv
	.p2align	4, 0x90
__ZN5CPUID11L2CacheDataEv:              ## @_ZN5CPUID11L2CacheDataEv
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 280
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r15, rdi
	mov	eax, -2147483642
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
	mov	r14d, ecx
	lea	rdi, [rbp - 200]
	lea	rbx, [rbp - 304]
	mov	rax, qword ptr [rip + __ZTCNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE0_NS_13basic_ostreamIcS2_EE@GOTPCREL]
	lea	rcx, [rax + 24]
	mov	qword ptr [rbp - 312], rcx
	add	rax, 64
	mov	qword ptr [rbp - 200], rax
Ltmp87:
	mov	rsi, rbx
	call	__ZNSt3__18ios_base4initEPv
Ltmp88:
## %bb.1:
	mov	qword ptr [rbp - 64], 0
	mov	dword ptr [rbp - 56], -1
	mov	r13, qword ptr [rip + __ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	lea	rax, [r13 + 24]
	mov	qword ptr [rbp - 48], rax ## 8-byte Spill
	mov	qword ptr [rbp - 312], rax
	add	r13, 64
	mov	qword ptr [rbp - 200], r13
Ltmp90:
	mov	rdi, rbx
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
Ltmp91:
## %bb.2:
	mov	r12, qword ptr [rip + __ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	r12, 16
	mov	qword ptr [rbp - 304], r12
	mov	qword ptr [rbp - 240], 0
	mov	qword ptr [rbp - 232], 0
	mov	qword ptr [rbp - 224], 0
	mov	qword ptr [rbp - 216], 0
	mov	dword ptr [rbp - 208], 16
Ltmp93:
	lea	rsi, [rip + L_.str.11]
	lea	rdi, [rbp - 312]
	mov	edx, 10
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp94:
## %bb.3:
Ltmp95:
	lea	rsi, [rip + L_.str.12]
	mov	edx, 18
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp96:
## %bb.4:
	movzx	esi, r14b
Ltmp97:
	mov	rdi, rax
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
Ltmp98:
## %bb.5:
Ltmp99:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp100:
## %bb.6:
Ltmp101:
	lea	rsi, [rip + L_.str.13]
	mov	edx, 18
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp102:
## %bb.7:
	mov	esi, r14d
	shr	esi, 12
	and	esi, 7
Ltmp103:
	mov	rdi, rax
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
Ltmp104:
## %bb.8:
Ltmp105:
	lea	rsi, [rip + L_.str.14]
	mov	edx, 2
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp106:
## %bb.9:
Ltmp107:
	lea	rsi, [rip + L_.str.15]
	mov	edx, 17
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp108:
## %bb.10:
	shr	r14d, 16
Ltmp109:
	mov	rdi, rax
	mov	esi, r14d
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
Ltmp110:
## %bb.11:
Ltmp111:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp112:
## %bb.12:
Ltmp113:
	mov	rdi, r15
	lea	rsi, [rbp - 304]
	call	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
Ltmp114:
## %bb.13:
	mov	rax, qword ptr [rbp - 48] ## 8-byte Reload
	mov	qword ptr [rbp - 312], rax
	mov	qword ptr [rbp - 200], r13
	mov	qword ptr [rbp - 304], r12
	test	byte ptr [rbp - 240], 1
	je	LBB4_15
## %bb.14:
	mov	rdi, qword ptr [rbp - 224]
	call	__ZdlPv
LBB4_15:
	lea	rdi, [rbp - 304]
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	lea	rdi, [rbp - 312]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	lea	rdi, [rbp - 200]
	call	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	rax, r15
	add	rsp, 280
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB4_17:
Ltmp92:
	mov	rbx, rax
	jmp	LBB4_21
LBB4_16:
Ltmp89:
	mov	rbx, rax
	jmp	LBB4_22
LBB4_18:
Ltmp115:
	mov	rbx, rax
	mov	rax, qword ptr [rbp - 48] ## 8-byte Reload
	mov	qword ptr [rbp - 312], rax
	mov	qword ptr [rbp - 200], r13
	mov	qword ptr [rbp - 304], r12
	test	byte ptr [rbp - 240], 1
	je	LBB4_20
## %bb.19:
	mov	rdi, qword ptr [rbp - 224]
	call	__ZdlPv
LBB4_20:
	lea	rdi, [rbp - 304]
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
LBB4_21:
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	lea	rdi, [rbp - 312]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
LBB4_22:
	lea	rdi, [rbp - 200]
	call	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	rdi, rbx
	call	__Unwind_Resume
	ud2
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table4:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Ltmp87-Lfunc_begin2    ## >> Call Site 1 <<
	.uleb128 Ltmp88-Ltmp87          ##   Call between Ltmp87 and Ltmp88
	.uleb128 Ltmp89-Lfunc_begin2    ##     jumps to Ltmp89
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp90-Lfunc_begin2    ## >> Call Site 2 <<
	.uleb128 Ltmp91-Ltmp90          ##   Call between Ltmp90 and Ltmp91
	.uleb128 Ltmp92-Lfunc_begin2    ##     jumps to Ltmp92
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp93-Lfunc_begin2    ## >> Call Site 3 <<
	.uleb128 Ltmp114-Ltmp93         ##   Call between Ltmp93 and Ltmp114
	.uleb128 Ltmp115-Lfunc_begin2   ##     jumps to Ltmp115
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp114-Lfunc_begin2   ## >> Call Site 4 <<
	.uleb128 Lfunc_end2-Ltmp114     ##   Call between Ltmp114 and Lfunc_end2
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end2:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN3VexIsEpLERKS0_     ## -- Begin function _ZN3VexIsEpLERKS0_
	.p2align	4, 0x90
__ZN3VexIsEpLERKS0_:                    ## @_ZN3VexIsEpLERKS0_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r14
	push	rbx
	.cfi_offset rbx, -32
	.cfi_offset r14, -24
	mov	r14, rsi
	mov	rbx, rdi
	call	__ZN3VexIsE10simd_flagsEv
	test	al, al
	js	LBB5_1
## %bb.4:
	call	__ZN3VexIsE10simd_flagsEv
	test	al, 2
	je	LBB5_8
## %bb.5:
	mov	rsi, qword ptr [rbx]
	mov	rcx, qword ptr [rbx + 8]
	add	rcx, rcx
	mov	rax, rcx
	xor	edx, edx
	div	rsi
	cmp	rsi, rcx
	ja	LBB5_8
## %bb.6:
	xor	ecx, ecx
	xor	edx, edx
	.p2align	4, 0x90
LBB5_7:                                 ## =>This Inner Loop Header: Depth=1
	mov	rsi, qword ptr [rbx + 24]
	mov	rdi, qword ptr [r14 + 24]
	vmovdqa	xmm0, xmmword ptr [rdi + rcx]
	vpaddw	xmm0, xmm0, xmmword ptr [rsi + rcx]
	vmovdqa	xmmword ptr [rsi + rcx], xmm0
	inc	rdx
	add	rcx, 16
	cmp	rdx, rax
	jb	LBB5_7
	jmp	LBB5_8
LBB5_1:
	mov	rsi, qword ptr [rbx]
	mov	rcx, qword ptr [rbx + 8]
	add	rcx, rcx
	mov	rax, rcx
	xor	edx, edx
	div	rsi
	cmp	rsi, rcx
	ja	LBB5_8
## %bb.2:
	xor	ecx, ecx
	xor	edx, edx
	.p2align	4, 0x90
LBB5_3:                                 ## =>This Inner Loop Header: Depth=1
	mov	rsi, qword ptr [rbx + 24]
	mov	rdi, qword ptr [r14 + 24]
	vmovdqa	ymm0, ymmword ptr [rdi + rcx]
	vpaddw	ymm0, ymm0, ymmword ptr [rsi + rcx]
	vmovdqa	ymmword ptr [rsi + rcx], ymm0
	inc	rdx
	add	rcx, 32
	cmp	rdx, rax
	jb	LBB5_3
LBB5_8:
	mov	rax, rbx
	pop	rbx
	pop	r14
	pop	rbp
	vzeroupper
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN3VexIsE10simd_flagsEv ## -- Begin function _ZN3VexIsE10simd_flagsEv
	.weak_def_can_be_hidden	__ZN3VexIsE10simd_flagsEv
	.p2align	4, 0x90
__ZN3VexIsE10simd_flagsEv:              ## @_ZN3VexIsE10simd_flagsEv
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rax, qword ptr [rip + __ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL]
	mov	al, byte ptr [rax]
	test	al, al
	je	LBB6_2
LBB6_1:
	mov	rax, qword ptr [rip + __ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL]
	movzx	eax, byte ptr [rax + 16]
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
LBB6_2:
	mov	rdi, qword ptr [rip + __ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL]
	call	___cxa_guard_acquire
	test	eax, eax
	je	LBB6_1
## %bb.3:
	xor	eax, eax
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
	mov	esi, eax
	mov	eax, eax
	mov	rdi, qword ptr [rip + __ZZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL]
	mov	qword ptr [rdi], rax
	test	esi, esi
	je	LBB6_6
## %bb.4:
	mov	eax, -2147483648
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
	mov	eax, eax
	mov	qword ptr [rdi + 8], rax
	cmp	esi, 7
	jb	LBB6_6
## %bb.5:
	mov	eax, 7
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
	mov	al, -1
	test	bl, 32
	jne	LBB6_17
LBB6_6:
	mov	eax, 1
	xor	ecx, ecx
	## InlineAsm Start
	cpuid
	## InlineAsm End
	test	ecx, 268435456
	jne	LBB6_12
## %bb.7:
	test	ecx, 1048576
	jne	LBB6_13
## %bb.8:
	test	ecx, 524288
	jne	LBB6_14
## %bb.9:
	test	ecx, 512
	jne	LBB6_15
## %bb.10:
	mov	al, 1
	test	edx, 67108864
	je	LBB6_17
## %bb.11:
	mov	byte ptr [rdi + 16], 3
	jmp	LBB6_17
LBB6_12:
	mov	byte ptr [rdi + 16], 127
	jmp	LBB6_16
LBB6_13:
	mov	byte ptr [rdi + 16], 63
	jmp	LBB6_16
LBB6_14:
	mov	byte ptr [rdi + 16], 31
	jmp	LBB6_16
LBB6_15:
	mov	byte ptr [rdi + 16], 15
LBB6_16:
	mov	al, 1
LBB6_17:
	mov	byte ptr [rdi + 16], al
	mov	rdi, qword ptr [rip + __ZGVZN3VexIsE10simd_flagsEvE3cpu@GOTPCREL]
	call	___cxa_guard_release
	jmp	LBB6_1
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN3VexIsEpLEs         ## -- Begin function _ZN3VexIsEpLEs
	.p2align	4, 0x90
__ZN3VexIsEpLEs:                        ## @_ZN3VexIsEpLEs
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r15d, esi
	mov	rbx, rdi
	mov	r13, qword ptr [rdi]
	mov	r12, qword ptr [rdi + 8]
	add	r12, r12
	mov	rax, r12
	xor	edx, edx
	div	r13
	mov	r14, rax
	call	__ZN3VexIsE10simd_flagsEv
	test	al, al
	js	LBB7_1
## %bb.4:
	call	__ZN3VexIsE10simd_flagsEv
	test	al, 2
	je	LBB7_8
## %bb.5:
	cmp	r13, r12
	ja	LBB7_8
## %bb.6:
	vmovd	xmm0, r15d
	vpbroadcastw	xmm0, xmm0
	xor	eax, eax
	xor	ecx, ecx
	.p2align	4, 0x90
LBB7_7:                                 ## =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rbx + 24]
	vpaddw	xmm1, xmm0, xmmword ptr [rdx + rax]
	vmovdqa	xmmword ptr [rdx + rax], xmm1
	inc	rcx
	add	rax, 16
	cmp	rcx, r14
	jb	LBB7_7
	jmp	LBB7_8
LBB7_1:
	cmp	r13, r12
	ja	LBB7_8
## %bb.2:
	vmovd	xmm0, r15d
	vpbroadcastw	ymm0, xmm0
	xor	eax, eax
	xor	ecx, ecx
	.p2align	4, 0x90
LBB7_3:                                 ## =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rbx + 24]
	vpaddw	ymm1, ymm0, ymmword ptr [rdx + rax]
	vmovdqa	ymmword ptr [rdx + rax], ymm1
	inc	rcx
	add	rax, 32
	cmp	rcx, r14
	jb	LBB7_3
LBB7_8:
	mov	rax, rbx
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZplIsE3VexIT_ERKS2_S4_ ## -- Begin function _ZplIsE3VexIT_ERKS2_S4_
	.p2align	4, 0x90
__ZplIsE3VexIT_ERKS2_S4_:               ## @_ZplIsE3VexIT_ERKS2_S4_
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r12
	push	rbx
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r14, rdx
	mov	rbx, rsi
	mov	r15, rdi
	mov	r12, qword ptr [rsi + 16]
	call	__ZN3VexIsE10simd_flagsEv
	and	al, 64
	shr	al, 6
	movzx	edx, al
	shl	rdx, 4
	add	rdx, 16
	mov	rdi, r15
	mov	rsi, r12
	call	__ZN10ContiguousIsEC2Emm
Ltmp116:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp117:
## %bb.1:
	test	al, al
	js	LBB8_2
## %bb.5:
Ltmp118:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp119:
## %bb.6:
	test	al, 2
	je	LBB8_10
## %bb.7:
	mov	rsi, qword ptr [rbx]
	mov	rcx, qword ptr [rbx + 8]
	add	rcx, rcx
	mov	rax, rcx
	xor	edx, edx
	div	rsi
	cmp	rsi, rcx
	ja	LBB8_10
## %bb.8:
	xor	ecx, ecx
	xor	edx, edx
	.p2align	4, 0x90
LBB8_9:                                 ## =>This Inner Loop Header: Depth=1
	mov	rsi, qword ptr [rbx + 24]
	mov	rdi, qword ptr [r14 + 24]
	vmovdqa	xmm0, xmmword ptr [rdi + rcx]
	vpaddw	xmm0, xmm0, xmmword ptr [rsi + rcx]
	mov	rsi, qword ptr [r15 + 24]
	vmovdqa	xmmword ptr [rsi + rcx], xmm0
	inc	rdx
	add	rcx, 16
	cmp	rdx, rax
	jb	LBB8_9
	jmp	LBB8_10
LBB8_2:
	mov	rsi, qword ptr [rbx]
	mov	rcx, qword ptr [rbx + 8]
	add	rcx, rcx
	mov	rax, rcx
	xor	edx, edx
	div	rsi
	cmp	rsi, rcx
	ja	LBB8_10
## %bb.3:
	xor	ecx, ecx
	xor	edx, edx
	.p2align	4, 0x90
LBB8_4:                                 ## =>This Inner Loop Header: Depth=1
	mov	rsi, qword ptr [rbx + 24]
	mov	rdi, qword ptr [r14 + 24]
	vmovdqa	ymm0, ymmword ptr [rdi + rcx]
	vpaddw	ymm0, ymm0, ymmword ptr [rsi + rcx]
	mov	rsi, qword ptr [r15 + 24]
	vmovdqa	ymmword ptr [rsi + rcx], ymm0
	inc	rdx
	add	rcx, 32
	cmp	rdx, rax
	jb	LBB8_4
LBB8_10:
	mov	rax, r15
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
LBB8_11:
Ltmp120:
	mov	rbx, rax
	mov	rdi, qword ptr [r15 + 24]
	call	_free
	mov	rdi, rbx
	call	__Unwind_Resume
	ud2
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table8:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Lfunc_begin3-Lfunc_begin3 ## >> Call Site 1 <<
	.uleb128 Ltmp116-Lfunc_begin3   ##   Call between Lfunc_begin3 and Ltmp116
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp116-Lfunc_begin3   ## >> Call Site 2 <<
	.uleb128 Ltmp119-Ltmp116        ##   Call between Ltmp116 and Ltmp119
	.uleb128 Ltmp120-Lfunc_begin3   ##     jumps to Ltmp120
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp119-Lfunc_begin3   ## >> Call Site 3 <<
	.uleb128 Lfunc_end3-Ltmp119     ##   Call between Ltmp119 and Lfunc_end3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end3:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZplIsE3VexIT_ERKS2_S1_ ## -- Begin function _ZplIsE3VexIT_ERKS2_S1_
	.p2align	4, 0x90
__ZplIsE3VexIT_ERKS2_S1_:               ## @_ZplIsE3VexIT_ERKS2_S1_
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 24
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	dword ptr [rbp - 44], edx ## 4-byte Spill
	mov	rbx, rsi
	mov	r14, rdi
	mov	rcx, qword ptr [rsi]
	mov	r13, qword ptr [rsi + 8]
	add	r13, r13
	mov	rax, r13
	xor	edx, edx
	mov	qword ptr [rbp - 56], rcx ## 8-byte Spill
	div	rcx
	mov	r15, rax
	mov	r12, qword ptr [rsi + 16]
	call	__ZN3VexIsE10simd_flagsEv
	and	al, 64
	shr	al, 6
	movzx	edx, al
	shl	rdx, 4
	add	rdx, 16
	mov	rdi, r14
	mov	rsi, r12
	call	__ZN10ContiguousIsEC2Emm
Ltmp121:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp122:
## %bb.1:
	test	al, al
	js	LBB9_2
## %bb.5:
Ltmp123:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp124:
## %bb.6:
	test	al, 2
	je	LBB9_10
## %bb.7:
	cmp	qword ptr [rbp - 56], r13 ## 8-byte Folded Reload
	ja	LBB9_10
## %bb.8:
	vmovd	xmm0, dword ptr [rbp - 44] ## 4-byte Folded Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vpbroadcastw	ymm0, xmm0
	xor	eax, eax
	xor	ecx, ecx
	.p2align	4, 0x90
LBB9_9:                                 ## =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rbx + 24]
	vpaddw	ymm1, ymm0, ymmword ptr [rdx + rax]
	mov	rdx, qword ptr [r14 + 24]
	vmovdqa	ymmword ptr [rdx + rax], ymm1
	inc	rcx
	add	rax, 16
	cmp	rcx, r15
	jb	LBB9_9
	jmp	LBB9_10
LBB9_2:
	cmp	qword ptr [rbp - 56], r13 ## 8-byte Folded Reload
	ja	LBB9_10
## %bb.3:
	vmovd	xmm0, dword ptr [rbp - 44] ## 4-byte Folded Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vpbroadcastw	ymm0, xmm0
	xor	eax, eax
	xor	ecx, ecx
	.p2align	4, 0x90
LBB9_4:                                 ## =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rbx + 24]
	vpaddw	ymm1, ymm0, ymmword ptr [rdx + rax]
	mov	rdx, qword ptr [r14 + 24]
	vmovdqa	ymmword ptr [rdx + rax], ymm1
	inc	rcx
	add	rax, 32
	cmp	rcx, r15
	jb	LBB9_4
LBB9_10:
	mov	rax, r14
	add	rsp, 24
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
LBB9_11:
Ltmp125:
	mov	rbx, rax
	mov	rdi, qword ptr [r14 + 24]
	call	_free
	mov	rdi, rbx
	call	__Unwind_Resume
	ud2
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table9:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4 ## >> Call Site 1 <<
	.uleb128 Ltmp121-Lfunc_begin4   ##   Call between Lfunc_begin4 and Ltmp121
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp121-Lfunc_begin4   ## >> Call Site 2 <<
	.uleb128 Ltmp124-Ltmp121        ##   Call between Ltmp121 and Ltmp124
	.uleb128 Ltmp125-Lfunc_begin4   ##     jumps to Ltmp125
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp124-Lfunc_begin4   ## >> Call Site 3 <<
	.uleb128 Lfunc_end4-Ltmp124     ##   Call between Ltmp124 and Lfunc_end4
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end4:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZplIsE3VexIT_ES1_RKS2_ ## -- Begin function _ZplIsE3VexIT_ES1_RKS2_
	.p2align	4, 0x90
__ZplIsE3VexIT_ES1_RKS2_:               ## @_ZplIsE3VexIT_ES1_RKS2_
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 24
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rbx, rdx
	mov	dword ptr [rbp - 44], esi ## 4-byte Spill
	mov	r14, rdi
	mov	rcx, qword ptr [rdx]
	mov	r13, qword ptr [rdx + 8]
	add	r13, r13
	mov	rax, r13
	xor	edx, edx
	mov	qword ptr [rbp - 56], rcx ## 8-byte Spill
	div	rcx
	mov	r15, rax
	mov	r12, qword ptr [rbx + 16]
	call	__ZN3VexIsE10simd_flagsEv
	and	al, 64
	shr	al, 6
	movzx	edx, al
	shl	rdx, 4
	add	rdx, 16
	mov	rdi, r14
	mov	rsi, r12
	call	__ZN10ContiguousIsEC2Emm
Ltmp126:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp127:
## %bb.1:
	test	al, al
	js	LBB10_2
## %bb.5:
Ltmp128:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp129:
## %bb.6:
	cmp	qword ptr [rbp - 56], r13 ## 8-byte Folded Reload
	ja	LBB10_10
## %bb.7:
	and	al, 2
	je	LBB10_10
## %bb.8:
	vmovd	xmm0, dword ptr [rbp - 44] ## 4-byte Folded Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vpbroadcastw	ymm0, xmm0
	xor	eax, eax
	xor	ecx, ecx
	.p2align	4, 0x90
LBB10_9:                                ## =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rbx + 24]
	vpaddw	ymm1, ymm0, ymmword ptr [rdx + rax]
	mov	rdx, qword ptr [r14 + 24]
	vmovdqa	ymmword ptr [rdx + rax], ymm1
	inc	rcx
	add	rax, 16
	cmp	rcx, r15
	jb	LBB10_9
	jmp	LBB10_10
LBB10_2:
	cmp	qword ptr [rbp - 56], r13 ## 8-byte Folded Reload
	ja	LBB10_10
## %bb.3:
	vmovd	xmm0, dword ptr [rbp - 44] ## 4-byte Folded Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vpbroadcastw	ymm0, xmm0
	xor	eax, eax
	xor	ecx, ecx
	.p2align	4, 0x90
LBB10_4:                                ## =>This Inner Loop Header: Depth=1
	mov	rdx, qword ptr [rbx + 24]
	vpaddw	ymm1, ymm0, ymmword ptr [rdx + rax]
	mov	rdx, qword ptr [r14 + 24]
	vmovdqa	ymmword ptr [rdx + rax], ymm1
	inc	rcx
	add	rax, 32
	cmp	rcx, r15
	jb	LBB10_4
LBB10_10:
	mov	rax, r14
	add	rsp, 24
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
LBB10_11:
Ltmp130:
	mov	rbx, rax
	mov	rdi, qword ptr [r14 + 24]
	call	_free
	mov	rdi, rbx
	call	__Unwind_Resume
	ud2
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table10:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Lfunc_begin5-Lfunc_begin5 ## >> Call Site 1 <<
	.uleb128 Ltmp126-Lfunc_begin5   ##   Call between Lfunc_begin5 and Ltmp126
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp126-Lfunc_begin5   ## >> Call Site 2 <<
	.uleb128 Ltmp129-Ltmp126        ##   Call between Ltmp126 and Ltmp129
	.uleb128 Ltmp130-Lfunc_begin5   ##     jumps to Ltmp130
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp129-Lfunc_begin5   ## >> Call Site 3 <<
	.uleb128 Lfunc_end5-Ltmp129     ##   Call between Ltmp129 and Lfunc_end5
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end5:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z2opILc43EEDv2_xS0_S0_ ## -- Begin function _Z2opILc43EEDv2_xS0_S0_
	.p2align	4, 0x90
__Z2opILc43EEDv2_xS0_S0_:               ## @_Z2opILc43EEDv2_xS0_S0_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	vpaddw	xmm0, xmm1, xmm0
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__Z2opILc43EEDv4_xS0_S0_ ## -- Begin function _Z2opILc43EEDv4_xS0_S0_
	.p2align	4, 0x90
__Z2opILc43EEDv4_xS0_S0_:               ## @_Z2opILc43EEDv4_xS0_S0_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	vmovdqu	ymm0, ymmword ptr [rbp + 48]
	vpaddw	ymm0, ymm0, ymmword ptr [rbp + 16]
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function main
LCPI13_0:
	.long	1287568416              ## float 1.0E+8
LCPI13_1:
	.long	1593835520              ## float 9.22337203E+18
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 472
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	call	__ZN3VexIsE10simd_flagsEv
	and	al, 64
	shr	al, 6
	movzx	ecx, al
	shl	rcx, 4
	add	rcx, 16
	lea	rdi, [rbp - 384]
	mov	esi, 99999999
	mov	edx, 7
	call	__ZN10ContiguousIsEC2Emsm
Ltmp131:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp132:
## %bb.1:
	and	al, 64
	shr	al, 6
	movzx	ecx, al
	shl	rcx, 4
	add	rcx, 16
Ltmp133:
	lea	rdi, [rbp - 480]
	mov	esi, 99999999
	mov	edx, 3
	call	__ZN10ContiguousIsEC2Emsm
Ltmp134:
## %bb.2:
Ltmp136:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp137:
## %bb.3:
	and	al, 64
	shr	al, 6
	movzx	ecx, al
	shl	rcx, 4
	add	rcx, 16
Ltmp138:
	lea	rdi, [rbp - 448]
	mov	esi, 99999999
	mov	edx, 11
	call	__ZN10ContiguousIsEC2Emsm
Ltmp139:
## %bb.4:
Ltmp141:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp142:
## %bb.5:
	and	al, 64
	shr	al, 6
	movzx	ecx, al
	shl	rcx, 4
	add	rcx, 16
Ltmp143:
	lea	rdi, [rbp - 344]
	mov	esi, 99999999
	mov	edx, 4
	call	__ZN10ContiguousIsEC2Emsm
Ltmp144:
## %bb.6:
Ltmp146:
	call	__ZN3VexIsE10simd_flagsEv
Ltmp147:
## %bb.7:
	and	al, 64
	shr	al, 6
	movzx	esi, al
	shl	rsi, 4
	add	rsi, 16
	mov	rax, rsi
	shr	rax
	cvtsi2ss	xmm0, eax
	movss	xmm1, dword ptr [rip + LCPI13_0] ## xmm1 = mem[0],zero,zero,zero
	divss	xmm1, xmm0
	roundss	xmm1, xmm1, 10
	mulss	xmm1, xmm0
	movss	xmm0, dword ptr [rip + LCPI13_1] ## xmm0 = mem[0],zero,zero,zero
	movaps	xmm2, xmm1
	subss	xmm2, xmm0
	cvttss2si	rax, xmm2
	movabs	rcx, -9223372036854775808
	xor	rcx, rax
	cvttss2si	rdx, xmm1
	ucomiss	xmm1, xmm0
	cmovae	rdx, rcx
	add	rdx, rdx
Ltmp148:
	lea	rdi, [rbp - 192]
	call	_posix_memalign
Ltmp149:
## %bb.8:
	test	eax, eax
	jne	LBB13_10
## %bb.9:
	mov	rax, qword ptr [rbp - 192]
	test	rax, rax
	je	LBB13_10
## %bb.12:
Ltmp150:
	lea	rdi, [rbp - 192]
	mov	esi, 16
	mov	edx, 200000000
	mov	qword ptr [rbp - 96], rax ## 8-byte Spill
	call	_posix_memalign
Ltmp151:
## %bb.13:
	test	eax, eax
	jne	LBB13_25
## %bb.14:
	mov	rbx, qword ptr [rbp - 192]
	test	rbx, rbx
	je	LBB13_25
## %bb.15:
	lea	rsi, [rip + L_.memset_pattern.40]
	mov	edx, 199999998
	mov	rdi, rbx
	call	_memset_pattern16
Ltmp152:
	lea	rdi, [rbp - 192]
	mov	esi, 16
	mov	edx, 200000000
	mov	qword ptr [rbp - 72], rbx ## 8-byte Spill
	call	_posix_memalign
Ltmp153:
## %bb.16:
	test	eax, eax
	jne	LBB13_26
## %bb.17:
	mov	rbx, qword ptr [rbp - 192]
	test	rbx, rbx
	je	LBB13_26
## %bb.18:
	lea	rsi, [rip + L_.memset_pattern.39]
	mov	edx, 199999998
	mov	rdi, rbx
	call	_memset_pattern16
Ltmp154:
	lea	rdi, [rbp - 192]
	mov	esi, 16
	mov	edx, 200000000
	mov	qword ptr [rbp - 120], rbx ## 8-byte Spill
	call	_posix_memalign
Ltmp155:
## %bb.19:
	test	eax, eax
	jne	LBB13_27
## %bb.20:
	mov	rbx, qword ptr [rbp - 192]
	test	rbx, rbx
	je	LBB13_27
## %bb.21:
	lea	rsi, [rip + L_.memset_pattern.38]
	mov	edx, 199999998
	mov	rdi, rbx
	call	_memset_pattern16
Ltmp156:
	lea	rdi, [rbp - 192]
	mov	esi, 16
	mov	edx, 200000000
	mov	qword ptr [rbp - 112], rbx ## 8-byte Spill
	call	_posix_memalign
Ltmp157:
## %bb.22:
	test	eax, eax
	jne	LBB13_24
## %bb.23:
	mov	rax, qword ptr [rbp - 192]
	test	rax, rax
	je	LBB13_24
## %bb.28:
Ltmp158:
	mov	edi, 199999998
	mov	qword ptr [rbp - 104], rax ## 8-byte Spill
	call	__Znwm
Ltmp159:
## %bb.29:
	mov	rbx, rax
	lea	rsi, [rip + L_.memset_pattern.40]
	mov	edx, 199999998
	mov	rdi, rax
	call	_memset_pattern16
Ltmp161:
	mov	edi, 199999998
	mov	qword ptr [rbp - 128], rbx ## 8-byte Spill
	call	__Znwm
Ltmp162:
## %bb.30:
	mov	r15, rax
	lea	rsi, [rip + L_.memset_pattern.39]
	mov	edx, 199999998
	mov	rdi, rax
	call	_memset_pattern16
Ltmp164:
	mov	edi, 199999998
	call	__Znwm
Ltmp165:
## %bb.31:
	mov	r12, rax
	lea	rsi, [rip + L_.memset_pattern.38]
	mov	edx, 199999998
	mov	rdi, rax
	call	_memset_pattern16
Ltmp167:
	mov	edi, 199999998
	call	__Znwm
Ltmp168:
## %bb.32:
	mov	r13, rax
	mov	esi, 199999998
	mov	rdi, rax
	call	___bzero
Ltmp170:
	mov	edi, 199999998
	call	__Znwm
Ltmp171:
## %bb.33:
	lea	rsi, [rip + L_.memset_pattern.40]
	mov	edx, 199999998
	mov	qword ptr [rbp - 64], rax ## 8-byte Spill
	mov	rdi, rax
	call	_memset_pattern16
	xor	r14d, r14d
	.p2align	4, 0x90
LBB13_34:                               ## =>This Inner Loop Header: Depth=1
	add	r14, -22
	cmp	r14, -199999998
	jne	LBB13_34
## %bb.35:
Ltmp173:
	mov	edi, 199999998
	call	__Znwm
Ltmp174:
## %bb.36:
	lea	rsi, [rip + L_.memset_pattern.39]
	mov	edx, 199999998
	mov	qword ptr [rbp - 152], rax ## 8-byte Spill
	mov	rdi, rax
	call	_memset_pattern16
Ltmp176:
	mov	edi, 199999998
	call	__Znwm
Ltmp177:
## %bb.37:
	lea	rsi, [rip + L_.memset_pattern.38]
	mov	edx, 199999998
	mov	qword ptr [rbp - 144], rax ## 8-byte Spill
	mov	rdi, rax
	call	_memset_pattern16
Ltmp179:
	mov	edi, 199999998
	call	__Znwm
Ltmp180:
## %bb.38:
	lea	rsi, [rip + L_.memset_pattern]
	mov	edx, 199999998
	mov	qword ptr [rbp - 136], rax ## 8-byte Spill
	mov	rdi, rax
	call	_memset_pattern16
Ltmp182:
	mov	edi, 199999998
	call	__Znwm
Ltmp183:
## %bb.39:
	mov	esi, 199999998
	mov	qword ptr [rbp - 48], rax ## 8-byte Spill
	mov	rdi, rax
	call	___bzero
	call	__ZNSt3__16chrono12steady_clock3nowEv
	mov	qword ptr [rbp - 192], rax
	lea	rax, [rip + L_.str.16]
	mov	qword ptr [rbp - 184], rax
	mov	rax, qword ptr [rbp - 320]
	lea	rcx, [r13 + 199999998]
	lea	rdx, [rbx + 199999998]
	lea	rsi, [r15 + 199999998]
	lea	r8, [r12 + 199999998]
	lea	rdi, [rax + 199999998]
	cmp	r13, rdx
	setb	r11b
	cmp	rbx, rcx
	setb	r9b
	cmp	r13, rsi
	setb	dl
	cmp	r15, rcx
	setb	r10b
	cmp	r13, r8
	setb	bl
	cmp	r12, rcx
	setb	r8b
	cmp	r13, rdi
	setb	sil
	cmp	rcx, rax
	seta	dil
	xor	ecx, ecx
	test	r11b, r9b
	jne	LBB13_40
## %bb.41:
	and	dl, r10b
	jne	LBB13_40
## %bb.42:
	and	bl, r8b
	jne	LBB13_40
## %bb.43:
	and	sil, dil
	mov	rsi, qword ptr [rbp - 128] ## 8-byte Reload
	mov	rdx, qword ptr [rbp - 64] ## 8-byte Reload
	mov	rbx, qword ptr [rbp - 48] ## 8-byte Reload
	jne	LBB13_47
## %bb.44:
	xor	ecx, ecx
	pcmpeqd	xmm0, xmm0
	.p2align	4, 0x90
LBB13_45:                               ## =>This Inner Loop Header: Depth=1
	movdqu	xmm1, xmmword ptr [rsi + rcx]
	movdqu	xmm2, xmmword ptr [rsi + rcx + 16]
	movdqu	xmm3, xmmword ptr [r15 + rcx]
	paddw	xmm3, xmm1
	movdqu	xmm1, xmmword ptr [r15 + rcx + 16]
	paddw	xmm1, xmm2
	movdqu	xmm2, xmmword ptr [r12 + rcx]
	movdqu	xmm4, xmmword ptr [r12 + rcx + 16]
	movdqu	xmm5, xmmword ptr [rax + rcx]
	paddw	xmm5, xmm2
	paddw	xmm5, xmm3
	movdqu	xmm2, xmmword ptr [rax + rcx + 16]
	paddw	xmm2, xmm4
	paddw	xmm2, xmm1
	psubw	xmm5, xmm0
	psubw	xmm2, xmm0
	movdqu	xmmword ptr [r13 + rcx], xmm5
	movdqu	xmmword ptr [r13 + rcx + 16], xmm2
	add	rcx, 32
	cmp	rcx, 199999968
	jne	LBB13_45
## %bb.46:
	mov	ecx, 99999984
	jmp	LBB13_47
LBB13_40:
	mov	rsi, qword ptr [rbp - 128] ## 8-byte Reload
	mov	rdx, qword ptr [rbp - 64] ## 8-byte Reload
	mov	rbx, qword ptr [rbp - 48] ## 8-byte Reload
LBB13_47:
	mov	rdi, rdx
	movzx	edx, word ptr [rsi + 2*rcx]
	add	dx, word ptr [r15 + 2*rcx]
	add	dx, word ptr [r12 + 2*rcx]
	add	dx, word ptr [rax + 2*rcx]
	sub	rdi, r14
	mov	qword ptr [rbp - 240], rdi ## 8-byte Spill
	inc	edx
	mov	word ptr [r13 + 2*rcx], dx
	add	rcx, -99999998
	.p2align	4, 0x90
LBB13_48:                               ## =>This Inner Loop Header: Depth=1
	movzx	edx, word ptr [rsi + 2*rcx + 199999998]
	add	dx, word ptr [r15 + 2*rcx + 199999998]
	add	dx, word ptr [r12 + 2*rcx + 199999998]
	add	dx, word ptr [rax + 2*rcx + 199999998]
	inc	edx
	mov	word ptr [r13 + 2*rcx + 199999998], dx
	movzx	edx, word ptr [rsi + 2*rcx + 200000000]
	add	dx, word ptr [r15 + 2*rcx + 200000000]
	add	dx, word ptr [r12 + 2*rcx + 200000000]
	add	dx, word ptr [rax + 2*rcx + 200000000]
	inc	edx
	mov	word ptr [r13 + 2*rcx + 200000000], dx
	add	rcx, 2
	jne	LBB13_48
## %bb.49:
Ltmp185:
	lea	rsi, [rip + L_.str.26]
	lea	rdi, [rbp - 192]
	call	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp186:
	mov	r14, qword ptr [rbp - 72] ## 8-byte Reload
## %bb.50:
	pxor	xmm0, xmm0
	mov	eax, 10
	xorps	xmm1, xmm1
	.p2align	4, 0x90
LBB13_51:                               ## =>This Inner Loop Header: Depth=1
	pmovsxwq	xmm2, dword ptr [r13 + 2*rax - 20]
	pmovsxwq	xmm3, dword ptr [r13 + 2*rax - 16]
	paddq	xmm2, xmm0
	paddq	xmm3, xmm1
	pmovsxwq	xmm1, dword ptr [r13 + 2*rax - 12]
	pmovsxwq	xmm4, dword ptr [r13 + 2*rax - 8]
	pmovsxwq	xmm0, dword ptr [r13 + 2*rax - 4]
	paddq	xmm0, xmm1
	paddq	xmm0, xmm2
	pmovsxwq	xmm1, dword ptr [r13 + 2*rax]
	paddq	xmm1, xmm4
	paddq	xmm1, xmm3
	add	rax, 12
	cmp	rax, 100000006
	jne	LBB13_51
## %bb.52:
	mov	qword ptr [rbp - 88], rbx ## 8-byte Spill
	paddq	xmm1, xmm0
	pshufd	xmm0, xmm1, 78          ## xmm0 = xmm1[2,3,0,1]
	paddq	xmm0, xmm1
	movq	rax, xmm0
	movsx	rcx, word ptr [r13 + 199999992]
	add	rcx, rax
	movsx	rax, word ptr [r13 + 199999994]
	add	rax, rcx
	movsx	rsi, word ptr [r13 + 199999996]
	add	rsi, rax
Ltmp188:
	mov	rdi, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEl
Ltmp189:
## %bb.53:
	mov	qword ptr [rbp - 88], rbx ## 8-byte Spill
Ltmp190:
	lea	rsi, [rip + L_.str.1]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp191:
## %bb.54:
	call	__ZNSt3__16chrono12steady_clock3nowEv
	mov	qword ptr [rbp - 192], rax
	lea	rax, [rip + L_.str.17]
	mov	qword ptr [rbp - 184], rax
	mov	r8, qword ptr [rbp - 368]
	test	r8, r8
	je	LBB13_81
## %bb.55:
	mov	r11, qword ptr [rbp - 360]
	mov	rdx, qword ptr [rbp - 456]
	mov	rsi, qword ptr [rbp - 424]
	mov	rdi, qword ptr [rbp - 320]
	cmp	r8, 15
	ja	LBB13_73
## %bb.56:
	xor	eax, eax
LBB13_57:
	mov	rcx, qword ptr [rbp - 96] ## 8-byte Reload
	.p2align	4, 0x90
LBB13_58:                               ## =>This Inner Loop Header: Depth=1
	movzx	ebx, word ptr [r11 + 2*rax]
	add	bx, word ptr [rdx + 2*rax]
	add	bx, word ptr [rsi + 2*rax]
	add	bx, word ptr [rdi + 2*rax]
	inc	ebx
	mov	word ptr [rcx + 2*rax], bx
	inc	rax
	cmp	r8, rax
	ja	LBB13_58
LBB13_81:
Ltmp192:
	lea	rsi, [rip + L_.str.26]
	lea	rdi, [rbp - 192]
	call	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp193:
## %bb.82:
	call	__ZNSt3__16chrono12steady_clock3nowEv
	mov	qword ptr [rbp - 192], rax
	lea	rax, [rip + L_.str.18]
	mov	qword ptr [rbp - 184], rax
	mov	rax, qword ptr [rbp - 320]
	mov	r10, qword ptr [rbp - 104] ## 8-byte Reload
	lea	rcx, [r10 + 199999998]
	lea	rdx, [r14 + 199999998]
	mov	rdi, qword ptr [rbp - 120] ## 8-byte Reload
	lea	rbx, [rdi + 199999998]
	mov	rsi, qword ptr [rbp - 112] ## 8-byte Reload
	lea	r8, [rsi + 199999998]
	lea	r9, [rax + 199999998]
	cmp	r10, rdx
	setb	r11b
	cmp	r14, rcx
	setb	r14b
	cmp	r10, rbx
	setb	dl
	cmp	rdi, rcx
	setb	dil
	cmp	r10, r8
	setb	bl
	cmp	rsi, rcx
	setb	r8b
	cmp	r10, r9
	setb	sil
	cmp	rcx, rax
	seta	r9b
	xor	ecx, ecx
	test	r11b, r14b
	jne	LBB13_83
## %bb.84:
	and	dl, dil
	jne	LBB13_83
## %bb.85:
	and	bl, r8b
	mov	r14, qword ptr [rbp - 72] ## 8-byte Reload
	jne	LBB13_86
## %bb.87:
	and	sil, r9b
	mov	rsi, qword ptr [rbp - 120] ## 8-byte Reload
	mov	rdi, qword ptr [rbp - 112] ## 8-byte Reload
	mov	rbx, qword ptr [rbp - 104] ## 8-byte Reload
	jne	LBB13_91
## %bb.88:
	xor	ecx, ecx
	pcmpeqd	xmm0, xmm0
	.p2align	4, 0x90
LBB13_89:                               ## =>This Inner Loop Header: Depth=1
	movdqu	xmm1, xmmword ptr [r14 + rcx]
	movdqu	xmm2, xmmword ptr [r14 + rcx + 16]
	movdqu	xmm3, xmmword ptr [rsi + rcx]
	paddw	xmm3, xmm1
	movdqu	xmm1, xmmword ptr [rsi + rcx + 16]
	paddw	xmm1, xmm2
	movdqu	xmm2, xmmword ptr [rdi + rcx]
	movdqu	xmm4, xmmword ptr [rdi + rcx + 16]
	movdqu	xmm5, xmmword ptr [rax + rcx]
	paddw	xmm5, xmm2
	paddw	xmm5, xmm3
	movdqu	xmm2, xmmword ptr [rax + rcx + 16]
	paddw	xmm2, xmm4
	paddw	xmm2, xmm1
	psubw	xmm5, xmm0
	psubw	xmm2, xmm0
	movdqu	xmmword ptr [rbx + rcx], xmm5
	movdqu	xmmword ptr [rbx + rcx + 16], xmm2
	add	rcx, 32
	cmp	rcx, 199999968
	jne	LBB13_89
## %bb.90:
	mov	ecx, 99999984
	jmp	LBB13_91
LBB13_73:
	mov	rcx, qword ptr [rbp - 96] ## 8-byte Reload
	lea	rax, [rcx + 2*r8]
	lea	rbx, [r11 + 2*r8]
	lea	r9, [rdx + 2*r8]
	lea	r10, [rsi + 2*r8]
	cmp	rcx, rbx
	setb	byte ptr [rbp - 88]     ## 1-byte Folded Spill
	cmp	rax, r11
	seta	byte ptr [rbp - 80]     ## 1-byte Folded Spill
	cmp	rcx, r9
	setb	r14b
	cmp	rax, rdx
	seta	byte ptr [rbp - 50]     ## 1-byte Folded Spill
	cmp	rcx, r10
	setb	r9b
	cmp	rax, rsi
	seta	byte ptr [rbp - 49]     ## 1-byte Folded Spill
	lea	rbx, [rdi + 2*r8]
	cmp	rcx, rbx
	setb	r10b
	cmp	rax, rdi
	seta	bl
	xor	eax, eax
	mov	cl, byte ptr [rbp - 80] ## 1-byte Reload
	test	byte ptr [rbp - 88], cl ## 1-byte Folded Reload
	jne	LBB13_74
## %bb.75:
	and	r14b, byte ptr [rbp - 50] ## 1-byte Folded Reload
	jne	LBB13_74
## %bb.76:
	and	r9b, byte ptr [rbp - 49] ## 1-byte Folded Reload
	mov	r14, qword ptr [rbp - 72] ## 8-byte Reload
	jne	LBB13_57
## %bb.77:
	and	r10b, bl
	mov	rcx, qword ptr [rbp - 96] ## 8-byte Reload
	jne	LBB13_58
## %bb.78:
	mov	rax, r8
	and	rax, -16
	xor	ebx, ebx
	pcmpeqd	xmm0, xmm0
	.p2align	4, 0x90
LBB13_79:                               ## =>This Inner Loop Header: Depth=1
	movdqu	xmm1, xmmword ptr [r11 + 2*rbx]
	movdqu	xmm2, xmmword ptr [r11 + 2*rbx + 16]
	movdqu	xmm3, xmmword ptr [rdx + 2*rbx]
	paddw	xmm3, xmm1
	movdqu	xmm1, xmmword ptr [rdx + 2*rbx + 16]
	paddw	xmm1, xmm2
	movdqu	xmm2, xmmword ptr [rsi + 2*rbx]
	movdqu	xmm4, xmmword ptr [rsi + 2*rbx + 16]
	movdqu	xmm5, xmmword ptr [rdi + 2*rbx]
	paddw	xmm5, xmm2
	paddw	xmm5, xmm3
	movdqu	xmm2, xmmword ptr [rdi + 2*rbx + 16]
	paddw	xmm2, xmm4
	paddw	xmm2, xmm1
	psubw	xmm5, xmm0
	psubw	xmm2, xmm0
	movdqu	xmmword ptr [rcx + 2*rbx], xmm5
	movdqu	xmmword ptr [rcx + 2*rbx + 16], xmm2
	add	rbx, 16
	cmp	rax, rbx
	jne	LBB13_79
## %bb.80:
	cmp	r8, rax
	jne	LBB13_58
	jmp	LBB13_81
LBB13_83:
	mov	r14, qword ptr [rbp - 72] ## 8-byte Reload
LBB13_86:
	mov	rsi, qword ptr [rbp - 120] ## 8-byte Reload
	mov	rdi, qword ptr [rbp - 112] ## 8-byte Reload
	mov	rbx, qword ptr [rbp - 104] ## 8-byte Reload
LBB13_91:
	movzx	edx, word ptr [r14 + 2*rcx]
	add	dx, word ptr [rsi + 2*rcx]
	add	dx, word ptr [rdi + 2*rcx]
	add	dx, word ptr [rax + 2*rcx]
	inc	edx
	mov	word ptr [rbx + 2*rcx], dx
	add	rcx, -99999998
	.p2align	4, 0x90
LBB13_92:                               ## =>This Inner Loop Header: Depth=1
	movzx	edx, word ptr [r14 + 2*rcx + 199999998]
	add	dx, word ptr [rsi + 2*rcx + 199999998]
	add	dx, word ptr [rdi + 2*rcx + 199999998]
	add	dx, word ptr [rax + 2*rcx + 199999998]
	inc	edx
	mov	word ptr [rbx + 2*rcx + 199999998], dx
	movzx	edx, word ptr [r14 + 2*rcx + 200000000]
	add	dx, word ptr [rsi + 2*rcx + 200000000]
	add	dx, word ptr [rdi + 2*rcx + 200000000]
	add	dx, word ptr [rax + 2*rcx + 200000000]
	inc	edx
	mov	word ptr [rbx + 2*rcx + 200000000], dx
	add	rcx, 2
	jne	LBB13_92
## %bb.93:
Ltmp195:
	lea	rsi, [rip + L_.str.26]
	lea	rdi, [rbp - 192]
	call	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp196:
## %bb.94:
	call	__ZNSt3__16chrono12steady_clock3nowEv
	mov	qword ptr [rbp - 264], rax
	lea	rax, [rip + L_.str.19]
	mov	qword ptr [rbp - 256], rax
Ltmp198:
	lea	rdi, [rbp - 296]
	lea	rsi, [rbp - 384]
	lea	rdx, [rbp - 480]
	call	__ZplIsE3VexIT_ERKS2_S4_
Ltmp199:
## %bb.95:
Ltmp201:
	lea	rdi, [rbp - 416]
	lea	rsi, [rbp - 296]
	lea	rdx, [rbp - 448]
	call	__ZplIsE3VexIT_ERKS2_S4_
Ltmp202:
## %bb.96:
Ltmp204:
	lea	rdi, [rbp - 232]
	lea	rsi, [rbp - 416]
	mov	edx, 1
	call	__ZplIsE3VexIT_ERKS2_S1_
Ltmp205:
## %bb.97:
Ltmp207:
	lea	rdi, [rbp - 192]
	lea	rsi, [rbp - 232]
	lea	rdx, [rbp - 344]
	call	__ZplIsE3VexIT_ERKS2_S4_
Ltmp208:
## %bb.98:
	mov	rax, qword ptr [rbp - 168]
	mov	qword ptr [rbp - 96], rax ## 8-byte Spill
	mov	qword ptr [rbp - 184], 0
	mov	qword ptr [rbp - 176], 0
	mov	qword ptr [rbp - 168], 0
	mov	rdi, qword ptr [rbp - 208]
	call	_free
	mov	rdi, qword ptr [rbp - 392]
	call	_free
	mov	rdi, qword ptr [rbp - 272]
	call	_free
Ltmp213:
	lea	rsi, [rip + L_.str.26]
	lea	rdi, [rbp - 264]
	call	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp214:
## %bb.99:
	call	__ZNSt3__16chrono12steady_clock3nowEv
	mov	qword ptr [rbp - 192], rax
	lea	rax, [rip + L_.str.20]
	mov	qword ptr [rbp - 184], rax
	mov	rdi, qword ptr [rbp - 240] ## 8-byte Reload
	mov	rcx, qword ptr [rbp - 64] ## 8-byte Reload
	sub	rdi, rcx
	cmp	rdi, 199999998
	jne	LBB13_103
## %bb.100:
	mov	rbx, qword ptr [rbp - 48] ## 8-byte Reload
	jmp	LBB13_107
LBB13_103:
	mov	rbx, rdi
	mov	rdi, qword ptr [rbp - 48] ## 8-byte Reload
	call	__ZdlPv
	test	rbx, rbx
	je	LBB13_104
## %bb.105:
Ltmp216:
	mov	rdi, rbx
	call	__Znwm
Ltmp217:
## %bb.106:
	mov	rdi, rax
	mov	rsi, rbx
	mov	qword ptr [rbp - 80], rbx ## 8-byte Spill
	mov	rbx, rax
	call	___bzero
	mov	qword ptr [rbp - 48], rbx ## 8-byte Spill
	mov	rcx, qword ptr [rbp - 64] ## 8-byte Reload
	mov	rdi, qword ptr [rbp - 80] ## 8-byte Reload
LBB13_107:
	mov	qword ptr [rbp - 88], rbx ## 8-byte Spill
	mov	r9, rdi
	sar	r9
	cmp	r9, 16
	jae	LBB13_109
## %bb.108:
	xor	r10d, r10d
LBB13_118:
	test	dil, 2
	jne	LBB13_120
## %bb.119:
	mov	rdi, r10
	jmp	LBB13_121
LBB13_109:
	mov	r8, qword ptr [rbp - 48] ## 8-byte Reload
	lea	r11, [r8 + rdi]
	mov	rax, qword ptr [rbp - 152] ## 8-byte Reload
	lea	rdx, [rax + rdi]
	mov	rsi, qword ptr [rbp - 144] ## 8-byte Reload
	lea	rbx, [rsi + rdi]
	mov	r10, qword ptr [rbp - 136] ## 8-byte Reload
	mov	qword ptr [rbp - 80], rdi ## 8-byte Spill
	add	rdi, r10
	cmp	r8, qword ptr [rbp - 240] ## 8-byte Folded Reload
	setb	byte ptr [rbp - 240]    ## 1-byte Folded Spill
	cmp	rcx, r11
	setb	r14b
	cmp	r8, rdx
	setb	dl
	cmp	rax, r11
	setb	al
	cmp	r8, rbx
	setb	bl
	cmp	rsi, r11
	setb	cl
	cmp	r8, rdi
	setb	sil
	cmp	r10, r11
	setb	dil
	xor	r10d, r10d
	test	byte ptr [rbp - 240], r14b ## 1-byte Folded Reload
	jne	LBB13_110
## %bb.111:
	and	dl, al
	mov	r14, qword ptr [rbp - 72] ## 8-byte Reload
	jne	LBB13_112
## %bb.113:
	and	bl, cl
	jne	LBB13_112
## %bb.114:
	and	sil, dil
	mov	rcx, qword ptr [rbp - 64] ## 8-byte Reload
	mov	rdi, qword ptr [rbp - 80] ## 8-byte Reload
	jne	LBB13_118
## %bb.115:
	mov	r10, r9
	and	r10, -16
	mov	rbx, qword ptr [rbp - 48] ## 8-byte Reload
	lea	r8, [rbx + 2*r10]
	xor	esi, esi
	pcmpeqd	xmm0, xmm0
	mov	rax, qword ptr [rbp - 152] ## 8-byte Reload
	mov	rdi, qword ptr [rbp - 144] ## 8-byte Reload
	mov	rdx, qword ptr [rbp - 136] ## 8-byte Reload
	.p2align	4, 0x90
LBB13_116:                              ## =>This Inner Loop Header: Depth=1
	movdqu	xmm1, xmmword ptr [rcx + 2*rsi]
	movdqu	xmm2, xmmword ptr [rcx + 2*rsi + 16]
	movdqu	xmm3, xmmword ptr [rax + 2*rsi]
	paddw	xmm3, xmm1
	movdqu	xmm1, xmmword ptr [rax + 2*rsi + 16]
	paddw	xmm1, xmm2
	movdqu	xmm2, xmmword ptr [rdi + 2*rsi]
	movdqu	xmm4, xmmword ptr [rdi + 2*rsi + 16]
	movdqu	xmm5, xmmword ptr [rdx + 2*rsi]
	paddw	xmm5, xmm2
	paddw	xmm5, xmm3
	movdqu	xmm2, xmmword ptr [rdx + 2*rsi + 16]
	paddw	xmm2, xmm4
	paddw	xmm2, xmm1
	psubw	xmm5, xmm0
	psubw	xmm2, xmm0
	movdqu	xmmword ptr [rbx + 2*rsi], xmm5
	movdqu	xmmword ptr [rbx + 2*rsi + 16], xmm2
	add	rsi, 16
	cmp	r10, rsi
	jne	LBB13_116
## %bb.117:
	mov	qword ptr [rbp - 48], r8 ## 8-byte Spill
	cmp	r9, r10
	mov	rdi, qword ptr [rbp - 80] ## 8-byte Reload
	jne	LBB13_118
	jmp	LBB13_124
LBB13_120:
	movzx	edx, word ptr [rcx + 2*r10]
	mov	rax, qword ptr [rbp - 152] ## 8-byte Reload
	add	dx, word ptr [rax + 2*r10]
	mov	rax, qword ptr [rbp - 144] ## 8-byte Reload
	add	dx, word ptr [rax + 2*r10]
	mov	rax, qword ptr [rbp - 136] ## 8-byte Reload
	add	dx, word ptr [rax + 2*r10]
	inc	edx
	mov	rax, qword ptr [rbp - 48] ## 8-byte Reload
	mov	word ptr [rax], dx
	add	rax, 2
	mov	qword ptr [rbp - 48], rax ## 8-byte Spill
	mov	rdi, r10
	or	rdi, 1
LBB13_121:
	or	r10, 1
	cmp	r9, r10
	je	LBB13_124
## %bb.122:
	sub	r9, rdi
	mov	rax, qword ptr [rbp - 136] ## 8-byte Reload
	lea	r8, [rax + 2*rdi + 2]
	mov	rax, qword ptr [rbp - 144] ## 8-byte Reload
	lea	rdx, [rax + 2*rdi + 2]
	mov	rax, qword ptr [rbp - 152] ## 8-byte Reload
	lea	rsi, [rax + 2*rdi + 2]
	lea	rdi, [rcx + 2*rdi + 2]
	xor	ebx, ebx
	mov	rcx, qword ptr [rbp - 48] ## 8-byte Reload
	.p2align	4, 0x90
LBB13_123:                              ## =>This Inner Loop Header: Depth=1
	movzx	eax, word ptr [rdi + 2*rbx - 2]
	add	ax, word ptr [rsi + 2*rbx - 2]
	add	ax, word ptr [rdx + 2*rbx - 2]
	add	ax, word ptr [r8 + 2*rbx - 2]
	inc	eax
	mov	word ptr [rcx + 2*rbx], ax
	movzx	eax, word ptr [rdi + 2*rbx]
	add	ax, word ptr [rsi + 2*rbx]
	add	ax, word ptr [rdx + 2*rbx]
	add	ax, word ptr [r8 + 2*rbx]
	inc	eax
	mov	word ptr [rcx + 2*rbx + 2], ax
	add	rbx, 2
	cmp	r9, rbx
	jne	LBB13_123
	jmp	LBB13_124
LBB13_104:
	xor	eax, eax
	mov	qword ptr [rbp - 88], rax ## 8-byte Spill
LBB13_124:
Ltmp222:
	lea	rsi, [rip + L_.str.26]
	lea	rdi, [rbp - 192]
	call	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp223:
## %bb.125:
Ltmp225:
	mov	rdi, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	lea	rsi, [rip + L_.str.21]
	mov	edx, 7
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp226:
## %bb.126:
	call	__ZNSt3__16chrono12steady_clock3nowEv
	mov	qword ptr [rbp - 312], rax
	lea	rax, [rip + L_.str.22]
	mov	qword ptr [rbp - 304], rax
Ltmp228:
	lea	rdi, [rbp - 200]
	lea	rsi, [rbp - 384]
	call	__ZN6VProxyIsEC1ERK3VexIsE
Ltmp229:
## %bb.127:
Ltmp230:
	lea	rdi, [rbp - 352]
	lea	rsi, [rbp - 480]
	call	__ZN6VProxyIsEC1ERK3VexIsE
Ltmp231:
## %bb.128:
	mov	rsi, qword ptr [rbp - 200]
	mov	rdx, qword ptr [rbp - 352]
Ltmp232:
	lea	rdi, [rbp - 232]
	call	__ZN6vex_opI6VProxyIsELc43ES1_EC1ES1_S1_
Ltmp233:
## %bb.129:
	mov	rbx, qword ptr [rbp - 232]
	mov	rax, qword ptr [rbp - 224]
	mov	qword ptr [rbp - 48], rax ## 8-byte Spill
Ltmp234:
	lea	rdi, [rbp - 232]
	lea	rsi, [rbp - 448]
	call	__ZN6VProxyIsEC1ERK3VexIsE
Ltmp235:
## %bb.130:
	mov	rcx, qword ptr [rbp - 232]
Ltmp236:
	lea	rdi, [rbp - 264]
	mov	rsi, rbx
	mov	rdx, qword ptr [rbp - 48] ## 8-byte Reload
	call	__ZN6vex_opIS_I6VProxyIsELc43ES1_ELc43ES1_EC1ES2_S1_
Ltmp237:
## %bb.131:
	mov	rax, qword ptr [rbp - 264]
	mov	rcx, qword ptr [rbp - 256]
	mov	qword ptr [rbp - 232], rax
	mov	qword ptr [rbp - 224], rcx
	mov	rax, qword ptr [rbp - 248]
	mov	qword ptr [rbp - 216], rax
Ltmp238:
	lea	rdi, [rbp - 200]
	mov	esi, 1
	call	__ZN3ValIsEC1Es
Ltmp239:
## %bb.132:
	mov	esi, dword ptr [rbp - 200]
Ltmp240:
	mov	rax, qword ptr [rbp - 216]
	mov	qword ptr [rsp + 16], rax
	mov	rax, qword ptr [rbp - 232]
	mov	rcx, qword ptr [rbp - 224]
	mov	qword ptr [rsp + 8], rcx
	mov	qword ptr [rsp], rax
	lea	rdi, [rbp - 296]
	call	__ZN6vex_opIS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEEC1ES3_S5_
Ltmp241:
## %bb.133:
	mov	rax, qword ptr [rbp - 296]
	mov	rcx, qword ptr [rbp - 288]
	mov	qword ptr [rbp - 232], rax
	mov	qword ptr [rbp - 224], rcx
	mov	rax, qword ptr [rbp - 280]
	mov	qword ptr [rbp - 216], rax
	mov	rax, qword ptr [rbp - 272]
	mov	qword ptr [rbp - 208], rax
Ltmp242:
	lea	rdi, [rbp - 200]
	lea	rsi, [rbp - 344]
	call	__ZN6VProxyIsEC1ERK3VexIsE
Ltmp243:
## %bb.134:
	mov	rsi, qword ptr [rbp - 200]
Ltmp244:
	mov	rax, qword ptr [rbp - 208]
	mov	qword ptr [rsp + 24], rax
	mov	rax, qword ptr [rbp - 216]
	mov	qword ptr [rsp + 16], rax
	mov	rax, qword ptr [rbp - 232]
	mov	rcx, qword ptr [rbp - 224]
	mov	qword ptr [rsp + 8], rcx
	mov	qword ptr [rsp], rax
	lea	rdi, [rbp - 192]
	call	__ZN6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_EC1ES6_S1_
Ltmp245:
## %bb.135:
Ltmp246:
	lea	rdi, [rbp - 416]
	lea	rsi, [rbp - 192]
	call	__ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_Ecv3VexIsEEv
Ltmp247:
## %bb.136:
	mov	rax, qword ptr [rbp - 392]
	mov	qword ptr [rbp - 48], rax ## 8-byte Spill
Ltmp252:
	lea	rsi, [rip + L_.str.26]
	lea	rdi, [rbp - 312]
	call	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp253:
	mov	rbx, qword ptr [rbp - 120] ## 8-byte Reload
## %bb.137:
	mov	rdi, qword ptr [rbp - 88] ## 8-byte Reload
	test	rdi, rdi
	je	LBB13_139
## %bb.138:
	call	__ZdlPv
LBB13_139:
	mov	rdi, qword ptr [rbp - 136] ## 8-byte Reload
	call	__ZdlPv
	mov	rdi, qword ptr [rbp - 144] ## 8-byte Reload
	call	__ZdlPv
	mov	rdi, qword ptr [rbp - 152] ## 8-byte Reload
	call	__ZdlPv
	mov	rdi, qword ptr [rbp - 64] ## 8-byte Reload
	call	__ZdlPv
	mov	rdi, r13
	call	__ZdlPv
	mov	rdi, r12
	call	__ZdlPv
	mov	rdi, r15
	call	__ZdlPv
	mov	rdi, qword ptr [rbp - 128] ## 8-byte Reload
	call	__ZdlPv
	mov	rdi, qword ptr [rbp - 104] ## 8-byte Reload
	call	_free
	mov	rdi, qword ptr [rbp - 112] ## 8-byte Reload
	call	_free
	mov	rdi, rbx
	call	_free
	mov	rdi, r14
	call	_free
	mov	rdi, qword ptr [rbp - 48] ## 8-byte Reload
	call	_free
	mov	rdi, qword ptr [rbp - 320]
	call	_free
	mov	rdi, qword ptr [rbp - 424]
	call	_free
	mov	rdi, qword ptr [rbp - 456]
	call	_free
	mov	rdi, qword ptr [rbp - 360]
	call	_free
	xor	eax, eax
	add	rsp, 472
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB13_74:
	mov	r14, qword ptr [rbp - 72] ## 8-byte Reload
	jmp	LBB13_57
LBB13_110:
	mov	r14, qword ptr [rbp - 72] ## 8-byte Reload
LBB13_112:
	mov	rcx, qword ptr [rbp - 64] ## 8-byte Reload
	mov	rdi, qword ptr [rbp - 80] ## 8-byte Reload
	jmp	LBB13_118
LBB13_10:
	mov	edi, 1
	call	___cxa_allocate_exception
Ltmp267:
	mov	rsi, qword ptr [rip + __ZTI15MemoryException@GOTPCREL]
	mov	rdi, rax
	xor	edx, edx
	call	___cxa_throw
Ltmp268:
	jmp	LBB13_11
LBB13_25:
	mov	edi, 1
	call	___cxa_allocate_exception
Ltmp264:
	mov	rsi, qword ptr [rip + __ZTI15MemoryException@GOTPCREL]
	mov	rdi, rax
	xor	edx, edx
	call	___cxa_throw
Ltmp265:
	jmp	LBB13_11
LBB13_26:
	mov	edi, 1
	call	___cxa_allocate_exception
Ltmp261:
	mov	rsi, qword ptr [rip + __ZTI15MemoryException@GOTPCREL]
	mov	rdi, rax
	xor	edx, edx
	call	___cxa_throw
Ltmp262:
	jmp	LBB13_11
LBB13_27:
	mov	edi, 1
	call	___cxa_allocate_exception
Ltmp258:
	mov	rsi, qword ptr [rip + __ZTI15MemoryException@GOTPCREL]
	mov	rdi, rax
	xor	edx, edx
	call	___cxa_throw
Ltmp259:
	jmp	LBB13_11
LBB13_24:
	mov	edi, 1
	call	___cxa_allocate_exception
Ltmp255:
	mov	rsi, qword ptr [rip + __ZTI15MemoryException@GOTPCREL]
	mov	rdi, rax
	xor	edx, edx
	call	___cxa_throw
Ltmp256:
LBB13_11:
	ud2
LBB13_149:
Ltmp218:
	mov	rbx, rax
Ltmp219:
	lea	rsi, [rip + L_.str.26]
	lea	rdi, [rbp - 192]
	call	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp220:
	jmp	LBB13_154
LBB13_148:
Ltmp221:
	mov	rdi, rax
	call	___clang_call_terminate
LBB13_178:
Ltmp254:
	mov	rdi, rax
	call	___clang_call_terminate
LBB13_177:
Ltmp224:
	mov	rdi, rax
	call	___clang_call_terminate
LBB13_176:
Ltmp215:
	mov	rdi, rax
	call	___clang_call_terminate
LBB13_143:
Ltmp209:
	mov	rbx, rax
	mov	rdi, qword ptr [rbp - 208]
	call	_free
	jmp	LBB13_144
LBB13_142:
Ltmp206:
	mov	rbx, rax
LBB13_144:
	mov	rdi, qword ptr [rbp - 392]
	call	_free
	jmp	LBB13_145
LBB13_141:
Ltmp203:
	mov	rbx, rax
LBB13_145:
	mov	rdi, qword ptr [rbp - 272]
	call	_free
	jmp	LBB13_146
LBB13_140:
Ltmp200:
	mov	rbx, rax
LBB13_146:
Ltmp210:
	lea	rsi, [rip + L_.str.26]
	lea	rdi, [rbp - 264]
	call	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp211:
## %bb.147:
	mov	rax, qword ptr [rbp - 48] ## 8-byte Reload
	mov	qword ptr [rbp - 88], rax ## 8-byte Spill
	jmp	LBB13_153
LBB13_179:
Ltmp212:
	mov	rdi, rax
	call	___clang_call_terminate
LBB13_102:
Ltmp197:
	mov	rdi, rax
	call	___clang_call_terminate
LBB13_175:
Ltmp194:
	mov	rdi, rax
	call	___clang_call_terminate
LBB13_59:
Ltmp187:
	mov	rdi, rax
	call	___clang_call_terminate
LBB13_72:
Ltmp184:
	mov	rbx, rax
	jmp	LBB13_154
LBB13_71:
Ltmp181:
	mov	rbx, rax
	jmp	LBB13_155
LBB13_70:
Ltmp178:
	mov	rbx, rax
	jmp	LBB13_156
LBB13_69:
Ltmp175:
	mov	rbx, rax
	jmp	LBB13_157
LBB13_68:
Ltmp172:
	mov	rbx, rax
	jmp	LBB13_158
LBB13_174:
Ltmp169:
	mov	rbx, rax
	jmp	LBB13_159
LBB13_173:
Ltmp166:
	mov	rbx, rax
	jmp	LBB13_160
LBB13_172:
Ltmp163:
	mov	rbx, rax
	jmp	LBB13_161
LBB13_171:
Ltmp160:
	mov	rbx, rax
	jmp	LBB13_162
LBB13_67:
Ltmp257:
	mov	rbx, rax
	jmp	LBB13_163
LBB13_66:
Ltmp260:
	mov	rbx, rax
	jmp	LBB13_164
LBB13_65:
Ltmp263:
	mov	rbx, rax
	jmp	LBB13_165
LBB13_64:
Ltmp266:
	mov	rbx, rax
	jmp	LBB13_166
LBB13_63:
Ltmp269:
	mov	rbx, rax
	jmp	LBB13_167
LBB13_62:
Ltmp145:
	mov	rbx, rax
	jmp	LBB13_168
LBB13_61:
Ltmp140:
	mov	rbx, rax
	jmp	LBB13_169
LBB13_60:
Ltmp135:
	mov	rbx, rax
	jmp	LBB13_170
LBB13_101:
Ltmp227:
	mov	rbx, rax
	jmp	LBB13_152
LBB13_151:
Ltmp248:
	mov	rbx, rax
Ltmp249:
	lea	rsi, [rip + L_.str.26]
	lea	rdi, [rbp - 312]
	call	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
Ltmp250:
LBB13_152:
	cmp	qword ptr [rbp - 88], 0 ## 8-byte Folded Reload
	je	LBB13_154
LBB13_153:
	mov	rdi, qword ptr [rbp - 88] ## 8-byte Reload
	call	__ZdlPv
LBB13_154:
	mov	rdi, qword ptr [rbp - 136] ## 8-byte Reload
	call	__ZdlPv
LBB13_155:
	mov	rdi, qword ptr [rbp - 144] ## 8-byte Reload
	call	__ZdlPv
LBB13_156:
	mov	rdi, qword ptr [rbp - 152] ## 8-byte Reload
	call	__ZdlPv
LBB13_157:
	mov	rdi, qword ptr [rbp - 64] ## 8-byte Reload
	call	__ZdlPv
LBB13_158:
	mov	rdi, r13
	call	__ZdlPv
LBB13_159:
	mov	rdi, r12
	call	__ZdlPv
LBB13_160:
	mov	rdi, r15
	call	__ZdlPv
LBB13_161:
	mov	rdi, qword ptr [rbp - 128] ## 8-byte Reload
	call	__ZdlPv
LBB13_162:
	mov	rdi, qword ptr [rbp - 104] ## 8-byte Reload
	call	_free
LBB13_163:
	mov	rdi, qword ptr [rbp - 112] ## 8-byte Reload
	call	_free
LBB13_164:
	mov	rdi, qword ptr [rbp - 120] ## 8-byte Reload
	call	_free
LBB13_165:
	mov	rdi, qword ptr [rbp - 72] ## 8-byte Reload
	call	_free
LBB13_166:
	mov	rdi, qword ptr [rbp - 96] ## 8-byte Reload
	call	_free
LBB13_167:
	mov	rdi, qword ptr [rbp - 320]
	call	_free
LBB13_168:
	mov	rdi, qword ptr [rbp - 424]
	call	_free
LBB13_169:
	mov	rdi, qword ptr [rbp - 456]
	call	_free
LBB13_170:
	mov	rdi, qword ptr [rbp - 360]
	call	_free
	mov	rdi, rbx
	call	__Unwind_Resume
	ud2
LBB13_150:
Ltmp251:
	mov	rdi, rax
	call	___clang_call_terminate
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table13:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Lfunc_begin6-Lfunc_begin6 ## >> Call Site 1 <<
	.uleb128 Ltmp131-Lfunc_begin6   ##   Call between Lfunc_begin6 and Ltmp131
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp131-Lfunc_begin6   ## >> Call Site 2 <<
	.uleb128 Ltmp134-Ltmp131        ##   Call between Ltmp131 and Ltmp134
	.uleb128 Ltmp135-Lfunc_begin6   ##     jumps to Ltmp135
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp136-Lfunc_begin6   ## >> Call Site 3 <<
	.uleb128 Ltmp139-Ltmp136        ##   Call between Ltmp136 and Ltmp139
	.uleb128 Ltmp140-Lfunc_begin6   ##     jumps to Ltmp140
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp141-Lfunc_begin6   ## >> Call Site 4 <<
	.uleb128 Ltmp144-Ltmp141        ##   Call between Ltmp141 and Ltmp144
	.uleb128 Ltmp145-Lfunc_begin6   ##     jumps to Ltmp145
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp146-Lfunc_begin6   ## >> Call Site 5 <<
	.uleb128 Ltmp149-Ltmp146        ##   Call between Ltmp146 and Ltmp149
	.uleb128 Ltmp269-Lfunc_begin6   ##     jumps to Ltmp269
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp150-Lfunc_begin6   ## >> Call Site 6 <<
	.uleb128 Ltmp151-Ltmp150        ##   Call between Ltmp150 and Ltmp151
	.uleb128 Ltmp266-Lfunc_begin6   ##     jumps to Ltmp266
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp151-Lfunc_begin6   ## >> Call Site 7 <<
	.uleb128 Ltmp152-Ltmp151        ##   Call between Ltmp151 and Ltmp152
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp152-Lfunc_begin6   ## >> Call Site 8 <<
	.uleb128 Ltmp153-Ltmp152        ##   Call between Ltmp152 and Ltmp153
	.uleb128 Ltmp263-Lfunc_begin6   ##     jumps to Ltmp263
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp153-Lfunc_begin6   ## >> Call Site 9 <<
	.uleb128 Ltmp154-Ltmp153        ##   Call between Ltmp153 and Ltmp154
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp154-Lfunc_begin6   ## >> Call Site 10 <<
	.uleb128 Ltmp155-Ltmp154        ##   Call between Ltmp154 and Ltmp155
	.uleb128 Ltmp260-Lfunc_begin6   ##     jumps to Ltmp260
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp155-Lfunc_begin6   ## >> Call Site 11 <<
	.uleb128 Ltmp156-Ltmp155        ##   Call between Ltmp155 and Ltmp156
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp156-Lfunc_begin6   ## >> Call Site 12 <<
	.uleb128 Ltmp157-Ltmp156        ##   Call between Ltmp156 and Ltmp157
	.uleb128 Ltmp257-Lfunc_begin6   ##     jumps to Ltmp257
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp158-Lfunc_begin6   ## >> Call Site 13 <<
	.uleb128 Ltmp159-Ltmp158        ##   Call between Ltmp158 and Ltmp159
	.uleb128 Ltmp160-Lfunc_begin6   ##     jumps to Ltmp160
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp159-Lfunc_begin6   ## >> Call Site 14 <<
	.uleb128 Ltmp161-Ltmp159        ##   Call between Ltmp159 and Ltmp161
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp161-Lfunc_begin6   ## >> Call Site 15 <<
	.uleb128 Ltmp162-Ltmp161        ##   Call between Ltmp161 and Ltmp162
	.uleb128 Ltmp163-Lfunc_begin6   ##     jumps to Ltmp163
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp162-Lfunc_begin6   ## >> Call Site 16 <<
	.uleb128 Ltmp164-Ltmp162        ##   Call between Ltmp162 and Ltmp164
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp164-Lfunc_begin6   ## >> Call Site 17 <<
	.uleb128 Ltmp165-Ltmp164        ##   Call between Ltmp164 and Ltmp165
	.uleb128 Ltmp166-Lfunc_begin6   ##     jumps to Ltmp166
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp165-Lfunc_begin6   ## >> Call Site 18 <<
	.uleb128 Ltmp167-Ltmp165        ##   Call between Ltmp165 and Ltmp167
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp167-Lfunc_begin6   ## >> Call Site 19 <<
	.uleb128 Ltmp168-Ltmp167        ##   Call between Ltmp167 and Ltmp168
	.uleb128 Ltmp169-Lfunc_begin6   ##     jumps to Ltmp169
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp168-Lfunc_begin6   ## >> Call Site 20 <<
	.uleb128 Ltmp170-Ltmp168        ##   Call between Ltmp168 and Ltmp170
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp170-Lfunc_begin6   ## >> Call Site 21 <<
	.uleb128 Ltmp171-Ltmp170        ##   Call between Ltmp170 and Ltmp171
	.uleb128 Ltmp172-Lfunc_begin6   ##     jumps to Ltmp172
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp171-Lfunc_begin6   ## >> Call Site 22 <<
	.uleb128 Ltmp173-Ltmp171        ##   Call between Ltmp171 and Ltmp173
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp173-Lfunc_begin6   ## >> Call Site 23 <<
	.uleb128 Ltmp174-Ltmp173        ##   Call between Ltmp173 and Ltmp174
	.uleb128 Ltmp175-Lfunc_begin6   ##     jumps to Ltmp175
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp174-Lfunc_begin6   ## >> Call Site 24 <<
	.uleb128 Ltmp176-Ltmp174        ##   Call between Ltmp174 and Ltmp176
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp176-Lfunc_begin6   ## >> Call Site 25 <<
	.uleb128 Ltmp177-Ltmp176        ##   Call between Ltmp176 and Ltmp177
	.uleb128 Ltmp178-Lfunc_begin6   ##     jumps to Ltmp178
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp177-Lfunc_begin6   ## >> Call Site 26 <<
	.uleb128 Ltmp179-Ltmp177        ##   Call between Ltmp177 and Ltmp179
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp179-Lfunc_begin6   ## >> Call Site 27 <<
	.uleb128 Ltmp180-Ltmp179        ##   Call between Ltmp179 and Ltmp180
	.uleb128 Ltmp181-Lfunc_begin6   ##     jumps to Ltmp181
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp180-Lfunc_begin6   ## >> Call Site 28 <<
	.uleb128 Ltmp182-Ltmp180        ##   Call between Ltmp180 and Ltmp182
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp182-Lfunc_begin6   ## >> Call Site 29 <<
	.uleb128 Ltmp183-Ltmp182        ##   Call between Ltmp182 and Ltmp183
	.uleb128 Ltmp184-Lfunc_begin6   ##     jumps to Ltmp184
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp183-Lfunc_begin6   ## >> Call Site 30 <<
	.uleb128 Ltmp185-Ltmp183        ##   Call between Ltmp183 and Ltmp185
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp185-Lfunc_begin6   ## >> Call Site 31 <<
	.uleb128 Ltmp186-Ltmp185        ##   Call between Ltmp185 and Ltmp186
	.uleb128 Ltmp187-Lfunc_begin6   ##     jumps to Ltmp187
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp188-Lfunc_begin6   ## >> Call Site 32 <<
	.uleb128 Ltmp191-Ltmp188        ##   Call between Ltmp188 and Ltmp191
	.uleb128 Ltmp227-Lfunc_begin6   ##     jumps to Ltmp227
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp192-Lfunc_begin6   ## >> Call Site 33 <<
	.uleb128 Ltmp193-Ltmp192        ##   Call between Ltmp192 and Ltmp193
	.uleb128 Ltmp194-Lfunc_begin6   ##     jumps to Ltmp194
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp195-Lfunc_begin6   ## >> Call Site 34 <<
	.uleb128 Ltmp196-Ltmp195        ##   Call between Ltmp195 and Ltmp196
	.uleb128 Ltmp197-Lfunc_begin6   ##     jumps to Ltmp197
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp198-Lfunc_begin6   ## >> Call Site 35 <<
	.uleb128 Ltmp199-Ltmp198        ##   Call between Ltmp198 and Ltmp199
	.uleb128 Ltmp200-Lfunc_begin6   ##     jumps to Ltmp200
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp201-Lfunc_begin6   ## >> Call Site 36 <<
	.uleb128 Ltmp202-Ltmp201        ##   Call between Ltmp201 and Ltmp202
	.uleb128 Ltmp203-Lfunc_begin6   ##     jumps to Ltmp203
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp204-Lfunc_begin6   ## >> Call Site 37 <<
	.uleb128 Ltmp205-Ltmp204        ##   Call between Ltmp204 and Ltmp205
	.uleb128 Ltmp206-Lfunc_begin6   ##     jumps to Ltmp206
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp207-Lfunc_begin6   ## >> Call Site 38 <<
	.uleb128 Ltmp208-Ltmp207        ##   Call between Ltmp207 and Ltmp208
	.uleb128 Ltmp209-Lfunc_begin6   ##     jumps to Ltmp209
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp213-Lfunc_begin6   ## >> Call Site 39 <<
	.uleb128 Ltmp214-Ltmp213        ##   Call between Ltmp213 and Ltmp214
	.uleb128 Ltmp215-Lfunc_begin6   ##     jumps to Ltmp215
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp216-Lfunc_begin6   ## >> Call Site 40 <<
	.uleb128 Ltmp217-Ltmp216        ##   Call between Ltmp216 and Ltmp217
	.uleb128 Ltmp218-Lfunc_begin6   ##     jumps to Ltmp218
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp217-Lfunc_begin6   ## >> Call Site 41 <<
	.uleb128 Ltmp222-Ltmp217        ##   Call between Ltmp217 and Ltmp222
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp222-Lfunc_begin6   ## >> Call Site 42 <<
	.uleb128 Ltmp223-Ltmp222        ##   Call between Ltmp222 and Ltmp223
	.uleb128 Ltmp224-Lfunc_begin6   ##     jumps to Ltmp224
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp225-Lfunc_begin6   ## >> Call Site 43 <<
	.uleb128 Ltmp226-Ltmp225        ##   Call between Ltmp225 and Ltmp226
	.uleb128 Ltmp227-Lfunc_begin6   ##     jumps to Ltmp227
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp228-Lfunc_begin6   ## >> Call Site 44 <<
	.uleb128 Ltmp247-Ltmp228        ##   Call between Ltmp228 and Ltmp247
	.uleb128 Ltmp248-Lfunc_begin6   ##     jumps to Ltmp248
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp252-Lfunc_begin6   ## >> Call Site 45 <<
	.uleb128 Ltmp253-Ltmp252        ##   Call between Ltmp252 and Ltmp253
	.uleb128 Ltmp254-Lfunc_begin6   ##     jumps to Ltmp254
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp253-Lfunc_begin6   ## >> Call Site 46 <<
	.uleb128 Ltmp267-Ltmp253        ##   Call between Ltmp253 and Ltmp267
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp267-Lfunc_begin6   ## >> Call Site 47 <<
	.uleb128 Ltmp268-Ltmp267        ##   Call between Ltmp267 and Ltmp268
	.uleb128 Ltmp269-Lfunc_begin6   ##     jumps to Ltmp269
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp268-Lfunc_begin6   ## >> Call Site 48 <<
	.uleb128 Ltmp264-Ltmp268        ##   Call between Ltmp268 and Ltmp264
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp264-Lfunc_begin6   ## >> Call Site 49 <<
	.uleb128 Ltmp265-Ltmp264        ##   Call between Ltmp264 and Ltmp265
	.uleb128 Ltmp266-Lfunc_begin6   ##     jumps to Ltmp266
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp265-Lfunc_begin6   ## >> Call Site 50 <<
	.uleb128 Ltmp261-Ltmp265        ##   Call between Ltmp265 and Ltmp261
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp261-Lfunc_begin6   ## >> Call Site 51 <<
	.uleb128 Ltmp262-Ltmp261        ##   Call between Ltmp261 and Ltmp262
	.uleb128 Ltmp263-Lfunc_begin6   ##     jumps to Ltmp263
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp262-Lfunc_begin6   ## >> Call Site 52 <<
	.uleb128 Ltmp258-Ltmp262        ##   Call between Ltmp262 and Ltmp258
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp258-Lfunc_begin6   ## >> Call Site 53 <<
	.uleb128 Ltmp259-Ltmp258        ##   Call between Ltmp258 and Ltmp259
	.uleb128 Ltmp260-Lfunc_begin6   ##     jumps to Ltmp260
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp259-Lfunc_begin6   ## >> Call Site 54 <<
	.uleb128 Ltmp255-Ltmp259        ##   Call between Ltmp259 and Ltmp255
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp255-Lfunc_begin6   ## >> Call Site 55 <<
	.uleb128 Ltmp256-Ltmp255        ##   Call between Ltmp255 and Ltmp256
	.uleb128 Ltmp257-Lfunc_begin6   ##     jumps to Ltmp257
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp219-Lfunc_begin6   ## >> Call Site 56 <<
	.uleb128 Ltmp220-Ltmp219        ##   Call between Ltmp219 and Ltmp220
	.uleb128 Ltmp221-Lfunc_begin6   ##     jumps to Ltmp221
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp210-Lfunc_begin6   ## >> Call Site 57 <<
	.uleb128 Ltmp211-Ltmp210        ##   Call between Ltmp210 and Ltmp211
	.uleb128 Ltmp212-Lfunc_begin6   ##     jumps to Ltmp212
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp249-Lfunc_begin6   ## >> Call Site 58 <<
	.uleb128 Ltmp250-Ltmp249        ##   Call between Ltmp249 and Ltmp250
	.uleb128 Ltmp251-Lfunc_begin6   ##     jumps to Ltmp251
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp250-Lfunc_begin6   ## >> Call Site 59 <<
	.uleb128 Lfunc_end6-Ltmp250     ##   Call between Ltmp250 and Lfunc_end6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end6:
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
	.globl	__ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_Ecv3VexIsEEv ## -- Begin function _ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_Ecv3VexIsEEv
	.weak_def_can_be_hidden	__ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_Ecv3VexIsEEv
	.p2align	4, 0x90
__ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_Ecv3VexIsEEv: ## @_ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_Ecv3VexIsEEv
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdi
	call	__ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_E4evalEv
	mov	rax, rbx
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev ## -- Begin function _ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.weak_def_can_be_hidden	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.p2align	4, 0x90
__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev: ## @_ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	rbx
	push	rax
	.cfi_offset rbx, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rax, qword ptr [rdi]
	mov	rax, qword ptr [rax - 24]
	lea	r15, [rdi + rax]
	mov	rcx, qword ptr [rip + __ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	lea	rdx, [rcx + 24]
	mov	qword ptr [rdi + rax], rdx
	lea	r14, [rdi + rax + 112]
	add	rcx, 64
	mov	qword ptr [rdi + rax + 112], rcx
	lea	rbx, [rdi + rax + 8]
	mov	rcx, qword ptr [rip + __ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rcx, 16
	mov	qword ptr [rdi + rax + 8], rcx
	test	byte ptr [rdi + rax + 72], 1
	je	LBB15_2
## %bb.1:
	mov	rdi, qword ptr [r15 + 88]
	call	__ZdlPv
LBB15_2:
	mov	rdi, rbx
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	mov	rdi, r15
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	mov	rdi, r14
	add	rsp, 8
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	jmp	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev ## -- Begin function _ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.p2align	4, 0x90
__ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev: ## @_ZNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	rbx
	push	rax
	.cfi_offset rbx, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rbx, rdi
	mov	rax, qword ptr [rip + __ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	lea	rcx, [rax + 24]
	mov	qword ptr [rdi], rcx
	lea	r14, [rdi + 112]
	add	rax, 64
	mov	qword ptr [rdi + 112], rax
	lea	r15, [rdi + 8]
	mov	rax, qword ptr [rip + __ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rax, 16
	mov	qword ptr [rdi + 8], rax
	test	byte ptr [rdi + 72], 1
	je	LBB16_2
## %bb.1:
	mov	rdi, qword ptr [rbx + 88]
	call	__ZdlPv
LBB16_2:
	mov	rdi, r15
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	mov	rdi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	mov	rdi, r14
	call	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	rdi, rbx
	add	rsp, 8
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev ## -- Begin function _ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.weak_def_can_be_hidden	__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.p2align	4, 0x90
__ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev: ## @_ZTv0_n24_NSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	rbx
	push	rax
	.cfi_offset rbx, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rax, qword ptr [rdi]
	mov	rax, qword ptr [rax - 24]
	lea	rbx, [rdi + rax]
	mov	rcx, qword ptr [rip + __ZTVNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	lea	rdx, [rcx + 24]
	mov	qword ptr [rdi + rax], rdx
	lea	r14, [rdi + rax + 112]
	add	rcx, 64
	mov	qword ptr [rdi + rax + 112], rcx
	lea	r15, [rdi + rax + 8]
	mov	rcx, qword ptr [rip + __ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rcx, 16
	mov	qword ptr [rdi + rax + 8], rcx
	test	byte ptr [rdi + rax + 72], 1
	je	LBB17_2
## %bb.1:
	mov	rdi, qword ptr [rbx + 88]
	call	__ZdlPv
LBB17_2:
	mov	rdi, r15
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	mov	rsi, qword ptr [rip + __ZTTNSt3__119basic_ostringstreamIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rsi, 8
	mov	rdi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	mov	rdi, r14
	call	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	rdi, rbx
	add	rsp, 8
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdi
	mov	rax, qword ptr [rip + __ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rax, 16
	mov	qword ptr [rdi], rax
	test	byte ptr [rdi + 64], 1
	je	LBB18_2
## %bb.1:
	mov	rdi, qword ptr [rbx + 80]
	call	__ZdlPv
LBB18_2:
	mov	rdi, rbx
	add	rsp, 8
	pop	rbx
	pop	rbp
	jmp	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEED0Ev
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdi
	mov	rax, qword ptr [rip + __ZTVNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEEE@GOTPCREL]
	add	rax, 16
	mov	qword ptr [rdi], rax
	test	byte ptr [rdi + 64], 1
	je	LBB19_2
## %bb.1:
	mov	rdi, qword ptr [rbx + 80]
	call	__ZdlPv
LBB19_2:
	mov	rdi, rbx
	call	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	mov	rdi, rbx
	add	rsp, 8
	pop	rbx
	pop	rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekoffExNS_8ios_base7seekdirEj
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	.cfi_offset rbx, -24
	mov	rax, rdi
	mov	rdi, qword ptr [rsi + 48]
	mov	r10, qword ptr [rsi + 88]
	cmp	r10, rdi
	jae	LBB20_2
## %bb.1:
	mov	qword ptr [rsi + 88], rdi
	mov	r10, rdi
LBB20_2:
	mov	ebx, r8d
	mov	r9, -1
	and	ebx, 24
	je	LBB20_31
## %bb.3:
	cmp	ecx, 1
	jne	LBB20_5
## %bb.4:
	cmp	ebx, 24
	je	LBB20_31
LBB20_5:
	test	r10, r10
	je	LBB20_6
## %bb.7:
	test	byte ptr [rsi + 64], 1
	jne	LBB20_8
## %bb.9:
	lea	rbx, [rsi + 64]
	inc	rbx
	jmp	LBB20_10
LBB20_6:
	xor	r11d, r11d
	test	ecx, ecx
	jne	LBB20_13
LBB20_12:
	xor	ecx, ecx
	add	rcx, rdx
	jns	LBB20_20
	jmp	LBB20_31
LBB20_8:
	mov	rbx, qword ptr [rsi + 80]
LBB20_10:
	mov	r11, r10
	sub	r11, rbx
	test	ecx, ecx
	je	LBB20_12
LBB20_13:
	cmp	ecx, 2
	je	LBB20_18
## %bb.14:
	cmp	ecx, 1
	jne	LBB20_31
## %bb.15:
	test	r8b, 8
	jne	LBB20_16
## %bb.17:
	mov	rcx, rdi
	sub	rcx, qword ptr [rsi + 40]
	add	rcx, rdx
	jns	LBB20_20
	jmp	LBB20_31
LBB20_18:
	mov	rcx, r11
	add	rcx, rdx
	jns	LBB20_20
	jmp	LBB20_31
LBB20_16:
	mov	rcx, qword ptr [rsi + 24]
	sub	rcx, qword ptr [rsi + 16]
	add	rcx, rdx
	js	LBB20_31
LBB20_20:
	cmp	r11, rcx
	jl	LBB20_31
## %bb.21:
	test	rcx, rcx
	je	LBB20_26
## %bb.22:
	test	r8b, 8
	je	LBB20_24
## %bb.23:
	cmp	qword ptr [rsi + 24], 0
	je	LBB20_31
LBB20_24:
	test	r8b, 16
	je	LBB20_26
## %bb.25:
	test	rdi, rdi
	je	LBB20_31
LBB20_26:
	test	r8b, 8
	je	LBB20_28
## %bb.27:
	mov	rdx, qword ptr [rsi + 16]
	add	rdx, rcx
	mov	qword ptr [rsi + 24], rdx
	mov	qword ptr [rsi + 32], r10
LBB20_28:
	test	r8b, 16
	je	LBB20_30
## %bb.29:
	movsxd	rdx, ecx
	add	rdx, qword ptr [rsi + 40]
	mov	qword ptr [rsi + 48], rdx
LBB20_30:
	mov	r9, rcx
LBB20_31:
	mov	qword ptr [rax + 120], 0
	mov	qword ptr [rax + 112], 0
	mov	qword ptr [rax + 104], 0
	mov	qword ptr [rax + 96], 0
	mov	qword ptr [rax + 88], 0
	mov	qword ptr [rax + 80], 0
	mov	qword ptr [rax + 72], 0
	mov	qword ptr [rax + 64], 0
	mov	qword ptr [rax + 56], 0
	mov	qword ptr [rax + 48], 0
	mov	qword ptr [rax + 40], 0
	mov	qword ptr [rax + 32], 0
	mov	qword ptr [rax + 24], 0
	mov	qword ptr [rax + 16], 0
	mov	qword ptr [rax + 8], 0
	mov	qword ptr [rax], 0
	mov	qword ptr [rax + 128], r9
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekposENS_4fposI11__mbstate_tEEj
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekposENS_4fposI11__mbstate_tEEj: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	r8d, edx
	mov	rbx, rdi
	mov	rdx, qword ptr [rbp + 144]
	mov	rax, qword ptr [rsi]
	xor	ecx, ecx
	call	qword ptr [rax + 32]
	mov	rax, rbx
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9underflowEv
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rax, qword ptr [rdi + 48]
	mov	rcx, qword ptr [rdi + 88]
	cmp	rcx, rax
	jae	LBB22_2
## %bb.1:
	mov	qword ptr [rdi + 88], rax
	mov	rcx, rax
LBB22_2:
	mov	eax, -1
	test	byte ptr [rdi + 96], 8
	je	LBB22_7
## %bb.3:
	mov	rdx, qword ptr [rdi + 32]
	cmp	rdx, rcx
	jae	LBB22_5
## %bb.4:
	mov	qword ptr [rdi + 32], rcx
	mov	rdx, rcx
LBB22_5:
	mov	rcx, qword ptr [rdi + 24]
	cmp	rcx, rdx
	jae	LBB22_7
## %bb.6:
	movzx	eax, byte ptr [rcx]
LBB22_7:
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE9pbackfailEi
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rax, qword ptr [rdi + 48]
	mov	rcx, qword ptr [rdi + 88]
	cmp	rcx, rax
	jae	LBB23_2
## %bb.1:
	mov	qword ptr [rdi + 88], rax
	mov	rcx, rax
LBB23_2:
	mov	rdx, qword ptr [rdi + 24]
	mov	eax, -1
	cmp	qword ptr [rdi + 16], rdx
	jae	LBB23_8
## %bb.3:
	cmp	esi, -1
	je	LBB23_4
## %bb.5:
	test	byte ptr [rdi + 96], 16
	jne	LBB23_7
## %bb.6:
	cmp	byte ptr [rdx - 1], sil
	jne	LBB23_8
LBB23_7:
	lea	rax, [rdx - 1]
	mov	qword ptr [rdi + 24], rax
	mov	qword ptr [rdi + 32], rcx
	mov	byte ptr [rdx - 1], sil
	mov	eax, esi
LBB23_8:
	pop	rbp
	ret
LBB23_4:
	dec	rdx
	mov	qword ptr [rdi + 24], rdx
	mov	qword ptr [rdi + 32], rcx
	xor	eax, eax
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi ## -- Begin function _ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi
	.weak_def_can_be_hidden	__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi
	.p2align	4, 0x90
__ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi: ## @_ZNSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE8overflowEi
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 40
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	cmp	esi, -1
	je	LBB24_1
## %bb.2:
	mov	r14d, esi
	mov	rbx, rdi
	mov	r15, qword ptr [rdi + 24]
	mov	r13, qword ptr [rdi + 48]
	sub	r15, qword ptr [rdi + 16]
	mov	rax, qword ptr [rdi + 56]
	cmp	r13, rax
	je	LBB24_4
## %bb.3:
	mov	rsi, qword ptr [rbx + 88]
	jmp	LBB24_13
LBB24_1:
	xor	r12d, r12d
	jmp	LBB24_20
LBB24_4:
	mov	r12d, -1
	test	byte ptr [rbx + 96], 16
	je	LBB24_20
## %bb.5:
	mov	rax, qword ptr [rbx + 40]
	mov	qword ptr [rbp - 56], rax ## 8-byte Spill
	mov	rax, qword ptr [rbx + 88]
	mov	qword ptr [rbp - 64], rax ## 8-byte Spill
	lea	rdi, [rbx + 64]
Ltmp270:
	mov	qword ptr [rbp - 48], rdi ## 8-byte Spill
	xor	esi, esi
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9push_backEc
Ltmp271:
## %bb.6:
	mov	esi, 22
	mov	rdi, qword ptr [rbp - 48] ## 8-byte Reload
	test	byte ptr [rdi], 1
	je	LBB24_8
## %bb.7:
	mov	rsi, qword ptr [rdi]
	and	rsi, -2
	dec	rsi
LBB24_8:
Ltmp272:
	xor	edx, edx
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeEmc
Ltmp273:
## %bb.9:
	mov	rax, qword ptr [rbp - 56] ## 8-byte Reload
	sub	r13, rax
	mov	rsi, qword ptr [rbp - 64] ## 8-byte Reload
	sub	rsi, rax
	mov	rcx, qword ptr [rbp - 48] ## 8-byte Reload
	movzx	eax, byte ptr [rcx]
	test	al, 1
	jne	LBB24_10
## %bb.11:
	inc	rcx
	shr	rax
	jmp	LBB24_12
LBB24_10:
	mov	rax, qword ptr [rbx + 72]
	mov	rcx, qword ptr [rbx + 80]
LBB24_12:
	add	rax, rcx
	mov	qword ptr [rbx + 40], rcx
	mov	qword ptr [rbx + 56], rax
	add	r13, rcx
	mov	qword ptr [rbx + 48], r13
	add	rsi, rcx
	mov	qword ptr [rbx + 88], rsi
LBB24_13:
	lea	rcx, [r13 + 1]
	mov	qword ptr [rbp - 72], rcx
	lea	rdx, [rbx + 88]
	cmp	rcx, rsi
	lea	rsi, [rbp - 72]
	cmovb	rsi, rdx
	mov	rdx, qword ptr [rsi]
	mov	qword ptr [rbx + 88], rdx
	test	byte ptr [rbx + 96], 8
	je	LBB24_18
## %bb.14:
	test	byte ptr [rbx + 64], 1
	jne	LBB24_15
## %bb.16:
	lea	rsi, [rbx + 64]
	inc	rsi
	jmp	LBB24_17
LBB24_15:
	mov	rsi, qword ptr [rbx + 80]
LBB24_17:
	add	r15, rsi
	mov	qword ptr [rbx + 16], rsi
	mov	qword ptr [rbx + 24], r15
	mov	qword ptr [rbx + 32], rdx
LBB24_18:
	cmp	r13, rax
	je	LBB24_22
## %bb.19:
	mov	qword ptr [rbx + 48], rcx
	mov	byte ptr [r13], r14b
	movzx	r12d, r14b
LBB24_20:
	mov	eax, r12d
	add	rsp, 40
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB24_22:
	movzx	esi, r14b
	mov	rax, qword ptr [rbx]
	mov	rax, qword ptr [rax + 104]
	mov	rdi, rbx
	add	rsp, 40
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	jmp	rax                     ## TAILCALL
LBB24_21:
Ltmp274:
	mov	rdi, rax
	call	___cxa_begin_catch
	call	___cxa_end_catch
	jmp	LBB24_20
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table24:
Lexception7:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Ltmp270-Lfunc_begin7   ## >> Call Site 1 <<
	.uleb128 Ltmp273-Ltmp270        ##   Call between Ltmp270 and Ltmp273
	.uleb128 Ltmp274-Lfunc_begin7   ##     jumps to Ltmp274
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp273-Lfunc_begin7   ## >> Call Site 2 <<
	.uleb128 Lfunc_end7-Ltmp273     ##   Call between Ltmp273 and Lfunc_end7
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end7:
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
	.private_extern	___clang_call_terminate ## -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## %bb.0:
	push	rax
	call	___cxa_begin_catch
	call	__ZSt9terminatev
                                        ## -- End function
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin8:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception8
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 40
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r14, rdx
	mov	r15, rsi
	mov	rbx, rdi
Ltmp275:
	lea	rdi, [rbp - 80]
	mov	rsi, rbx
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp276:
## %bb.1:
	cmp	byte ptr [rbp - 80], 0
	je	LBB26_10
## %bb.2:
	mov	rax, qword ptr [rbx]
	mov	rax, qword ptr [rax - 24]
	lea	r12, [rbx + rax]
	mov	rdi, qword ptr [rbx + rax + 40]
	mov	r13d, dword ptr [rbx + rax + 8]
	mov	eax, dword ptr [rbx + rax + 144]
	cmp	eax, -1
	jne	LBB26_7
## %bb.3:
Ltmp278:
	mov	qword ptr [rbp - 64], rdi ## 8-byte Spill
	lea	rdi, [rbp - 56]
	mov	rsi, r12
	call	__ZNKSt3__18ios_base6getlocEv
Ltmp279:
## %bb.4:
Ltmp280:
	mov	rsi, qword ptr [rip + __ZNSt3__15ctypeIcE2idE@GOTPCREL]
	lea	rdi, [rbp - 56]
	call	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp281:
## %bb.5:
	mov	rcx, qword ptr [rax]
Ltmp282:
	mov	rdi, rax
	mov	esi, 32
	call	qword ptr [rcx + 56]
	mov	byte ptr [rbp - 41], al ## 1-byte Spill
Ltmp283:
## %bb.6:
	lea	rdi, [rbp - 56]
	call	__ZNSt3__16localeD1Ev
	movsx	eax, byte ptr [rbp - 41] ## 1-byte Folded Reload
	mov	dword ptr [r12 + 144], eax
	mov	rdi, qword ptr [rbp - 64] ## 8-byte Reload
LBB26_7:
	add	r14, r15
	and	r13d, 176
	cmp	r13d, 32
	mov	rdx, r15
	cmove	rdx, r14
Ltmp285:
	movsx	r9d, al
	mov	rsi, r15
	mov	rcx, r14
	mov	r8, r12
	call	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp286:
## %bb.8:
	test	rax, rax
	jne	LBB26_10
## %bb.9:
	mov	rax, qword ptr [rbx]
	mov	rax, qword ptr [rax - 24]
	lea	rdi, [rbx + rax]
	mov	esi, dword ptr [rbx + rax + 32]
	or	esi, 5
Ltmp288:
	call	__ZNSt3__18ios_base5clearEj
Ltmp289:
LBB26_10:
	lea	rdi, [rbp - 80]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB26_11:
	mov	rax, rbx
	add	rsp, 40
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB26_12:
Ltmp290:
	jmp	LBB26_15
LBB26_13:
Ltmp284:
	mov	r14, rax
	lea	rdi, [rbp - 56]
	call	__ZNSt3__16localeD1Ev
	jmp	LBB26_16
LBB26_14:
Ltmp287:
LBB26_15:
	mov	r14, rax
LBB26_16:
	lea	rdi, [rbp - 80]
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	jmp	LBB26_18
LBB26_17:
Ltmp277:
	mov	r14, rax
LBB26_18:
	mov	rdi, r14
	call	___cxa_begin_catch
	mov	rax, qword ptr [rbx]
	mov	rdi, qword ptr [rax - 24]
	add	rdi, rbx
Ltmp291:
	call	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp292:
## %bb.19:
	call	___cxa_end_catch
	jmp	LBB26_11
LBB26_20:
Ltmp293:
	mov	rbx, rax
Ltmp294:
	call	___cxa_end_catch
Ltmp295:
## %bb.21:
	mov	rdi, rbx
	call	__Unwind_Resume
	ud2
LBB26_22:
Ltmp296:
	mov	rdi, rax
	call	___clang_call_terminate
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table26:
Lexception8:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end8-Lcst_begin8
Lcst_begin8:
	.uleb128 Ltmp275-Lfunc_begin8   ## >> Call Site 1 <<
	.uleb128 Ltmp276-Ltmp275        ##   Call between Ltmp275 and Ltmp276
	.uleb128 Ltmp277-Lfunc_begin8   ##     jumps to Ltmp277
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp278-Lfunc_begin8   ## >> Call Site 2 <<
	.uleb128 Ltmp279-Ltmp278        ##   Call between Ltmp278 and Ltmp279
	.uleb128 Ltmp287-Lfunc_begin8   ##     jumps to Ltmp287
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp280-Lfunc_begin8   ## >> Call Site 3 <<
	.uleb128 Ltmp283-Ltmp280        ##   Call between Ltmp280 and Ltmp283
	.uleb128 Ltmp284-Lfunc_begin8   ##     jumps to Ltmp284
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp285-Lfunc_begin8   ## >> Call Site 4 <<
	.uleb128 Ltmp286-Ltmp285        ##   Call between Ltmp285 and Ltmp286
	.uleb128 Ltmp287-Lfunc_begin8   ##     jumps to Ltmp287
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp288-Lfunc_begin8   ## >> Call Site 5 <<
	.uleb128 Ltmp289-Ltmp288        ##   Call between Ltmp288 and Ltmp289
	.uleb128 Ltmp290-Lfunc_begin8   ##     jumps to Ltmp290
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp289-Lfunc_begin8   ## >> Call Site 6 <<
	.uleb128 Ltmp291-Ltmp289        ##   Call between Ltmp289 and Ltmp291
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp291-Lfunc_begin8   ## >> Call Site 7 <<
	.uleb128 Ltmp292-Ltmp291        ##   Call between Ltmp291 and Ltmp292
	.uleb128 Ltmp293-Lfunc_begin8   ##     jumps to Ltmp293
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp292-Lfunc_begin8   ## >> Call Site 8 <<
	.uleb128 Ltmp294-Ltmp292        ##   Call between Ltmp292 and Ltmp294
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp294-Lfunc_begin8   ## >> Call Site 9 <<
	.uleb128 Ltmp295-Ltmp294        ##   Call between Ltmp294 and Ltmp295
	.uleb128 Ltmp296-Lfunc_begin8   ##     jumps to Ltmp296
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp295-Lfunc_begin8   ## >> Call Site 10 <<
	.uleb128 Lfunc_end8-Ltmp295     ##   Call between Ltmp295 and Lfunc_end8
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end8:
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
Lfunc_begin9:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception9
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 56
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	test	rdi, rdi
	je	LBB27_20
## %bb.1:
	mov	r12, r8
	mov	r15, rcx
	mov	r13, rdi
	mov	dword ptr [rbp - 68], r9d ## 4-byte Spill
	mov	rax, rcx
	sub	rax, rsi
	mov	rcx, qword ptr [r8 + 24]
	xor	r14d, r14d
	sub	rcx, rax
	cmovg	r14, rcx
	mov	qword ptr [rbp - 88], rdx ## 8-byte Spill
	mov	rbx, rdx
	sub	rbx, rsi
	test	rbx, rbx
	jle	LBB27_3
## %bb.2:
	mov	rax, qword ptr [r13]
	mov	rdi, r13
	mov	rdx, rbx
	call	qword ptr [rax + 96]
	cmp	rax, rbx
	jne	LBB27_20
LBB27_3:
	test	r14, r14
	jle	LBB27_16
## %bb.4:
	mov	qword ptr [rbp - 80], r12 ## 8-byte Spill
	cmp	r14, 23
	jae	LBB27_8
## %bb.5:
	lea	eax, [r14 + r14]
	mov	byte ptr [rbp - 64], al
	lea	rbx, [rbp - 64]
	lea	r12, [rbp - 63]
	jmp	LBB27_9
LBB27_8:
	lea	rbx, [r14 + 16]
	and	rbx, -16
	mov	rdi, rbx
	call	__Znwm
	mov	r12, rax
	mov	qword ptr [rbp - 48], rax
	or	rbx, 1
	mov	qword ptr [rbp - 64], rbx
	mov	qword ptr [rbp - 56], r14
	lea	rbx, [rbp - 64]
LBB27_9:
	movzx	esi, byte ptr [rbp - 68] ## 1-byte Folded Reload
	mov	rdi, r12
	mov	rdx, r14
	call	_memset
	mov	byte ptr [r12 + r14], 0
	test	byte ptr [rbp - 64], 1
	je	LBB27_11
## %bb.10:
	mov	rbx, qword ptr [rbp - 48]
	jmp	LBB27_12
LBB27_11:
	inc	rbx
LBB27_12:
	mov	r12, qword ptr [rbp - 80] ## 8-byte Reload
	mov	rax, qword ptr [r13]
Ltmp297:
	mov	rdi, r13
	mov	rsi, rbx
	mov	rdx, r14
	call	qword ptr [rax + 96]
Ltmp298:
## %bb.13:
	mov	rbx, rax
	test	byte ptr [rbp - 64], 1
	je	LBB27_15
## %bb.14:
	mov	rdi, qword ptr [rbp - 48]
	call	__ZdlPv
LBB27_15:
	cmp	rbx, r14
	jne	LBB27_20
LBB27_16:
	mov	rsi, qword ptr [rbp - 88] ## 8-byte Reload
	sub	r15, rsi
	test	r15, r15
	jle	LBB27_18
## %bb.17:
	mov	rax, qword ptr [r13]
	mov	rdi, r13
	mov	rdx, r15
	call	qword ptr [rax + 96]
	cmp	rax, r15
	jne	LBB27_20
LBB27_18:
	mov	qword ptr [r12 + 24], 0
	jmp	LBB27_21
LBB27_20:
	xor	r13d, r13d
LBB27_21:
	mov	rax, r13
	add	rsp, 56
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB27_22:
Ltmp299:
	mov	rbx, rax
	test	byte ptr [rbp - 64], 1
	je	LBB27_24
## %bb.23:
	mov	rdi, qword ptr [rbp - 48]
	call	__ZdlPv
LBB27_24:
	mov	rdi, rbx
	call	__Unwind_Resume
	ud2
Lfunc_end9:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table27:
Lexception9:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end9-Lcst_begin9
Lcst_begin9:
	.uleb128 Lfunc_begin9-Lfunc_begin9 ## >> Call Site 1 <<
	.uleb128 Ltmp297-Lfunc_begin9   ##   Call between Lfunc_begin9 and Ltmp297
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp297-Lfunc_begin9   ## >> Call Site 2 <<
	.uleb128 Ltmp298-Ltmp297        ##   Call between Ltmp297 and Ltmp298
	.uleb128 Ltmp299-Lfunc_begin9   ##     jumps to Ltmp299
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp298-Lfunc_begin9   ## >> Call Site 3 <<
	.uleb128 Lfunc_end9-Ltmp298     ##   Call between Ltmp298 and Lfunc_end9
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end9:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv ## -- Begin function _ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
	.weak_def_can_be_hidden	__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
	.p2align	4, 0x90
__ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv: ## @_ZNKSt3__115basic_stringbufIcNS_11char_traitsIcEENS_9allocatorIcEEE3strEv
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r14, rdi
	mov	eax, dword ptr [rsi + 96]
	test	al, 16
	jne	LBB28_3
## %bb.1:
	test	al, 8
	jne	LBB28_8
## %bb.2:
	mov	qword ptr [r14 + 16], 0
	mov	qword ptr [r14 + 8], 0
	mov	qword ptr [r14], 0
	jmp	LBB28_41
LBB28_3:
	mov	rax, qword ptr [rsi + 48]
	mov	r12, qword ptr [rsi + 88]
	cmp	r12, rax
	jae	LBB28_5
## %bb.4:
	mov	qword ptr [rsi + 88], rax
	mov	r12, rax
LBB28_5:
	mov	rbx, qword ptr [rsi + 40]
	mov	r13, r12
	sub	r13, rbx
	cmp	r13, -16
	jae	LBB28_42
## %bb.6:
	cmp	r13, 22
	ja	LBB28_11
## %bb.7:
	lea	eax, [r13 + r13]
	mov	byte ptr [r14], al
	mov	rax, r14
	inc	rax
	cmp	rbx, r12
	jne	LBB28_12
	jmp	LBB28_40
LBB28_8:
	mov	rbx, qword ptr [rsi + 16]
	mov	r12, qword ptr [rsi + 32]
	mov	r13, r12
	sub	r13, rbx
	cmp	r13, -16
	jae	LBB28_42
## %bb.9:
	cmp	r13, 22
	ja	LBB28_17
## %bb.10:
	lea	eax, [r13 + r13]
	mov	byte ptr [r14], al
	mov	rax, r14
	inc	rax
	cmp	rbx, r12
	jne	LBB28_18
	jmp	LBB28_40
LBB28_11:
	lea	r15, [r13 + 16]
	and	r15, -16
	mov	rdi, r15
	call	__Znwm
	mov	qword ptr [r14 + 16], rax
	or	r15, 1
	mov	qword ptr [r14], r15
	mov	qword ptr [r14 + 8], r13
	cmp	rbx, r12
	je	LBB28_40
LBB28_12:
	cmp	r13, 32
	jb	LBB28_30
## %bb.13:
	cmp	rax, r12
	jae	LBB28_15
## %bb.14:
	lea	rcx, [rax + r13]
	cmp	rbx, rcx
	jb	LBB28_30
LBB28_15:
	mov	rcx, r13
	and	rcx, -32
	lea	rsi, [rcx - 32]
	mov	rdi, rsi
	shr	rdi, 5
	inc	rdi
	mov	edx, edi
	and	edx, 3
	cmp	rsi, 96
	jae	LBB28_23
## %bb.16:
	xor	esi, esi
	jmp	LBB28_25
LBB28_17:
	lea	r15, [r13 + 16]
	and	r15, -16
	mov	rdi, r15
	call	__Znwm
	mov	qword ptr [r14 + 16], rax
	or	r15, 1
	mov	qword ptr [r14], r15
	mov	qword ptr [r14 + 8], r13
	cmp	rbx, r12
	je	LBB28_40
LBB28_18:
	cmp	r13, 32
	jb	LBB28_39
## %bb.19:
	cmp	rax, r12
	jae	LBB28_21
## %bb.20:
	lea	rcx, [rax + r13]
	cmp	rbx, rcx
	jb	LBB28_39
LBB28_21:
	mov	rcx, r13
	and	rcx, -32
	lea	rdi, [rcx - 32]
	mov	rsi, rdi
	shr	rsi, 5
	inc	rsi
	mov	edx, esi
	and	edx, 3
	cmp	rdi, 96
	jae	LBB28_32
## %bb.22:
	xor	esi, esi
	jmp	LBB28_34
LBB28_23:
	sub	rdi, rdx
	xor	esi, esi
	.p2align	4, 0x90
LBB28_24:                               ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rbx + rsi]
	movups	xmm1, xmmword ptr [rbx + rsi + 16]
	movups	xmmword ptr [rax + rsi], xmm0
	movups	xmmword ptr [rax + rsi + 16], xmm1
	movups	xmm0, xmmword ptr [rbx + rsi + 32]
	movups	xmm1, xmmword ptr [rbx + rsi + 48]
	movups	xmmword ptr [rax + rsi + 32], xmm0
	movups	xmmword ptr [rax + rsi + 48], xmm1
	movups	xmm0, xmmword ptr [rbx + rsi + 64]
	movups	xmm1, xmmword ptr [rbx + rsi + 80]
	movups	xmmword ptr [rax + rsi + 64], xmm0
	movups	xmmword ptr [rax + rsi + 80], xmm1
	movups	xmm0, xmmword ptr [rbx + rsi + 96]
	movups	xmm1, xmmword ptr [rbx + rsi + 112]
	movups	xmmword ptr [rax + rsi + 96], xmm0
	movups	xmmword ptr [rax + rsi + 112], xmm1
	sub	rsi, -128
	add	rdi, -4
	jne	LBB28_24
LBB28_25:
	test	rdx, rdx
	je	LBB28_28
## %bb.26:
	add	rsi, 16
	neg	rdx
	.p2align	4, 0x90
LBB28_27:                               ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rbx + rsi - 16]
	movups	xmm1, xmmword ptr [rbx + rsi]
	movups	xmmword ptr [rax + rsi - 16], xmm0
	movups	xmmword ptr [rax + rsi], xmm1
	add	rsi, 32
	inc	rdx
	jne	LBB28_27
LBB28_28:
	add	rax, rcx
	cmp	rcx, r13
	je	LBB28_40
## %bb.29:
	add	rbx, rcx
	.p2align	4, 0x90
LBB28_30:                               ## =>This Inner Loop Header: Depth=1
	movzx	ecx, byte ptr [rbx]
	mov	byte ptr [rax], cl
	inc	rbx
	inc	rax
	cmp	r12, rbx
	jne	LBB28_30
	jmp	LBB28_40
LBB28_32:
	mov	rdi, rdx
	sub	rdi, rsi
	xor	esi, esi
	.p2align	4, 0x90
LBB28_33:                               ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rbx + rsi]
	movups	xmm1, xmmword ptr [rbx + rsi + 16]
	movups	xmmword ptr [rax + rsi], xmm0
	movups	xmmword ptr [rax + rsi + 16], xmm1
	movups	xmm0, xmmword ptr [rbx + rsi + 32]
	movups	xmm1, xmmword ptr [rbx + rsi + 48]
	movups	xmmword ptr [rax + rsi + 32], xmm0
	movups	xmmword ptr [rax + rsi + 48], xmm1
	movups	xmm0, xmmword ptr [rbx + rsi + 64]
	movups	xmm1, xmmword ptr [rbx + rsi + 80]
	movups	xmmword ptr [rax + rsi + 64], xmm0
	movups	xmmword ptr [rax + rsi + 80], xmm1
	movups	xmm0, xmmword ptr [rbx + rsi + 96]
	movups	xmm1, xmmword ptr [rbx + rsi + 112]
	movups	xmmword ptr [rax + rsi + 96], xmm0
	movups	xmmword ptr [rax + rsi + 112], xmm1
	sub	rsi, -128
	add	rdi, 4
	jne	LBB28_33
LBB28_34:
	test	rdx, rdx
	je	LBB28_37
## %bb.35:
	add	rsi, 16
	neg	rdx
	.p2align	4, 0x90
LBB28_36:                               ## =>This Inner Loop Header: Depth=1
	movups	xmm0, xmmword ptr [rbx + rsi - 16]
	movups	xmm1, xmmword ptr [rbx + rsi]
	movups	xmmword ptr [rax + rsi - 16], xmm0
	movups	xmmword ptr [rax + rsi], xmm1
	add	rsi, 32
	inc	rdx
	jne	LBB28_36
LBB28_37:
	add	rax, rcx
	cmp	r13, rcx
	je	LBB28_40
## %bb.38:
	add	rbx, rcx
	.p2align	4, 0x90
LBB28_39:                               ## =>This Inner Loop Header: Depth=1
	movzx	ecx, byte ptr [rbx]
	mov	byte ptr [rax], cl
	inc	rbx
	inc	rax
	cmp	r12, rbx
	jne	LBB28_39
LBB28_40:
	mov	byte ptr [rax], 0
LBB28_41:
	mov	rax, r14
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB28_42:
	mov	rdi, r14
	call	__ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _ZN10ContiguousIsEC2Emsm
LCPI29_0:
	.long	1593835520              ## float 9.22337203E+18
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN10ContiguousIsEC2Emsm
	.weak_def_can_be_hidden	__ZN10ContiguousIsEC2Emsm
	.p2align	4, 0x90
__ZN10ContiguousIsEC2Emsm:              ## @_ZN10ContiguousIsEC2Emsm
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	rbx
	push	rax
	.cfi_offset rbx, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r15d, edx
	mov	r14, rdi
	mov	qword ptr [rdi], rcx
	mov	rax, rcx
	shr	rax
	test	rsi, rsi
	js	LBB29_1
## %bb.2:
	cvtsi2ss	xmm0, rsi
	jmp	LBB29_3
LBB29_1:
	mov	rdx, rsi
	shr	rdx
	mov	edi, esi
	and	edi, 1
	or	rdi, rdx
	cvtsi2ss	xmm0, rdi
	addss	xmm0, xmm0
LBB29_3:
	cvtsi2ss	xmm1, rax
	divss	xmm0, xmm1
	roundss	xmm0, xmm0, 10
	mulss	xmm0, xmm1
	movss	xmm1, dword ptr [rip + LCPI29_0] ## xmm1 = mem[0],zero,zero,zero
	movaps	xmm2, xmm0
	subss	xmm2, xmm1
	cvttss2si	rax, xmm2
	movabs	rdi, -9223372036854775808
	xor	rdi, rax
	cvttss2si	rdx, xmm0
	ucomiss	xmm0, xmm1
	cmovae	rdx, rdi
	mov	qword ptr [r14 + 8], rdx
	mov	qword ptr [r14 + 16], rsi
	add	rdx, rdx
	cmp	rcx, 1
	jne	LBB29_5
## %bb.4:
	mov	rdi, rdx
	call	_malloc
	jmp	LBB29_7
LBB29_5:
	lea	rax, [rcx - 1]
	test	rcx, rax
	mov	esi, 8
	cmovne	rsi, rcx
	cmp	rcx, 8
	cmovae	rsi, rcx
	lea	rdi, [rbp - 32]
	call	_posix_memalign
	test	eax, eax
	jne	LBB29_21
## %bb.6:
	mov	rax, qword ptr [rbp - 32]
LBB29_7:
	mov	qword ptr [r14 + 24], rax
	test	rax, rax
	je	LBB29_22
## %bb.8:
	mov	rcx, qword ptr [r14 + 16]
	test	rcx, rcx
	je	LBB29_20
## %bb.9:
	cmp	rcx, 15
	ja	LBB29_12
## %bb.10:
	xor	edx, edx
	jmp	LBB29_11
LBB29_12:
	mov	rdx, rcx
	and	rdx, -16
	movd	xmm0, r15d
	pshuflw	xmm0, xmm0, 224         ## xmm0 = xmm0[0,0,2,3,4,5,6,7]
	pshufd	xmm0, xmm0, 0           ## xmm0 = xmm0[0,0,0,0]
	lea	rbx, [rdx - 16]
	mov	rdi, rbx
	shr	rdi, 4
	inc	rdi
	mov	esi, edi
	and	esi, 7
	cmp	rbx, 112
	jae	LBB29_14
## %bb.13:
	xor	ebx, ebx
	jmp	LBB29_16
LBB29_14:
	sub	rdi, rsi
	xor	ebx, ebx
	.p2align	4, 0x90
LBB29_15:                               ## =>This Inner Loop Header: Depth=1
	movdqu	xmmword ptr [rax + 2*rbx], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 16], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 32], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 48], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 64], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 80], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 96], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 112], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 128], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 144], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 160], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 176], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 192], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 208], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 224], xmm0
	movdqu	xmmword ptr [rax + 2*rbx + 240], xmm0
	sub	rbx, -128
	add	rdi, -8
	jne	LBB29_15
LBB29_16:
	test	rsi, rsi
	je	LBB29_19
## %bb.17:
	lea	rdi, [rax + 2*rbx + 16]
	neg	rsi
	.p2align	4, 0x90
LBB29_18:                               ## =>This Inner Loop Header: Depth=1
	movdqu	xmmword ptr [rdi - 16], xmm0
	movdqu	xmmword ptr [rdi], xmm0
	add	rdi, 32
	inc	rsi
	jne	LBB29_18
LBB29_19:
	cmp	rcx, rdx
	je	LBB29_20
	.p2align	4, 0x90
LBB29_11:                               ## =>This Inner Loop Header: Depth=1
	mov	word ptr [rax + 2*rdx], r15w
	inc	rdx
	cmp	rdx, rcx
	jb	LBB29_11
LBB29_20:
	add	rsp, 8
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB29_21:
	mov	qword ptr [r14 + 24], 0
LBB29_22:
	mov	edi, 1
	call	___cxa_allocate_exception
	mov	rsi, qword ptr [rip + __ZTI15MemoryException@GOTPCREL]
	mov	rdi, rax
	xor	edx, edx
	call	___cxa_throw
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _ZN10ContiguousIsEC2Emm
LCPI30_0:
	.long	1593835520              ## float 9.22337203E+18
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN10ContiguousIsEC2Emm
	.weak_def_can_be_hidden	__ZN10ContiguousIsEC2Emm
	.p2align	4, 0x90
__ZN10ContiguousIsEC2Emm:               ## @_ZN10ContiguousIsEC2Emm
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdi
	mov	qword ptr [rdi], rdx
	mov	rax, rdx
	shr	rax
	test	rsi, rsi
	js	LBB30_1
## %bb.2:
	cvtsi2ss	xmm0, rsi
	jmp	LBB30_3
LBB30_1:
	mov	rcx, rsi
	shr	rcx
	mov	edi, esi
	and	edi, 1
	or	rdi, rcx
	cvtsi2ss	xmm0, rdi
	addss	xmm0, xmm0
LBB30_3:
	cvtsi2ss	xmm1, rax
	divss	xmm0, xmm1
	roundss	xmm0, xmm0, 10
	mulss	xmm0, xmm1
	movss	xmm1, dword ptr [rip + LCPI30_0] ## xmm1 = mem[0],zero,zero,zero
	movaps	xmm2, xmm0
	subss	xmm2, xmm1
	cvttss2si	rax, xmm2
	movabs	rcx, -9223372036854775808
	xor	rcx, rax
	cvttss2si	rax, xmm0
	ucomiss	xmm0, xmm1
	cmovae	rax, rcx
	mov	qword ptr [rbx + 8], rax
	mov	qword ptr [rbx + 16], rsi
	add	rax, rax
	cmp	rdx, 1
	jne	LBB30_5
## %bb.4:
	mov	rdi, rax
	call	_malloc
	jmp	LBB30_7
LBB30_5:
	lea	rcx, [rdx - 1]
	test	rdx, rcx
	mov	esi, 8
	cmovne	rsi, rdx
	cmp	rdx, 8
	cmovae	rsi, rdx
	lea	rdi, [rbp - 16]
	mov	rdx, rax
	call	_posix_memalign
	test	eax, eax
	jne	LBB30_9
## %bb.6:
	mov	rax, qword ptr [rbp - 16]
LBB30_7:
	mov	qword ptr [rbx + 24], rax
	test	rax, rax
	je	LBB30_10
## %bb.8:
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
LBB30_9:
	mov	qword ptr [rbx + 24], 0
LBB30_10:
	mov	edi, 1
	call	___cxa_allocate_exception
	mov	rsi, qword ptr [rip + __ZTI15MemoryException@GOTPCREL]
	mov	rdi, rax
	xor	edx, edx
	call	___cxa_throw
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc ## -- Begin function _ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
	.weak_def_can_be_hidden	__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
	.p2align	4, 0x90
__ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc: ## @_ZN6timing9TimerBaseINSt3__16chrono12steady_clockENS2_8durationIxNS1_5ratioILl1ELl1000EEEEEE4timeEPKc
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r14, rsi
	mov	r15, rdi
	call	__ZNSt3__16chrono12steady_clock3nowEv
	sub	rax, qword ptr [r15]
	movabs	rcx, 4835703278458516699
	imul	rcx
	mov	r12, rdx
	mov	rax, rdx
	shr	rax, 63
	sar	r12, 18
	add	r12, rax
	mov	r13b, byte ptr [r14]
	mov	rbx, qword ptr [r15 + 8]
	mov	rdi, rbx
	call	_strlen
	mov	rdi, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	mov	rsi, rbx
	mov	rdx, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	test	r13b, r13b
	je	LBB31_2
## %bb.1:
	lea	rsi, [rip + L_.str.27]
	mov	edx, 10
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	mov	rbx, rax
	mov	rdi, r14
	call	_strlen
	mov	rdi, rbx
	mov	rsi, r14
	mov	rdx, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	lea	rsi, [rip + L_.str.28]
	mov	edx, 8
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	mov	rdi, rax
	mov	rsi, r12
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEx
	lea	rsi, [rip + L_.str.29]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	mov	byte ptr [rbp - 42], 109
	lea	rsi, [rbp - 42]
	jmp	LBB31_3
LBB31_2:
	lea	rsi, [rip + L_.str.31]
	mov	edx, 13
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	mov	rdi, rax
	mov	rsi, r12
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEx
	lea	rsi, [rip + L_.str.29]
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	mov	byte ptr [rbp - 41], 109
	lea	rsi, [rbp - 41]
LBB31_3:
	mov	edx, 1
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	lea	rsi, [rip + L_.str.30]
	mov	edx, 2
	mov	rdi, rax
	call	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6VProxyIsEC1ERK3VexIsE ## -- Begin function _ZN6VProxyIsEC1ERK3VexIsE
	.weak_def_can_be_hidden	__ZN6VProxyIsEC1ERK3VexIsE
	.p2align	4, 0x90
__ZN6VProxyIsEC1ERK3VexIsE:             ## @_ZN6VProxyIsEC1ERK3VexIsE
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rdi], rsi
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6vex_opI6VProxyIsELc43ES1_EC1ES1_S1_ ## -- Begin function _ZN6vex_opI6VProxyIsELc43ES1_EC1ES1_S1_
	.weak_def_can_be_hidden	__ZN6vex_opI6VProxyIsELc43ES1_EC1ES1_S1_
	.p2align	4, 0x90
__ZN6vex_opI6VProxyIsELc43ES1_EC1ES1_S1_: ## @_ZN6vex_opI6VProxyIsELc43ES1_EC1ES1_S1_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rdi], rsi
	mov	qword ptr [rdi + 8], rdx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6vex_opIS_I6VProxyIsELc43ES1_ELc43ES1_EC1ES2_S1_ ## -- Begin function _ZN6vex_opIS_I6VProxyIsELc43ES1_ELc43ES1_EC1ES2_S1_
	.weak_def_can_be_hidden	__ZN6vex_opIS_I6VProxyIsELc43ES1_ELc43ES1_EC1ES2_S1_
	.p2align	4, 0x90
__ZN6vex_opIS_I6VProxyIsELc43ES1_ELc43ES1_EC1ES2_S1_: ## @_ZN6vex_opIS_I6VProxyIsELc43ES1_ELc43ES1_EC1ES2_S1_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rdi], rsi
	mov	qword ptr [rdi + 8], rdx
	mov	qword ptr [rdi + 16], rcx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN3ValIsEC1Es         ## -- Begin function _ZN3ValIsEC1Es
	.weak_def_can_be_hidden	__ZN3ValIsEC1Es
	.p2align	4, 0x90
__ZN3ValIsEC1Es:                        ## @_ZN3ValIsEC1Es
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	word ptr [rdi], si
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6vex_opIS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEEC1ES3_S5_ ## -- Begin function _ZN6vex_opIS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEEC1ES3_S5_
	.weak_def_can_be_hidden	__ZN6vex_opIS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEEC1ES3_S5_
	.p2align	4, 0x90
__ZN6vex_opIS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEEC1ES3_S5_: ## @_ZN6vex_opIS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEEC1ES3_S5_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rax, qword ptr [rbp + 32]
	mov	qword ptr [rdi + 16], rax
	vmovaps	xmm0, xmmword ptr [rbp + 16]
	vmovups	xmmword ptr [rdi], xmm0
	mov	word ptr [rdi + 24], si
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_EC1ES6_S1_ ## -- Begin function _ZN6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_EC1ES6_S1_
	.weak_def_can_be_hidden	__ZN6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_EC1ES6_S1_
	.p2align	4, 0x90
__ZN6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_EC1ES6_S1_: ## @_ZN6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_EC1ES6_S1_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	vmovups	ymm0, ymmword ptr [rbp + 16]
	vmovups	ymmword ptr [rdi], ymm0
	mov	qword ptr [rdi + 32], rsi
	pop	rbp
	vzeroupper
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_E4evalEv ## -- Begin function _ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_E4evalEv
	.weak_def_can_be_hidden	__ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_E4evalEv
	.p2align	4, 0x90
__ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_E4evalEv: ## @_ZNK6vex_opIS_IS_IS_I6VProxyIsELc43ES1_ELc43ES1_ELc43E3ValIsEELc43ES1_E4evalEv
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 64
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r12, rsi
	mov	r14, rdi
	call	__ZN3VexIsE10simd_flagsEv
	mov	byte ptr [rsp], al      ## 1-byte Spill
	mov	rbx, qword ptr [r12]
	mov	rdi, qword ptr [r12 + 8]
	mov	rax, qword ptr [rbx + 8]
	mov	r13, qword ptr [rbx + 16]
	mov	rcx, qword ptr [rdi + 8]
	mov	rdx, qword ptr [rdi + 16]
	cmp	rdx, r13
	cmovb	r13, rdx
	mov	r10, qword ptr [r12 + 16]
	mov	rsi, qword ptr [r10 + 8]
	mov	rdx, qword ptr [r10 + 16]
	cmp	rdx, r13
	cmovb	r13, rdx
	mov	r8, qword ptr [r12 + 32]
	mov	r9, qword ptr [r8 + 8]
	mov	rdx, qword ptr [r8 + 16]
	cmp	rdx, r13
	cmovb	r13, rdx
	add	rax, rax
	xor	edx, edx
	div	qword ptr [rbx]
	mov	r15, rax
	add	rcx, rcx
	mov	rax, rcx
	xor	edx, edx
	div	qword ptr [rdi]
	cmp	rax, r15
	cmovb	r15, rax
	add	rsi, rsi
	mov	rax, rsi
	xor	edx, edx
	div	qword ptr [r10]
	cmp	rax, r15
	cmovb	r15, rax
	add	r9, r9
	mov	rax, r9
	xor	edx, edx
	div	qword ptr [r8]
	cmp	rax, r15
	cmovb	r15, rax
	call	__ZN3VexIsE10simd_flagsEv
	and	al, 64
	shr	al, 6
	movzx	edx, al
	shl	rdx, 4
	add	rdx, 16
	mov	rdi, r14
	mov	rsi, r13
	call	__ZN10ContiguousIsEC2Emm
	test	byte ptr [rsp], 64      ## 1-byte Folded Reload
	jne	LBB38_7
## %bb.1:
	test	r15, r15
	je	LBB38_14
## %bb.2:
	xor	ebx, ebx
	mov	rdx, qword ptr [rip + __ZGVZNK3ValIsE11get_sse_regEmE3res@GOTPCREL]
	mov	rsi, qword ptr [rip + __ZZNK3ValIsE11get_sse_regEmE3res@GOTPCREL]
	xor	r13d, r13d
	.p2align	4, 0x90
LBB38_3:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [r12]
	mov	rcx, qword ptr [r12 + 8]
	mov	rax, qword ptr [rax + 24]
	mov	rcx, qword ptr [rcx + 24]
	vmovdqa	xmm0, xmmword ptr [rcx + rbx]
	vpaddw	xmm0, xmm0, xmmword ptr [rax + rbx]
	mov	rax, qword ptr [r12 + 16]
	mov	rax, qword ptr [rax + 24]
	vpaddw	xmm0, xmm0, xmmword ptr [rax + rbx]
	movzx	eax, byte ptr [rdx]
	test	al, al
	je	LBB38_4
LBB38_6:                                ##   in Loop: Header=BB38_3 Depth=1
	vpaddw	xmm0, xmm0, xmmword ptr [rsi]
	mov	rax, qword ptr [r12 + 32]
	mov	rax, qword ptr [rax + 24]
	vpaddw	xmm0, xmm0, xmmword ptr [rax + rbx]
	mov	rax, qword ptr [r14 + 24]
	vmovdqa	xmmword ptr [rax + rbx], xmm0
	inc	r13
	add	rbx, 16
	cmp	r13, r15
	jb	LBB38_3
	jmp	LBB38_14
LBB38_4:                                ##   in Loop: Header=BB38_3 Depth=1
	mov	rdi, qword ptr [rip + __ZGVZNK3ValIsE11get_sse_regEmE3res@GOTPCREL]
	vmovdqa	xmmword ptr [rsp], xmm0 ## 16-byte Spill
	call	___cxa_guard_acquire
	vmovdqa	xmm0, xmmword ptr [rsp] ## 16-byte Reload
	mov	rsi, qword ptr [rip + __ZZNK3ValIsE11get_sse_regEmE3res@GOTPCREL]
	mov	rdx, qword ptr [rip + __ZGVZNK3ValIsE11get_sse_regEmE3res@GOTPCREL]
	test	eax, eax
	je	LBB38_6
## %bb.5:                               ##   in Loop: Header=BB38_3 Depth=1
	vpbroadcastw	xmm0, word ptr [r12 + 24]
	vmovdqa	xmmword ptr [rsi], xmm0
	mov	rdi, qword ptr [rip + __ZGVZNK3ValIsE11get_sse_regEmE3res@GOTPCREL]
	call	___cxa_guard_release
	vmovdqa	xmm0, xmmword ptr [rsp] ## 16-byte Reload
	mov	rsi, qword ptr [rip + __ZZNK3ValIsE11get_sse_regEmE3res@GOTPCREL]
	mov	rdx, qword ptr [rip + __ZGVZNK3ValIsE11get_sse_regEmE3res@GOTPCREL]
	jmp	LBB38_6
LBB38_7:
	## InlineAsm Start
	##proxy add
	## InlineAsm End
	test	r15, r15
	je	LBB38_13
## %bb.8:
	xor	ebx, ebx
	mov	rdx, qword ptr [rip + __ZGVZNK3ValIsE11get_avx_regEmE3res@GOTPCREL]
	mov	rsi, qword ptr [rip + __ZZNK3ValIsE11get_avx_regEmE3res@GOTPCREL]
	xor	r13d, r13d
	.p2align	4, 0x90
LBB38_9:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [r12]
	mov	rcx, qword ptr [r12 + 8]
	mov	rax, qword ptr [rax + 24]
	mov	rcx, qword ptr [rcx + 24]
	vmovdqa	ymm0, ymmword ptr [rcx + rbx]
	vpaddw	ymm0, ymm0, ymmword ptr [rax + rbx]
	mov	rax, qword ptr [r12 + 16]
	mov	rax, qword ptr [rax + 24]
	vpaddw	ymm0, ymm0, ymmword ptr [rax + rbx]
	movzx	eax, byte ptr [rdx]
	test	al, al
	je	LBB38_10
LBB38_12:                               ##   in Loop: Header=BB38_9 Depth=1
	vpaddw	ymm0, ymm0, ymmword ptr [rsi]
	mov	rax, qword ptr [r12 + 32]
	mov	rax, qword ptr [rax + 24]
	vpaddw	ymm0, ymm0, ymmword ptr [rax + rbx]
	mov	rax, qword ptr [r14 + 24]
	vmovdqa	ymmword ptr [rax + rbx], ymm0
	inc	r13
	add	rbx, 32
	cmp	r13, r15
	jb	LBB38_9
	jmp	LBB38_13
LBB38_10:                               ##   in Loop: Header=BB38_9 Depth=1
	mov	rdi, qword ptr [rip + __ZGVZNK3ValIsE11get_avx_regEmE3res@GOTPCREL]
	vmovdqa	ymmword ptr [rsp], ymm0 ## 32-byte Spill
	vzeroupper
	call	___cxa_guard_acquire
	vmovdqa	ymm0, ymmword ptr [rsp] ## 32-byte Reload
	mov	rsi, qword ptr [rip + __ZZNK3ValIsE11get_avx_regEmE3res@GOTPCREL]
	mov	rdx, qword ptr [rip + __ZGVZNK3ValIsE11get_avx_regEmE3res@GOTPCREL]
	test	eax, eax
	je	LBB38_12
## %bb.11:                              ##   in Loop: Header=BB38_9 Depth=1
	vpbroadcastw	ymm0, word ptr [r12 + 24]
	vmovdqu	ymmword ptr [rsi], ymm0
	mov	rdi, qword ptr [rip + __ZGVZNK3ValIsE11get_avx_regEmE3res@GOTPCREL]
	vzeroupper
	call	___cxa_guard_release
	vmovdqa	ymm0, ymmword ptr [rsp] ## 32-byte Reload
	mov	rsi, qword ptr [rip + __ZZNK3ValIsE11get_avx_regEmE3res@GOTPCREL]
	mov	rdx, qword ptr [rip + __ZGVZNK3ValIsE11get_avx_regEmE3res@GOTPCREL]
	jmp	LBB38_12
LBB38_13:
	## InlineAsm Start
	##proxy add
	## InlineAsm End
LBB38_14:
	mov	rax, r14
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
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
	.asciz	"AVX2     : "

L_.str.10:                              ## @.str.10
	.asciz	"popcount : "

L_.str.11:                              ## @.str.11
	.asciz	"L2 Cache:\n"

L_.str.12:                              ## @.str.12
	.asciz	"Line size (B)   : "

L_.str.13:                              ## @.str.13
	.asciz	"Assoc. Type     : "

L_.str.14:                              ## @.str.14
	.asciz	"x\n"

L_.str.15:                              ## @.str.15
	.asciz	"Cache Size (KB) :"

L_.str.16:                              ## @.str.16
	.asciz	"vector for"

L_.str.17:                              ## @.str.17
	.asciz	"for-loop"

L_.str.18:                              ## @.str.18
	.asciz	"contiguous for-loop"

L_.str.19:                              ## @.str.19
	.asciz	"a + b"

L_.str.20:                              ## @.str.20
	.asciz	"valarray"

L_.str.21:                              ## @.str.21
	.asciz	"PROXY:\n"

L_.str.22:                              ## @.str.22
	.asciz	"op<a, '+', b>"

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
L_.str.23:                              ## @.str.23
	.asciz	"Enabled"

L_.str.24:                              ## @.str.24
	.asciz	"Disabled"

	.section	__DATA,__data
	.globl	__ZZN3VexIsE10simd_flagsEvE3cpu ## @_ZZN3VexIsE10simd_flagsEvE3cpu
	.weak_definition	__ZZN3VexIsE10simd_flagsEvE3cpu
	.p2align	3
__ZZN3VexIsE10simd_flagsEvE3cpu:
	.space	24

	.globl	__ZGVZN3VexIsE10simd_flagsEvE3cpu ## @_ZGVZN3VexIsE10simd_flagsEvE3cpu
	.weak_definition	__ZGVZN3VexIsE10simd_flagsEvE3cpu
	.p2align	3
__ZGVZN3VexIsE10simd_flagsEvE3cpu:
	.quad	0                       ## 0x0

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
L_.str.26:                              ## @.str.26
	.space	1

L_.str.27:                              ## @.str.27
	.asciz	" timer @ ["

L_.str.28:                              ## @.str.28
	.asciz	"] time: "

L_.str.29:                              ## @.str.29
	.asciz	" "

L_.str.30:                              ## @.str.30
	.asciz	"s\n"

L_.str.31:                              ## @.str.31
	.asciz	" timer time: "

	.section	__DATA,__data
	.globl	__ZZNK3ValIsE11get_avx_regEmE3res ## @_ZZNK3ValIsE11get_avx_regEmE3res
	.weak_definition	__ZZNK3ValIsE11get_avx_regEmE3res
	.p2align	5
__ZZNK3ValIsE11get_avx_regEmE3res:
	.space	32

	.globl	__ZGVZNK3ValIsE11get_avx_regEmE3res ## @_ZGVZNK3ValIsE11get_avx_regEmE3res
	.weak_definition	__ZGVZNK3ValIsE11get_avx_regEmE3res
	.p2align	3
__ZGVZNK3ValIsE11get_avx_regEmE3res:
	.quad	0                       ## 0x0

	.globl	__ZZNK3ValIsE11get_sse_regEmE3res ## @_ZZNK3ValIsE11get_sse_regEmE3res
	.weak_definition	__ZZNK3ValIsE11get_sse_regEmE3res
	.p2align	4
__ZZNK3ValIsE11get_sse_regEmE3res:
	.space	16

	.globl	__ZGVZNK3ValIsE11get_sse_regEmE3res ## @_ZGVZNK3ValIsE11get_sse_regEmE3res
	.weak_definition	__ZGVZNK3ValIsE11get_sse_regEmE3res
	.p2align	3
__ZGVZNK3ValIsE11get_sse_regEmE3res:
	.quad	0                       ## 0x0

	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## @.memset_pattern
L_.memset_pattern:
	.short	4                       ## 0x4
	.short	4                       ## 0x4
	.short	4                       ## 0x4
	.short	4                       ## 0x4
	.short	4                       ## 0x4
	.short	4                       ## 0x4
	.short	4                       ## 0x4
	.short	4                       ## 0x4

	.p2align	4               ## @.memset_pattern.38
L_.memset_pattern.38:
	.short	11                      ## 0xb
	.short	11                      ## 0xb
	.short	11                      ## 0xb
	.short	11                      ## 0xb
	.short	11                      ## 0xb
	.short	11                      ## 0xb
	.short	11                      ## 0xb
	.short	11                      ## 0xb

	.p2align	4               ## @.memset_pattern.39
L_.memset_pattern.39:
	.short	3                       ## 0x3
	.short	3                       ## 0x3
	.short	3                       ## 0x3
	.short	3                       ## 0x3
	.short	3                       ## 0x3
	.short	3                       ## 0x3
	.short	3                       ## 0x3
	.short	3                       ## 0x3

	.p2align	4               ## @.memset_pattern.40
L_.memset_pattern.40:
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7
	.short	7                       ## 0x7

.subsections_via_symbols
