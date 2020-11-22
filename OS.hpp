/* OS DETECTION */
#if (__APPLE__ || __MACH__)
    #define OS "Mac OS"
    #define MAC_OS
#elif (WIN32 || _WIN32 || __WIN32__ || __NT__)
    #define OS "Windows 32"
    #define WIN32_OS
    #if (_WIN64)
        #define OS "Windows 64"
        #define WIN64_OS
    #endif
#elif __linux__
    #define OS "Linux"
    #define LINUX_OS

#elif __unix__
    #define OS "Unix"
    #define UNIX_OS

#elif defined(_POSIX_VERSION)
    #define OS "Posix"
    #define POSIX_OS

#else
    #define OS "Unknown OS"
    #define UNKNOWN_OS
#endif
