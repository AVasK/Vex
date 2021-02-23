///!!! DO NOT COMPILE AS AN INDEPENDENT FILE
#pragma once
#include "intrin_funcs.hh"

template<>
void Array<i16>::set_func_handlers()
{
    if (simd_flags() | SIMD::AVX2) {
        f_add = i16_add_avx;
    }
    else if (simd_flags() | SIMD::SSE2) {
        f_add = i16_add_sse;
    }
}


template<>
func Array<i16>::operator+= (Array<i16> const& other) -> Array<i16>&
{
    //this->f_add(*this, *this, other);
    //return *this;
#if C_GCC // GCC SUPPORTS A GREAT FEATURE CALLED MULTIVERSIONING:
    i16_add_gccmulti(*this, *this, other);
#else
    if (simd_flags() | SIMD::AVX2) {
        i16_add_avx(*this, *this, other);
    }
    else if (simd_flags() | SIMD::SSE2) {
        i16_add_sse(*this, *this, other);
    }
#endif
    return *this;
}


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
