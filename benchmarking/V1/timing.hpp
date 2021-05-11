#pragma once

#include <chrono>
#include <iostream>

namespace timing {
    
    template <typename Clock, typename unit>
    class TimerBase;

    using namespace std::chrono;
    using ms = milliseconds;
    using ns = nanoseconds;

    template <typename Units =milliseconds>
    using Timer = TimerBase<high_resolution_clock, Units>;

    using msTimer = Timer<milliseconds>;
    using nsTimer = Timer<nanoseconds>;

    // An optional TIMEIT macro for some simple usecases
    #define TIMEIT(timer_name, code) \
    {                      \
        auto t = timing::Timer<>(timer_name); \
        code \
    }
    
    // Conversion for output
    template <typename T>
    struct convert {};

    template<>
    struct convert<milliseconds>
    {
        static constexpr char value = 'm';
    };

    template<>
    struct convert<nanoseconds>
    {
        static constexpr char value = 'n';
    };

    template<>
    struct convert<seconds>
    {
        static constexpr char value = ' ';
    };


    // Clumsy Timer template with all the settings
    template <typename Clock, typename unit =nanoseconds>
    class TimerBase {
    public:
        TimerBase(const char* _name="unnamed")
        : start_time {Clock::now()}
        , name{_name} {}
        
        inline void time(const char* _caption = "") {
            auto curr_time = Clock::now();
            auto elapsed = duration_cast<unit>(curr_time - start_time).count();
            if (*_caption != '\0')
                std::cout << name << " timer @ [" << _caption << "] time: "
                          << elapsed << " " << convert<unit>::value<<"s\n";
            else
                std::cout << name << " timer time: "
                          << elapsed << " " << convert<unit>::value<<"s\n";
        }
        
        ~TimerBase() {
            time();
        }
        
    private:
        time_point<Clock> start_time;
        const char* name;
    };

}; // namespace Timing
