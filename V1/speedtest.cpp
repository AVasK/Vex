#include "cctools.hpp"
#include <iostream>
#include "aligned_array.hpp"
#include "vex.hpp"

#include "timing.hpp"
#include <valarray>
#include <vector>
#include <cstdlib> // rng

#include "vex_proxy.hpp"


#ifdef __SSE4_1__ 
#warning "SSE4.1 ENABLED"
#endif

#ifdef __SSE4_2__ 
#warning "SSE4.2 ENABLED"
#endif

#ifdef __AVX__ 
#warning "AVX ENABLED"
#endif

#ifdef __AVX2__ 
#warning "AVX2 ENABLED"
#endif


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
    
    auto N = 100000000;
    //auto N = 42;

    using T = i8;//float;
        
    
    auto v = Vex<T>(N, 'a'); // [7] * 14
    auto w = Vex<T>(N, 2); // [2] * 14
    //v+=w;
    
    //rand_init(v, N);
    //rand_init(w, N);
    //std::cout << v << w << "\n";
    

    // {
    //     auto t = timing::msTimer("vex_add: vex + vex");
    //     //v += w; // SIMD?
    //     //v += 7;
    //     Vex<T> r = vex_add(v, w);
    // }

    int n_tests = 10;

    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("warmup");
        //v += w; // SIMD?
        //v += 7;
        Vex<T> r = w + v*2;
    }

    std::cout << "N: " << N << "\n";
    std::cout << "# tests: " << n_tests << "\n";
    std::cout << "testing: r = 2*w + v;" << "\n";

    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("vex");
        //v += w; // SIMD?
        //v += 7;
        Vex<T> r = w + v*2;
    }

    
    
    auto vv = std::vector<T> (N, 'a');
    auto vw = std::vector<T> (N, 2);
    std::vector<T> res;
    //rand_init(vv, N);
    //rand_init(vw, N);
    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("std::vector");
        res = std::vector<T>(N);
        for (size_t i=0; i<vv.size(); ++i) {
            //vv[i] += vw[i];
            //vv[i] += 7;
            //res[i] = vv[i] + vw[i];
            res[i] = vw[i] + vv[i]*2;
        }
        //s += vv[0];
    }
    
    auto va = std::valarray<T> ('a', N);
    auto wa = std::valarray<T> (2, N);
    //rand_init(va, N);
    //rand_init(wa, N);
    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("std::valarray");
        std::valarray<T> res = wa + va*2;
        //std::valarray<i8> res = va + wa;
        //va += wa;
        //va += 7;
    }
    
    //std::cout << s << "\n";
    
    {
        auto t = timing::msTimer("SIMD vex[mask]");
        w[v == T('a')] = v + w;
    }

    {
        auto t = timing::msTimer("valarray[mask]");
        wa[va == T('a')] = va + wa;
    }

    {
        auto t = timing::msTimer("std::vector[mask]");
        for (size_t i=0; i<vv.size(); i++)
        {
            if (vv[i] == T('a'))
            {
                vw[i] = vv[i] + vw[i];
            }
        }
    }
     
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
