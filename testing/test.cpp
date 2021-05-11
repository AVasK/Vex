#include <iostream>
#include <vector>
#include <valarray>
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
        if ( vx[i] - v[i] >= 0.00001 ) {
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


using X1 = vex_valuetype< int, Vex<i8> >;
using X2 = vex_valuetype< Vex<i8>, Vex<i16> >;

using X3 = reType<Vex<i8>, i16>;

int main()
{
    int N = 30;
    using T = i16;
    const auto vec7 = std::vector<T>(N, 7);
    const auto vec3 = std::vector<T>(N, 3);
    const auto vec1 = std::vector<T>(N, 1);
    auto vex3 = Vex<T>(N, 3);
    ASSERT_EQ(vex3, vec3);
    auto vex1 = Vex<T>(N, 1);
    auto vex2 = Vex<T>(N, 2);
    ASSERT_EQ(Vex<T>(T(1) + vex2), vec3);
    ASSERT_EQ(Vex<T>(vex2 + T(1)), vec3);
    ASSERT_EQ(Vex<T>(vex1 + vex2), vec3);
    ASSERT_EQ(Vex<T>(vex1 + vex2 + vex3 + T(1)), vec7);
    ASSERT_EQ(Vex<T>(vex3 - vex2), vec1);
    ASSERT_EQ(Vex<T>(vex1 + T(2)*vex3), vec7);

    ASSERT_EQ(vex2 += vex1, vec3);
    ASSERT_EQ(vex1, vec1);
    ASSERT_EQ(Vex<T>(vex1 + T(2)), vec3); // operator+ (Vex<i16>, int)
    ASSERT_EQ(vex1 += 2, vec3);
    
    std::vector<float> vf1 (N, 3.14);
    Vex<float> x1 (N, 2.0);
    Vex<float> x2 (N, 0.14);
    ASSERT_EQ(Vex<float>(x1 + x1/2.f + x2), vf1);
    

    Vex<i16> v = {-1, 1, -1, 1};
    Vex<i16> w = {1, 0, 1, 0};
    Vex<i16> z = {5,5,5,5};
    (w + v)[0];
    v[w + v == 0] = 7;
    //v[v == i16(0)] = 1;
    v[v == 1] = v + z;
    // v[1 == 1] = 2; //ERROR
    std::cout << v << "\n";
    std::cout << eval( 2*w + z ) << "\n";

    auto x = v | otherwise(w);
    v[v == 2*w+z] = 11 | otherwise(w);
    std::cout << v << "\n";

    Vex<i8> v8 = {1,1,1,1};
    Vex<int> v32 = {2,2,2,2};
    Vex<int> res = Vex<int>(v8) + v32;
    std::cout << res << "\n";

    Vex<int> arr = {0,1,0,1,0};
    arr[arr == 0] = 1 | otherwise(0); //flip


    // Vex<i32> res2 = vex1 + 2;
    // std::cout << vex1 << "\n";
    // std::cout << res2 << "\n";


    // Allowed Conversions:
    // Vex<Integral> supports operands of any Integral type
    // Vex<FloatingPoint> supports operands of and Integral & Floating point types
    Vex<float> fvex = {1.2, 2.2, 3.14, 4.2};
    Vex<i8> ivex = {1, 2, 3, 4};
    auto ok_1 = fvex + 1; // OK: Vex<float> + int
    auto ok_2 = ivex + 1; // OK: Vex<i8> + int
    auto ok_3 = fvex + 2.2; // OK: Vex<float> + double
    // auto error = ivex + 2.2; // ERROR: No truncating downcast by default

    // std::valarray will let you do the truncation, resulting in a warning about implicit conversion.
    std::valarray<int> val_f1 (3.14, 4);
    std::valarray<int> res_f1 = val_f1 + 3.14;

}
