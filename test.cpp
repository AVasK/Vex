#include <iostream>
#include "proto.hpp"

int main()
{
    Vec<int, vex::off> v {1,2,3,4,5};
    std::cout << v.toString() << "\n";
    std::cout << v.view() << "\n";
    v.push(7);
    std::cout << v.view() << "\n";
    v.push(7);
    std::cout << v.view() << "\n";
    v.push({11,12,13,14});
    std::cout << v.view() << "\n";
    
    
    
    auto v2 = v;
    
    try {
        auto v3 = v + v2;
        v3.push(-1);
        v3.push(-2);
        v3.push({-3,-4,-5});
        std::cout << v3.view();
    }
    catch(IndexError e) {
        std::cout << e.what();
    }
     
}
