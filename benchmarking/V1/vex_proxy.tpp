#include "SIMD_flags.set"

template <typename T1, char opcode, typename T2>
func vex_op<T1,opcode,T2>::get_avx_reg (size_t idx) const -> avx_reg<value_type>
{
    auto _r1 = v1.get_avx_reg(idx);
    auto _r2 = v2.get_avx_reg(idx);
    return op<opcode>(_r1, _r2);
}


template <typename T1, char opcode, typename T2>
func vex_op<T1,opcode,T2>::eval() const -> Vex<value_type>
{
    auto flags = Vex<value_type>::simd_flags();
    auto len = this->size();
    auto n_regs = this->size_in_registers();
    Vex<value_type> res (len);

    if (flags & SIMD::AVX)
    {
        for (size_t i = 0; i < n_regs; ++i)
        {
            auto _r1 = v1.get_avx_reg(i * avx_reg<value_type>::offset);
            auto _r2 = v2.get_avx_reg(i * avx_reg<value_type>::offset);
            auto _res = op<opcode>(_r1, _r2);
            store_avx( &res[i * avx_reg<value_type>::offset], _res );
        }
    }
    else 
    { 
        #if ARCH_x86_64
        for (size_t i = 0; i < n_regs; ++i)
        {
            auto _r1 = v1.get_sse_reg(i * sse_reg<value_type>::offset);
            auto _r2 = v2.get_sse_reg(i * sse_reg<value_type>::offset);
            auto _res = op<opcode>(_r1, _r2);
            store_sse( &res[i * sse_reg<value_type>::offset], _res );
        }
        #elif ARCH_x86_32
        for (size_t i = 0; i < len; ++i)
        {
            res[i] = v1[i] + v2[i];
        }
        #endif
    }
    return res;
}

template <typename T1, char opcode, typename T2>
vex_op<T1,opcode,T2>::operator Vex<value_type> () const {
    //std::cout << "to Vex\n";
    return eval();
}



template <typename T>
inline func Val<T>::get_avx_reg(size_t idx) const -> avx_reg<value_type>
{
    static auto res = avx_reg<T>( val );
    return res;
}



template <typename T>
inline func VProxy<T>::get_avx_reg(size_t i) const -> avx_reg<value_type>
{
    return load_avx(&vector[i]);
}


#include "SIMD_flags.discard"