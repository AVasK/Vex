#include <sstream> // ostringstream
#include <string>  // std::string
#include <cstring> // memcpy

// EXCEPTION
struct IndexError {
    IndexError();
    IndexError(std::string err)
    : error {err}
    {}
    
    std::string what() { return error; }

    std::string error = "<unspecified>";
};

// ENUM
enum class vectorization {off, avx, sse, dynamic};
using vex = vectorization;

std::string vex_to_str(vectorization vmode)
{
    switch (vmode) {
        case vex::off:
            return "off";
        case vex::avx:
            return "avx";
        case vex::sse:
            return "sse";
        case vex::dynamic:
            return "dynamic";
    }
}

// VEC FWD DECLARATION
template <typename NumType, vectorization vmode>
class Vec;

// ===================[VEC:OFF]=====================
template<typename NumType>
class Vec<NumType, vex::off> {
public:
    // C'tor
    Vec() {}
    
    Vec(size_t len)
    : _capacity {len}
    , elements {new NumType [_capacity]}
    {}
    
    Vec(size_t len, NumType fill_value)
    : _capacity {len}
    , _currsize {len}
    , elements {new NumType [_capacity]}
    {
        for (size_t i = 0; i < _currsize; i++)
        {
            elements[i] = fill_value;
        }
    }
    
    Vec(std::initializer_list<NumType> ilist)
    : _capacity {ilist.size()}
    , _currsize {ilist.size()}
    , elements  {new NumType[_capacity]}
    {
        size_t idx = 0;
        for (auto elem : ilist)
        {
            elements[idx++] = elem;
        }
    }
    
    // Dtor:
    ~Vec()
    {
        delete[] elements;
    }
    
    // Copy
    Vec(Vec const& copied)
    : _capacity {copied._capacity}
    , _currsize {copied._currsize}
    , elements {new NumType [_capacity]}
    {
        std::cout << "Copy Ctor\n";
        std::memcpy(elements, copied.elements, _currsize * sizeof(NumType));
        
    }

    auto operator= (Vec const& copied) -> Vec&
    {
        std::cout << "Copy assignment\n";
        _capacity = copied._capacity;
        _currsize = copied._currsize;
        elements = new NumType [_capacity];
        std::memcpy(elements, copied.elements, _currsize * sizeof(NumType));
        return *this;
    }
    
    // Move
    Vec(Vec&& moved)
    : _capacity {moved._capacity}
    , _currsize {moved._currsize}
    , elements  {moved.elements }
    {
        std::cout << "Move Ctor\n";
        moved.elements = nullptr;
    }
    
    
    auto operator= (Vec&& moved) -> Vec&
    {
        std::cout << "Move assignment\n";
        _capacity = moved._capacity;
        _currsize = moved._currsize;
        elements  = moved.elements;
        moved.elements = nullptr;
        return *this;
    }
    
    void push (NumType element)
    {
        if (_currsize == _capacity)
        {
            this->enlarge(_capacity<<1);
        }
        elements[_currsize++] = element;
    }
    
    void push (std::initializer_list<NumType> ilist)
    {
        if (_currsize + ilist.size() > _capacity)
        {
            this->enlarge(_capacity<<1);
        }
        for (auto elem : ilist)
        {
            this->push( elem );
        }
    }
    
    // Arithmetic
    // Vector addition
    auto operator+ (Vec const& other) -> Vec
    {
        Vec temp (_currsize);
        
        for (auto i = 0; i < _currsize; ++i)
        {
            temp.push( elements[i] + other[i] );
        }
        return temp;
    }
    
    // Vector + Scalar
    auto operator+ (NumType num) -> Vec
    {
        Vec temp (_currsize, 0);
    }
    
    // ...
    auto operator[] (size_t idx) -> NumType&
    {
        //TODO: Check for out-of-bounds only @ debug time
        if (idx >= _currsize) throw IndexError("Out Of Bounds");
        return elements[idx];
    }
    
    auto operator[] (size_t idx) const -> NumType
    {
        //TODO: Check for out-of-bounds only @ debug time
        if (idx >= _currsize) throw IndexError("Out Of Bounds");
        return elements[idx];
    }
    // Print
    std::string toString() const
    {
        auto end = _currsize-1;
        std::ostringstream oss;
        oss << "[";
        for (size_t i = 0; i < end; ++i)
        {
            oss << elements[i] << ", ";
        }
        oss << elements[end] << "]";
        return oss.str();
    }
    
    // Full Stats & View
    std::string view() const
    {
        auto end = _capacity-1;
        std::ostringstream oss;
        oss << "*--------------------------------\n"
            << "| Capacity: " << _capacity << "\n"
            << "| Used:     " << _currsize << "\n"
            << "| @:        " << elements << "\n"
            << "| V-mode:   " << vex_to_str(vmode) << "\n"
            << "*--------------------------------\n";
        oss << "[";
        for (size_t i = 0; i < end; ++i)
        {
            if (i < _currsize) {
                oss << elements[i] << ", ";
            }
            else {
                oss << "_, ";
            }
        }
        if (end < _currsize) {
            oss << elements[end] << "]";
        }
        else {
            oss << "_]";
        }
        oss << "\n";
        return oss.str();
    }
    
private:
    size_t _currsize = 0;
    size_t _capacity = 0;
    NumType * elements = nullptr;
    static const vectorization vmode = vex::off;
    
    void enlarge(size_t new_capacity)
    {
        auto temp = Vec(new_capacity);
        std::memcpy(temp.elements, elements, _currsize * sizeof(NumType));
        temp._currsize = _currsize;
        
        delete[] elements;
        *this = std::move(temp);
    }
};
// ===================[VEC:OFF]=====================
