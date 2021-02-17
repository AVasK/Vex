#include "aligned_array.hpp"

//TODO: Use cpuid + check needed SIMD instr.set to get needed alignment
size_t get_alignment() { return 16; }

template <typename T>
class Array;

template <typename T>
Array<T> operator+ (Array<T> const& a1, Array<T> const& a2);


template <typename T>
class Array {
public:
    Array(size_t size)
    : alignment {get_alignment()}
    , memory(size, alignment)
    {}
    
    Array(size_t size, T fill_value)
    : alignment {get_alignment()}
    , memory(size, fill_value, alignment)
    {}
    
    auto operator[] (size_t idx) -> T&
    {
        return memory[idx];
    }
    
    auto operator[] (size_t idx) const -> const T&
    {
        return memory[idx];
    }
    
    std::string toStream() const {
        return memory.toString();
    }
    
    size_t size() const {
        return memory.size();
    }
    
    friend auto operator+<T> (Array const& a1, Array const& a2) -> Array;
    
private:
    size_t alignment;
    Contiguous<T> memory;
};

using I16 = int16_t;

static inline auto LoadVector(void const * p) -> __m128i
{
    // load aligned integer vector from array p
    return _mm_load_si128((__m128i const*) p);
}

static inline auto StoreVector(void * d, __m128i const& x) -> void
{
    // store aligned integer vector x into array d
    _mm_store_si128((__m128i *) d, x);
}


template <typename T>
Array<T> operator+ (Array<T> const& a1, Array<T> const& a2)
{}

template <>
Array<I16> operator+ (Array<I16> const& a1, Array<I16> const& a2)
{
    auto n_regs = a1.memory.size_in_registers();
    Array<I16> res (a1.size());
    for (size_t i=0; i<n_regs; ++i)
    {
        // load 8 consecutive elements from a1:
        __m128i _a1 = LoadVector(&a1[8*i]);
        //FIXME: Need separate function to get register start address.
        
        // load 8 cons.elems from a2
        __m128i _a2 = LoadVector(&a2[8*i]);
        
        // vadds _a1, _a2
        __m128i _res = _mm_adds_epi16(_a1, _a2);
        
        // store the resulting 8 elements in res:
        StoreVector(&res[8*i], _res);
    }
    return res;
}

template <typename T>
std::ostream& operator<< (std::ostream& os, Array<T> const& arr)
{
    os << arr.toStream();
    return os;
}
