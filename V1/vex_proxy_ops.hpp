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

template <char opcode>
struct eval_op {};

template<>
struct eval_op<'+'> {
    template <typename T, typename V1, typename V2>
    static inline void compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    {
    #ifdef __AVX2__
        mul_avx(res, v1, v2);
    #else

        auto flags = Vex<T>::simd_flags();
        if ( flags & SIMD::AVX2 )
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
    template <typename T, typename V1, typename V2>
    static inline void compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    {
    #ifdef __AVX2__
        mul_avx(res, v1, v2);
    #else

        auto flags = Vex<T>::simd_flags();
        if ( flags & SIMD::AVX2 )
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
    template <typename T, typename V1, typename V2>
    static inline void compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    {
    #ifdef __AVX2__
        mul_avx(res, v1, v2);
    #else

        auto flags = Vex<T>::simd_flags();
        if ( flags & SIMD::AVX2 )
        { 
            mul_avx(res, v1, v2);
        }
        else {
            mul_sse(res, v1, v2);
        }
    #endif
    }

    /*
    // SPECIAL CASES:
    // i32:
    template<typename V1, typename V2>
    static inline void compute(Vex<i32> & res, V1 const& v1, V2 const& v2)
    {
    #ifdef __AVX2__
        mul_avx(res, v1, v2);
    #elif __SSE4_1__ 
        mul_sse(res, v1, v2);
    #else
    
        auto flags = Vex<i32>::simd_flags();
        if (flags & SIMD::AVX2) {
            std::cerr << "AVX2 mul i32\n";
            mul_avx(res, v1, v2);
        }
        else if (flags & SIMD::SSE4_1) {
            std::cerr << "SSE4.1 mul i32\n";
            mul_sse(res, v1, v2);
        }
        else {
            std::cerr << "Fallback to non-SIMD case\n";
            for (size_t i=0; i < res.size(); ++i)
            {
                res[i] = v1[i] + v2[i];
            }
        }
    #endif
    }
*/
};


template<>
struct eval_op<'/'> {
    template <typename T, typename V1, typename V2>
    static inline void compute(Vex<T> & res, V1 const& v1, V2 const& v2)
    {
        auto flags = Vex<T>::simd_flags();
        if ( flags & SIMD::AVX2 )
        { 
            div_avx(res, v1, v2);
        }
        else {
            div_sse(res, v1, v2);
        }
    }
};