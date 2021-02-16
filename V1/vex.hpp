#include "aligned_array.hpp"

//TODO: Use cpuid + check needed SIMD instr.set to get needed alignment
size_t get_alignment() { return 16; }


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
    
    std::string toStream() const {
        return memory.toString();
    }
    
private:
    size_t alignment;
    Contiguous<T> memory;
};


template <typename T>
std::ostream& operator<< (std::ostream& os, Array<T> const& arr)
{
    os << arr.toStream();
    return os;
}
