#pragma once

#include "integers.hpp"

template <typename T>
class Vex;

template <typename T>
struct VProxy;

template <typename T>
struct Val;


template <typename T>
using promote_t = typename std::remove_reference<decltype( std::declval<T>() + 0 )>::type;


template <typename T1, typename T2>
using lesser_type = typename std::conditional<(sizeof(T1) < sizeof(T2)), T1, T2>::type;

template <typename T1, typename T2>
using greater_type = typename std::conditional<(sizeof(T1) > sizeof(T2)), T1, T2>::type;


template <typename T>
struct wrap_vex {
    using type = T;
};

template <typename T>
struct wrap_vex<Vex<T>> {
    using type = VProxy<T>;
};

#define DEF_WRAP_VEX(T)     \
template <>                 \
struct wrap_vex<T> {        \
    using type = Val<T>;    \
};                          \

DEF_WRAP_VEX(i8)
DEF_WRAP_VEX(u8)
DEF_WRAP_VEX(i16)
DEF_WRAP_VEX(i32)
DEF_WRAP_VEX(i64)
DEF_WRAP_VEX(float)
DEF_WRAP_VEX(double)

using t1 = wrap_vex<Vex<u8>>::type;

template <typename T>
using wrap_t = typename wrap_vex<T>::type;


template <typename V1, typename V2>
using vex_type = typename std::conditional< 
                    std::is_convertible<wrap_t<V1>, Vex<typename wrap_t<V1>::value_type>>::value,
                    typename wrap_t<V1>::value_type,
                    typename wrap_t<V2>::value_type
                >::type;


template <typename V1, typename V2>
using vex_valuetype = typename std::conditional<
    std::is_convertible<wrap_t<V1>, Vex<typename wrap_t<V1>::value_type>>::value,
    typename std::conditional<
        std::is_convertible<wrap_t<V2>, Vex<typename wrap_t<V2>::value_type>>::value,
        greater_type<typename wrap_t<V1>::value_type, typename wrap_t<V2>::value_type>, // both wrap<V1> & wrap<V2> are convertible to Vex<T>
        vex_type<V1, V2>// default case
    >::type,
    vex_type<V1, V2>
>::type;


// NOTE : A simpler conversion
// template <typename V, typename T>
// using reType = typename
//     std::conditional<
//         // std::is_arithmetic to support floats & doubles.
//         std::is_integral<V>::value, 
//         T, 
//         V 
//     >::type;

// NOTE: A full-blown type conversion function
// V -> T (try convert V to T if V is a numeric type, otherwise leave unchanged)
// Separated float/double and integral conversions
// EXAMPLE: Vex<int> + 3.14 
// The conversion of 3.14 to 3 (silent truncation) 
// is probably not what one would expect
template <typename V, typename T>
using reType = typename
    std::conditional<
        // std::is_arithmetic to support floats & doubles.
        std::is_integral<V>::value, // if V is integral
        T,
        // else, if V is not integral
        typename std::conditional<
            std::is_floating_point<V>::value, // if V is floating point
            typename std::conditional<
                std::is_floating_point<T>::value, // and T is floating point
                T, // then T
                V  // otherwise V
            >::type,
            V // V is not arithmetic
        >::type
    >::type;
