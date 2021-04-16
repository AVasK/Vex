// @: SIMD wrapper ops
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

#include "simd_types.hpp"
#include "intrinsics.hpp"

#define func auto


__attribute__((target("avx2")))
auto set1_value_avx (i16 value) -> __m256i
{
    return _mm256_set1_epi16( value );
}

__attribute__((target("sse")))
auto set1_value_sse (i16 value) -> __m128i
{
    return _mm_set1_epi16( value );
}

// ======== SSE ========

auto operator+ (sse_u8 r1, sse_u8 r2) -> sse_u8
{
    return sse_u8(_mm_adds_epu8(r1, r2));
}

auto operator+ (sse_i8 r1, sse_i8 r2) -> sse_i8
{
    return sse_i8(_mm_adds_epi8(r1, r2));
}

auto operator+ (sse_i16 r1, sse_i16 r2) -> sse_i16
{
    return sse_i16(_mm_adds_epi16(r1, r2));
}

auto operator+ (sse_i32 r1, sse_i32 r2) -> sse_i32
{
    return sse_i32(_mm_add_epi32(r1, r2));
}

auto operator+ (sse_i64 r1, sse_i64 r2) -> sse_i64
{
    return sse_i64(_mm_add_epi64(r1, r2));
}

auto operator+ (sse_float r1, sse_float r2) -> sse_float
{
    return sse_float(_mm_add_ps(r1, r2));
}

auto operator+ (sse_double r1, sse_double r2) -> sse_double 
{
    return sse_double(_mm_add_pd(r1, r2));
}

// sub

auto operator- (sse_u8 r1, sse_u8 r2) -> sse_u8
{
    return sse_u8(_mm_subs_epu8(r1, r2));
}

auto operator- (sse_i8 r1, sse_i8 r2) -> sse_i8
{
    return sse_i8(_mm_subs_epi8(r1, r2));
}

auto operator- (sse_i16 r1, sse_i16 r2) -> sse_i16
{
    return sse_i16(_mm_subs_epi16(r1, r2));
}

auto operator- (sse_i32 r1, sse_i32 r2) -> sse_i32
{
    return sse_i32(_mm_sub_epi32(r1, r2));
}

auto operator- (sse_i64 r1, sse_i64 r2) -> sse_i64
{
    return sse_i64(_mm_sub_epi64(r1, r2));
}

auto operator- (sse_float r1, sse_float r2) -> sse_float
{
    return sse_float(_mm_sub_ps(r1, r2));
}

auto operator- (sse_double r1, sse_double r2) -> sse_double 
{
    return sse_double(_mm_sub_pd(r1, r2));
}

auto operator* (sse_i8 r1, sse_i8 r2) -> sse_i8 
{
    // unpack and multiply
    __m128i dst_even = _mm_mullo_epi16(r1.data, r2.data);
    __m128i dst_odd = _mm_mullo_epi16(_mm_srli_epi16(r1.data, 8),_mm_srli_epi16(r2.data, 8));
    // repack
    return sse_i8(_mm_or_si128(_mm_slli_epi16(dst_odd, 8), _mm_srli_epi16(_mm_slli_epi16(dst_even,8), 8)));
}

auto operator* (sse_u8 r1, sse_u8 r2) -> sse_u8 
{
    // unpack and multiply
    __m128i dst_even = _mm_mullo_epi16(r1.data, r2.data);
    __m128i dst_odd = _mm_mullo_epi16(_mm_srli_epi16(r1.data, 8),_mm_srli_epi16(r2.data, 8));
    // repack
    return sse_u8(_mm_or_si128(_mm_slli_epi16(dst_odd, 8), _mm_srli_epi16(_mm_slli_epi16(dst_even,8), 8)));
}

auto operator* (sse_i16 r1, sse_i16 r2) -> sse_i16
{
    return sse_i16(_mm_mullo_epi16(r1, r2));
}

__attribute__((target("sse4.1")))
auto operator* (sse_i32 r1, sse_i32 r2) -> sse_i32
{
    //NOTE: REQUIRES SSE4.1!
    return sse_i32(_mm_mullo_epi32(r1, r2));
}

// auto operator* (sse_i64 r1, sse_i64 r2) -> sse_i64
// {
//     return sse_i64(_mm_mullo_epi64(r1, r2));
// }

