#include "aligned_array.hpp" //TODO: rename to aligned_memory
#include "vex.hpp"

template <typename T>
class ImmutableView;

template <typename T>
class View;

template <typename T>
auto view (Vex<T> & vex) -> View<T>
{
    return View<T>( vex );
}

template <typename T>
auto view (Vex<T> const& vex) -> ImmutableView<T>
{
    return ImmutableView<T>( vex );
}


template <typename T>
class View {
public:
    using value_type = T;
    View (Vex<T> & vex)
    : memory {vex.data()}
    {}

    auto size() const -> size_t
    {
        return memory.size();
    }

    auto operator[] (size_t i) -> T&
    {
        return memory[i];
    }

private:
    Contiguous<T> & memory;
};

template <typename T>
class ImmutableView {
public:
    using value_type = T;
    ImmutableView (Vex<T> const& vex)
    : memory {vex.data()}
    {}

    auto size() const -> size_t
    {
        return memory.size();
    }

    auto operator[] (size_t i) const -> T const&
    {
        return memory[i];
    }

private:
    Contiguous<T> const& memory;
};

