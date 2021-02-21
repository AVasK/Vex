#include "intrin_funcs.hh"

template<>
void Array<i16>::set_func_handlers()
{
    auto alignment = memory.get_alignment();
    switch (alignment)
    {
        case 16:
            f_add = i16_add_sse;
            std::cerr << "sse\n";
            break;
        case 32:
            f_add = i16_add_avx;
            std::cerr << "avx\n";
            break;
        default:
            std::cerr << "ERROR! WRONG ALIGNMENT\n";
            throw 1;
    }
}

template<>
func Array<i16>::operator+= (Array<i16> const& other) -> Array<i16>&
{
    this->f_add(*this, *this, other);
    return *this;
}

template <>
inline func operator+ (Array<i16> const& a1, Array<i16> const& a2) -> Array<i16>
{
    Array<i16> res (a1.size());
    return a1.f_add(res, a1, a2);
}




template <typename T>
std::ostream& operator<< (std::ostream& os, Array<T> const& arr)
{
    os << arr.toStream();
    return os;
}
