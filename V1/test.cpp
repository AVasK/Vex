#include <iostream>
#include <vector>
#include "integers.hpp"
#include "vex.hpp"
#include "simd_types.hpp"

#define ASSERT_EQ(a, b) \
    do { \
    auto temp ## __LINE__ = (a); \
    std::cout << #a" == "#b" : " << ( equal( temp ## __LINE__,(b) ) ? "PASSED" : "FAIL!\n" + (temp ## __LINE__).toStream() ) << "\n"; \
    } while(0);

template <typename T>
bool equal(Vex<T> const& vx, std::vector<T> const& v)
{
    if (vx.size() != v.size()) { std::cerr<<"size mismatch\n"; return false; }
    for (int i=0; i< v.size(); ++i)
    {
        if ( vx[i] != v[i] ) {
            std::cerr << vx[i] << " != " << v[i] << "\n";
            return false;
        }
    }
    return true;
}

// #ifdef __SSE4_2__ 
// #error "SSE4.2 flag has leaked into user-space"
// #endif

// #ifdef __AVX__ 
// #error "AVX flag has leaked into user-space"
// #endif

// #ifdef __AVX2__ 
// #error "AVX2 flag has leaked into user-space"
// #endif

int main()
{
    avx_i8 v8 {4};
    sse_u8 w8 {0};
    avx_i16 v16 {0};
    // TESTING:
    int N = 30;
    using T = i32;
    const auto vec3 = std::vector<T>(N, 3);
    auto vex3 = Vex<T>(N, 3);
    auto fvex = Vex<float>(N, 3.0);
    fvex += Vex<float>(N, 0.1415);
    ASSERT_EQ(vex3, vec3);
    std::cout << "vex3 = " << vex3 << "\n";
    auto vex1 = Vex<T>(N, 1);
    auto vex2 = Vex<T>(N, 2);
    ASSERT_EQ(Vex<T>(vex1 + vex2), vec3);
    std::cout << "vex1 + vex2 = " << Vex<T>(vex1 + vex2) << "\n";
    ASSERT_EQ(vex2 += vex1, vec3);
    ASSERT_EQ(Vex<T>(vex1 + 2), vec3); // operator+ (Vex<i16>, int)
    ASSERT_EQ(vex1 += 2, vec3);
    
}
