# Vectorized C++ numeric arrays:

## Details:
- a header-only library: 
- does not need separate compilation

To use, include the main header
```C++
#include "Vex.hpp"
```

### Implements dynamic SIMD dispatch at runtime
uses GCC/Clang language extension
```C++
__attribute__((target(...)))
```

### Can use static compile-time dispatch when compiler SIMD flags are set
if you set extended SIMD flags while compiling your program, the library will either totally ditch dynamic dispatch and switch to static compile-time vectorization or limit the amout of runtime checks. 
Extended SIMD flags can be set in many ways, some examples being:
- ` -mavx2`
- ` -mavx`
- ` -msse4.2`

or even
- ` -march=native`

The set of default SIMD flags depends on the vendor and the version of your compiler, but it is usually chosen to be supported by the vast majority of cpu's currently in use. (no AVX by default as of yet)

### Two evaluation modes:
- eager evaluation:
```C++
Vex<T> res = x + 2*y;
//or 
auto res = eval( x + 2*y );
```
- lazy evaluation:
```C++
auto res = x + 2*y;
//dereferencing res[i] is O(1)
//auto is inferred to be vex_op<Vex<T>, '+', vex_op<Val<T>, '*', Vex<T>>> at compile-time, no runtime cost.
```

### Implements efficient vectorization for u8 / i8 using saturated overflow mode
- Works as an implicit hardware-implemented clamp for images: u8 values are "clamped" in [0, 255]. 
- Vex<u8> is faster than std::vector<u8> even on -O3
- Vectorized code can be easily modified

### Supports .push(), .pop()
Unlike `std::valarray` supports pushing and popping to/from memory. 

### Supports extension
- can be used to implement faster strings (using SSE4.2) [SSE4.2 flags can be checked using x86_cpuid.hpp]
- flexible: behaviour can be fine-tuned for each type separately by specializing eval_op and/or simd_op in file `vex_proxy_ops.hpp`
- uses Expression Templates to eliminate multiple loops

## Examples
```C++
// flip
Vex<int> arr = {0,1,0,1,0};
arr[arr == 0] = 1 | otherwise(0); 
```

```C++
// Allowed (Vex <-> value) Conversions:
// Vex<Integral> supports operands of any Integral type
// Vex<FloatingPoint> supports operands of and Integral & Floating point types
Vex<float> fvex = {...};
Vex<i8>    ivex = {...};

auto ok_1 = fvex + 1;    // OK: Vex<float> + int
auto ok_2 = ivex + 1;    // OK: Vex<i8> + int
auto ok_3 = fvex + 2.2;  // OK: Vex<float> + double
auto error = ivex + 2.2; // ERROR: No truncating downcast by default

// std::valarray will let you do the truncation, resulting in a warning about implicit conversion.
std::valarray<int> val_f1 (3.14, 4);
std::valarray<int> res_f1 = val_f1 + 3.14;
```

```C++
Vex<float> v = ...;
Vex<float> w = ...;
float a = ...;
int b = ...;
int c = ...;

// saxpy:
v += a*w;

// and more:
v += a*w + b*z + c; // will make a single loop over all vectors, very efficient
```

## Supported compilers:
- Clang
- GCC