auto operator* (sse_float r1, sse_float r2) -> sse_float
{
    return sse_float(_mm_mul_ps(r1, r2));
}

auto operator* (sse_double r1, sse_double r2) -> sse_double 
{
    return sse_double(_mm_mul_pd(r1, r2));
}

// DIV

auto operator/ (sse_float r1, sse_float r2) -> sse_float
{
    return sse_float(_mm_div_ps(r1, r2));
}

auto operator/ (sse_double r1, sse_double r2) -> sse_double 
{
    return sse_double(_mm_div_pd(r1, r2));
}

// ======== AVX ========

__attribute__((target("avx2")))
auto operator+ (avx_i8 r1, avx_i8 r2) -> avx_i8
{
    return avx_i8(_mm256_adds_epi8(r1, r2));
}

__attribute__((target("avx2")))
auto operator+ (avx_u8 r1, avx_u8 r2) -> avx_u8
{
    return avx_u8(_mm256_adds_epu8(r1, r2));
}

__attribute__((target("avx2")))
auto operator+ (avx_i16 r1, avx_i16 r2) -> avx_i16
{
    return avx_i16(_mm256_add_epi16(r1, r2));
}

__attribute__((target("avx2")))
auto operator+ (avx_i32 r1, avx_i32 r2) -> avx_i32
{
    return avx_i32(_mm256_add_epi32(r1, r2));
}

__attribute__((target("avx2")))
auto operator+ (avx_i64 r1, avx_i64 r2) -> avx_i64
{
    return avx_i64(_mm256_add_epi64(r1, r2));
}

__attribute__((target("avx2")))
auto operator+ (avx_float r1, avx_float r2) -> avx_float
{
    return _mm256_add_ps(r1, r2);
}

__attribute__((target("avx2")))
auto operator+ (avx_double r1, avx_double r2) -> avx_double
{
    return _mm256_add_pd(r1, r2);
}

//sub

__attribute__((target("avx2")))
auto operator- (avx_i8 r1, avx_i8 r2) -> avx_i8
{
    return avx_i8(_mm256_subs_epi8(r1, r2));
}

__attribute__((target("avx2")))
auto operator- (avx_u8 r1, avx_u8 r2) -> avx_u8
{
    return avx_u8(_mm256_subs_epu8(r1, r2));
}

__attribute__((target("avx2")))
auto operator- (avx_i16 r1, avx_i16 r2) -> avx_i16
{
    return avx_i16(_mm256_sub_epi16(r1, r2));
}

__attribute__((target("avx2")))
auto operator- (avx_i32 r1, avx_i32 r2) -> avx_i32
{
    return avx_i32(_mm256_sub_epi32(r1, r2));
}

__attribute__((target("avx2")))
auto operator- (avx_i64 r1, avx_i64 r2) -> avx_i64
{
    return avx_i64(_mm256_sub_epi64(r1, r2));
}

__attribute__((target("avx2")))
auto operator- (avx_float r1, avx_float r2) -> avx_float
{
    return avx_float(_mm256_sub_ps(r1, r2));
}

__attribute__((target("avx2")))
auto operator- (avx_double r1, avx_double r2) -> avx_double
{
    return avx_double(_mm256_sub_pd(r1, r2));
}


// MUL

__attribute__((target("avx2")))
auto operator* (avx_i8 r1, avx_i8 r2) -> avx_i8 
{
    // unpack and multiply
    __m256i dst_even = _mm256_mullo_epi16(r1.data, r2.data);
    __m256i dst_odd = _mm256_mullo_epi16(_mm256_srli_epi16(r1.data, 8),_mm256_srli_epi16(r2.data, 8));
    // repack
    return avx_i8(_mm256_or_si256(_mm256_slli_epi16(dst_odd, 8), _mm256_and_si256(dst_even, _mm256_set1_epi16(0xFF))));
}

__attribute__((target("avx2")))
auto operator* (avx_u8 r1, avx_u8 r2) -> avx_u8 
{
    // unpack and multiply
    __m256i dst_even = _mm256_mullo_epi16(r1.data, r2.data);
    __m256i dst_odd = _mm256_mullo_epi16(_mm256_srli_epi16(r1.data, 8),_mm256_srli_epi16(r2.data, 8));
    // repack
    return avx_u8(_mm256_or_si256(_mm256_slli_epi16(dst_odd, 8), _mm256_and_si256(dst_even, _mm256_set1_epi16(0xFF))));
}

