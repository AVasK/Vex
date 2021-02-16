#include "cctools.hpp"
#include <iostream>
#include "aligned_array.hpp"
#include "vex.hpp"

int main() {
    
/*
#if ARCH_x86
    #if ARCH_x86_64
    std::cout << "x86/64 processor\n";
    #elif
    std::cout << "x86 processor architecture\n";
    #endif
#endif
    
    std::cout << "C++" << CPP_V << "\n";
    if (CPP_V >= 11) {
        std::cout << "...";
    }
*/
    
    Contiguous<int> a(11, 16);
    Contiguous<long> b(17, 7, 32);
    auto c = b;
    auto d = std::move(a);
    auto e = Contiguous<int16_t>(17, 1, 8);
        
    std::cout << a << "\n" << b << "\n" << c << "\n" << d << "\n" << e << "\n";
    
    
    auto v = Array<int16_t>(14, 0); // 14 ints
    auto w = Array<double>(14, 0); // 14 doubles
    std::cout << v << "\n" << w << "\n";
    
    /*
     Interface Prototyping:
     1) the outter array interface:
     vex::array<i16> a(100, 1); // [1]x100
     a *= 2;
     a += 1;
     a <<= 2;
     ...
     
     2) how does the array use aligned memory:
     class array {
     ...
        array() {
            // delegates memory handling to memory container class.
            // in order to do so it SHOULD CHECK CPUID.
            // based on that, it sets the alignment (@runtime)
        }
     }
     
     */
}
