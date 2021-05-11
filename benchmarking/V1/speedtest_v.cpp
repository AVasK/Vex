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


int main() {
    
    //auto N = 99999999;
    auto N = 10000142;

    using T = float;
        
    auto v = Vex<T>(N, 'a'); // [7] * 14
    auto w = Vex<T>(N, 2); // [2] * 14
    int n_tests = 10;


    std::cout << "N: " << N << "\n";
    std::cout << "# tests: " << n_tests << "\n";
    std::cout << "testing: r = 2*w + v + 1;" << "\n";


    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("vex");
        Vex<T> r = w*T(2) + v + T(1);
    }


    auto vv = std::vector<T> (N, 'a');
    auto vw = std::vector<T> (N, 2);
    std::vector<T> res;
    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("std::vector");
        res = std::vector<T>(N);
        for (size_t i=0; i<vv.size(); ++i) {
            res[i] = T(2) * vw[i] + vv[i] + T(1);
        }
    }
    
    auto va = std::valarray<T> ('a', N);
    auto wa = std::valarray<T> (2, N);
    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("std::valarray");
        std::valarray<T> res = wa*T(2) + va + T(1);
    }
    
   
}
