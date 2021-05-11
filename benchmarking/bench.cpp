//#include <iostream>
#include <benchmark/benchmark.h>
#include "vex.hpp"
#include <valarray>
#include <vector>

#ifdef __APPLE__
#include "cblas.h" // -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Accelerate.framework/Versions/Current/Frameworks/vecLib.framework/Headers/ -framework Accelerate
#endif

long N = 100000000;
using T = float;

static void BM_VexSum(benchmark::State& state) {
    auto v = Vex<T>(N, 'a');
    auto w = Vex<T>(N, 7);
    auto z = Vex<T>(N, 10);
    for (auto _ : state) {
        //Vex<T> res = v + w;
        v += w + z;
        //v += 2*w + z;
        benchmark::ClobberMemory();
    }
}
// Register the function as a benchmark


static void BM_VectorSum(benchmark::State& state) {
    auto v = std::vector<T>(N, 'a');
    auto w = std::vector<T>(N, 7);
    auto z = std::vector<T>(N, 10);
    //std::vector<T> res;
    for (auto _ : state) {
         //res = std::vector<T>(N);
         for (size_t i=0; i<std::min(v.size(), w.size()); i++) {
            //res[i] = v[i] + w[i];
            v[i] += w[i] + z[i];
            //v[i] += 2*w + z;
            benchmark::ClobberMemory();
         }
    }
}


static void BM_ValSum(benchmark::State& state) {
    auto v = std::valarray<T>('a', N);
    auto w = std::valarray<T>(7, N);
    auto z = std::valarray<T>(10, N);
    for (auto _ : state) {    
        v += w + z;
        //std::valarray<T> res = v + w;
        benchmark::ClobberMemory();
    }
}


static void BM_BLAS_saxpy(benchmark::State& state) {
    std::vector<float> v (N, 3.14);
    std::vector<float> w (N, 2);
    std::vector<float> z (N, 10);
    for (auto _ : state) {
        cblas_saxpy(N, 1.0, w.data(), 1, v.data(), 1);
        cblas_saxpy(N, 1.0, z.data(), 1, v.data(), 1);
        benchmark::ClobberMemory();
    }
}

BENCHMARK(BM_ValSum);
BENCHMARK(BM_BLAS_saxpy);
BENCHMARK(BM_VexSum);
BENCHMARK(BM_VectorSum);

BENCHMARK_MAIN();