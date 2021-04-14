// @: SIMD load/store ops [RENAME FILE?]
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

__attribute__((target("avx2")))
static inline auto iload_256(const void * p) -> __m256i
{
    // load aligned integer vector from array p
    return _mm256_load_si256((__m256i const*) p);
}

__attribute__((target("avx2")))
static inline auto fload_256(void const* p) -> avx_reg<float>
{
    // load aligned integer vector from array p
    return _mm256_load_ps((float const*) p);
}

__attribute__((target("avx2")))
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
__attribute__((target("avx2")))
static inline auto load_avx(T const * p) -> avx_reg<T>
{
    return avx_reg<T>( iload_256(p) );
}

__attribute__((target("avx2")))
static inline auto load_avx(float const * p) -> avx_reg<float>
{
    return fload_256(p);
}

__attribute__((target("avx2")))
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
__attribute__((target("avx2")))
static inline auto store_avx(T * d, avx_reg<T> x) -> void
{
    // store aligned integer vector x into array d
    _mm256_store_si256((__m256i *)d, x.as_register());
}

__attribute__((target("avx2")))
static inline auto store_avx(float * mem, avx_reg<float> x) -> void
{
    _mm256_store_ps(mem, x.as_register());
}

__attribute__((target("avx2")))
static inline auto store_avx(double * mem, avx_reg<double> x) -> void
{
    _mm256_store_pd(mem, x.as_register());
}
