// vex proxy wrappers
#include <iostream>
#include <type_traits>
//#include <limits>
#include "vex.hpp"

#define func auto

template <typename T1, char opcode, typename T2>
struct vex_op;

template <typename T1, typename T2>
struct vex_op<T1, '+', T2>
{
    static_assert(
        std::is_same<typename T1::value_type, typename T2::value_type>::value, 
        "value types should match for T1 and T2 in vex_op<T1, opcode, T2>"
    );

    using value_type = typename T1::value_type;

    template <typename U1, typename U2>
    vex_op (U1&& t1, U2&& t2)
    : v1 {std::forward<U1>(t1)}
    , v2 {std::forward<U2>(t2)}
    {}

    operator Vex<value_type> () const {
        std::cout << "to Vex\n";
        return eval();
    }

    func size() const -> size_t
    {
        return std::min(v1.size(), v2.size());
    }

    func operator[] (size_t idx) const -> value_type
    {
        return v1[idx] + v2[idx];
    }

    func eval() const -> Vex<value_type>
    {
        auto len = std::min(v1.size(), v2.size());
        Vex<value_type> res (len);
        for (size_t i = 0; i < len; ++i)
        {
            std::cout << "v1["<<i<<"] = " << v1[i] << "\n"
                      << "v2["<<i<<"] = " << v2[i] << "\n";

            res[i] = v1[i] + v2[i];
        }
        return res;
    }

    T1 const v1;
    T2 const v2;
};


template <typename T>
class Val {
public:
    using value_type = T;

    Val(T _val)
    : val {_val}
    {}

    func operator[] (size_t) const -> T
    {
        return val;
    }

    constexpr func size() const -> const size_t 
    {
        return -1;
        //return std::numeric_limits<std::size_t>::max();
    }
private:
    T val;
};


template <typename V, typename T>
func add (V const& vex, T val) -> vex_op<V,'+', Val<T>>
{
    return vex_op< V,'+',Val<T> >( vex, Val<T>(val) );
}

template <typename V>
func add (V const& v1, V const& v2) -> vex_op<V,'+',V>
{
    return vex_op< V,'+',V >( v1, v2 );
}



int main() 
{
    Vex<i16> a(10, 3);
    Vex<i16> b(10, 1);

    Vex<i16> res = add( add( add(a, b), (i16)3), (i16)3);
    std::cout << res;
}

#undef func