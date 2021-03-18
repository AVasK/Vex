#pragma once

#include "aligned_array.hpp"
#include "integers.hpp"
#include "x86_cpuid.hpp"

#define func auto

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
class Vex;

// FORWARD DECLARED FRIEND FUNCS
template <typename T>
func operator+ (Vex<T> const& a1, Vex<T> const& a2) -> Vex<T>;

template <typename T>
func operator+ (Vex<T> const& a1, T value) -> Vex<T>;

template <typename T>
func operator+ (T value, Vex<T> const& a1) -> Vex<T>;


// ARRAY class
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

    // TODO: Delete, default is ok
    Vex (Vex const& other)
    : memory {other.memory}
    {
        std::cout << "vex copy\n";
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
    func operator+= (Vex const& other) -> Vex&;
    func operator+= (T value) -> Vex&;
    func operator*= (Vex const& other) -> Vex&;
    func operator*= (T value) -> Vex&;
    
    // Friend Binary Ops
    friend func operator+<T> (Vex const& a1, Vex const& a2) -> Vex;
    friend func operator+<T> (Vex const& a1, T value) -> Vex;
    friend func operator+<T> (T value, Vex const& a1) -> Vex;
    
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
