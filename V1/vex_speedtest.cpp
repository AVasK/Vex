#include <iostream>
#include "vex.hpp"
#include "vex_proxy.hpp"
#include "timing.hpp"

#include <vector>

int main() {

    int N = 99999999;
    //int N = 10;
    auto a = Vex<i16>(N, 7);
    auto b = Vex<i16>(N, 3);
    auto c = Vex<i16>(N, 11);
    auto d = Vex<i16>(N, 4);
    auto res = Vex<i16>(N);

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

    {
        auto t = timing::msTimer("for-loop");
        for (int i=0; i<a.size(); ++i)
        {
            res[i] = a[i]+b[i]+c[i]+1+d[i];
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