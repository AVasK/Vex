///!!! DO NOT COMPILE AS AN INDEPENDENT FILE
#pragma once

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


#define I16_256(res, a1, a2, op)           \
    auto n_regs = (a1).size_in_registers();\
    for (size_t i=0; i < n_regs; ++i)      \
    {                                      \
        auto _a1 = iload_256(&(a1)[i<<4]); \
        auto _a2 = iload_256(&(a2)[i<<4]); \
    auto _res = (op) (_a1, _a2);           \
    istore_256(&(res)[i<<4], _res);        \
    }

#define I16_128(res, a1, a2, op)           \
    auto n_regs = (a1).size_in_registers();\
    for (size_t i=0; i < n_regs; ++i)      \
    {                                      \
        auto _a1 = iload_128(&(a1)[i<<3]); \
        auto _a2 = iload_128(&(a2)[i<<3]); \
    auto _res = (op) (_a1, _a2);           \
    istore_128(&(res)[i<<3], _res);        \
    }

/* ##############################################
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
*/

// FUNCS:

inline func i16_add_avx (
                  Vex<i16> & res,
                  Vex<i16> const& a1,
                  Vex<i16> const& a2
                  )
-> Vex<i16>
{

    auto n_regs = a1.size_in_registers();
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _a1 = iload_256(&a1[i<<4]);
        auto _a2 = iload_256(&a2[i<<4]);
        auto _res = _mm256_add_epi16(_a1, _a2);
        istore_256(&res[i<<4], _res);
        //_mm256_zeroupper();
    }
/*
    auto size = a1.size();
    for (size_t i=0; i < size; i+=16)
    {
        auto _a1 = iload_256(&a1[i]);
        auto _a2 = iload_256(&a2[i]);
        auto _res = _mm256_add_epi16(_a1, _a2);
        istore_256(&res[i], _res);
    }
*/
    return res;
}


inline func i16_add_sse (
                  Vex<i16> & res,
                  Vex<i16> const& a1,
                  Vex<i16> const& a2
                  )
-> Vex<i16>
{
    auto n_regs = a1.size_in_registers();
    for (size_t i=0; i < n_regs; ++i)
    {
        auto _a1 = iload_128(&a1[i<<3]);
        auto _a2 = iload_128(&a2[i<<3]);
        auto _res = _mm_add_epi16(_a1, _a2);
        istore_128(&res[i<<3], _res);
    }
    return res;
}
