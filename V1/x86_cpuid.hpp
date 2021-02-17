// Written by Alex Vaskov
// CPUID subset extraction
#pragma once

#include "cctools.hpp" // detect proc.arch, OS, Compiler
#if !(ARCH_x86)
#error this header is for x86 only
#endif

#include <array>
#include <string>
#include <sstream>
#include <thread>
#if defined(MAC_OS) || C_GCC
    #include <cpuid.h>
#endif


using UInt8 = uint8_t;
using UInt16 = uint16_t;
using UInt32 = uint32_t;
using UInt64 = uint64_t;

struct Registers {
    UInt32 EAX = 0;
    UInt32 EBX = 0;
    UInt32 ECX = 0;
    UInt32 EDX = 0;
    
    Registers() {}
    
    Registers(UInt32 * other)
    : EAX {other[0]}
    , EBX {other[1]}
    , ECX {other[2]}
    , EDX {other[3]}
    { }
    
    Registers& operator= (UInt32 * other)
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


inline auto cpuid(unsigned i) -> Registers
{
    Registers regs;
    
    // GCC:
    //TODO: TEST!
    #if C_GCC && defined(__get_cpuid)
        __get_cpuid(i, regs.EAX, regs.EBX, regs.ECX, regs.EDX);
        return regs;
    // MacOS:
    #elif (defined(MAC_OS) && defined(__cpuid))
        __cpuid(i, regs.EAX, regs.EBX, regs.ECX, regs.EDX);
        return regs;
    // Windows:
    #elif defined(WINDOWS_OS)
        __cpuid((int *)regs, (int)i);
    
    // else: (check clobbered registers again)
    // x86_32:
    #elif ARCH_x86_32 && defined(__PIC__)
        asm volatile (
                  "pushl %%ebx\n"\
                  "cpuid\n"\
                  "mov %%ebx, %1\n"
                  "popl %%ebx"\
                  : "=a" (regs[0]), "=r" (regs[1]), "=c" (regs[2]), "=d" (regs[3]) \
                  : "a" (i), "c" (0)
        );
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

inline bool hasAVX(UInt32 ECX)
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
      << "Assoc. Type     : " <<( (data.ECX >> 12) & 0x07 )<< "x\n"
      << "Cache Size (KB) :" <<( (data.ECX >> 16) & 0xffff )<< "\n";
    
    return s.str();
}

/*
 This doesn't work with recent Intel processors,
 if this functionality will be of any use,
 this func should probably be re-written
 (also to support AMDs, need to check vendor &
   read from the other offset)
 */
auto CPUNumCores() -> int
{
    // CPUID.4.EAX[31:26] + 1
    auto regs = cpuid(4);
    auto EAX = regs.EAX;
    
    auto num_cores = ((EAX & (0b111111<<26)) >> 26) + 1;
    return num_cores;
}

/*
 For the same reason as for CPUNumCores,
 decided to use std::thread's functionality for now
 */
auto CPUNumThreads() -> int
{
    /*
    // CPUID.1.EBX[23:16]
    auto regs = cpuid(1);
    auto EBX = regs.EBX;
    
    auto num_threads = ((EBX & (0b11111111<<16)) >> 16);
    return num_threads;
     */
    
    return std::thread::hardware_concurrency();
}

class CPU_Info {
private:
    Registers regs;
    
public:
    CPU_Info()
    : regs {cpuid(0)}
    {
        
    }
};

/*
CPU_Info cpu();
cpu.has_avx();
cpu.has_sse();
*/
