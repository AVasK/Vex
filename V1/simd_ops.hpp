#pragma once 

#include "simd_types.hpp"
#include "intrinsics.hpp"

//#include "SIMD_flags.set"
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

auto operator+ (sse_float r1, sse_float r2) -> sse_float
{
    return sse_float(_mm_add_ps(r1, r2));
}

auto operator+ (sse_double r1, sse_double r2) -> sse_double 
{
    return sse_double(_mm_add_pd(r1, r2));
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


//template <char>
//auto op (avx_i8, avx_i8) -> avx_i8;

//template <char>
//auto op (avx_i16, avx_i16) -> avx_i16;


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


DEF_SIMD_OP(+, sse_i8)
DEF_SIMD_OP(+, sse_i16)
DEF_SIMD_OP(+, sse_i32)
DEF_SIMD_OP(+, sse_i64)

// DEF_SIMD_OP('-',-, sse_i8)
// DEF_SIMD_OP('-',-, sse_i16)
// DEF_SIMD_OP('-',-, sse_i32)
// DEF_SIMD_OP('-',-, sse_i64)

DEF_SIMD_OP(+, avx_i8)
DEF_SIMD_OP(+, avx_i16)
DEF_SIMD_OP(+, avx_i32)
DEF_SIMD_OP(+, avx_i64)



#undef func
//#include "SIMD_flags.discard"