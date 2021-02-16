#pragma once
#include "intrinsics.hpp" // _mm_malloc, _mm_free
#include <cstddef> // size_t
#define func auto

namespace aligned {

template <typename T>
inline func alloc(size_t n, size_t align) -> T*
{
    return (T*) _mm_malloc(n*sizeof(T), align);
}

inline func free(void* addr) -> void
{
    _mm_free(addr);
}

} // namespace aligned
#undef func
