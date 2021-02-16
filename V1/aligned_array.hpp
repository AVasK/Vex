#include "aligned_memalloc.hpp"
#include <cstddef> // size_t
#include <cstring> // memcpy
#include <initializer_list>

// temporary
#include <sstream> // ostringstream
#include <string>  // std::string

#define func auto

/*
// The Contiguous memory has the granularity of
// the underlying MMX | XMM | YMM | ZMM registers (== alignment)
// => all memory allocations should be of size: size % align == 0
template <size_t block_size>
constexpr func modsize(size_t n) -> size_t;

// size: size >= n && size % 16 == 0
template<>
inline
constexpr func modsize<16>(size_t n) -> size_t
{
    return ((n>>4)+1)<<4;
}

template<>
inline
constexpr func modsize<32>(size_t n) -> size_t
{
    return ((n>>5)+1)<<5;
}

template<>
inline
constexpr func modsize<64>(size_t n) -> size_t
{
    return ((n>>6)+1)<<6;
}
 */


// TODO: Add .what at least
struct MemoryException {};


/// Contiguous memory of type T
/// aligned @ <align>-byte boundary
template <typename T, size_t align=16>
class Contiguous {
public:
    
    // C'tors & stuff
    
    // given just the block_size,
    // we only set the capacity.
    Contiguous(size_t size)
    : capacity {size}
    , used {0}
    , data {aligned::alloc<T>( size, align )}
    {
        if (!data) {
            throw MemoryException {};
        }
    }
    
    Contiguous(size_t size, T fill_value)
    : capacity {size}
    , used {size}
    , data {aligned::alloc<T>( size, align )}
    {
        if (!data) {
            throw MemoryException {};
        }
        for (size_t i=0; i<capacity; ++i)
        {
            data[i] = fill_value;
        }
    }
    
    Contiguous(std::initializer_list<T> list)
    : capacity {list.size()}
    , used {capacity}
    , data {aligned::alloc<T>( capacity, align )}
    {
        size_t i = 0;
        for (auto elem : list)
        {
            data[i++] = elem;
        }
    }
    
    ~Contiguous()
    {
        aligned::free(data);
    }
    
    // Copy ops
    Contiguous(Contiguous const& other)
    : capacity {other.capacity}
    , used {other.used}
    , data {aligned::alloc<T>( capacity, align )}
    {
        if (!data)
        {
            throw MemoryException {};
        }
        for (int i=0; i<used; ++i)
        {
            data[i] = other.data[i];
        }
    }
    
    func operator= (Contiguous const& other) -> Contiguous&
    {
        capacity = other.capacity;
        used = other.used;
        data = aligned::alloc<T>( capacity, align );
        if (!data)
        {
            throw MemoryException {};
        }
        for (int i=0; i<used; ++i)
        {
            data[i] = other.data[i];
        }
        return *this;
    }
    
    // Move ops
    Contiguous(Contiguous && other)
    : capacity {other.capacity}
    , used {other.used}
    , data {other.data}
    {
        other.used = 0;
        other.capacity = 0;
        other.data = nullptr;
    }
    
    func operator= (Contiguous && other) -> Contiguous&
    {
        capacity = other.capacity;
        used = other.used;
        data = other.data;
        
        other.used = 0;
        other.capacity = 0;
        other.data = nullptr;
        
        return *this;
    }
    
    // Memory-management
    
    // Addressing
    
    // toString
    func toString() const -> std::string
    {
        std::ostringstream oss;
        oss << "*--------------------------------\n"
            << "| Capacity: " << capacity    << "\n"
            << "| Used:     " << used        << "\n"
            << "| @:        " << data        << "\n"
            << "| (long) @: " << (long)data  << "\n"
            << "| @ % 16    " <<(long)data%16<< "\n"
            << "| @ % 32    " <<(long)data%32<< "\n"
            << "| @ % 64    " <<(long)data%64<< "\n"
            << "*--------------------------------\n";
        oss << "[";
        
        auto end = capacity-1;
        for (size_t i = 0; i < end; ++i)
        {
            if (i < used) {
                oss << data[i] << ", ";
            }
            else {
                oss << "_, ";
            }
        }
        if (end < used) {
            oss << data[end] << "]";
        }
        else {
            oss << "_]";
        }
        oss << "\n";
        return oss.str();
    }
    
    
    
    
private:
    size_t capacity = 0;
    size_t used = 0;
    T* data = nullptr;
};

template <typename T, size_t align>
std::ostream& operator<<(std::ostream& os, Contiguous<T, align> const& mem)
{
    os << mem.toString();
    return os;
}

#undef func
