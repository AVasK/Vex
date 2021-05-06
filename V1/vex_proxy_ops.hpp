// @: Overloads for vex_proxy eval computation
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

#include "vex.hpp"
#include "vex_ops.hpp"
#include "simd_types.hpp"
#include "simd_ops.hpp"
#include "x86_cpuid.hpp"

using CPUID::simd_flags;

template <char opcode>
struct eval_op {};

template<>
struct eval_op<'+'> {
    // compute for integral T
    template <typename T, typename V1, typename V2>
    static inline auto compute(Vex<T> & res, V1 const& v1, V2 const& v2) 
    -> typename std::enable_if<!std::is_floating_point<T>::value>::type
    {
    #ifdef __AVX2__
        mul_avx(res, v1, v2);
    #else

        auto flags = simd_flags();
        if ( flags & SIMD::AVX2 )
        { 
            add_avx(res, v1, v2);
        }
        else {
            add_sse(res, v1, v2);
        }
    #endif
    }

    // compute for floating point T
    template <typename T, typename V1, typename V2>
    static inline auto compute(Vex<T> & res, V1 const& v1, V2 const& v2) 
    -> typename std::enable_if<std::is_floating_point<T>::value>::type
    {
    #ifdef __AVX__
        mul_avx(res, v1, v2);
    #else

        auto flags = simd_flags();
        if ( flags & SIMD::AVX )
        { 
            add_avx(res, v1, v2);
        }
        else {
            add_sse(res, v1, v2);
        }
    #endif
    }
};

template<>
struct eval_op<'-'> {
    // compute for Integral T
    template <typename T, typename V1, typename V2>
    static inline auto compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    -> typename std::enable_if<std::is_integral<T>::value>::type
    {
    #ifdef __AVX2__
        mul_avx(res, v1, v2);
    #else

        auto flags = simd_flags();
        if ( flags & SIMD::AVX2 )
        { 
            sub_avx(res, v1, v2);
        }
        else {
            sub_sse(res, v1, v2);
        }
    #endif
    }

    // compute for Floating Point T
    template <typename T, typename V1, typename V2>
    static inline auto compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    -> typename std::enable_if<std::is_floating_point<T>::value>::type
    {
    #ifdef __AVX__
        mul_avx(res, v1, v2);
    #else

        auto flags = simd_flags();
        if ( flags & SIMD::AVX )
        { 
            sub_avx(res, v1, v2);
        }
        else {
            sub_sse(res, v1, v2);
        }
    #endif
    }
};

template<>
struct eval_op<'*'> {
    // compute for Integral T
    template <typename T, typename V1, typename V2>
    static inline auto compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    -> typename std::enable_if<std::is_integral<T>::value>::type
    {
    #ifdef __AVX2__
        mul_avx(res, v1, v2);
    #else

        auto flags = simd_flags();
        if ( flags & SIMD::AVX2 )
        { 
            mul_avx(res, v1, v2);
        }
        else {
            mul_sse(res, v1, v2);
        }
    #endif
    }

    
    // compute for Floating Point T
    template <typename T, typename V1, typename V2>
    static inline auto compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    -> typename std::enable_if<std::is_floating_point<T>::value>::type
    {
    #ifdef __AVX__
        mul_avx(res, v1, v2);
    #else

        auto flags = simd_flags();
        if ( flags & SIMD::AVX )
        { 
            mul_avx(res, v1, v2);
        }
        else {
            mul_sse(res, v1, v2);
        }
    #endif
    }
};


template<>
struct eval_op<'/'> {
    // compute for Integral T
    template <typename T, typename V1, typename V2>
    static inline auto compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    -> typename std::enable_if<std::is_integral<T>::value>::type
    {
        for (size_t i=0; i < res.size(); i++)
        {
            res[i] = v1[i] / v2[i];
        }
        // SIMD versions not implemented yet, they're tricky 
        // since no SIMD division is present in hardware for int
        // auto flags = simd_flags();
        // if ( flags & SIMD::AVX2 )
        // { 
        //     div_avx(res, v1, v2);
        // }
        // else {
        //     div_sse(res, v1, v2);
        // }
    }

    // compute for Floating Point T
    template <typename T, typename V1, typename V2>
    static inline auto compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    -> typename std::enable_if<std::is_floating_point<T>::value>::type
    {
    #ifdef __AVX__
            div_avx(res, v1, v2);
    #else
        auto flags = simd_flags();
        if ( flags & SIMD::AVX )
        { 
            div_avx(res, v1, v2);
        }
        else {
            div_sse(res, v1, v2);
        }
    #endif
    }
};