__attribute__((target("avx2")))
auto operator* (avx_i16 r1, avx_i16 r2) -> avx_i16
{
    return avx_i16(_mm256_mullo_epi16(r1, r2));
}

__attribute__((target("avx2")))
auto operator* (avx_i32 r1, avx_i32 r2) -> avx_i32
{
    return avx_i32(_mm256_mullo_epi32(r1, r2));
}

// __attribute__((target("avx512f, avx512vl, avx512dq")))
// auto operator* (avx_i64 r1, avx_i64 r2) -> avx_i64
// {
//     return avx_i64(_mm256_mullo_epi64(r1, r2));
// }

__attribute__((target("avx2")))
auto operator* (avx_float r1, avx_float r2) -> avx_float
{
    return avx_float(_mm256_mul_ps(r1, r2));
}

__attribute__((target("avx2")))
auto operator* (avx_double r1, avx_double r2) -> avx_double
{
    return avx_double(_mm256_mul_pd(r1, r2));
}

// DIV
__attribute__((target("avx2")))
auto operator/ (avx_float r1, avx_float r2) -> avx_float
{
    return avx_float(_mm256_div_ps(r1, r2));
}

__attribute__((target("avx2")))
auto operator/ (avx_double r1, avx_double r2) -> avx_double
{
    return avx_double(_mm256_div_pd(r1, r2));
}


#define DECL_SIMD_OP(_op_, T)                       \
template <char>                                     \
auto op (T, T) -> T;                                \



#define DEF_SIMD_OP(_op_, T)                        \
                                                    \
template <char>                                     \
auto op (T, T) -> T;                                \
                                                    \
template<>                                          \
auto op< #_op_[0] > (T r1, T r2) -> T               \
{                                                   \
    return r1 _op_ r2;                              \
}


DEF_SIMD_OP(+, sse_float)
DEF_SIMD_OP(+, sse_double)
DEF_SIMD_OP(+, sse_i8)
DEF_SIMD_OP(+, sse_u8)
DEF_SIMD_OP(+, sse_i16)
DEF_SIMD_OP(+, sse_i32)
DEF_SIMD_OP(+, sse_i64)

DEF_SIMD_OP(-, sse_float)
DEF_SIMD_OP(-, sse_double)
DEF_SIMD_OP(-, sse_i8)
DEF_SIMD_OP(-, sse_u8)
DEF_SIMD_OP(-, sse_i16)
DEF_SIMD_OP(-, sse_i32)
DEF_SIMD_OP(-, sse_i64)

DEF_SIMD_OP(*, sse_float)
DEF_SIMD_OP(*, sse_double)
DEF_SIMD_OP(*, sse_i8)
DEF_SIMD_OP(*, sse_u8)
DEF_SIMD_OP(*, sse_i16)
DEF_SIMD_OP(*, sse_i32) // SSE4.1

DEF_SIMD_OP(/, sse_float)
DEF_SIMD_OP(/, sse_double)


//////////////////////////
// AVX

DEF_SIMD_OP(+, avx_float)
DEF_SIMD_OP(+, avx_double)
DEF_SIMD_OP(+, avx_i8)
DEF_SIMD_OP(+, avx_u8)
DEF_SIMD_OP(+, avx_i16)
DEF_SIMD_OP(+, avx_i32)
DEF_SIMD_OP(+, avx_i64)

DEF_SIMD_OP(-, avx_float)
DEF_SIMD_OP(-, avx_double)
DEF_SIMD_OP(-, avx_i8)
DEF_SIMD_OP(-, avx_u8)
DEF_SIMD_OP(-, avx_i16)
DEF_SIMD_OP(-, avx_i32)
DEF_SIMD_OP(-, avx_i64)

DEF_SIMD_OP(*, avx_float)
DEF_SIMD_OP(*, avx_double)
DEF_SIMD_OP(*, avx_i8)
DEF_SIMD_OP(*, avx_u8)
DEF_SIMD_OP(*, avx_i16)
DEF_SIMD_OP(*, avx_i32)

DEF_SIMD_OP(/, avx_float)
DEF_SIMD_OP(/, avx_double)


#undef func