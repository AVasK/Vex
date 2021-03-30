#pragma once 

#include "intrinsics.hpp"
#include "SIMD_flags.set"
#define func auto

template <char>
auto op (__m128i, __m128i) -> __m128i;

template <char>
auto op (__m256i, __m256i) -> __m256i;

template <>
auto op<'+'> (__m128i r1, __m128i r2) -> __m128i
{
    return _mm_add_epi16(r1, r2);
}

template <>
auto op<'+'> (__m256i r1, __m256i r2) -> __m256i
{
    return _mm256_add_epi16(r1, r2);
}


auto set1_value_avx (i16 value) -> __m256i
{
    return _mm256_set1_epi16( value );
}

auto set1_value_sse (i16 value) -> __m128i
{
    return _mm_set1_epi16( value );
}

#undef func
#include "SIMD_flags.discard"