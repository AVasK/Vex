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

    auto get_sse_reg (size_t idx) const -> __m128i
    {
        auto _r1 = v1.get_sse_reg(idx);
        auto _r2 = v2.get_sse_reg(idx);
        return op<'+'>(_r1, _r2);
    }

    auto get_avx_reg (size_t idx) const -> __m256i
    {
        auto _r1 = v1.get_avx_reg(idx);
        auto _r2 = v2.get_avx_reg(idx);
        return op<'+'>(_r1, _r2);
    }


    operator Vex<T> ()
    {
        return vex_add(v1, v2);
    }

};

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
auto operator+ (Vex<T> const& v, int val) -> VISum<T>
{
    return VISum<T>(v, T(val));
}

template <typename T>
auto operator+ (int val, Vex<T> const& v) -> VISum<T>
{
    return VISum<T>(v, T(val));
}

// specialization for i64
auto operator+ (Vex<i64> const& v, i64 val) -> VISum<i64>
{
    return VISum<i64>(v, val);
}
auto operator+ (i64 val, Vex<i64> const& v) -> VISum<i64>
{
    return VISum<i64>(v, val);
}

// VSum / VISum to vex_op in case where there are more additions/subtractions e.t.c
template <typename T, template<typename> class Vexlike>
auto operator+ (VSum<T> const& vsum, Vexlike<T> const& vexlike) -> vex_op<VSum<T>, '+', Vexlike<T>>
{
    return vex_op<VSum<T>, '+', Vexlike<T>>(vsum, vexlike);
}