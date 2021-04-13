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
#include <type_traits>
#include "simd_types.hpp"

#include "SIMD_flags.set"


static inline auto iload_128(void const * p) -> __m128i
{
    // load aligned integer vector from array p
    return _mm_load_si128((__m128i const*) p);
}

static inline auto fload_128(void const* p) -> sse_reg<float>
{
    // load aligned integer vector from array p
    return _mm_load_ps((float const*) p);
}

static inline auto dload_128(void const* p) -> sse_reg<double>
{
    // load aligned integer vector from array p
    return _mm_load_pd((double const*) p);
}

static inline auto iload_256(const void * p) -> __m256i
{
    // load aligned integer vector from array p
    return _mm256_load_si256((__m256i const*) p);
}

static inline auto fload_256(void const* p) -> avx_reg<float>
{
    // load aligned integer vector from array p
    return _mm256_load_ps((float const*) p);
}

static inline auto dload_256(void const* p) -> avx_reg<double>
{
    // load aligned integer vector from array p
    return _mm256_load_pd((double const*) p);
}


// SSE
template <typename T>
static inline auto load_sse(T const * p) -> sse_reg<T>
{
    return sse_reg<T>( iload_128(p) );
}

static inline auto load_sse(float const * p) -> sse_reg<float>
{
    return fload_128(p);
}

static inline auto load_sse(double const * p) -> sse_reg<double>
{
    return dload_128(p);
}

// AVX
template <typename T>
static inline auto load_avx(T const * p) -> avx_reg<T>
{
    return avx_reg<T>( iload_256(p) );
}

static inline auto load_avx(float const * p) -> avx_reg<float>
{
    return fload_256(p);
}

static inline auto load_avx(double const * p) -> avx_reg<double>
{
    return dload_256(p);
}


// STORE
template <typename T>
static inline auto store_sse(T * mem, sse_reg<T> x) -> void
{
    // store aligned integer vector x into array d
    _mm_store_si128((__m128i *) mem, x.as_register());
}

static inline auto store_sse(float * mem, sse_reg<float> x) -> void
{
    _mm_store_ps(mem, x.as_register());
}

static inline auto store_sse(double * mem, sse_reg<double> x) -> void
{
    _mm_store_pd(mem, x.as_register());
}

template <typename T>
static inline auto store_avx(T * d, avx_reg<T> x) -> void
{
    // store aligned integer vector x into array d
    _mm256_store_si256((__m256i *)d, x.as_register());
}

static inline auto store_avx(float * mem, avx_reg<float> x) -> void
{
    _mm256_store_ps(mem, x.as_register());
}

static inline auto store_avx(double * mem, avx_reg<double> x) -> void
{
    _mm256_store_pd(mem, x.as_register());
}


/* ##############################################
auto n_regs = a1.size_in_registers();
for (size_t i=0; i < n_regs; ++i)
{
    //FIXME: Need separate function to get register start address.
    // load #elems_per_reg consecutive elements from a1:
    auto _a1 = iload_256(&a1[i<<4]);
    
    auto _a2 = iload_256(&a2[i<<4]);
    
    auto _res = _mm256_add_epi16(_a1, _a2);
    
    store_avx(&res[i<<4], _res);
    //_mm256_zeroupper();
}
*/

// FUNCS:

inline func i16_add_avx (
                  Vex<i16> & res,
                  Vex<i16> const& a1,
                  Vex<i16> const& a2
                  )
-> Vex<i16>
{

    auto n_regs = a1.size_in_registers();
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _a1 = avx_i16( iload_256(&a1[i<<4]) );
        auto _a2 = avx_i16( iload_256(&a2[i<<4]) );
        auto _res = _a1 + _a2;
        store_avx(&res[i<<4], _res);
        //_mm256_zeroupper();
    }
/*
    auto size = a1.size();
    for (size_t i=0; i < size; i+=16)
    {
        auto _a1 = iload_256(&a1[i]);
        auto _a2 = iload_256(&a2[i]);
        auto _res = _mm256_add_epi16(_a1, _a2);
        store_avx(&res[i], _res);
    }
*/
    return res;
}


inline func i16_add_sse (
                  Vex<i16> & res,
                  Vex<i16> const& a1,
                  Vex<i16> const& a2
                  )
-> Vex<i16>
{
    auto n_regs = a1.size_in_registers();
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _a1 = sse_i16( load_sse(&a1[i<<3]) );
        auto _a2 = sse_i16( load_sse(&a2[i<<3]) );
        auto _res = _a1 + _a2;
        store_sse(&res[i<<3], _res);
    }
    return res;
}

#include "SIMD_flags.discard"