///!!! DO NOT COMPILE AS AN INDEPENDENT FILE
#pragma once

#ifdef ARCH_x86
    #if C_CLANG
        #pragma clang attribute push (__attribute__((target("sse, sse2,sse4.1,sse4.2,ssse3,avx,avx2"))), apply_to=function)
    #elif C_GCC
        #pragma GCC push_options
        #pragma GCC target("sse4.2", "ssse3", "avx", "avx2")
    #endif
#endif


static inline auto iload_128(void const * p) -> __m128i
{
    // load aligned integer vector from array p
    return _mm_load_si128((__m128i const*) p);
}

static inline auto iload_256(void const * p) -> __m256i
{
    // load aligned integer vector from array p
    return _mm256_load_si256((__m256i const*) p);
}

static inline auto istore_128(void * d, __m128i const& x) -> void
{
    // store aligned integer vector x into array d
    _mm_store_si128((__m128i *) d, x);
}

static inline auto istore_256(void * d, __m256i const& x) -> void
{
    // store aligned integer vector x into array d
    _mm256_store_si256((__m256i *)d, x);
}


// FUNCS:
//[[gnu::optimize("3")]]
func i16_add_avx (
                  Array<i16> & res,
                  Array<i16> const& a1,
                  Array<i16> const& a2
                  )
-> Array<i16>
{
    auto n_regs = a1.size_in_registers();
    for (size_t i=0; i < n_regs; ++i)
    {
        //FIXME: Need separate function to get register start address.
        // load #elems_per_reg consecutive elements from a1:
        auto _a1 = iload_256(&a1[i<<4]);
        
        auto _a2 = iload_256(&a2[i<<4]);
        
        auto _res = _mm256_add_epi16(_a1, _a2);
        
        istore_256(&res[i<<4], _res);
        //_mm256_zeroupper();
    }
    return res;
}


func i16_add_sse (
                  Array<i16> & res,
                  Array<i16> const& a1,
                  Array<i16> const& a2
                  )
-> Array<i16>
{
    auto n_regs = a1.size_in_registers();
    for (size_t i=0; i < n_regs; ++i)
    {
        // load <n_per_reg> consecutive elements from a1:
        auto _a1 = iload_128(&a1[i<<3]);
        // load 8 cons.elems from a2 [i*8]
        auto _a2 = iload_128(&a2[i<<3]);
        auto _res = _mm_add_epi16(_a1, _a2);
        istore_128(&res[i<<3], _res);
    }
    return res;
}



#ifdef ARCH_x86
    #if C_CLANG
        #pragma clang attribute pop
    #elif C_GCC
        #pragma GCC pop_options
    #endif
#endif