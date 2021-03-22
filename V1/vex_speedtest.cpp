#include <iostream>
#include "vex.hpp"
#include "vex_proxy.hpp"
#include "vex_view.hpp"

#include "timing.hpp"

#include <vector>

template <typename T>
class Error;

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

    {
        auto t = timing::msTimer("vector for");
        for (int i=0; i<v1.size(); ++i)
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
        auto rv = view( res );
        auto av = view( a );
        auto bv = view( b );
        auto cv = view( c );
        auto dv = view( d );
        for (int i=0; i<a.size(); ++i)
        {
            rv[i] = av[i]+bv[i]+cv[i]+1+dv[i];
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
        res = a + b + c + i16(1) + d;
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