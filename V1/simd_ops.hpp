#pragma once 

#include "simd_types.hpp"
#include "intrinsics.hpp"

#include "SIMD_flags.set"
#define func auto


auto set1_value_avx (i16 value) -> __m256i
{
    return _mm256_set1_epi16( value );
}

auto set1_value_sse (i16 value) -> __m128i
{
    return _mm_set1_epi16( value );
}

// ======== SSE ========
auto operator+ (sse_i8 r1, sse_i8 r2) -> sse_i8
{
    return sse_i8(_mm_adds_epi8(r1, r2));
}

auto operator+ (sse_i16 r1, sse_i16 r2) -> sse_i16
{
    return sse_i16(_mm_add_epi16(r1, r2));
}

auto operator+ (sse_i32 r1, sse_i32 r2) -> sse_i32
{
    return sse_i32(_mm_add_epi32(r1, r2));
}

auto operator+ (sse_i64 r1, sse_i64 r2) -> sse_i64
{
    return sse_i64(_mm_add_epi64(r1, r2));
}

// ======== AVX ========
auto operator+ (avx_i8 r1, avx_i8 r2) -> avx_i8
{
    return avx_i8(_mm256_adds_epi8(r1, r2));
}

auto operator+ (avx_i16 r1, avx_i16 r2) -> avx_i16
{
    return avx_i16(_mm256_add_epi16(r1, r2));
}

auto operator+ (avx_i32 r1, avx_i32 r2) -> avx_i32
{
    return avx_i32(_mm256_add_epi32(r1, r2));
}

auto operator+ (avx_i64 r1, avx_i64 r2) -> avx_i64
{
    return avx_i64(_mm256_add_epi64(r1, r2));
}



//template <char>
//auto op (avx_i8, avx_i8) -> avx_i8;

//template <char>
//auto op (avx_i16, avx_i16) -> avx_i16;


#define DEF_SIMD_OP(opcode, T)                      \
template <char>                                     \
auto op (T, T) -> T;                                \
                                                    \
template<>                                          \
auto op<opcode> (T r1, T r2) -> T                   \
{                                                   \
    return r1 + r2;                                 \
}


DEF_SIMD_OP('+', sse_i8)
DEF_SIMD_OP('+', sse_i16)
DEF_SIMD_OP('+', sse_i32)
DEF_SIMD_OP('+', sse_i64)

DEF_SIMD_OP('+', avx_i8)
DEF_SIMD_OP('+', avx_i16)
DEF_SIMD_OP('+', avx_i32)
DEF_SIMD_OP('+', avx_i64)



#undef func
#include "SIMD_flags.discard"