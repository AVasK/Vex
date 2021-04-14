#include "cctools.hpp"
#include <iostream>
#include "aligned_array.hpp"
#include "vex.hpp"

#include "timing.hpp"
#include <valarray>
#include <vector>
#include <cstdlib> // rng

#include "vex_proxy.hpp"

// #ifdef __SSE4_2__ 
// #error "SSE4.2 flag has leaked into user-space"
// #endif

// #ifdef __AVX__ 
// #error "AVX flag has leaked into user-space"
// #endif

// #ifdef __AVX2__ 
// #error "AVX2 flag has leaked into user-space"
// #endif


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
    
    auto N = 99999999;
    //auto N = 42;
    int s = 0;
    std::srand(std::time(nullptr));
        
    
    auto v = Vex<i8>(N, 'a'); // [7] * 14
    auto w = Vex<i8>(N, 2); // [2] * 14
    //v+=w;
    
    //rand_init(v, N);
    //rand_init(w, N);
    //std::cout << v << w << "\n";
    
    {
        auto t = timing::msTimer("SIMD vex + vex");
        //v += w; // SIMD?
        //v += 7;
        //Vex<i8> r = add(v, w);
        v += w;
        //std::cout << r[0] << "\n";
    }

    {
        auto t = timing::msTimer("SIMD proxy vex <+> vex");
        //v += w; // SIMD?
        //v += 7;
        Vex<i8> r = v + w;
        /*
        auto val = r[0];
        for (size_t i = 0; i < N; i++)
        {
            if (r[i] != r[0])
            {
                std::cerr << "ERR!\n";
                return 1;
            }
        }
        */
    }
    
    auto vv = std::vector<i8> (N, 'a');
    auto vw = std::vector<i8> (N, 2);
    std::vector<i8> res;
    rand_init(vv, N);
    rand_init(vw, N);
    {
        auto t = timing::msTimer("vector");
        res = std::vector<i8>(N);
        for (size_t i=0; i<vv.size(); ++i) {
            vv[i] += vw[i];
            //vv[i] += 7;
            //res[i] = vv[i] + vw[i];
        }
        s += vv[0];
    }
    
    auto va = std::valarray<i8> ('a', N);
    auto wa = std::valarray<i8> (2, N);
    rand_init(va, N);
    rand_init(wa, N);
    {
        auto t = timing::msTimer("valarray");
        //std::valarray<i8> res = va + wa;
        va += wa;
        //va += 7;
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
