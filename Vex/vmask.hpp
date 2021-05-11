#pragma once

#include "type_traits"
#include "type_ops.hpp"

template <typename T>
class Vex;

template <typename V1, typename V2>
struct twofold;

enum class Comparator {
    EQ,     // ==
    NEQ,    // !=
    LT,     // <
    GT,     // >
    LT_EQ,  // <=
    GT_EQ   // >=
};

template <Comparator>
struct Comparison;

template<>
struct Comparison<Comparator::EQ>
{
    template <typename T>
    static constexpr bool evaluate (T lhs, T rhs)
    {
        return lhs == rhs;
    }
};

template <Comparator Comp, typename V1, typename V2>
class VMask {
public:
    VMask(V1 _lhs, V2 _rhs)
    : lhs {_lhs}
    , rhs {_rhs}
    {}

    bool operator[] (size_t i) const
    {
        return Comparison<Comp>::evaluate(lhs[i], rhs[i]);
    }


private:
    V1 lhs;
    V2 rhs;
};

template <typename Vexlike, Comparator Comp, typename T1, typename T2>
class VMaskedProxy {   
public:
    using value_type = typename Vexlike::value_type;

    VMaskedProxy (Vexlike & _vex, VMask<Comp, T1, T2> const& _mask)
    : vex {_vex}
    , mask {_mask}
    {}

    template <typename U>
    void operator= (U const& _val)
    {
        wrap_t<U> val = _val;
        // naive implementation (no simd):
        for (size_t i = 0; i < vex.size(); i++)
        {
            if (mask[i]) {
                vex[i] = val[i];
            }
        }
    }

    template <typename V1, typename V2>
    void operator= (twofold<V1, V2> vals)
    {
        for (size_t i = 0; i < vex.size(); i++)
        {
            if (mask[i]) {
                vex[i] = vals.v1[i];
            }
            else {
                vex[i] = vals.v2[i];
            }
        }
    }

    void operator+= (value_type val)
    {
        for (size_t i = 0; i < vex.size(); i++)
        {
            if (mask[i]) {
                vex[i] += val;
            }
        }
    }

    void operator*= (value_type val)
    {
        for (size_t i = 0; i < vex.size(); i++)
        {
            if (mask[i]) {
                vex[i] += val;
            }
        }
    }

    void operator/= (value_type val)
    {
        for (size_t i = 0; i < vex.size(); i++)
        {
            if (mask[i]) {
                vex[i] += val;
            }
        }
    }

private:
    Vexlike & vex;
    VMask<Comp,T1,T2> const& mask;
};

template <
    typename V1, 
    typename V2,
    //typename _vtype = typename V1::value_type,
    //typename = typename std::enable_if< std::is_convertible<V1, Vex<_vtype>>::value >::type
    typename = decltype(std::declval<wrap_t<V1>>().get_avx_reg(0))
>
inline auto operator== (V1 const& vex, V2 const& v2) -> VMask<Comparator::EQ, wrap_t<V1>, wrap_t<V2>>
{
    return VMask<Comparator::EQ, wrap_t<V1>, wrap_t<V2>>(vex, v2);
}


template <typename V>
struct Otherwise {
    using value_type = typename wrap_t<V>::value_type;

    explicit Otherwise (V const& val)
    : value {val}
    {}

    V const& value;
};

template <typename V>
auto otherwise (V const& v) -> Otherwise<V>
{
    return Otherwise<V>(v);
}

template <typename V1, typename V2>
struct twofold {
    
    explicit twofold (V1 const& _v1, V2 const& _v2)
    : v1 {_v1}
    , v2 {_v2}
    {}

    wrap_t<V1> v1;
    wrap_t<V2> v2;
};

template <typename V1, typename V2>
auto operator| (V1 const& v1, Otherwise<V2> v2) -> twofold<V1, V2>
{
    return twofold<V1, V2> (v1, v2.value);
}