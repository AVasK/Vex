#include "cctools.hpp"

// GCC/Clang
#if C_GCC || C_CLANG
    #include <x86intrin.h>

// MSVC
#elif C_MSVC || C_ICC
    #include <intrin.h>

// portable SIMD instructions header
// (most compiler-agnostic from the bunch)
#else
    #include <immintrin.h>
#endif
