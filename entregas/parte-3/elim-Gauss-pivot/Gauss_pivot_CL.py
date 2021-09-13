from copy import deepcopy
import numpy as np

a = [[1, -1, 1], [2, 3, -1], [-3, 1, 1]]
b = [1, 4, -1]

copy_a = deepcopy(a)
copy_b = deepcopy(b)

n = len(b)
o = [x for x in range(n)]

for k in range(n - 1):
    maior = abs(a[o[k]][k])
    p = k
    for i in range(k + 1, n):
        if abs(a[o[i]][k]) > maior:
            maior = abs(a[o[i]][k])
            p = i
        if p > k:            
            aux = o[k]
            o[k] = o[p]
            o[p] = aux

for k in range(n - 1):
    maior = abs(a[k][k])
    p = k
    for i in range(k + 1, n):
        if abs(a[i][k]) > maior:
            maior = abs(a[i][k])
            p = i
        if p > k:
            for j in range(k, n):
                aux = a[k][j]
                a[k][j] = a[p][j]
                a[p][j] = aux
            aux = b[k]
            b[k] = b[p]
            b[p] = aux
    for i in range(k + 1, n):
        m = a[i][k] / a[k][k]        
        for j in range(k, n):
            a[i][j] = a[i][j] - (m * a[k][j])
        b[i] = b[i] - (m * b[k])    

x = [i for i in range(n)]
x[-1] = b[n - 1] / a[n - 1][n - 1]
for i in reversed(range(n - 1)):
    soma = 0
    for j in range(i + 1, n):
        soma = soma + (a[i][j] * x[j])
    x[i] = (b[i] - soma) / a[i][i]

array_a = np.array(copy_a)
array_b = np.array(copy_b).reshape(-1, 1)
array_x = np.array(x).reshape(-1, 1)
r = array_b - array_a.dot(array_x)

print(f'\nMatriz dos coeficientes: {np.round(a, decimals = 3)}')
print(f'\nMatriz dos termos independentes: {np.round(b, decimals = 3)}')
print(f'\nValores de x: {array_x}')
print(f'\nVetor índice: {np.array(o)}')
print(f'\nValores residuais: {r}')