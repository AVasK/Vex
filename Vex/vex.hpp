// @: Vex header file
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
#include "simd_types.hpp"
#include "simd_ops.hpp"
#include "vex_ops.hpp"
#include "x86_cpuid.hpp"
#include "vmask.hpp"

using CPUID::simd_flags;

#define func auto

// FORWARD DECLARATION
template <typename T>
class Vex;


// Friend functions
template <typename T>
func mul (Vex<T> const&, Vex<T> const&) -> Vex<T>;

template <typename T>
func mul (Vex<T> const&, T) -> Vex<T>;

template <typename T>
func mul (T, Vex<T> const&) -> Vex<T>;


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

    template <typename T2>
    Vex(Vex<T2> const& other)
    : memory(other.size(), _alignment())
    {
        std::cerr << "Vex<T2> -> Vex<T>\n";
        for (size_t i=0; i<other.size(); ++i)
        {
            memory[i] = static_cast<T>( other[i] );
        }
    }

    Vex(std::initializer_list<T> ilist)
    : memory(ilist.size(), _alignment())
    {
        size_t i = 0;
        for (auto elem : ilist)
        {
            memory[i++] = elem;
        }
    }
    
    /*
    static func simd_flags() -> u8
    {
        static CPUID::CPU cpu;
        //return cpu.supported_simd();
        return CPUID::VEXMODE::SSE2;
    }
    */
    
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

    func get_avx_reg(size_t at_idx) const -> avx_reg<value_type>
    {
        return load_avx(&memory[at_idx]);
    }

    func get_sse_reg(size_t at_idx) const -> sse_reg<value_type>
    {
        return load_sse(&memory[at_idx]);
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

    template <Comparator C, typename T1, typename T2>
    func operator[] (VMask<C, T1, T2> const& mask) -> VMaskedProxy<Vex<T>, C, T1, T2>
    {
        return VMaskedProxy<Vex<T>, C, T1, T2>( *this, mask );
    }
    
    // Size & Memory Management

    void push(value_type elem)
    {
        memory.push( elem );
    }

    func pop() -> value_type
    {
        return memory.pop();
    }

    func toStream() const -> std::string
    {
        return memory.toString();
    }
    
    func size() const -> size_t
    {
        return memory.size();
    }

    func data() -> Aligned<T>&
    {
        return memory;
    }

    func data() const -> Aligned<T> const&
    {
        return memory;
    }
    
    // Arithmetics:
    func operator+= (T value) -> Vex&;
    template <typename Vexlike>
    func operator+= (Vexlike const& other)
    -> typename std::enable_if<std::is_same<T, typename Vexlike::value_type>::value, Vex&>::type;

    func operator-= (Vex const& other) -> Vex&;
    func operator-= (T value) -> Vex&;
    template <typename Vexlike>
    func operator-= (Vexlike const& other) 
    -> typename std::enable_if<std::is_same<T, typename Vexlike::value_type>::value, Vex&>::type;

    func operator*= (Vex const& other) -> Vex&;
    func operator*= (T value) -> Vex&;
    template <typename Vexlike>
    func operator*= (Vexlike const& other) 
    -> typename std::enable_if<std::is_same<T, typename Vexlike::value_type>::value, Vex&>::type;
    
    // Friend Binary Ops
    friend func mul<T> (Vex const& a1, Vex const& a2) -> Vex;
    friend func mul<T> (Vex const& a1, T value) -> Vex;
    friend func mul<T> (T value, Vex const& a1) -> Vex;
    
protected:
    Aligned<T> memory;
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