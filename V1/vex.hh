// Copyright (c) 2021 Alex Vaskov

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#pragma once
#include "intrin_funcs.hh"

#include "SIMD_flags.set"

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

#include "SIMD_flags.discard"