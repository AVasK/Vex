#include "cctools.hpp"
#include <iostream>
#include "aligned_array.hpp"
#include "vex.hpp"

#include "timing.hpp"
#include <valarray>
#include <vector>
#include <cstdlib> // rng

#include "vex_proxy.hpp"


#ifdef __SSE4_1__ 
#warning "SSE4.1 ENABLED"
#endif

#ifdef __SSE4_2__ 
#warning "SSE4.2 ENABLED"
#endif

#ifdef __AVX__ 
#warning "AVX ENABLED"
#endif

#ifdef __AVX2__ 
#warning "AVX2 ENABLED"
#endif

#include "cblas.h"


static void saxpy_kernel_noasm( long n, float *x, float *y, float *alpha)
{
	long register i = 0;
	float a = *alpha;

	while(i < n)
        {
              y[i]   += a * x[i];
              y[i+1] += a * x[i+1];
              y[i+2] += a * x[i+2];
              y[i+3] += a * x[i+3];
              y[i+4] += a * x[i+4];
              y[i+5] += a * x[i+5];
              y[i+6] += a * x[i+6];
              y[i+7] += a * x[i+7];
              i+=8 ;

       }

}

static void saxpy_kernel_16( long n, float *x, float *y, float *alpha)
{

	long register i = 0;

	__asm__  __volatile__
	(
	"vbroadcastss		(%4), %%ymm0		    \n\t"  // alpha	

	".p2align 4				            \n\t"
	"1:				            \n\t"

        "vmovups                  (%3,%0,4), %%ymm12         \n\t"  // 8 * y
        "vmovups                32(%3,%0,4), %%ymm13         \n\t"  // 8 * y
        "vmovups                64(%3,%0,4), %%ymm14         \n\t"  // 8 * y
        "vmovups                96(%3,%0,4), %%ymm15         \n\t"  // 8 * y
	"vfmadd231ps       (%2,%0,4), %%ymm0  , %%ymm12  	     \n\t"   // y += alpha * x
	"vfmadd231ps     32(%2,%0,4), %%ymm0  , %%ymm13  	     \n\t"   // y += alpha * x
	"vfmadd231ps     64(%2,%0,4), %%ymm0  , %%ymm14  	     \n\t"   // y += alpha * x
	"vfmadd231ps     96(%2,%0,4), %%ymm0  , %%ymm15  	     \n\t"   // y += alpha * x
	"vmovups	%%ymm12,   (%3,%0,4)		     \n\t"
	"vmovups	%%ymm13, 32(%3,%0,4)		     \n\t"
	"vmovups	%%ymm14, 64(%3,%0,4)		     \n\t"
	"vmovups	%%ymm15, 96(%3,%0,4)		     \n\t"

	"addq		$32, %0	  	 	             \n\t"
	"subq	        $32, %1			             \n\t"		
	"jnz		1b		             \n\t"
	"vzeroupper				     \n\t"

	: 
          "+r" (i),	// 0	
	  "+r" (n)  	// 1
        :
          "r" (x),      // 2
          "r" (y),      // 3
          "r" (alpha)   // 4
	: "cc", 
	  "%xmm0", "%xmm1", "%xmm2", "%xmm3",
	  "%xmm4", "%xmm5", "%xmm6", "%xmm7",
	  "%xmm8", "%xmm9", "%xmm10", "%xmm11", 
	  "%xmm12", "%xmm13", "%xmm14", "%xmm15",
	  "memory"
	);

} 


template <typename T>
void rand_init(T & array_like, size_t N)
{
    for (size_t i=0; i<N; i++)
    {
        array_like[i] = std::rand();
    }
}

