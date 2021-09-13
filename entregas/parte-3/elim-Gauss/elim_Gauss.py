from copy import deepcopy
import numpy as np

a = [[-0.421, 0.784, 0.279], [0.448, 0.832, 0.193], [0.421, 0.784, -0.207]]
b = [0, 1, 0]

copy_a = deepcopy(a)
copy_b = deepcopy(b)

n = len(b)

for k in range(n - 1):
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

print(f'\nMatriz dos coeficientes: {array_a}')
print(f'\nMatriz dos termos independentes: {array_b}')
print(f'\nValores de x: {array_x}')
print(f'\nValores residuais: {r}')