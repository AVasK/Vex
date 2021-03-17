#include <iostream>
#include <vector>
#include "integers.hpp"
#include "vex.hpp"

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

int main()
{
    // TESTING:
    const auto vec3 = std::vector<i16>(10, 3);
    auto vex3 = Vex<i16>(10, 3);
    ASSERT_EQ(vex3, vec3);
    auto vex1 = Vex<i16>(10, 1);
    auto vex2 = Vex<i16>(10, 2);
    ASSERT_EQ(vex1 + vex2, vec3);
    ASSERT_EQ(vex2 += vex1, vec3);
    ASSERT_EQ(vex1 + i16(2), vec3); // operator+ (Vex<i16>, int)
    ASSERT_EQ(vex1 += 2, vec3);
    
}
