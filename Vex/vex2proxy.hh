// <-> Included into vex.hpp
#pragma once

#include "type_traits"
#include "type_ops.hpp"
#include "vex_proxy.hpp"
#include "simd_types.hpp"

// The Idea here is:
// operator+ (wrap_t<V1>, wrap_t<V2>) -> vex_op<Wrap<V1>,'+',Wrap<V2>
// where wrap_t<V> = VProxy<T> if V == Vex<T>
//                 = Val<T> if V is arithmetic
//                 = V otherwise
// using t1 = wrap_vex<i8>::type;
// using t2 = wrap_vex<Vex<i8>>::type;
// using t3 = wrap_vex<VSum<i8>>::type;
// using t4 = wrap_vex<vex_op<Vex<i8>,'+',Val<i8>>>::type;

template <typename T1, char opcode, typename T2, typename vtype = vex_type<T1, T2>>
auto eval (vex_op<T1,opcode,T2> proxy) -> Vex<vtype>
{
    return Vex<vtype>( proxy );
}


template <
    typename V1,
    typename V2,
    typename T = vex_type<V1, V2>,
    typename VX1 = wrap_t<reType<V1, T>>,
    typename VX2 = wrap_t<reType<V2, T>>,
    typename = decltype(std::declval<wrap_t<V1>>().get_avx_reg(0))
>  
constexpr inline auto operator+ (V1 const& v1, V2 const& v2) -> vex_op<VX1,'+',VX2>
{
    return vex_op<VX1,'+',VX2>( v1, v2 );
}


template <
    typename V1,
    typename V2,
    typename T = vex_type<V1, V2>,
    typename VX1 = wrap_t<reType<V1, T>>,
    typename VX2 = wrap_t<reType<V2, T>>,
    typename = decltype(std::declval<wrap_t<V1>>().get_avx_reg(0))
>  
constexpr inline auto operator- (V1 const& v1, V2 const& v2) -> vex_op<VX1,'-',VX2>
{
    return vex_op<VX1,'-',VX2>( v1, v2 );
}


template <
    typename V1,
    typename V2,
    typename T = vex_type<V1, V2>,
    typename VX1 = wrap_t<reType<V1, T>>,
    typename VX2 = wrap_t<reType<V2, T>>,
    typename = decltype(std::declval<wrap_t<V1>>().get_avx_reg(0))
>  
constexpr inline auto operator* (V1 const& v1, V2 const& v2) -> vex_op<VX1,'*',VX2>
{
    return vex_op<VX1,'*',VX2>( v1, v2 );
}


template <
    typename V1,
    typename V2,
    typename T = vex_type<V1, V2>,
    typename VX1 = wrap_t<reType<V1, T>>,
    typename VX2 = wrap_t<reType<V2, T>>,
    typename = decltype(std::declval<wrap_t<V1>>().get_avx_reg(0))
>  
constexpr inline auto operator/ (V1 const& v1, V2 const& v2) -> vex_op<VX1,'/',VX2>
{
    return vex_op<VX1,'/',VX2>( v1, v2 );
}


