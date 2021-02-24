///!!! DO NOT COMPILE AS AN INDEPENDENT FILE
#pragma once
#include "intrin_funcs.hh"

template<>
void Array<i16>::set_func_handlers()
{
    if (simd_flags() & SIMD::AVX2) {
        f_add = i16_add_avx;
    }
    else if (simd_flags() & SIMD::SSE2) {
        f_add = i16_add_sse;
    }
}


#if C_GCC // GCC SUPPORTS A GREAT FEATURE CALLED MULTIVERSIONING: (alas it doesn't work so well, at least on Mac)

// multiversioning doesn't work with template funcs!
template<>
__attribute__((always_inline))
inline func Array<i16>::operator+= (Array<i16> const& other) -> Array<i16>&
{
    //i16_add_gccmulti(*this, *this, other); // GCC MULTIVERSIONING: 117ms on MacOS
    
    // plain old if (GCC: 30ms on the SAME MacOS)
    if (simd_flags() & SIMD::AVX2) {
        auto size = other.size();
        for (size_t i=0; i < size; i+=16)
        {
            auto _a1 = iload_256(&other[i]);
            auto _a2 = iload_256(&(this->memory[i]));
            auto _res = _mm256_add_epi16(_a1, _a2);
            istore_256(&(this->memory[i]), _res);
        }
    }
    else {
        auto size = other.size();
        for (size_t i=0; i < size; i+=8)
        {
            auto _a1 = iload_128(&other[i]);
            auto _a2 = iload_128(&(this->memory[i]));
            auto _res = _mm_add_epi16(_a1, _a2);
            istore_128(&(this->memory[i]), _res);
        }
    }
    return *this;
     
}

#else

template<>
func Array<i16>::operator+= (Array<i16> const& other) -> Array<i16>&
{
    //this->f_add(*this, *this, other);
    //return *this;

    if (simd_flags() & SIMD::AVX2) {
        i16_add_avx(*this, *this, other);
    }
    else if (simd_flags() & SIMD::SSE2) {
        i16_add_sse(*this, *this, other);
    }
    return *this;
}
#endif

template <>
inline func operator+ (Array<i16> const& a1, Array<i16> const& a2) -> Array<i16>
{
    Array<i16> res (a1.size());
    return a1.f_add(res, a1, a2);
}


/*
template<typename Func>
func Array<i16>::map (Func f)
{
    return *this;//TODO: write function body
}
 */


template <typename T>
std::ostream& operator<< (std::ostream& os, Array<T> const& arr)
{
    os << arr.toStream();
    return os;
}
