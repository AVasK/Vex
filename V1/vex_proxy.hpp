// @: Proxy Expression Templates
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

#include <iostream>
#include <type_traits>
#include <limits>
//#include "vex.hpp"
//#include "intrin_funcs.hh"
#include "simd_types.hpp"
#include "simd_ops.hpp"
#include "vex_ops.hpp" 
#include "vex_proxy_ops.hpp" // eval_op<opcode>::compute 

#define func auto

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

    constexpr vex_op (T1 t1, T2 t2)
    : v1 {t1}
    , v2 {t2}
    {}

    operator Vex<value_type> () const
    {
        return eval();
    }

    template <typename _T>
    operator Vex<_T> () const
    {
        Vex<_T> res( size() );
        for (size_t i=0; i<size(); ++i)
        {
            res[i] = this->operator[](i);
        }
        return res;
    }


    constexpr func size() const -> size_t
    {
        return std::min(v1.size(), v2.size());
    }

    func size_in_registers() const -> size_t
    {
        auto res = std::min(v1.size_in_registers(), v2.size_in_registers());
        return res;
    }

    func operator[] (size_t idx) const -> value_type
    {
        return op<opcode>(v1[idx], v2[idx]);
    }

    func get_sse_reg (size_t idx) const -> sse_reg<value_type>
    {
        return simd_op<opcode, value_type>::sse_reg(idx, v1, v2);
    }

    __attribute__((target("avx2")))
    func get_avx_reg (size_t idx) const -> avx_reg<value_type>
    {
        return simd_op<opcode, value_type>::avx_reg(idx, v1, v2);
    }


    func eval() const -> Vex<value_type>
    {
        Vex<value_type> res (this->size());
        eval_op<opcode>::compute(res, v1, v2);
        return res;
    }

    T1 const v1;
    T2 const v2;
};



template <typename T>
struct Val {

    using value_type = T;

    constexpr Val(T _val)
    : val {_val}
    {}

    constexpr func operator[] (size_t) const -> value_type
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

    constexpr func get_sse_reg (size_t idx) const -> sse_reg<value_type>
    {
        return sse_reg<value_type>(val);
    }
    
    __attribute__((target("avx2")))
    constexpr func get_avx_reg (size_t idx) const -> avx_reg<value_type>
    {
        return avx_reg<value_type>( val );
    }

    T val;
};


//  VProxy is a thin wrapper around Vex<T> to avoid copying when passing in expression templates
template <typename T>
struct VProxy {

    using value_type = T;

    VProxy(Vex<T> const& vex)
    : vector {vex}
    {}

    operator Vex<value_type> ()
    {
        return vector;
    }

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

    func get_sse_reg (size_t i) const -> sse_reg<value_type>
    {
        return load_sse(&vector[i]);
    }

    __attribute__((target("avx2")))
    func get_avx_reg (size_t i) const -> avx_reg<value_type>
    {
       return load_avx(&vector[i]);
    }

    Vex<T> const& vector;
};


#undef func

