import math
import numpy as np
from numpy.lib.function_base import copy

r = [1 , 5, 5, 5, 5, 5, 5, 5, 5, 5, 1]
t = [0, -1, -1, -1, -1, -1, -1, -1, -1,-1, -0.5]
d = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0]
b = [ 0.00000, 0.98007, 0.95534, 0.92106, 0.87758, 0.82534, 0.76484, 0.69671, 0.62161, 0.54030, 0.00000]
b_c = copy(b)

n = len(b)
x = [0 for x in range(n)]

for i in range(1, n):    
    mult = t[i] / r[i - 1]
    r[i] = r[i] - (mult * d[i - 1])
    b[i] = b[i] - (mult * b[i - 1])

x[n - 1] = b[n - 1] / r[n - 1]

for i in reversed(range(0, n - 1)):
    x[i] = (b[i] - (d[i] * x[i + 1])) / r[i]

print(f'\nMatriz dos termos independentes: {b_c}')
print(f'\nResolução: {x}\n')

def check_l(j):
    return -x[j - 2] + (5 * x[j - 1]) - x[j]

def check_r(j):
    return math.cos(j / 10)

for i in range(2, 11):
    print("Left: {:.5f} | Right: {:.15f}".format(check_l(i), check_r(i)))