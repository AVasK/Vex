#pragma once
#include "integers.hpp"
#include "intrinsics.hpp"
#include <type_traits>



template <typename T>
using promote_t = typename std::remove_reference<decltype( 
        std::declval<T>() + 0
    )>::type;


//// 

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