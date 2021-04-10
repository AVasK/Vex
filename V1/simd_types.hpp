#pragma once
#include "integers.hpp"
#include "intrinsics.hpp"
#include <type_traits>


template <typename T>
using promote_t = typename std::remove_reference<decltype( 
        std::declval<T>() + 0
    )>::type;


// SIMD type wrappers:
#include "SIMD_flags.set"

struct sse_i128 {
    __m128i data;
    sse_i128 (__m128i reg) : data{ reg } {}
    operator __m128i () { return data; }
};

struct avx_i256 {
    __m256i data;
    avx_i256 (__m256i reg) : data{ reg } {}
    operator __m256i () { return data; }
};

// ======== SSE ========
#ifdef VEX_SSE
struct sse_i8  : sse_i128 {
    sse_i8(i8 _v) : sse_i128{ _mm_set1_epi8(_v) } {}
    sse_i8(sse_i128 reg) : sse_i128{ reg } {}
};
struct sse_i16 : sse_i128 {
    sse_i16(i16 _v) : sse_i128{ _mm_set1_epi16(_v) } {}
    sse_i16(sse_i128 reg) : sse_i128{ reg } {}
};
struct sse_i32 : sse_i128 {
    sse_i32(i32 _v) : sse_i128{ _mm_set1_epi32(_v) } {}
    sse_i32(sse_i128 reg) : sse_i128{ reg } {}
};
struct sse_i64 : sse_i128 {
    sse_i64(i64 _v) : sse_i128{ _mm_set1_epi64x(_v) } {}
    sse_i64(sse_i128 reg) : sse_i128{ reg } {}
};

struct sse_u8  : sse_i8 {
    sse_u8(u8 _v) : sse_i8( _v ) {}
};

#endif
// ======== AVX ========
#ifdef VEX_AVX

struct avx_i8  : avx_i256 {
    avx_i8(i8 _v) : avx_i256{ _mm256_set1_epi8(_v) } {}
    avx_i8(avx_i256 reg) : avx_i256{ reg } {}
};
struct avx_i16 : avx_i256 {
    avx_i16(i16 _v) : avx_i256{ _mm256_set1_epi16(_v) } {}
    avx_i16(avx_i256 reg) : avx_i256{ reg } {}
};
struct avx_i32 : avx_i256 {
    avx_i32(i32 _v) : avx_i256{ _mm256_set1_epi32(_v) } {}
    avx_i32(avx_i256 reg) : avx_i256{ reg } {}
};
struct avx_i64 : avx_i256 {
    avx_i64(i64 _v) : avx_i256{ _mm256_set1_epi64x(_v) } {}
    avx_i64(avx_i256 reg) : avx_i256{ reg } {}
};

struct avx_u8  : avx_i256 {};

#endif
#include "SIMD_flags.discard"

// SSE_REGISTER template:
template <typename T>
struct sse_register_type;

template <typename T>
using sse_reg = typename sse_register_type< promote_t<T> >::type;

template<>
struct sse_register_type<int> 
{
    using type = __m128i;
};

template<>
struct sse_register_type<i64> 
{
    using type = __m128i;
};

template<>
struct sse_register_type<float>
{
    using type = __m128;
};

template<>
struct sse_register_type<double>
{
    using type = __m128d;
};

// AVX:
template <typename T>
struct avx_register_type;

template <typename T>
using avx_reg = typename avx_register_type< promote_t<T> >::type;

template<>
struct avx_register_type<int> 
{
    using type = __m256i;
};

template<>
struct avx_register_type<i64> 
{
    using type = __m256i;
};

template<>
struct avx_register_type<float>
{
    using type = __m256;
};

template<>
struct avx_register_type<double>
{
    using type = __m256d;
};