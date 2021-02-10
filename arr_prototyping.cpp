#include "arr_prototyping.hpp"

template <vectorization mode>
void f(TArray<mode> arr)
{
    std::cout << "WOW\n";
}

void f(TArray<vex::gpu> gpu_arr)
{
    std::cout << "GPU array deduced!\n";
}

int main() {
    
    // check inside any operation
    auto a = IArray(vectorization::off);
    auto b = IArray(vectorization::avx);
    
    a+a;
    b+b;
    a+b;
    b+a;
    
    // dynamic op initialization
    auto p1 = PArray(vex::off);
    auto p2 = PArray(vex::avx);
    
    p1 * p1;
    p2 * p2;
    
    // templated array type
    auto t1 = TArray<vex::off>();
    auto t2 = TArray<vex::gpu>();
    
    t1 + t1;
    t2 + t2;
    //t1 + t2; // compile-time error
    t2 + t1; // OK: TArray<off> -> TArray<avx>
    
    // the only problem is:
    // when passing into a function, we either need to
    // use templates, or use fixed vectorization type
    f(t1);
    f(t2);
    
}
