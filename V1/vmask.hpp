#pragma once

#include "type_traits"
#include "type_ops.hpp"

template <typename T>
class Vex;

template <typename Comp, typename V1, typename V2>
class VMask {
public:
    VMask(V1 _lhs, V2 _rhs)
    : lhs {_lhs}
    , rhs {_rhs}
    {}

    bool operator[] (size_t i) const
    {
        return lhs[i] == rhs[i];
    }

private:
    V1 lhs;
    V2 rhs;
};

template <typename Vexlike, typename Comp, typename T1, typename T2>
class VMaskedProxy {   
public:
    using value_type = typename Vexlike::value_type;

    VMaskedProxy (Vexlike & _vex, VMask<Comp, T1, T2> const& _mask)
    : vex {_vex}
    , mask {_mask}
    {}

    void operator= (value_type val)
    {
        // naive implementation (no simd):
        for (size_t i = 0; i < vex.size(); i++)
        {
            if (mask[i]) {
                vex[i] = val;
            }
        }
    }

    //template <typename V>
    //auto operator= (V const& other)

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
auto operator== (V1 const& vex, V2 const& v2) -> VMask<bool, wrap_t<V1>, wrap_t<V2>>
{
    return VMask<bool, wrap_t<V1>, wrap_t<V2>>(vex, v2);
}

// template <typename T>
// auto operator== (Vex<T> const& vex, promote_t<T> val) -> VMask<bool, Vex<T>, Val<T>>
// {  
//     std::cerr << "VAL: " << val << "\n";
//     return VMask<bool, Vex<T>, Val<T>>(vex, Val<T>(val));
// }