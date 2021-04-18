// @: Vex template implementation file
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
#include "vex_proxy.hpp"


#define func auto

// ===============================
// ========== Addition ===========
// ===============================

template<typename T>
func Vex<T>::operator+= (Vex<T> const& other) -> Vex<T>&
{
    if (simd_flags() & SIMD::AVX2) {
        add_avx(*this, *this, other);
    }
    // Add compile-time user-set-flags checking
    else if (simd_flags() & SIMD::SSE2) {
        add_sse(*this, *this, other);
    }
    return *this;
}


template<typename T>
func Vex<T>::operator+= (T other) -> Vex<T>&
{   
    if (simd_flags() & SIMD::AVX2) {
        // AVX2
        addval_avx(*this, *this, other);
    }
    else if (simd_flags() & SIMD::SSE2) {
        // SSE2
        addval_sse(*this, *this, other);
    }
    return *this;
}


template <typename T>
func vex_add (Vex<T> const& v1, Vex<T> const& v2) -> Vex<T>
{
    Vex<T> res (v1.size());

    if (Vex<T>::simd_flags() & SIMD::AVX2) {
        add_avx(res, v1, v2);
    }
    else if (Vex<T>::simd_flags() & SIMD::SSE2) {
        add_sse(res, v1, v2);
    }
    return res;
}


template<typename T>
inline func vex_add (Vex<T> const& vex, T value) -> Vex<T>
{
    Vex<T> res (vex.size());
    
    if (Vex<T>::simd_flags() & SIMD::AVX2) {
        addval_avx(res, vex, value);
    }
    else if (Vex<T>::simd_flags() & SIMD::SSE2) {
        addval_sse(res, vex, value);
    }
    return res;
}

template<typename T>
func vex_add (T value, Vex<T> const& vex) -> Vex<T>
{
    return vex_add(vex, value);
}


// ===============================
// ========= Subtraction =========
// ===============================


template<typename T>
func Vex<T>::operator-= (Vex<T> const& other) -> Vex<T>&
{
    if (simd_flags() & SIMD::AVX2) {
        sub_avx(*this, *this, other);
    }
    // Add compile-time user-set-flags checking
    else if (simd_flags() & SIMD::SSE2) {
        sub_sse(*this, *this, other);
    }
    return *this;
}


template<typename T>
func Vex<T>::operator-= (T other) -> Vex<T>&
{   
    if (simd_flags() & SIMD::AVX2) {
        // AVX2
        subval_avx(*this, *this, other);
    }
    else if (simd_flags() & SIMD::SSE2) {
        // SSE2
        subval_sse(*this, *this, other);
    }
    return *this;
}


template <typename T>
func vex_sub (Vex<T> const& v1, Vex<T> const& v2) -> Vex<T>
{
    Vex<T> res (v1.size());

    if (Vex<T>::simd_flags() & SIMD::AVX2) {
        sub_avx(res, v1, v2);
    }
    else if (Vex<T>::simd_flags() & SIMD::SSE2) {
        sub_sse(res, v1, v2);
    }
    return res;
}


template<typename T>
inline func vex_sub (Vex<T> const& vex, T value) -> Vex<T>
{
    Vex<T> res (vex.size());
    
    if (Vex<T>::simd_flags() & SIMD::AVX2) {
        subval_avx(res, vex, value);
    }
    else if (Vex<T>::simd_flags() & SIMD::SSE2) {
        subval_sse(res, vex, value);
    }
    return res;
}

template<typename T>
func vex_sub (T value, Vex<T> const& vex) -> Vex<T>
{
    return vex_sub(vex, value);
}


// ===============================
// ======= Multiplication ========
// ===============================


template<typename T>
func Vex<T>::operator*= (Vex<T> const& other) -> Vex<T>&
{
    if (simd_flags() & SIMD::AVX2) {
        mul_avx(*this, *this, other);
    }
    // Add compile-time user-set-flags checking
    else if (simd_flags() & SIMD::SSE2) {
        mul_sse(*this, *this, other);
    }
    return *this;
}


template<typename T>
func Vex<T>::operator*= (T other) -> Vex<T>&
{   
    if (simd_flags() & SIMD::AVX2) {
        // AVX2
        mulval_avx(*this, *this, other);
    }
    else if (simd_flags() & SIMD::SSE2) {
        // SSE2
        mulval_sse(*this, *this, other);
    }
    return *this;
}

template <typename T>
func vex_mul (Vex<T> const& v1, Vex<T> const& v2) -> Vex<T>
{
    Vex<T> res (v1.size());

    if (Vex<T>::simd_flags() & SIMD::AVX2) {
        mul_avx(res, v1, v2);
    }
    else if (Vex<T>::simd_flags() & SIMD::SSE2) {
        mul_sse(res, v1, v2);
    }
    return res;
}


template<typename T>
inline func vex_mul (Vex<T> const& vex, T value) -> Vex<T>
{
    Vex<T> res (vex.size());
    
    if (Vex<T>::simd_flags() & SIMD::AVX2) {
        mulval_avx(res, vex, value);
    }
    else if (Vex<T>::simd_flags() & SIMD::SSE2) {
        mulval_sse(res, vex, value);
    }
    return res;
}

template<typename T>
func vex_mul (T value, Vex<T> const& vex) -> Vex<T>
{
    return vex_mul(vex, value);
}


template <typename T>
std::ostream& operator<< (std::ostream& os, Vex<T> const& arr)
{
    os << arr.toStream();
    return os;
}
