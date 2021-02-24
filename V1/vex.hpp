#pragma once

#include "aligned_array.hpp"
#include "integers.hpp"
#include "x86_cpuid.hpp"

#define func auto
#define VEX_PTR_DISPATCH 0

#ifdef ARCH_x86
    #if C_CLANG
        #pragma clang attribute push (__attribute__((target("sse, sse2, sse3, sse4.1, sse4.2, ssse3, avx, avx2"))), apply_to=function)
    #elif C_GCC
        #pragma GCC push_options
        #pragma GCC target("sse", "sse2", "sse3", "ssse3", "sse4.1", "sse4.2", "avx", "avx2")
    #endif
#endif

// FORWARD DECLARATION
template <typename T>
class Array;

// FORWARD DECLARED FRIEND FUNCS
template <typename T>
Array<T> operator+ (Array<T> const& a1, Array<T> const& a2);


// ARRAY class
template <typename T>
class Array {
    
    // Aliases:
    using UnaryF  = Array<T> (*) (Array<T> const&);
    
    using BinaryF = Array<T> (*) (
                                  Array<T> & dest,
                                  Array<T> const&,
                                  Array<T> const&
                                 );
    
public:
    // C'tors
    Array(size_t size)
    : memory (size, _alignment())
    {
        #if VEX_PTR_DISPATCH
        set_func_handlers();
        #endif
    }
    
    Array(size_t size, T fill_value)
    : memory(size, fill_value, _alignment())
    {
        #if VEX_PTR_DISPATCH
        set_func_handlers();
        #endif
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
    
    func operator[] (size_t idx) -> T&
    {
        return memory[idx];
    }
    
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
    
    // Arithmetics:
    func operator+= (Array const& other) -> Array&;
    func operator*= (Array const& other) -> Array&;
    
    
    // Friend Binary Ops
    friend func operator+<T> (Array const& a1, Array const& a2) -> Array;
    
protected:
    Contiguous<T> memory;
    
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
private:
    BinaryF f_add;
    BinaryF f_sub;
    UnaryF f_iadd;
    UnaryF f_isub;
    
    void set_func_handlers();
};


// Intrinsic wrappers lie in another file to avoid clutter...
#include "intrin_funcs.hh"

// Definitions:
#include "vex.hh"

#undef func

#ifdef ARCH_x86
    #if C_CLANG
        #pragma clang attribute pop
    #elif C_GCC
        #pragma GCC pop_options
    #endif
#endif
