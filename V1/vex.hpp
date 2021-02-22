#pragma once

#include "aligned_array.hpp"
#include "integers.hpp"

#define func auto


#ifdef ARCH_x86
    #if C_CLANG
        #pragma clang attribute push (__attribute__((target("sse, sse2,sse4.1,sse4.2,ssse3,avx,avx2"))), apply_to=function)
    #elif C_GCC
        #pragma GCC push_options
        #pragma GCC target("sse4.2", "ssse3", "avx", "avx2")
    #endif
#endif

//FIXME: Use cpuid + check needed SIMD instr.set to get needed alignment
size_t dummy_alignment() { return 32; }

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
    : memory (size, dummy_alignment())
    {
        set_func_handlers();
    }
    
    Array(size_t size, T fill_value)
    : memory(size, fill_value, dummy_alignment())
    {
        set_func_handlers();
    }
    
    // Memory Addressing
    
    func get_alignment() const -> size_t
    {
        return memory.get_alignment();
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
