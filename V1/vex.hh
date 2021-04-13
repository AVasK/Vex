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


template<typename T>
__attribute__((target("avx2")))
func Vex<T>::operator+= (Vex<T> const& other) -> Vex<T>&
{
    //auto n_regs = size_in_registers();
    if (simd_flags() & SIMD::AVX2) {
        std::cerr << "call to i16_add_avx\n";
        add_avx(*this, *this, other);
        // for (size_t i=0; i < n_regs; ++i)
        // {
        //     auto _r1 = load_avx(&this->memory[i * avx_reg<T>::offset]);
        //     auto _r2 = load_avx(&other.memory[i * avx_reg<T>::offset]);
        //     auto _res = _r1 + _r2;
        //     store_avx( &this->memory[i * avx_reg<T>::offset], _res );
        // }
    }
    // TODO: Check if SSE2 is available by default on all x64
    else if (simd_flags() & SIMD::SSE2) {
        add_sse(*this, *this, other);
        // for (size_t i=0; i < n_regs; ++i)
        // {
        //     auto _r1 = load_sse(&this->memory[i * sse_reg<T>::offset]);
        //     auto _r2 = load_sse(&other.memory[i * sse_reg<T>::offset]);
        //     auto _res = _r1 + _r2;
        //     store_sse( &this->memory[i * sse_reg<T>::offset], _res );
        // }
    }
    return *this;
}

template<typename T>
__attribute__((target("avx2")))
func Vex<T>::operator+= (T other) -> Vex<T>&
{
    auto n_regs = size_in_registers();
    
    if (simd_flags() & SIMD::AVX2) {
        // AVX2
        for (size_t i=0; i < n_regs; ++i)
        {
            //auto _r1 = load_avx(&a[i<<4]);
            //auto _r2 = _mm256_set1_epi16(value);
            //auto _res = op<'+'>(_r1, _r2);
            auto _r1 = load_avx(&this->memory[i*avx_reg<T>::offset]);
            auto _r2 = avx_reg<T>( other );
            auto _res = _r1 + _r2;
            store_avx( &this->memory[i*avx_reg<T>::offset], _res );
        }
    }
    else if (simd_flags() & SIMD::SSE2) {
        // SSE2
        for (size_t i=0; i < n_regs; ++i)
        {
            auto _r1 = load_sse(&this->memory[i*sse_reg<T>::offset]);
            auto _r2 = sse_reg<T>( other );
            auto _res = _r1 + _r2;
            store_sse( &this->memory[i*sse_reg<T>::offset], _res );
        }
    }
    return *this;
}

template <typename T>
__attribute__((target("avx2")))
func vex_add (Vex<T> const& a1, Vex<T> const& a2) -> Vex<T>
{
    // TODO: add min_size to for-loop part, mb try to make more generic...
    //auto len = std::min(a1.size(), a2.size());
    Vex<T> res (a1.size());
    auto n_regs = std::min(a1.size_in_registers(), a2.size_in_registers());

    if (a1.simd_flags() & SIMD::AVX2) {
        //i16_add_avx(res, a1, a2);
        for (size_t i=0; i < n_regs; ++i)
        {
            auto _r1 = load_avx(&a1[i * avx_reg<T>::offset]);
            auto _r2 = load_avx(&a2[i * avx_reg<T>::offset]);
            auto _res = _r1 + _r2;
            store_avx( &res[i * avx_reg<T>::offset], _res);
        }
    }
    else if (a1.simd_flags() & SIMD::SSE2) {
        //i16_add_sse(res, a1, a2);
        for (size_t i=0; i < n_regs; ++i)
        {
            auto _r1 = load_sse(&a1[i * sse_reg<T>::offset]);
            auto _r2 = load_sse(&a2[i * sse_reg<T>::offset]);
            auto _res = _r1 + _r2;
            store_sse( &res[i * sse_reg<T>::offset], _res);
        }
    }
    return res;
}


template<typename T>
__attribute__((target("avx2")))
inline func vex_add (Vex<T> const& a, T value) -> Vex<T>
{
    auto n_regs = a.size_in_registers();
    Vex<T> res (a.size());
    
    if (a.simd_flags() & SIMD::AVX2) {
        // AVX2
        for (size_t i=0; i < n_regs; ++i)
        {
            //auto _r1 = load_avx(&a[i<<4]).as_register();
            //auto _r2 = _mm256_set1_epi16(value);
            //auto _res = _mm256_adds_epi16(_r1, _r2);
            auto _r1 = load_avx(&a[i * avx_reg<T>::offset]);
            auto _r2 = avx_reg<T>( value );
            auto _res = _r1 + _r2;
            store_avx( &res[i * avx_reg<T>::offset], _res);
        }
    }
    else if (a.simd_flags() & SIMD::SSE2) {
        // SSE2
        for (size_t i=0; i < n_regs; ++i)
        {
            auto _r1 = load_sse(&a[i * sse_reg<T>::offset]);
            auto _r2 = sse_reg<T>( value );
            auto _res = _r1 + _r2;
            store_sse( &res[i * sse_reg<T>::offset], _res);
        }
    }
    return res;
}

template<typename T>
__attribute__((target("avx2")))
func vex_add (T value, Vex<T> const& vex) -> Vex<T>
{
    return vex_add(vex, value);
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
