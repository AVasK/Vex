// @: SIMD wrapper types
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
#include "integers.hpp"
#include "intrinsics.hpp"


template <typename T>
using promote_t = typename std::remove_reference<decltype( 
        std::declval<T>() + 0
    )>::type;


template <typename T>
struct avx512_offset {
    constexpr const static int value = 64 / sizeof(T);
};

template <typename T>
struct avx_offset {
    constexpr const static int value = 32 / sizeof(T);
};

template <typename T>
struct sse_offset {
    constexpr const static int value = 16 / sizeof(T);
};


struct sse_i128 {
    sse_i128 (__m128i reg) : data{ reg } {}
    operator __m128i () { return data; }
    auto as_register() -> __m128i { return data; }

    __m128i data;
};

struct sse_float {
    sse_float (__m128 reg) : data {reg} {}
    explicit sse_float(float _v) : data{ _mm_set1_ps(_v) } {}
    operator __m128 () { return data; }
    auto as_register() -> __m128 { return data; }

    __m128 data;
};

struct sse_double {
    sse_double (__m128d reg) : data {reg} {}
    explicit sse_double(double _v) : data{ _mm_set1_pd(_v) } {}
    operator __m128d () { return data; }
    auto as_register() -> __m128d { return data; }

    __m128d data;
};

struct avx_i256 {
    __attribute__((target("avx2")))
    avx_i256 (__m256i reg) : data{ reg } {}

    __attribute__((target("avx2")))
    operator __m256i () { return data; }

    __attribute__((target("avx2")))
    auto as_register() -> __m256i { return data; }

    __m256i data;
};

struct avx_float {
    __attribute__((target("avx2")))
    avx_float (__m256 reg) : data {reg} {}

    __attribute__((target("avx2")))
    explicit avx_float(float _v) : data{ _mm256_set1_ps(_v) } {}

    __attribute__((target("avx2"))) 
    operator __m256 () { return data; }

    __attribute__((target("avx2")))
    auto as_register() -> __m256 { return data; }

    __m256 data;
};

struct avx_double {

    __attribute__((target("avx2")))
    avx_double (__m256d reg) : data {reg} {}

    __attribute__((target("avx2")))
    explicit avx_double(double _v) : data{ _mm256_set1_pd(_v) } {}

    __attribute__((target("avx2")))
    operator __m256d () { return data; }

    __attribute__((target("avx2")))
    auto as_register() -> __m256d { return data; }

    __m256d data;
};

// ======== SSE ========
struct sse_i8  : sse_i128 {
    explicit sse_i8(i8 _v) : sse_i128{ _mm_set1_epi8(_v) } {}
    explicit sse_i8(__m128i reg) : sse_i128{ reg } {}
};

struct sse_u8  : sse_i128 {
    explicit sse_u8(u8 _v) : sse_i128{ _mm_set1_epi8(_v) } {}
    explicit sse_u8(__m128i reg) : sse_i128{ reg } {}
};

struct sse_i16 : sse_i128 {
    explicit sse_i16(i16 _v) : sse_i128{ _mm_set1_epi16(_v) } {}
    explicit sse_i16(__m128i reg) : sse_i128{ reg } {}
};

struct sse_i32 : sse_i128 {
    explicit sse_i32(i32 _v) : sse_i128{ _mm_set1_epi32(_v) } {}
    explicit sse_i32(__m128i reg) : sse_i128{ reg } {}
};

struct sse_i64 : sse_i128 {
    explicit sse_i64(i64 _v) : sse_i128{ _mm_set1_epi64x(_v) } {}
    explicit sse_i64(__m128i reg) : sse_i128{ reg } {}
};

// ======== AVX ========
struct avx_i8  : avx_i256 {
    __attribute__((target("avx2")))
    explicit avx_i8(i8 _v) : avx_i256{ _mm256_set1_epi8(_v) } {}

    __attribute__((target("avx2")))
    explicit avx_i8(__m256i reg) : avx_i256{ reg } {}
};

struct avx_u8  : avx_i256 {
    __attribute__((target("avx2")))
    explicit avx_u8(u8 _v) : avx_i256{ _mm256_set1_epi8(_v) } {}

    __attribute__((target("avx2")))
    explicit avx_u8(__m256i reg) : avx_i256{ reg } {}
};

struct avx_i16 : avx_i256 {
    __attribute__((target("avx2")))
    explicit avx_i16(i16 _v) : avx_i256{ _mm256_set1_epi16(_v) } {}

    __attribute__((target("avx2")))
    explicit avx_i16(__m256i reg) : avx_i256{ reg } {}
};

struct avx_i32 : avx_i256 {
    __attribute__((target("avx2")))
    explicit avx_i32(i32 _v) : avx_i256{ _mm256_set1_epi32(_v) } {}
    
    __attribute__((target("avx2")))
    explicit avx_i32(__m256i reg) : avx_i256{ reg } {}
};

struct avx_i64 : avx_i256 {
    __attribute__((target("avx2")))
    explicit avx_i64(i64 _v) : avx_i256{ _mm256_set1_epi64x(_v) } {}

    __attribute__((target("avx2")))
    explicit avx_i64(__m256i reg) : avx_i256{ reg } {}
};


// SSE_REGISTER template:
template <typename T>
struct sse_register_type;

template <typename T>
using sse_reg = typename sse_register_type<T>::type;

template<>
struct sse_register_type<i8> 
{
    using type = sse_i8;
};

template<>
struct sse_register_type<i16> 
{
    using type = sse_i16;
};

template<>
struct sse_register_type<i32> 
{
    using type = sse_i32;
};

template<>
struct sse_register_type<i64> 
{
    using type = sse_i64;
};

template<>
struct sse_register_type<float>
{
    using type = sse_float;
};

template<>
struct sse_register_type<double>
{
    using type = sse_double;
};

// AVX:
template <typename T>
struct avx_register_type;

template <typename T>
using avx_reg = typename avx_register_type<T>::type;

template<>
struct avx_register_type<i8> 
{
    using type = avx_i8;
};

template<>
struct avx_register_type<i16> 
{
    using type = avx_i16;
};

template<>
struct avx_register_type<i32> 
{
    using type = avx_i32;
};

template<>
struct avx_register_type<i64> 
{
    using type = avx_i64;
};

template<>
struct avx_register_type<float>
{
    using type = avx_float;
};

template<>
struct avx_register_type<double>
{
    using type = avx_double;
};