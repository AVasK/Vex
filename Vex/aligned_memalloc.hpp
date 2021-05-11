#pragma once
//#define USE_STD

//TODO: USE aligned_alloc!

#ifndef USE_STD
#include "intrinsics.hpp" // _mm_malloc, _mm_free
#endif

#include <cstddef> // size_t
#define func auto

namespace aligned {

// size_t allocation_count = 0;

template <typename T>
inline func alloc(size_t n, size_t align) -> T*
{
    // allocation_count++;
    // std::cerr << "(+) # blocks: " << allocation_count << "\n";
    return (T*)_mm_malloc(n*sizeof(T), align);
}

inline func free(void* addr) -> void
{
    // allocation_count--;
    // std::cerr << "(-) # blocks: " << allocation_count << "\n";
    _mm_free(addr);
}

} // namespace aligned
#undef func
