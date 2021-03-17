///!!! DO NOT COMPILE AS AN INDEPENDENT FILE
#pragma once
#include "intrin_funcs.hh"

#if VEX_PTR_DISPATCH
template<>
void Vex<i16>::set_func_handlers()
{
    if (simd_flags() & SIMD::AVX2) {
        f_add = i16_add_avx;
    }
    else if (simd_flags() & SIMD::SSE2) {
        f_add = i16_add_sse;
    }
}
#endif


// GCC SUPPORTS A FEATURE CALLED MULTIVERSIONING: (alas it doesn't work so well, at least on Mac)
// Also, multiversioning doesn't work with template funcs!
// So, no GCC-specific specializations for now
//i16_add_gccmulti(*this, *this, other); // GCC MULTIVERSIONING: 117ms on MacOS
// plain old if (GCC: 30ms on the SAME MacOS)

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
