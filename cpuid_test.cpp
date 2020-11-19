#include "cpuid.hpp"

#include <iostream>
#include <string>

using namespace std;

int main(int argc, char *argv[]) {
    
    auto regs = cpuid(0);
    string vendor;
    
    auto leaves = getProcLeaves();
    std::cout << "Leaf: " << leaves.first << " / "
              << leaves.second << "\n";
    
    std::cout << "Generation: "
              << IntelProcGeneration()
              << "\n";
    
    std::cout << "Make: "
              << getCPUVendor() << "\n";
    

    // 3 = 011(b)
    //std::cout << isSet(3, 3);
    //std::cout << isSet(3, 2);
    //std::cout << isSet(3, 1);
    //std::cout << isSet(3, 0);
    
    //auto features = cpuid(1);
    //std::cout << ( hasAVX(features.ECX) ? "AVX" : "No AVX" );
    
    auto ft = getCPUFeatures();
    std::cout << "\n" << ft << "\n";
    
    std::cout << L2CacheData() << "\n";
    
  return 0;
}
