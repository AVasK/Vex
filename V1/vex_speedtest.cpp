#include <iostream>
#include "vex.hpp"
#include "vex_proxy.hpp"
#include "vex_view.hpp"

#include "timing.hpp"

#include <vector>
#include <valarray>

template <typename T>
class Error;


// #ifdef __SSE4_2__ 
// #error "SSE4.2 flag has leaked into user-space"
// #endif

// #ifdef __AVX__ 
// #error "AVX flag has leaked into user-space"
// #endif

// #ifdef __AVX2__ 
// #error "AVX2 flag has leaked into user-space"
// #endif


int main() {

    int N = 99999999;
    //int N = 10;
    const auto a = Vex<i16>(N, 7);
    auto b = Vex<i16>(N, 3);
    auto c = Vex<i16>(N, 11);

    std::vector<i16> v1 (N, 7);
    std::vector<i16> v2 (N, 3);
    std::vector<i16> v3 (N, 11);
    std::vector<i16> r  (N, 0);

    std::valarray<i16> vl1 (7, N);
    std::valarray<i16> vl2 (3, N);
    std::valarray<i16> vl3 (11, N);
    

    size_t sum = 0;

    {
        auto t = timing::msTimer("for-loop");
        auto res = Vex<i16>(N);
        for (size_t i=0; i<a.size(); ++i)
        {
            res[i] = a[i]+b[i]+c[i]+1;
        }
    }

    {
        auto t = timing::msTimer("vector for");
        std::vector<i16> r  (N, 0);
        for (size_t i=0; i<v1.size(); ++i)
        {
            r[i] = v1[i] + v2[i] + v3[i] + 1;
        }
        sum += r[0];
    }

    {
        auto t = timing::msTimer("Vex");
        Vex<i16> res = a + b + c + i16(1);
        //res = a + b;
    }
    
    {
        auto t = timing::msTimer("valarray");
        std::valarray<i16> rl = vl1 + vl2 + vl3 + 1;
        //res = a + b;
    }

    std::cout << sum << "\n";
}