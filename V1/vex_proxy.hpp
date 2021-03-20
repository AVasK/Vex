// vex proxy wrappers
#include <iostream>
#include <type_traits>
//#include <limits>
#include "vex.hpp"

#define func auto

template <char op>
func op (__m128i, __m128i) -> __m128i;

template <>
func op<'+'> (__m128i r1, __m128i r2) -> __m128i
{
    return _mm_add_epi16(r1, r2);
}


template <typename T1, char opcode, typename T2>
struct vex_op
{
    static_assert(
        std::is_same<typename T1::value_type, typename T2::value_type>::value, 
        "value types should match for T1 and T2 in vex_op<T1, opcode, T2>"
    );

    using value_type = typename T1::value_type;

    vex_op (T1 t1, T2 t2)
    : v1 {t1}
    , v2 {t2}
    {}

    operator Vex<value_type> () const {
        //std::cout << "to Vex\n";
        return eval();
    }

    func size() const -> size_t
    {
        static auto res = std::min(v1.size(), v2.size());
        return res;
    }

    func size_in_sse_regs() const -> size_t
    {
        static auto res = std::min(v1.size_in_sse_regs(), v2.size_in_sse_regs());
        return res;
    }

    func operator[] (size_t idx) const -> value_type
    {
        return v1[idx] + v2[idx];
    }

    func get_sse_reg (size_t idx) const -> __m128i
    {
        auto _r1 = v1.get_sse_reg(idx);
        auto _r2 = v2.get_sse_reg(idx);
        return _mm_add_epi16(_r1, _r2);
    }

    func eval() const -> Vex<value_type>
    {
        /*
        auto len = std::min(v1.size(), v2.size());
        Vex<value_type> res (len);
        for (size_t i = 0; i < len; ++i)
        {
            //std::cout << "v1["<<i<<"] = " << v1[i] << "\n"
            //          << "v2["<<i<<"] = " << v2[i] << "\n";

            res[i] = v1[i] + v2[i];
        }
        return res;
        */
       auto len = this->size();
       auto n_regs = this->size_in_sse_regs();
       Vex<value_type> res (len);
       for (size_t i = 0; i < n_regs; ++i)
       {
           auto _r1 = v1.get_sse_reg(i);
           auto _r2 = v2.get_sse_reg(i);
           auto _res = op<opcode>(_r1, _r2);
           istore_128( &res[i<<3], _res );
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

    func operator[] (size_t) const -> value_type
    {
        return val;
    }

    constexpr func size() const -> const size_t 
    {
        return -1;
        //return std::numeric_limits<std::size_t>::max();
    }

    constexpr func size_in_sse_regs() const -> size_t
    {
        return -1;
    }

    func get_sse_reg (size_t idx) const -> __m128i;

private:
    T val;
};

template<>
inline func Val<i16>::get_sse_reg(size_t idx) const -> __m128i
{
    static auto res = _mm_set1_epi16(val);
    return res;
}

//  VProxy is a thin wrapper around Vex<T> for 
//  copy elusion & possible operator[] -> __m128 overload
template <typename T>
class VProxy {
public:

    using value_type = T;

    VProxy(Vex<T> const& vex)
    : vector {vex}
    {}

    func size() const -> size_t
    {
        return vector.size();
    }

    func size_in_sse_regs() const -> size_t
    {
        static auto res = vector.size_in_sse_regs();
        return res;
    }


    func operator[] (size_t idx) const -> value_type
    {
        return vector[idx];
    }

    func get_sse_reg (size_t i) const -> __m128i;

private:
    Vex<T> const& vector;
};

template<>
inline func VProxy<i16>::get_sse_reg (size_t i) const -> __m128i
{
    return iload_128(&vector[i<<3]);
}




template <typename V, typename T>
func add (V const& vex, T val) -> vex_op<V,'+', Val<T>>
{
    return vex_op< V,'+',Val<T> >( vex, Val<T>(val) );
}

template <typename V, typename T>
func add (V const& vex, Vex<T> const& v2) -> vex_op<V,'+', VProxy<T>>
{
    return vex_op< V,'+',VProxy<T> >( vex, VProxy<T>(v2) );
}

template <typename T>
func add (Vex<T> const& vex, T val) -> vex_op<VProxy<T>,'+', Val<T>>
{
    return vex_op< VProxy<T>,'+',Val<T> >( VProxy<T>(vex), Val<T>(val) );
}

template <typename T>
func add (Vex<T> const& v1, Vex<T> const& v2) -> vex_op<VProxy<T>,'+',VProxy<T>>
{
    return vex_op< VProxy<T>,'+',VProxy<T> >( VProxy<T>(v1), VProxy<T>(v2) );
}
/*
template <typename V, typename U>
func add (V v1, U v2) -> vex_op<V,'+',U>
{
    return vex_op< V,'+',U >( v1, v2 );
}
*/

/*
int main() 
{
    Vex<i16> a(10, 3);
    Vex<i16> b(10, 1);

    Vex<i16> res = add( add( add((a+b), (i16)1), (i16)3), (i16)3);
    std::cout << res;

    //auto vp = VProxy<i16>(a + (i16)1 + b);
    //auto cvp = vp;
}
*/
#undef func