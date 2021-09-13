import numpy as np
from numpy.lib.function_base import copy

r = [2, 2, 2, 2, 2]
t = [0, 1, 1, 1, 1]
d = [1, 1, 1, 1, 0]
b = [4, 4, 0, 0, 2]
b_c = copy(b)

a = [
    [2, 1, 0, 0, 0],
    [1, 2, 1, 0, 0],
    [0, 1, 2, 1, 0],
    [0, 0, 1, 2, 1],
    [0, 0, 0, 1, 2]
    ]

# somente para conferir os resultados
solved = np.linalg.solve(a, b)

n = len(b)
x = [0 for x in range(n)]

for i in range(1, n):    
    mult = t[i] / r[i - 1]
    r[i] = r[i] - (mult * d[i - 1])
    b[i] = b[i] - (mult * b[i - 1])

x[n - 1] = b[n - 1] / r[n - 1]

for i in reversed(range(0, 4)):
    x[i] = (b[i] - (d[i] * x[i + 1])) / r[i]

print(f'\nMatriz dos coeficientes: {a}')
print(f'\nMatriz dos termos independentes: {b_c}')
print(f'\nResolução por meio de biblioteca da linguagem: {solved}')
print(f'\nResolução por meio do algorítimo implementado: {x}')