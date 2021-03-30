// Included into vex.hpp
#include "vex_proxy.hpp"
#include "num_types.hpp"

template <typename T>
struct VSum {

    using value_type = T;

    Vex<T> const& v1;
    Vex<T> const& v2;

    VSum(Vex<T> const& _v1, Vex<T> const& _v2)
    : v1 {_v1}
    , v2 {_v2}
    {}

    auto size() const -> size_t
    {
        return std::min(v1.size(), v2.size());
    }

    auto size_in_registers() const -> size_t
    {
        return std::min(v1.size_in_registers(), v2.size_in_registers());
    }

    auto operator[] (size_t idx) const -> T
    {
        return v1[idx] + v2[idx];
    }

    auto get_sse_reg (size_t i) const -> sse_reg<value_type>
    {
        auto _r1 = load_sse(&v1[i]);
        auto _r2 = load_sse(&v2[i]);
        return op<'+'>(_r1, _r2);
    }

    auto get_avx_reg (size_t i) const -> avx_reg<value_type>;

    operator Vex<T> ()
    {
        return vex_add(v1, v2);
    }

};

#include "vex2proxy.tpp"

template <typename T>
struct VISum {
    Vex<T> const& vex;
    T const val;

    VISum(Vex<T> const& _v1, T _v2)
    : vex {_v1}
    , val {_v2}
    {}

    VISum(T _v2, Vex<T> const& _v1)
    : vex {_v1}
    , val {_v2}
    {}

    operator Vex<T> ()
    {
        return vex_add(vex, val);
    }

};

template <typename T>
auto operator+ (Vex<T> const& v1, Vex<T> const& v2) -> VSum<T>
{
    return VSum<T>(v1, v2);
}

template <typename T>
auto operator+ (Vex<T> const& v, promote_t<T> val) -> VISum<T>
{
    return VISum<T>(v, T(val));
}

template <typename T>
auto operator+ (promote_t<T> val, Vex<T> const& v) -> VISum<T>
{
    return VISum<T>(v, T(val));
}


// VSum / VISum to vex_op in case where there are more additions/subtractions e.t.c
template <typename T, template<typename> class Vexlike>
auto operator+ (VSum<T> const& vsum, Vexlike<T> const& vexlike) -> vex_op<VSum<T>,'+',Vexlike<T>>
{
    return vex_op<VSum<T>, '+', Vexlike<T>>(vsum, vexlike);
}

template <typename T>
auto operator+ (VSum<T> const& vsum, Vex<T> const& vex) -> vex_op<VSum<T>,'+',VProxy<T>>
{
    return vex_op<VSum<T>,'+',VProxy<T>>( vsum, VProxy<T>(vex) );
}

template <typename T>
auto operator+ (VSum<T> const& vsum, promote_t<T> val) -> vex_op<VSum<T>,'+',Val<T>>
{
    return vex_op<VSum<T>,'+',Val<T>>( vsum, Val<T>(val) );
}


template <typename Vexlike, 
          typename _vtype = typename Vexlike::value_type,
          typename _ptype = promote_t<_vtype>>
auto operator+ (Vexlike const& vexlike, _ptype val) -> vex_op<Vexlike,'+',Val<_vtype>>
{
    return vex_op<Vexlike,'+',Val<_vtype>>( vexlike, Val<_vtype>(val) );
}


template <typename Vexlike, typename _vtype = typename Vexlike::value_type>
auto operator+ (Vexlike const& vexlike, Vex<_vtype> const& vex) -> vex_op<Vexlike,'+',VProxy<_vtype>>
{
    return vex_op<Vexlike,'+',VProxy<_vtype>>( vexlike, VProxy<_vtype>(vex) );
}