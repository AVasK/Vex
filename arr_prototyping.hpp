#include <iostream>

#ifdef __AVX__
#error "avx"
#endif

enum class vectorization {off, avx, sse, gpu};
using vex = vectorization;

// checking for vectorization type in each op.
// Naive
class IArray {
public:
    
    IArray (vectorization mode)
    : vmode {mode}
    {}
    
    IArray operator+ (IArray other)
    {
        if (vmode != other.vmode)
        {
            std::cout << "vtype mismatch\n";
        }
        
        else if (vmode == vex::avx) {
            std::cout << "avx\n";
        }
        else if (vmode == vex::off)
        {
            std::cout << "plain\n";
        }
    }
private:
    size_t _size = 0;
    vectorization vmode;
};

// Rewiring function pointer @ construction
// (-): > double indirection possible due to ptr to func
//      > increased complexity
// (+): single if-statement @ construction

class PArray;

PArray& mul_nv (PArray & lhs, PArray const& other)
{
    std::cout << "NON-VEC'D\n";
    return lhs;
}

PArray& mul_v (PArray & lhs, PArray const& other)
{
    std::cout << "VECD\n";
    return lhs;
}

// overriding ops[] @ construction time
class PArray {
    using PType = PArray& (*) (PArray&, PArray const&);
public:
    PArray (vectorization mode)
    : vmode {mode}
    {
        if ( vmode == vex::off )
        {
            // put the non-vectorized ops inside
            // the 'ops' array
            ops[0] = mul_nv;
        }
        else
        if ( vmode == vex::avx )
        {
            ops[0] = mul_v;
        }
    }
    
    PArray& operator*(PArray const& other)
    {
        return ( ops[0](*this, other) );
    }
    
private:
    vectorization vmode;
    PType ops[4];
};


// template approach works well with the C++ type system
// + fast
// - but manual (no autodetection of vectorization)
template <vectorization mode>
class TArray;

template <>
class TArray<vex::off> {
public:
    auto operator+ (TArray rhs) -> TArray&
    {
        std::cout << "non-v'd\n";
        return *this;
    }
    
    operator TArray<vex::gpu>();
};

template <>
class TArray<vex::avx> {
public:
    auto operator+ (TArray rhs) -> TArray&
    {
        std::cout << "avx\n";
        return *this;
    }
};

template <>
class TArray<vex::gpu> {
public:
    auto operator+ (TArray rhs) -> TArray&
    {
        std::cout << "GPU\n";
        return *this;
    }
};

// and can even convert between array realizations
// without losing the support of the type system
TArray<vex::off>::operator TArray<vex::gpu>()
{
    std::cout << "Vector moved to GPU\n";
    return TArray<vex::gpu>();
}
