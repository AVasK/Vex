#include <iostream>
#include "vex.hpp"

int main() {

    Vex<i8> v (10, 'x');
    std::cout << v << "\n";

    for (int i=0; i < 25; i++)
    {
        v.push('a'+i8(i));
    }
    std::cout << v << "\n";

    for (int i=0; i < 29; i++)
    {
        v.pop();
    }

    std::cout << v << "\n";

    int N = 2000;
    Vex<i8> v1 (N, 'a');
    Vex<i8> v2 (N, 3);
    Vex<i8> res = v1 + v2;
    std::cout << res;

}