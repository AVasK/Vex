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
    auto d = Vex<i16>(N, 4);
    auto res = Vex<i16>(N);

    auto c1 = Contiguous<i16>(N, 7, 16);
    auto c2 = Contiguous<i16>(N, 3, 16);
    auto c3 = Contiguous<i16>(N, 11, 16);
    auto c4 = Contiguous<i16>(N, 16);

    std::vector<i16> v1 (N, 7);
    std::vector<i16> v2 (N, 3);
    std::vector<i16> v3 (N, 11);
    std::vector<i16> r  (N, 0);

    std::valarray<i16> vl1 (7, N);
    std::valarray<i16> vl2 (3, N);
    std::valarray<i16> vl3 (11, N);
    std::valarray<i16> vl4 (4, N);
    std::valarray<i16> rl (N);

    {
        auto t = timing::msTimer("vector for");
        for (size_t i=0; i<v1.size(); ++i)
        {
            r[i] = v1[i] + v2[i] + v3[i] + 1 + d[i];
        }
    }

    long sum {};
    for (auto& e : r)
    {
        sum += e;
    }
    std::cout << sum << "\n";

    {
        auto t = timing::msTimer("for-loop");
        for (int i=0; i<a.size(); ++i)
        {
            res[i] = a[i]+b[i]+c[i]+1+d[i];
            //res[i] = a[i] + b[i];
        }
    }

    {
        auto t = timing::msTimer("contiguous for-loop");
        for (int i=0; i<c1.size(); ++i)
        {
            c4[i] = c1[i]+c2[i]+c3[i]+1+d[i];
        }
    }

    {
        auto t = timing::msTimer("a + b");
        res = a + b + c + 1 + d;
        //res = a + b;
    }

    {
        auto t = timing::msTimer("valarray");
        rl = vl1 + vl2 + vl3 + i16(1) + vl4;
        //res = a + b;
    }

    //std::cout << res << "\n";
    std::cout << "PROXY:\n";
    {
        auto t = timing::msTimer("op<a, '+', b>");
        res = add(add(add(add(a, b), c), i16(1)), d);
        //res = add(a, b);
    }

    //std::cout << res << "\n";
}