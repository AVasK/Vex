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

int main(int argc, char* argv[]) {
    auto N = 100000000;
    //auto N = 42;
    if (argc == 2)
    {
        N = std::atoi( argv[1] );
        std::cout << "N = " << N << ";\n"; 
    }
    else {
        std::cout << "default N = " << N << ";\n"; 
    }


    using T = uint8_t;//u8;
        
    
    auto v = Vex<T>(N, 'a'); // [7] * 14
    auto w = Vex<T>(N, 7*argc); // [2] * 14
    auto z = Vex<T>(N, 3);
    auto x = Vex<T>(N, 4);
    auto vv = std::vector<T> (N, 'a');
    auto vw = std::vector<T> (N, 7*argc);
    auto vz = std::vector<T> (N, 3);
    auto vx = std::vector<T> (N, 4);
    std::vector<T> res;
    auto va = std::valarray<T> ('a', N);
    auto wa = std::valarray<T> (7*argc, N);
    auto za = std::valarray<T> (3, N);
    auto xa = std::valarray<T> (4, N);
    
    //rand_init(v, N);
    //rand_init(w, N);

    int n_tests = 1;


    std::cout << "N: " << N << "\n";
    std::cout << "# tests: " << n_tests << "\n";
    std::cout << "testing: v += 7*w;\nVex<T> res = v + w;" << "\n";

    
    {
        auto t = timing::msTimer("vector");
        res = std::vector<T>(N);
        for (size_t i=0; i<vv.size(); ++i) {
            //vv[i] += vw[i];
            //vv[i] += 7;
            vv[i] += 7*vw[i];
            res[i] = vv[i] + vw[i];
            //res[i] = vw[i] + vv[i]*2;
            //vv[i] += vw[i] + vz[i] + vx[i];
        }
    }
    

    {
        auto t = timing::msTimer("valarray");
        va += wa*7;
        //std::valarray<T> res = wa + za + xa;
        std::valarray<T> res = va + wa;
        //va += wa;
        //va += 7;
    }
    
    {
        auto t = timing::msTimer("vex");
        //v += w; // SIMD?
        //v += 7;
        //Vex<T> r = w + v*2;
        v += 7*w;
        Vex<T> res = v + w;
    }
    
    
    {
        auto t = timing::msTimer("SIMD vex[mask]");
        w[v == T('a')] = v + w;
    }

    #ifdef C_CLANG
    {
        auto t = timing::msTimer("valarray[mask]");
        wa[va == T('a')] = va + wa;
    }
    #endif

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
