#pragma once

#include <thread>

class smart_thread {

    std::thread _t;

public:
    template <typename F, typename... Ts>
    smart_thread (F && f, Ts&&... args)
    : _t(std::forward<F>(f), std::forward<Ts>(args)...)
    {}

    smart_thread (std::thread && t)
    : _t {std::move(t)}
    {
        if (!_t.joinable())
        {
            throw std::runtime_error("non-joinable thread moved");
        }
    }

    smart_thread(std::thread const&) = delete;
    smart_thread& operator= (std::thread const&) = delete;

    ~smart_thread() 
    {
        if (_t.joinable())
        {
            _t.join();
        }
    }
};