// Copyright (c) 2021 Alex Vaskov

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#pragma once
// vex proxy wrappers
#include <iostream>
#include <type_traits>
#include <limits>
#include "vex.hpp"
#include "simd_ops.hpp"

#define func auto

#include "SIMD_flags.set"

/*
template <typename T>
struct sse_register_type;

template<> struct sse_register_type<i8> {using type = __m128i;};
template<> struct sse_register_type<i16> {using type = __m128i;};
template<> struct sse_register_type<i32> {using type = __m128i;};
template<> struct sse_register_type<i64> {using type = __m128i;};
template<> struct sse_register_type<float> {using type = __m128;};
template<> struct sse_register_type<double> {using type = __m128d;};

template <typename T>
using sse_reg = typename sse_register_type<T>::type;
*/


////////// VEX_OP ////////////////
// minimal interface for T1 & T2:
// > size()
// > size_in_registers()
// > get_sse_reg()
// > get_avx_reg()
// > operator[]
//////////////////////////////////

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
        auto res = std::min(v1.size(), v2.size());
        return res;
    }

    func size_in_registers() const -> size_t
    {
        auto res = std::min(v1.size_in_registers(), v2.size_in_registers());
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
        return op<'+'>(_r1, _r2);
    }

    func get_avx_reg (size_t idx) const -> __m256i
    {
        auto _r1 = v1.get_avx_reg(idx);
        auto _r2 = v2.get_avx_reg(idx);
        return op<'+'>(_r1, _r2);
    }

    func eval() const -> Vex<value_type>
    {
        auto flags = Vex<value_type>::simd_flags();
        auto len = this->size();
        auto n_regs = this->size_in_registers();
        Vex<value_type> res (len);

        if (flags & SIMD::AVX)
        {
            for (size_t i = 0; i < n_regs; ++i)
            {
                auto _r1 = v1.get_avx_reg(i);
                auto _r2 = v2.get_avx_reg(i);
                auto _res = op<opcode>(_r1, _r2);
                istore_256( &res[i<<4], _res );
            }
        }
        else 
        { 
            #if ARCH_x86_64
            for (size_t i = 0; i < n_regs; ++i)
            {
                auto _r1 = v1.get_sse_reg(i);
                auto _r2 = v2.get_sse_reg(i);
                auto _res = op<opcode>(_r1, _r2);
                istore_128( &res[i<<3], _res );
            }
            #elif ARCH_x86_32
            for (size_t i = 0; i < len; ++i)
            {
                res[i] = v1[i] + v2[i];
            }
            #endif
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
        //return -1;
        return std::numeric_limits<std::size_t>::max();
    }

    constexpr func size_in_registers() const -> size_t
    {
        //return -1;
        return std::numeric_limits<std::size_t>::max();
    }

    func get_sse_reg (size_t idx) const -> __m128i;
    func get_avx_reg (size_t idx) const -> __m256i;

private:
    T val;
};

template<>
inline func Val<i16>::get_sse_reg(size_t idx) const -> __m128i
{
    static auto res = _mm_set1_epi16(val);
    return res;
}

template<>
inline func Val<i16>::get_avx_reg(size_t idx) const -> __m256i
{
    static auto res = _mm256_set1_epi16(val);
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

    func size_in_registers() const -> size_t
    {
        auto res = vector.size_in_registers();
        return res;
    }

    func operator[] (size_t idx) const -> value_type
    {
        return vector[idx];
    }

    func get_sse_reg (size_t i) const -> __m128i;
    func get_avx_reg (size_t i) const -> __m256i;

private:
    Vex<T> const& vector;
};

template<>
inline func VProxy<i16>::get_sse_reg (size_t i) const -> __m128i
{
    return iload_128(&vector[i<<3]);
}

template<>
inline func VProxy<i16>::get_avx_reg (size_t i) const -> __m256i
{
    return iload_256(&vector[i<<4]);
}

#include "SIMD_flags.discard"


template <typename V, typename T>
func add (V const& vex, T val) -> vex_op<V,'+', Val<T>>
{
    return vex_op< V,'+',Val<T> >( vex, Val<T>(val) );
}

template <typename V, typename T>
func add (V const& proxy, Vex<T> const& v2) -> vex_op<V,'+', VProxy<T>>
{
    return vex_op< V,'+',VProxy<T> >( proxy, VProxy<T>(v2) );
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

