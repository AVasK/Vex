#include <iostream>
#include "timing.hpp"
#include <thread>

//#define NOINLINE

#ifdef NOINLINE
#define INLINING __attribute__((noinline))
#else
#define INLINING __attribute__((always_inline))
#endif

enum mode {avx, sse, none, m1, m2, m3, m4, m5};
auto get_mode()->mode { return mode::avx; }
auto condition = mode::none;


// if-based function with multiple modes detected @ runtime
class I1 {
private:
    int * data;
public:
    I1() : data{nullptr} {}
    
    INLINING int f() {
        if (condition == mode::avx) {
            return 1;
        }
        else if (condition == mode::sse) {
            return 2;
        }
        else if (condition == mode::none) {
            return 3;
        }
        else if (condition == mode::m1) {
            return -1;
        }
        else if (condition == mode::m2) {
            return -2;
        }
        else if (condition == mode::m3) {
            return -3;
        }
        else {
            return 0;
        }
    }
    
    INLINING int g(int x) {
        if (condition == mode::avx) {
            return x<<2;
        }
        else if (condition == mode::sse) {
            return x<<3;
        }
        else if (condition == mode::none) {
            return x<<4;
        }
        return -1;
    }
};


class I1s {
private:
    int * data;
public:
    I1s() : data{nullptr} {}
    
    INLINING int f() {
        switch (condition) {
            case mode::avx:
                return 1;
                break;
            case mode::sse:
                return 2;
                break;
            case mode::none:
                return 3;
                break;
            case mode::m1:
                return -1;
                break;
            case mode::m2:
                return -2;
                break;
            case mode::m3:
                return -3;
                break;
            case mode::m4:
            default:
                return 0;
        }
    }
    
    INLINING int g(int x) {
        if (condition == mode::avx) {
            return x<<2;
        }
        else if (condition == mode::sse) {
            return x<<3;
        }
        else if (condition == mode::none) {
            return x<<4;
        }
        return -1;
    }
};



// dynamically linking a function ptr @ construction time

INLINING int f_avx() {
    return 1;
}
INLINING int f_sse() {
    return 2;
}
INLINING int f_none() {
    return 3;
}
INLINING int g_avx(int x) {
    return x<<2;
}
INLINING int g_sse(int x) {
    return x<<3;
}
INLINING int g_none(int x) {
    return x<<4;
}

class I2 {
public:
    int *data;
    int (*f_ptr)();
    int (*g_ptr)(int);

    I2()
    : data {nullptr}
    {
        if (condition == mode::avx) {
            f_ptr = f_avx;
            g_ptr = g_avx;
        }
        else if (condition == mode::sse) {
            f_ptr = f_sse;
            g_ptr = g_sse;
        }
        else if (condition == mode::none) {
            f_ptr = f_none;
            g_ptr = g_none;
        }
        else if (condition == mode::m1) {
            f_ptr = f_none;
            g_ptr = g_none;
        }
        else if (condition == mode::m2) {
            f_ptr = f_none;
            g_ptr = g_none;
        }
        else if (condition == mode::m3) {
            f_ptr = f_none;
            g_ptr = g_none;
        }
        else if (condition == mode::m4) {
            f_ptr = f_none;
            g_ptr = g_none;
        }
    }
    
    int f() {
        return f_ptr();
    }
    /*INLINING*/ int g(int x) {
        return g_ptr(x);
    }
};

int main() {
    using namespace timing;
    
    condition = get_mode();
    I1 i1;
    I1s i1s;
    I2 i2;
    long long HN = 999999;//99L;
    long N = 100000;
    
#ifdef NOINLINE
    std::cout << "NOINLINE\n";
#else
    std::cout << "ALWAYS INLINE\n";
#endif
    
    // IF
    {
        auto t = nsTimer("pre-existing I1 (if-based)");
        int c {};
        for (long i=0; i<HN; ++i)
        {
            c += i1.f();
            //c -= i1.g(i);
        }
        std::cout << c << "\n";
    }
    
    // SWITCH
    {
        auto t = nsTimer("pre-existing I1 (switch-based)");
        int c{};
        for (long i=0; i<HN; ++i)
        {
            c += i1s.f();
            //c -= i1s.g(i);
        }
        std::cout << c << "\n";
    }
    
    // PTR
    {
        auto t = nsTimer("pre-existing I2 (ptr-based)");
        int c {};
        for (long i=0; i<HN; ++i)
        {
            c += i2.f();
            //c -= i2.g(i);
        }
        std::cout << c << "\n";
    }
    std::cout << "=======\n";
    
    
    
    std::thread t1 ([=]()mutable{
        auto t = nsTimer("[T] pre-existing I1 (if-based)");
        int c {};
        for (long i=0; i<HN; ++i)
        {
            c += i1.f();
            //c -= i1.g(i);
        }
        std::cout << c << "\n";
    });
    

    std::thread t2 ([=]()mutable{
        auto t = nsTimer("[T] pre-existing I1 (switch-based)");
        int c{};
        for (long i=0; i<HN; ++i)
        {
            c += i1s.f();
            //c -= i1s.g(i);
        }
        std::cout << c << "\n";
    });
    
    
    /// I2 on thread gives poor performance
    /// REASON: UNKNOWN.
    /// ...................................
    /// can it be due to f_ptr pointing to another process's data?
    /// f_ptr differs in (main) and (t3)

    std::thread t3 ([=]()mutable{
        auto t = nsTimer("[T] pre-existing I2 (ptr-based)");
        int c {};
        for (long i=0; i<HN; ++i)
        {
            c += i2.f();
            //c -= i2.g(i);
        }
        std::cout << c << "\n";
    });

    
    t1.join();
    t2.join();
    t3.join();
    
    
    /*
    // pre-existing I1 (if-based)
    {
        auto t = nsTimer("pre-existing I1 (if-based)");
        for (long i=0; i<HN; ++i)
        {
            if (i == 100) {
                t.time("I1 100-time");
            }
            i1.f();
            i1.g(i%100);
        }
        
    }
        
    // pre-existing I2 (ptr-based)
    {
        auto t = nsTimer("pre-existing I2 (ptr-based)");
        for (long i=0; i<HN; ++i)
        {
            if (i == 100) {
                t.time("I2 100-time");
            }
            i2.f();
            i2.g(i%100);
        }
    }
    */
    
    
}
