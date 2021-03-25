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

#include "aligned_memalloc.hpp"
#include <cstddef> // size_t
#include <cstring> // memcpy
#include <initializer_list>
#include <cmath> // ceil

// temporary
#include <sstream> // ostringstream
#include <string>  // std::string

#define func auto


// The Contiguous memory has the granularity of
// the underlying MMX | XMM | YMM | ZMM registers (== alignment)
// register (XMM|YMM|whatever) = [_|_|_|_] can contain reg_size/sizeof(T) elements
// of type T
// => since the memory class should map directly to registers,
// [_|_|_|_][_|_|_|_] (cannot add incomplete register: [_|])

// Computes the blocksize such that
// blocksize is evenly divisible by the #of_elements of type T
// that fit into the XMM|YMM|ZMM register size (reg.size = in bytes to alignment)
template <typename T>
static inline func blocksize(size_t n, size_t reg_size) -> size_t
{
    auto per_register = reg_size / sizeof(T);
    //return ((n / per_register) + 1) * per_register;
    return ceil((float)n / per_register) * per_register;
}




// TODO: Add .what at least
struct MemoryException {};


/// Contiguous memory of type T
/// aligned @ <align>-byte boundary
/// NOTE: Since the alignment is chosen given the CPUID info
///       @ runtime => "align" shouldn't be a template parameter
///       but rather fed into the C'tor.
template <typename T>
class Contiguous {
public:
    
    // C'tors & stuff
    
    // no initialization (for temporaries)
    Contiguous(size_t size, size_t align)
    : alignment {align}
    , capacity {blocksize<T>( size, align )}
    , used {size}
    , data {aligned::alloc<T>( capacity, align )}
    {
        if (!data) {
            throw MemoryException {};
        }
    }
    
    Contiguous(size_t size, T fill_value, size_t align)
    : alignment {align}
    , capacity {blocksize<T>( size, align )}
    , used {size}
    , data {aligned::alloc<T>( capacity, align )}
    {
        if (!data) {
            throw MemoryException {};
        }
        for (size_t i=0; i<used; ++i)
        {
            data[i] = fill_value;
        }
    }
    
    ~Contiguous()
    {
        aligned::free(data);
    }
    
    // Copy ops
    Contiguous(Contiguous const& other)
    : alignment {other.alignment}
    , capacity {other.capacity}
    , used {other.used}
    , data {aligned::alloc<T>( capacity, alignment )}
    {
        if (!data)
        {
            throw MemoryException {};
        }
        //for (int i=0; i<used; ++i)
        //{
        //    data[i] = other.data[i];
        //}
        std::memcpy(data, other.data, used*sizeof(T));
    }
    
    func operator= (Contiguous const& other) -> Contiguous&
    {
        capacity = other.capacity;
        used = other.used;
        alignment = other.alignment;
        data = aligned::alloc<T>( capacity, alignment );
        if (!data)
        {
            throw MemoryException {};
        }
        //for (int i=0; i<used; ++i)
        //{
        //    data[i] = other.data[i]; //TODO: use memcpy instead
        //}
        
        std::memcpy(data, other.data, used*sizeof(T));
        return *this;
    }
    
    // Move ops
    Contiguous(Contiguous && other)
    : alignment {other.alignment}
    , capacity {other.capacity}
    , used {other.used}
    , data {other.data}
    {
        other.used = 0;
        other.capacity = 0;
        other.data = nullptr;
    }
    
    func operator= (Contiguous && other) -> Contiguous&
    {
        capacity = other.capacity;
        used = other.used;
        alignment = other.alignment;
        data = other.data;
        
        other.used = 0;
        other.capacity = 0;
        other.data = nullptr;
        
        return *this;
    }
    
    // Memory-management
    
    func size() const -> size_t
    {
        return used;
    }
    
    func size_in_registers() const -> size_t
    {
        return capacity*sizeof(T)/alignment;
    }

    func size_in_sse_regs() const -> size_t
    {
        return capacity*sizeof(T)/16;
    }

    func size_in_avx_regs() const -> size_t
    {
        return capacity*sizeof(T)/32;
    }
    
    func get_alignment() const -> size_t
    {
        return alignment;
    }
    
    // Addressing
    __attribute__((always_inline))
    inline func operator[] (size_t idx) -> T&
    {
        //if ((unsigned)idx <= used)
            return data[idx];
        //else
        //    throw MemoryException {};
    }
    
    __attribute__((always_inline))
    inline func operator[] (size_t idx) const -> const T&
    {
        //if ((unsigned)idx <= used)
            return data[idx];
        //else
        //    throw MemoryException {};
    }
    
    // TODO: Add .at() bounds-checked.

    
    // toString
    func toString() const -> std::string
    {
        std::ostringstream oss;
        oss << "*--------------------------------\n"
            << "| Capacity: " << capacity    << "\n"
            << "| Used:     " << used        << "\n"
            << "| @:        " << data        << "\n"
            << "| (long) @: " << (long)data  << "\n"
            << "| @ % 16    " <<(long)data%16<< "\n"
            << "| @ % 32    " <<(long)data%32<< "\n"
            << "| @ % 64    " <<(long)data%64<< "\n"
            << "| sizeof(T)=" << sizeof(T)   << "\n"
            << "| reg_size =" << alignment   << "\n"
            << "| elems/reg " << alignment/sizeof(T) << "\n"
            << "| # regs    " << capacity*sizeof(T)/alignment << "\n"
            << "*--------------------------------\n";
        
        auto reg_size = alignment;
        auto per_register = reg_size/sizeof(T);
        //auto n_registers = capacity/reg_size;
        auto masking = true;
        
        for (int i=0; i<capacity; i++)
        {
            if (i && i % per_register == 0)
            {
                oss << "| ";
            }
            if (masking && i < used)
                oss << data[i] << " ";
            else
                oss << "# ";
        }
        oss << "\n";
        return oss.str();
    }
    
private:
    size_t alignment = 16;
    size_t capacity = 0;
    size_t used = 0;
protected:
    T* data = nullptr;
};


template <typename T>
std::ostream& operator<<(std::ostream& os, Contiguous<T> const& mem)
{
    os << mem.toString();
    return os;
}


#undef func
