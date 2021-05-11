#include "SIMD_flags.set"

template <typename T>
auto VSum<T>::get_avx_reg (size_t i) const -> avx_reg<value_type>
{
    auto _r1 = load_avx(&v1[i]);
    auto _r2 = load_avx(&v2[i]);
    return op<'+'>(_r1, _r2);
}

#include "SIMD_flags.discard"