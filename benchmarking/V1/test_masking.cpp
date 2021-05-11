#include <iostream>
#include <vector>

enum class cmp_op {
    greater,
    greater_equal,
    equal,
    less,
    less_equal
};

template <cmp_op comparator>
struct MaskedArray;

template <cmp_op cmp>
struct MaskedProxy;

class Array {
public:
    Array (std::vector<int> const& v) 
    : data {v} 
    {}

    Array (Array const& other)
    : data {other.data}
    {}

    Array(Array && other)
    : data {std::move(other.data)}
    {}

    auto operator% (int val) -> Array
    {
        Array temp = *this;
        for (auto& elem : temp.data)
        {
            elem %= val;
        }
        return temp;
    }

    template <typename T, typename= 
               typename std::enable_if<
                 std::is_convertible<T, std::vector<int> >::type
               >::type
             >
    Array (T&& init) 
    : data ({init})
    {}

    int size() const { return data.size(); }

    auto operator[] (int idx) const -> int
    {
        return data[idx];
    }

    template <cmp_op cmp>
    auto operator[] (MaskedArray<cmp> mask) -> MaskedProxy<cmp>
    {
        return MaskedProxy<cmp>( data, mask );
    }

    friend std::ostream& operator<< (std::ostream& os, Array const& a) {
        for (auto const& elem : a.data)
        {
            os << elem << ", ";
        }
        return os;
    }

private:
    std::vector<int> data;
}; 

template <cmp_op comparator>
struct MaskedArray {
    MaskedArray(Array const& arr, int val)
    : array {arr}
    , value {val}
    {}

    Array const& array;
    int value;
};

template <cmp_op cmp>
struct MaskedProxy {
    MaskedProxy (std::vector<int> const& v, MaskedArray<cmp> const& mask) 
    {
        std::cout << "masked\n";
        for (int i=0; i < mask.array.size(); ++i) 
        {
            if constexpr (cmp == cmp_op::greater)
            {
                if (mask.array[i] > mask.value)
                    std::cout << v[i] << ", ";
            }
            if constexpr (cmp == cmp_op::equal)
            {
                if (mask.array[i] == mask.value)
                {
                    std::cout << v[i] << ", ";
                }
            }
        }
        std::cout << "\n";
    }
};

auto operator> (Array arr, int value) -> MaskedArray<cmp_op::greater>
{
    return MaskedArray<cmp_op::greater>( arr, value );
}

auto operator== (Array arr, int value) -> MaskedArray<cmp_op::equal>
{
    return MaskedArray<cmp_op::equal>( arr, value );
}


int main() 
{
    Array a = std::vector<int> {1,2,-3,4,-5,6};
    std::cout << a << "\n";
    a[a>0];
    a[a%2==0];
    std::cout << (a%2);
}