// @: Unified vectorized ops
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

#include "intrin_funcs.hh"
#include "simd_types.hpp"
#include "simd_ops.hpp"

template <typename T>
class Vex;


// ===============================
// ========== Addition ===========
// ===============================

template <typename T, class V1, class V2>
__attribute__((target("avx2")))
inline void add_avx (
                  Vex<T> & res,
                  V1 const& v1,
                  V2 const& v2
                  )
{
    //auto n_regs = v1.size_in_registers();
    auto n_regs = std::min(v1.size_in_registers(), v2.size_in_registers());
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _r1 = v1.get_avx_reg(i * avx_offset<T>::value);;
        auto _r2 = v2.get_avx_reg(i * avx_offset<T>::value);
        auto _res = _r1 + _r2;
        store_avx( &res[i * avx_offset<T>::value], _res );
    }
}


template <typename T>
__attribute__((target("avx2")))
inline void addval_avx (Vex<T> & res, Vex<T> const& vex, promote_t<T> value)
{
    for (size_t i=0; i < vex.size_in_registers(); ++i)
    {
        auto _r1 = vex.get_avx_reg(i * avx_offset<T>::value);
        auto _r2 = avx_reg<T>( T(value) );
        auto _res = _r1 + _r2;
        store_avx( &res[i * avx_offset<T>::value], _res );
    }
}


template <typename T, class V1, class V2>
inline void add_sse (Vex<T> & res, V1 const& v1, V2 const& v2)
{
    //auto n_regs = v1.size_in_registers();
    auto n_regs = std::min(v1.size_in_registers(), v2.size_in_registers());
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _r1 = v1.get_sse_reg(i * sse_offset<T>::value);
        auto _r2 = v2.get_sse_reg(i * sse_offset<T>::value);
        auto _res = _r1 + _r2;
        store_sse( &res[i * sse_offset<T>::value], _res );
    }
}


template <typename T>
inline void addval_sse (Vex<T> & res, Vex<T> const& vex, promote_t<T> value)
{
    for (size_t i=0; i < vex.size_in_registers(); ++i)
    {
        auto _r1 = vex.get_sse_reg(i * sse_offset<T>::value);
        auto _r2 = sse_reg<T>( T(value) );
        auto _res = _r1 + _r2;
        store_sse( &res[i * sse_offset<T>::value], _res );
    }
}


// ===============================
// ========= Subtraction =========
// =============================== 

template <typename T, class V1, class V2>
__attribute__((target("avx2")))
inline void sub_avx (
                  Vex<T> & res,
                  V1 const& v1,
                  V2 const& v2
                  )
{
    //auto n_regs = v1.size_in_registers();
    auto n_regs = std::min(v1.size_in_registers(), v2.size_in_registers());
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _r1 = v1.get_avx_reg(i * avx_offset<T>::value);;
        auto _r2 = v2.get_avx_reg(i * avx_offset<T>::value);
        auto _res = _r1 - _r2;
        store_avx( &res[i * avx_offset<T>::value], _res );
    }
}


template <typename T>
__attribute__((target("avx2")))
inline void subval_avx (Vex<T> & res, Vex<T> const& vex, promote_t<T> value)
{
    for (size_t i=0; i < vex.size_in_registers(); ++i)
    {
        auto _r1 = vex.get_avx_reg(i * avx_offset<T>::value);
        auto _r2 = avx_reg<T>( T(value) );
        auto _res = _r1 - _r2;
        store_avx( &res[i * avx_offset<T>::value], _res );
    }
}


template <typename T, class V1, class V2>
inline void sub_sse (Vex<T> & res, V1 const& v1, V2 const& v2)
{
    //auto n_regs = v1.size_in_registers();
    auto n_regs = std::min(v1.size_in_registers(), v2.size_in_registers());
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _r1 = v1.get_sse_reg(i * sse_offset<T>::value);
        auto _r2 = v2.get_sse_reg(i * sse_offset<T>::value);
        auto _res = _r1 - _r2;
        store_sse( &res[i * sse_offset<T>::value], _res );
    }
}


