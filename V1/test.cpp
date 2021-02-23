#include "cctools.hpp"
#include <iostream>
#include "aligned_array.hpp"
#include "vex.hpp"

#include "timing.hpp"
#include <valarray>
#include <vector>
#include <cstdlib> // rng

#include "intrinsics.hpp"

template <typename T>
void rand_init(T & array_like, size_t N)
{
    for (size_t i=0; i<N; i++)
    {
        array_like[i] = std::rand();
    }
}

int main() {
    
/*
#if ARCH_x86
    #if ARCH_x86_64
    std::cout << "x86/64 processor\n";
    #elif
    std::cout << "x86 processor architecture\n";
    #endif
#endif
    
    std::cout << "C++" << CPP_V << "\n";
    if (CPP_V >= 11) {
        std::cout << "...";
    }

    
    Contiguous<int> a(11, 16);
    Contiguous<long> b(17, 7, 32);
    auto c = b;
    auto d = std::move(a);
    auto e = Contiguous<int16_t>(17, 1, 8);
        
    //std::cout << a << "\n" << b << "\n" << c << "\n" << d << "\n" << e << "\n";
*/
    
    //auto N = 99999999;
    auto N = 30;
    int s = 0;
    std::srand(std::time(nullptr));
        
    
    auto v = Array<int16_t>(N, 3); // [1] * 14
    auto w = Array<int16_t>(N, 4); // [3] * 14
    std::cout << v << w << "\n";
    //rand_init(v, N);
    //rand_init(w, N);
    
    {
        auto t = timing::msTimer("SIMD");
        v += w; // SIMD?
        //auto r = v + w;
        std::cout << v << "\n";
        s += v[0];
    }
     
    
    auto vv = std::vector<int16_t> (N, 0);
    auto vw = std::vector<int16_t> (N, 0);
    rand_init(vv, N);
    rand_init(vw, N);
    {
        auto t = timing::msTimer("vector");
        for (size_t i=0; i<vv.size(); ++i) {
            vv[i] += vw[i];
        }
        s += vv[0];
    }
    
    auto va = std::valarray<int16_t> (1, N);
    auto wa = std::valarray<int16_t> (1, N);
    rand_init(va, N);
    rand_init(wa, N);
    {
        //auto t = timing::msTimer("valarray");
        auto res = va + wa;
        s += res[N/2];
    }
    
    //std::cout << s << "\n";
    
    
     
    //std::cout << v << "\n" << w << "\n" << z << "\n";
    
    
    
    /*
     Interface Prototyping:
     1) the outter array interface:
     vex::array<i16> a(100, 1); // [1]x100
     a *= 2;
     a += 1;
     a <<= 2;
     ...
     
     2) how does the array use aligned memory:
     class array {
     ...
        array() {
            // delegates memory handling to memory container class.
            // in order to do so it SHOULD CHECK CPUID.
            // based on that, it sets the alignment (@runtime)
        }
     }
     
     */
}
