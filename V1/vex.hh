///!!! DO NOT COMPILE AS AN INDEPENDENT FILE
#pragma once
#include "intrin_funcs.hh"

#ifdef ARCH_x86
    #if C_CLANG
        #pragma clang attribute push (__attribute__((target("sse, sse2, sse3, sse4.1, sse4.2, ssse3, avx, avx2"))), apply_to=function)
    #elif C_GCC
        #pragma GCC push_options
        #pragma GCC target("sse", "sse2", "sse3", "ssse3", "sse4.1", "sse4.2", "avx", "avx2")
    #endif
#endif

template<>
func Vex<i16>::operator+= (Vex<i16> const& other) -> Vex<i16>&
{
    if (simd_flags() & SIMD::AVX2) {
        //i16_add_avx(*this, *this, other);
        I16_256(*this, *this, other, _mm256_add_epi16);
    }
    // TODO: Check if SSE2 is available by default on all x64
    else if (simd_flags() & SIMD::SSE2) {
        //i16_add_sse(*this, *this, other);
        I16_128(*this, *this, other, _mm_add_epi16);
    }
    return *this;
}

template<>
func Vex<i16>::operator+= (i16 other) -> Vex<i16>&
{
    auto n_regs = size_in_registers();

    if (simd_flags() & SIMD::AVX2) {
        for (size_t i=0; i < n_regs; ++i)
        {
            auto _r1 = iload_256(&this->memory[i<<4]);
            auto _r2 = _mm256_set1_epi16(other);
            auto _res = _mm256_add_epi16(_r1, _r2);
            istore_256( &this->memory[i<<4], _res );
        }
    }
    else if (simd_flags() & SIMD::SSE2) {
        for (size_t i=0; i < n_regs; ++i)
        {
            auto _r1 = iload_128(&this->memory[i<<3]);
            auto _r2 = _mm_set1_epi16(other);
            auto _res = _mm_add_epi16(_r1, _r2);
            istore_128( &this->memory[i<<3], _res );
        }
    }
    return *this;
}

template <>
func operator+ (Vex<i16> const& a1, Vex<i16> const& a2) -> Vex<i16>
{
    Vex<i16> res (a1.size());
    if (a1.simd_flags() & SIMD::AVX2) {
        //i16_add_avx(res, a1, a2);
        I16_256(res, a1, a2, _mm256_add_epi16);
    }
    else if (a1.simd_flags() & SIMD::SSE2) {
        //i16_add_sse(res, a1, a2);
        I16_128(res, a1, a2, _mm_add_epi16);
    }
    return res;
}


template<>
func operator+ (Vex<i16> const& a, i16 value) -> Vex<i16>
{
    auto n_regs = a.size_in_registers();
    Vex<i16> res (a.size());
    
    if (a.simd_flags() & SIMD::AVX2) {
        // AVX2
        for (size_t i=0; i < n_regs; ++i)
        {
            auto _r1 = iload_256(&a[i<<4]);
            auto _r2 = _mm256_set1_epi16(value);
            auto _res = _mm256_add_epi16(_r1, _r2);
            istore_256( &res[i<<4], _res);
        }
    }
    else if (a.simd_flags() & SIMD::SSE2) {
        // SSE2
        for (size_t i=0; i < n_regs; ++i)
        {
            auto _r1 = iload_256(&a[i<<3]);
            auto _r2 = _mm256_set1_epi16(value);
            auto _res = _mm256_add_epi16(_r1, _r2);
            istore_256( &res[i<<3], _res);
        }
    }
    return res;
}

template<>
func operator+ (i16 value, Vex<i16> const& a) -> Vex<i16>
{
    return a+value;
}

/*
template<typename Func>
func Vex<i16>::map (Func f)
{
    return *this;//TODO: write function body
}
 */


template <typename T>
std::ostream& operator<< (std::ostream& os, Vex<T> const& arr)
{
    os << arr.toStream();
    return os;
}

#ifdef ARCH_x86
    #if C_CLANG
        #pragma clang attribute pop
    #elif C_GCC
        #pragma GCC pop_options
    #endif
#endif