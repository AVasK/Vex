// Conditional Compilation Tools
#pragma once

//============= COMPILER DETECTION =============
// Clang + LLVM
#if defined(__clang__)
    #define C_CLANG 1
    #define C_LLVM  1
#elif defined(__llvm__)
    #define C_LLVM  1
// GCC
#elif defined(__GNUC__)
    #define C_GCC   1
// MSVC
#elif defined(_MSC_VER)
    #define C_MSVC  1
// Intel ICC
#elif defined(__INTEL_COMPILER)
    #define C_ICC   1
// Fujitsu C++
#elif defined(__FCC_VERSION)
    #define C_FUJITSU 2
// ARM Compiler
#elif defined(__CC_ARM)
    #define C_ARM   2
#endif


//=============== OS DETECTION =================
// Apple
#if (__APPLE__ || __MACH__)
    #define MAC_OS
// Windows (32bit)
#elif (WIN32 || _WIN32 || __WIN32__ || __NT__)
    #define WIN32_OS
    #define WINDOWS_OS
    // Windows (64bit) (_WIN64 implies _WIN32)
    #if (_WIN64)
        #define WIN64_OS
    #endif
// Linux
#elif __linux__
    #define LINUX_OS
// Unix
#elif __unix__
    #define UNIX_OS
// Posix-compliant
#elif defined(_POSIX_VERSION)
    #define OS "Posix"
    #define POSIX_OS
// ...?
#else
    #define UNKNOWN_OS
#endif


//======== PROC ARCHITECTURE DETECTION =========
// x86
// x86_32
#if defined(__i386__)
    #define ARCH_x86    1
    #define ARCH_x86_32 1
// x86_64
#elif defined(__x86_64__)
    #define ARCH_x86    1
    #define ARCH_x86_64 1
// ARM
#elif defined(__arm__)
    #define ARCH_ARM    1
    #if defined(__ARM_ARCH_5T__)
        #define ARCH_ARM_5T 1
    #endif
    #if defined(__ARM_ARCH_7A__)
        #define ARCH_ARM_7A 1
    #endif
// PowerPC
#elif defined(__powerpc64__)
    #define ARCH_PPC64   1
#endif

//=========== C++ VERSION (2 digits) ===========
// Ignores C++ 1989, since it's always there
// returns -> 11, 14, 17, 20, e.t.c
#define CPP_V ((__cplusplus/10000 > 19)?\
((__cplusplus/100) % 100): 0)
