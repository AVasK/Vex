#pragma once

#include <array>
#include <string>
#include <sstream>

#include <cstdint>
#include <climits>

// UInt:
template <int N>
struct USizedInt {
    using type = unsigned int;
};
template <>
struct USizedInt<8> {
    using type = uint8_t;
};

template <>
struct USizedInt<16> {
    using type = uint16_t;
};

template <>
struct USizedInt<32> {
    using type = uint32_t;
};

template <>
struct USizedInt<64> {
    using type = uint64_t;
};

template <int N>
using UInt = typename USizedInt<N>::type;


// Registers
struct Registers {

    UInt<32> EAX = 0;
    UInt<32> EBX = 0;
    UInt<32> ECX = 0;
    UInt<32> EDX = 0;
    
    Registers() {}
    
    Registers(UInt<32> * other)
    : EAX {other[0]}
    , EBX {other[1]}
    , ECX {other[2]}
    , EDX {other[3]}
    { }
    
    Registers& operator= (UInt<32> * other)
    {
        EAX = other[0];
        EBX = other[1];
        ECX = other[2];
        EDX = other[3];
        
        return *this;
    }
    
    operator int* ()
    {
        return (int*) this;
    }
};


auto cpuid(unsigned i) -> Registers
{
    Registers regs;
    
    #ifdef _WIN32
    __cpuid((int *)regs, (int)i);

    #else
    asm volatile
      ("cpuid" : "=a" (regs[0]), "=b" (regs[1]), "=c" (regs[2]), "=d" (regs[3])
       : "a" (i), "c" (0));
    // ECX is set to zero for CPUID function 4
    #endif
    
    return regs;
}

auto getCPUVendor() -> std::string
{
    using namespace std;
    auto regs = cpuid(0);
    ostringstream tmp;
    tmp << string((const char *) &regs.EBX, 4)
        << string((const char *) &regs.EDX, 4)
        << string((const char *) &regs.ECX, 4);
    
    return tmp.str();
}

auto getProcLeaves() -> std::pair<unsigned, unsigned>
{
    auto leaf = cpuid(0);
    auto xtended = cpuid(0x80000000);
    
    auto max_leaf = leaf.EAX;
    auto ext_leaf = xtended.EAX;
    
    return std::make_pair(max_leaf, ext_leaf);
}

auto IntelProcGeneration() -> std::string
{
    auto leaf = cpuid(0);
    auto max_leaf = leaf.EAX;
    
    std::string gen = "___";
    
    switch (max_leaf) {
        // only recent gens
        case 0x02 : gen = "Pentium {Pro, II, IV, M} or Xeon"; break;
        case 0x03 : gen = "Pentium III"; break;
        case 0x05 : gen = "Pentium 4 (HyperThreading) or Pentium D";
        case 0x06 : gen += "Pentium D(9xx)";break;
        case 0x0A : gen = "Core Duo, IvyBridge-based or Xeon(3000|5100-5400)";break;
        case 0x0B : gen = "Nehalem-based";break;
        case 0x0D : gen = "Core 2 Duo 8k Series or Ivy Bridge";break;
        case 0x16 : gen = "Skylake-based"; break;
        default   : gen = "Go figure"; break;
    }
    
    return gen;
}


inline constexpr bool isSet(unsigned bits, unsigned pos)
{
    return bits & (1 << pos);
}

namespace CPU {

enum ECX_Feature {
    sse3   = 1 << 0,
    vmx    = 1 << 5,  // Intel (VM eXtensions)
    ssse3  = 1 << 9,
    fma    = 1 << 12, // Fused Multiply-Add
    sse4_1 = 1 << 19,
    sse4_2 = 1 << 20,
    popcnt = 1 << 23, // Popcount hardware instruction
    aes    = 1 << 25, // AES encryption
    avx    = 1 << 28, // AVX
    f16c   = 1 << 29,
    rdrnd  = 1 << 30  // Intel rdrand (hardware-generated random)
};

enum EDX_Feature {
    fpu   = 1 << 0,  // x87 floating point unit on-chip
    tsc   = 1 << 4,  // TimeStampCounter (RDTSC & RDTSCP instruction support)
    mmx   = 1 << 23, // MMX
    sse   = 1 << 25, // SSE
    sse2  = 1 << 26, // SSE2
    htt   = 1 << 28  // Hyper-Threading
};

}; // namespace CPU;

inline bool hasAVX(UInt<32> ECX)
{
    return ECX & CPU::avx;
}

auto getCPUFeatures() -> std::string {
    auto rpack = cpuid(1);
    auto ECX = rpack.ECX;
    auto EDX = rpack.EDX;
    auto LEnabled = [](bool flag){return (flag ? "Enabled" : "Disabled");};
    
    std::ostringstream features;
    features << "Hyper Threading : " << LEnabled( EDX & CPU::htt ) << "\n"
             << "MMX      : " << LEnabled( EDX & CPU::mmx ) << "\n"
             << "SSE      : " << LEnabled( EDX & CPU::sse ) << "\n"
             << "SSE2     : " << LEnabled( EDX & CPU::sse2 ) << "\n"
             << "FPU      : " << LEnabled( EDX & CPU::fpu ) << "\n"
             << "SSE4_1   : " << LEnabled( ECX & CPU::sse4_1 ) << "\n"
             << "SSE4_2   : " << LEnabled( ECX & CPU::sse4_2 ) << "\n"
             << "AVX      : " << LEnabled( ECX & CPU::avx ) << "\n"
             << "popcount : " << LEnabled( ECX & CPU::popcnt ) << "\n";
    
    return features.str();
}


auto L2CacheData() -> std::string
{
    auto data = cpuid(0x80000006);
    std::ostringstream s;
    s << "L2 Cache:\n"
      << "Line size (B)   : " <<( data.ECX & 0xff )<< "\n"
      << "Assoc. Type     : " <<( (data.ECX >> 12) & 0x05 )<< "-way associative\n"
      << "Cache Size (KB) :" <<( (data.ECX >> 16) & 0xffff )<< "\n";
    
    return s.str();
}
