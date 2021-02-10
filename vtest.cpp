#include <iostream>
#include "proto.hpp"
#include "timing.hpp"
#include <vector>

int main()
{
    using namespace timing;
    long N = 999999999;
 
    {
        auto timer = Timer<ms>("My vector");
        Vec<int, vex::off> av(N);
        timer.time("constructed");
        av.push(3);
        std::cout << av[0];
    }
    
    {
        auto timer = Timer<ms>("std::vector");
        std::vector<int> sv; // sv(N) will waste a lot of time
        sv.reserve(N); // the only way to do it fast with vector
        timer.time("constructed");
        sv[0] = 3;  // no check for out-of-bounds
        sv.push_back(7); // pushes back into [0]
        std::cout << sv[0];
        
    }

}
