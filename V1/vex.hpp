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

#include "cctools.hpp"
#include "aligned_array.hpp"
#include "integers.hpp"
#include "x86_cpuid.hpp"

#define func auto



// FORWARD DECLARATION
template <typename T>
class Vex;

template <typename T>
class VSum;
template <typename T>
class VISum;


/*
template <typename T>
func operator+ (Vex<T> const&, Vex<T> const&) -> VSum<T>;

template <typename T>
func operator+ (Vex<T> const&, T) -> VISum<T>;

template <typename T>
func operator+ (T, Vex<T> const&) -> VISum<T>;

func operator+ (Vex<float> const&, Vex<float> const&) -> FMAProxy<float>;
*/

// Friend functions
template <typename T>
func vex_add (Vex<T> const&, Vex<T> const&) -> Vex<T>;

template <typename T>
func vex_add (Vex<T> const&, T) -> Vex<T>;

template <typename T>
func vex_add (T, Vex<T> const&) -> Vex<T>;

// Vex class
template <typename T>
class Vex {
public:

    using value_type = T;

    // C'tors
    explicit Vex(size_t size)
    : memory (size, _alignment())
    {}
    
    explicit Vex(size_t size, T fill_value)
    : memory(size, fill_value, _alignment())
    {}
    
    static func simd_flags() -> u8
    {
        static CPUID::CPU cpu;
        return cpu.supported_simd();
        //return CPUID::VEXMODE::SSE2;
    }
    
    static func _alignment() -> int
    {
        if (simd_flags() & SIMD::AVX)
        {
            return 32;
        }
        else
        {
            return 16;
        }
    }

    // Memory Addressing
    
    func get_alignment() const -> size_t
    {
        return _alignment();
    }
    
    func size_in_registers() const -> size_t
    {
        return memory.size_in_registers();
    }

    func size_in_sse_regs() const -> size_t
    {
        return memory.size_in_sse_regs();
    }

    func size_in_avx_regs() const -> size_t
    {
        return memory.size_in_avx_regs();
    }
    
    //__attribute__((always_inline))
    func operator[] (size_t idx) -> T&
    {
        return memory[idx];
    }
    
    //__attribute__((always_inline))
    func operator[] (size_t idx) const -> const T&
    {
        return memory[idx];
    }
    
    // Size & Memory Management
    func toStream() const -> std::string
    {
        return memory.toString();
    }
    
    func size() const -> size_t
    {
        return memory.size();
    }

    func data() -> Contiguous<T>&
    {
        return memory;
    }

    func data() const -> Contiguous<T> const&
    {
        return memory;
    }
    
    // Arithmetics:
    func operator+= (Vex const& other) -> Vex&;
    func operator+= (T value) -> Vex&;
    func operator*= (Vex const& other) -> Vex&;
    func operator*= (T value) -> Vex&;
    
    // Friend Binary Ops
    friend func vex_add<T> (Vex const& a1, Vex const& a2) -> Vex;
    friend func vex_add<T> (Vex const& a1, T value) -> Vex;
    friend func vex_add<T> (T value, Vex const& a1) -> Vex;
    
protected:
    Contiguous<T> memory;
};

// Intrinsic wrappers lie in another file to avoid clutter...
#include "intrin_funcs.hh"

// Definitions:
#include "vex.hh"
#include "vex2proxy.hh"

/*
// Proxy:
#include "vex_proxy.hpp"
*/



#undef func