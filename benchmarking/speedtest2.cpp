#include "cctools.hpp"
#include <iostream>
#include "aligned_array.hpp"
#include "vex.hpp"

#include "timing.hpp"
#include <valarray>
#include <vector>

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


int main() {
    auto N = 99999999;
    auto iters = 10;
    int s = 0;

    using T = i8;
        
    
    auto v = Vex<T>(N, 'a'); // [7] * 14
    auto w = Vex<T>(N, 2); // [2] * 14

    size_t time = 0;
    for (int i=0; i < iters; i++)
    {
        {
            auto t = timing::msTimer(time, "Vex");
            Vex<T> r = w + v * T(7);
        }
    }
    std::cout << "\n==== Vex ====\n";
    std::cout << "avg. T: " << time/iters << "\n";

    
    auto vv = std::vector<T> (N, 'a');
    auto vw = std::vector<T> (N, 2);
    std::vector<T> res;

    time = 0;
    for (int i=0; i < iters; i++)
    {
        auto t = timing::msTimer(time, "vector");
        res = std::vector<T>(N);
        for (size_t i=0; i<vv.size(); ++i) {
            res[i] = vw[i] + vv[i] * T(7);
        }
        //s += res[0];
    }
    std::cout << "\n==== std::vector ====\n";
    std::cout << "avg. T: " << time/iters << "\n";
    

    auto va = std::valarray<T> ('a', N);
    auto wa = std::valarray<T> (2, N);
 
    time = 0;
    for (int i=0; i < iters; i++)
    {
        {
            auto t = timing::msTimer(time, "valarray");
            std::valarray<T> res = wa + va * T(7);
        }
    }
    std::cout << "\n==== std::valarray ====\n";
    std::cout << "avg. T: " << time/iters << "\n";

    
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
     
  
}
