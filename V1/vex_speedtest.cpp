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
    auto res = Vex<i16>(N);

    std::vector<i16> v1 (N, 7);
    std::vector<i16> v2 (N, 3);
    std::vector<i16> v3 (N, 11);
    std::vector<i16> r  (N, 0);

    std::valarray<i16> vl1 (7, N);
    std::valarray<i16> vl2 (3, N);
    std::valarray<i16> vl3 (11, N);
    std::valarray<i16> rl (N);

    {
        auto t = timing::msTimer("for-loop");
        for (int i=0; i<a.size(); ++i)
        {
            res[i] = a[i]+b[i]+c[i]+1;
            //res[i] = a[i] + b[i];
        }
    }

    {
        auto t = timing::msTimer("vector for");
        for (size_t i=0; i<v1.size(); ++i)
        {
            r[i] = v1[i] + v2[i] + v3[i] + 1;
        }
    }
    int sum = r[100];

    {
        auto t = timing::msTimer("a + b");
        res = a + b + c + i16(1);
        //res = a + b;
    }

    {
        auto t = timing::msTimer("a + b");
        res = a + b + c + i16(1);
        //res = a + b;
    }

    

    
    {
        auto t = timing::msTimer("valarray");
        rl = vl1 + vl2 + vl3 + 1;
        //res = a + b;
    }

    std::cout << sum << "\n";
}