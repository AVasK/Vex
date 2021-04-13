#pragma once
#include "integers.hpp"
#include "intrinsics.hpp"
#include <type_traits>


#define VEX_AVX
#define VEX_SSE


template <typename T>
using promote_t = typename std::remove_reference<decltype( 
        std::declval<T>() + 0
    )>::type;


struct sse_i128 {
    __m128i data;
    sse_i128 (__m128i reg) : data{ reg } {}
    operator __m128i () { return data; }
    auto as_register() -> __m128i { return data; }
};

struct sse_float {
    __m128 data;
    constexpr const static int offset = 128 / (8*sizeof( float ));

    sse_float (__m128 reg) : data {reg} {}
    explicit sse_float(float _v) : data{ _mm_set1_ps(_v) } {}
    operator __m128 () { return data; }
    auto as_register() -> __m128 { return data; }
};

struct sse_double {
    __m128d data;
    constexpr const static int offset = 16 / sizeof(double);

    sse_double (__m128d reg) : data {reg} {}
    explicit sse_double(double _v) : data{ _mm_set1_pd(_v) } {}
    operator __m128d () { return data; }
    auto as_register() -> __m128d { return data; }
};

struct avx_i256 {
    __m256i data;

    avx_i256 (__m256i reg) : data{ reg } {}

    __attribute__((target("avx2")))
    operator __m256i () { return data; }

    __attribute__((target("avx2")))
    auto as_register() -> __m256i { return data; }
};

struct avx_float {
    __m256 data;
    constexpr const static int offset = 32 / sizeof(float);

    avx_float (__m256 reg) : data {reg} {}

    explicit avx_float(float _v) : data{ _mm256_set1_ps(_v) } {}

    __attribute__((target("avx2"))) 
    operator __m256 () { return data; }

    __attribute__((target("avx2")))
    auto as_register() -> __m256 { return data; }
};

struct avx_double {
    __m256d data;
    constexpr const static int offset = 32 / sizeof(double);

    avx_double (__m256d reg) : data {reg} {}

    explicit avx_double(double _v) : data{ _mm256_set1_pd(_v) } {}

    __attribute__((target("avx2")))
    operator __m256d () { return data; }

    __attribute__((target("avx2")))
    auto as_register() -> __m256d { return data; }
};

// ======== SSE ========
#ifdef VEX_SSE
struct sse_i8  : sse_i128 {
    constexpr const static int offset = 128 / 8;
    explicit sse_i8(i8 _v) : sse_i128{ _mm_set1_epi8(_v) } {}
    explicit sse_i8(__m128i reg) : sse_i128{ reg } {}
};
struct sse_i16 : sse_i128 {
    constexpr const static int offset = 128 / 16;
    explicit sse_i16(i16 _v) : sse_i128{ _mm_set1_epi16(_v) } {}
    explicit sse_i16(__m128i reg) : sse_i128{ reg } {}
};
struct sse_i32 : sse_i128 {
    constexpr const static int offset = 128 / 32;
    explicit sse_i32(i32 _v) : sse_i128{ _mm_set1_epi32(_v) } {}
    explicit sse_i32(__m128i reg) : sse_i128{ reg } {}
};
struct sse_i64 : sse_i128 {
    constexpr const static int offset = 128 / 64;
    explicit sse_i64(i64 _v) : sse_i128{ _mm_set1_epi64x(_v) } {}
    explicit sse_i64(__m128i reg) : sse_i128{ reg } {}
};

struct sse_u8  : sse_i8 {
    explicit sse_u8(u8 _v) : sse_i8( _v ) {}
};
#endif // VEX_SSE


// ======== AVX ========
#ifdef VEX_AVX

struct avx_i8  : avx_i256 {
    constexpr const static int offset = 256 / 8;

    __attribute__((target("avx2")))
    explicit avx_i8(i8 _v) : avx_i256{ _mm256_set1_epi8(_v) } {}

    __attribute__((target("avx2")))
    explicit avx_i8(__m256i reg) : avx_i256{ reg } {}
};
struct avx_i16 : avx_i256 {
    constexpr const static int offset = 256 / 16;

    __attribute__((target("avx2")))
    explicit avx_i16(i16 _v) : avx_i256{ _mm256_set1_epi16(_v) } {}

    __attribute__((target("avx2")))
    explicit avx_i16(__m256i reg) : avx_i256{ reg } {}
};
struct avx_i32 : avx_i256 {
    constexpr const static int offset = 256 / 32;
    __attribute__((target("avx2")))
    explicit avx_i32(i32 _v) : avx_i256{ _mm256_set1_epi32(_v) } {}
    
    __attribute__((target("avx2")))
    explicit avx_i32(__m256i reg) : avx_i256{ reg } {}
};
struct avx_i64 : avx_i256 {
    constexpr const static int offset = 256 / 64;

    __attribute__((target("avx2")))
    explicit avx_i64(i64 _v) : avx_i256{ _mm256_set1_epi64x(_v) } {}

    __attribute__((target("avx2")))
    explicit avx_i64(__m256i reg) : avx_i256{ reg } {}
};

struct avx_u8  : avx_i256 {};

#endif // VEX_AVX


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