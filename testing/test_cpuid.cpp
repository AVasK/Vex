#include <iostream>
#include "x86_cpuid.hpp"



int main()
{
    std::cout << CPUID::printCPUFeatures() << "\n";
    CPUID::CPU cpu;
    u8 simd = cpu.supported_simd();
    std::cout << (int)simd << "\n";
    if (simd & SIMD::AVX2) {
        std::cout << "AVX2\n";
    }
}
