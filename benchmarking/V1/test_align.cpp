#include <x86intrin.h>
#include <iostream>
#include "aligned_memalloc.hpp"

int main()
{
    auto u = new int[10];
    //auto a = _mm_malloc(10*sizeof(int), 16);
    //auto a32 = _mm_malloc(10*sizeof(int), 32);
    
    auto a = aligned::alloc<int>(10, 16);
    auto a32 = aligned::alloc<int>(10, 32);
    
    std::cout << "@ "<< (void*) u << "\n"
              << "@ "<< (void*) a << "\n"
              << "@ "<< (void*) a32 << "\n";
    
    
    
    delete[] u;
    aligned::free(a);
    aligned::free(a32);
}