template <typename T>
inline void subval_sse (Vex<T> & res, Vex<T> const& vex, promote_t<T> value)
{
    for (size_t i=0; i < vex.size_in_registers(); ++i)
    {
        auto _r1 = vex.get_sse_reg(i * sse_offset<T>::value);
        auto _r2 = sse_reg<T>( T(value) );
        auto _res = _r1 - _r2;
        store_sse( &res[i * sse_offset<T>::value], _res );
    }
}

// ===============================
// ======== Multiplication =======
// =============================== 

template <typename T, class V1, class V2>
__attribute__((target("avx2")))
inline void mul_avx (
                  Vex<T> & res,
                  V1 const& v1,
                  V2 const& v2
                  )
{
    //auto n_regs = v1.size_in_registers();
    auto n_regs = std::min(v1.size_in_registers(), v2.size_in_registers());
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _r1 = v1.get_avx_reg(i * avx_offset<T>::value);;
        auto _r2 = v2.get_avx_reg(i * avx_offset<T>::value);
        auto _res = _r1 * _r2;
        store_avx( &res[i * avx_offset<T>::value], _res );
    }
}


template <typename T>
__attribute__((target("avx2")))
inline void mulval_avx (Vex<T> & res, Vex<T> const& vex, promote_t<T> value)
{
    for (size_t i=0; i < vex.size_in_registers(); ++i)
    {
        auto _r1 = vex.get_avx_reg(i * avx_offset<T>::value);
        auto _r2 = avx_reg<T>( T(value) );
        auto _res = _r1 * _r2;
        store_avx( &res[i * avx_offset<T>::value], _res );
    }
}


template <typename T, class V1, class V2>
inline void mul_sse (Vex<T> & res, V1 const& v1, V2 const& v2)
{
    //auto n_regs = v1.size_in_registers();
    auto n_regs = std::min(v1.size_in_registers(), v2.size_in_registers());
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _r1 = v1.get_sse_reg(i * sse_offset<T>::value);
        auto _r2 = v2.get_sse_reg(i * sse_offset<T>::value);
        auto _res = _r1 * _r2;
        store_sse( &res[i * sse_offset<T>::value], _res );
    }
}


template <typename T>
inline void mulval_sse (Vex<T> & res, Vex<T> const& vex, promote_t<T> value)
{
    for (size_t i=0; i < vex.size_in_registers(); ++i)
    {
        auto _r1 = vex.get_sse_reg(i * sse_offset<T>::value);
        auto _r2 = sse_reg<T>( T(value) );
        auto _res = _r1 * _r2;
        store_sse( &res[i * sse_offset<T>::value], _res );
    }
}


//////////////////////
//       DIV

template <typename T, class V1, class V2>
inline void div_sse (Vex<T> & res, V1 const& v1, V2 const& v2)
{
    auto n_regs = std::min(v1.size_in_registers(), v2.size_in_registers());
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _r1 = v1.get_sse_reg(i * sse_offset<T>::value);
        auto _r2 = v2.get_sse_reg(i * sse_offset<T>::value);
        auto _res = _r1 / _r2;
        store_sse( &res[i * sse_offset<T>::value], _res );
    }
}


template <typename T, class V1, class V2>
__attribute__((target("avx2")))
inline void div_avx (Vex<T> & res, V1 const& v1, V2 const& v2)
{
    auto n_regs = std::min(v1.size_in_registers(), v2.size_in_registers());
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _r1 = v1.get_avx_reg(i * avx_offset<T>::value);;
        auto _r2 = v2.get_avx_reg(i * avx_offset<T>::value);
        auto _res = _r1 / _r2;
        store_avx( &res[i * avx_offset<T>::value], _res );
    }
}