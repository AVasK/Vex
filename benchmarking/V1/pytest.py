import numpy as np
import time

def time_ms():
    return round(time.time() * 1000)

N = 999999999

t_a1 = time_ms()
a1 = np.ones(N) * 2.2
t_a1 = time_ms() - t_a1

t_a2 = time_ms()
a2 = np.ones(N) * 3.14
t_a2 = time_ms() - t_a2

print(f"{t_a1}, {t_a2} memory init")

t1 = time_ms()
a1 += a2
t2 = time_ms()
print(t2 - t1)