int main(int argc, char* argv[]) {
    auto N = 100000000;
    //auto N = 42;
    if (argc == 2)
    {
        N = std::atoi( argv[1] );
        std::cout << "N = " << N << ";\n"; 
    }
    else {
        std::cout << "default N = " << N << ";\n"; 
    }


    using T = float;//i8;//float;
        
    
    auto v = Vex<T>(N, 'a'); // [7] * 14
    auto w = Vex<T>(N, 2); // [2] * 14
    auto z = Vex<T>(N, 3);
    auto x = Vex<T>(N, 4);
    //v+=w;
    
    //rand_init(v, N);
    //rand_init(w, N);
    //std::cout << v << w << "\n";
    

    // {
    //     auto t = timing::msTimer("vex_add: vex + vex");
    //     //v += w; // SIMD?
    //     //v += 7;
    //     Vex<T> r = vex_add(v, w);
    // }

    int n_tests = 10;

    // for (int i=0; i<n_tests; i++)
    // {
    //     auto t = timing::msTimer("warmup");
    //     //v += w; // SIMD?
    //     //v += 7;
    //     Vex<T> r = w + v*2;
    // }

    std::cout << "N: " << N << "\n";
    std::cout << "# tests: " << n_tests << "\n";
    std::cout << "testing: v += 7*w;" << "\n";

    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("vex");
        //v += w; // SIMD?
        //v += 7;
        //Vex<T> r = w + v*2;
        v += 7*w;
        //Vex<T> res = w + z + x;
    }
    //std::cout << v[0] << "\n";


    std::vector<float> blas_v (N, 'a');
    std::vector<float> blas_w (N, 2);
    std::vector<float> blas_z (N, 3);
    std::vector<float> blas_x (N, 4);
    std::cout << blas_v[0] << "\n";
    //for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("APPLE BLAS SAXPY");
        cblas_saxpy(N, 7.0, blas_w.data(), 1, blas_v.data(), 1);
        //cblas_saxpy(N, 1.0, blas_z.data(), 1, blas_v.data(), 1);
        //cblas_saxpy(N, 1.0, blas_x.data(), 1, blas_v.data(), 1);
    }
    //std::cout << blas_v[0] << "\n";

    float alpha = 7.0;
    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("openBLAS SAXPY");
        saxpy_kernel_16(N, blas_w.data(), blas_v.data(), &alpha);
        //saxpy_kernel_16(N, blas_z.data(), blas_v.data(), &alpha);
        //saxpy_kernel_16(N, blas_x.data(), blas_v.data(), &alpha);
    }

    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("openBLAS SAXPY (no asm)");
        saxpy_kernel_noasm(N, blas_w.data(), blas_v.data(), &alpha);
        //saxpy_kernel_noasm(N, blas_z.data(), blas_v.data(), &alpha);
        //saxpy_kernel_noasm(N, blas_x.data(), blas_v.data(), &alpha);
    }
    
    auto vv = std::vector<T> (N, 'a');
    auto vw = std::vector<T> (N, 2);
    auto vz = std::vector<T> (N, 3);
    auto vx = std::vector<T> (N, 4);
    std::vector<T> res;
    //rand_init(vv, N);
    //rand_init(vw, N);
    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("std::vector");
        //res = std::vector<T>(N);
        for (size_t i=0; i<vv.size(); ++i) {
            //vv[i] += vw[i];
            //vv[i] += 7;
            //res[i] = vv[i] + vw[i];
            //res[i] = vw[i] + vv[i]*2;
            //vv[i] += vw[i] + vz[i] + vx[i];
            vv[i] += 7*vw[i];
        }
        //s += vv[0];
    }
    
    auto va = std::valarray<T> ('a', N);
    auto wa = std::valarray<T> (2, N);
    auto za = std::valarray<T> (3, N);
    auto xa = std::valarray<T> (4, N);
    //rand_init(va, N);
    //rand_init(wa, N);
    for (int i=0; i<n_tests; i++)
    {
        auto t = timing::msTimer("std::valarray");
        va += wa*7;
        //va += wa + za + xa;
        //std::valarray<T> res = wa + za + xa;
        //std::valarray<i8> res = va + wa;
        //va += wa;
        //va += 7;
    }
    
    //std::cout << s << "\n";
    
    /*
    {
        auto t = timing::msTimer("SIMD vex[mask]");
        w[v == T('a')] = v + w;
    }

    {
        auto t = timing::msTimer("valarray[mask]");
        wa[va == T('a')] = va + wa;
    }

    {
        auto t = timing::msTimer("std::vector[mask]");
        for (size_t i=0; i<vv.size(); i++)
        {
            if (vv[i] == T('a'))
            {
                vw[i] = vv[i] + vw[i];
            }
        }
    }
    */
     
    //std::cout << v << "\n" << w << "\n" << z << "\n";
    
    /*
     Interface Prototyping:
     1) the outter array interface:
     vex::array<i16> a(100, 1); // [1]x100
     a *= 2;
     a += 1;
     a <<= 2;
     ...
     
     2) how does the array use aligned memory:
     class array {
     ...
        array() {
            // delegates memory handling to memory container class.
            // in order to do so it SHOULD CHECK CPUID.
            // based on that, it sets the alignment (@runtime)
        }
     }
     
     */

}
