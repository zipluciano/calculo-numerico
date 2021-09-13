import numpy as np

a = [[4, 2, 3], [2, -4, -1], [-1, 1, 4]]
b = [7, 1, -5]

a = np.array(a)
b = np.array(b)

n = len(b)

L = np.zeros((a.shape[0], a.shape[1]))
U = np.zeros((a.shape[0], a.shape[1]))

for k in range(0, n):
    for i in range(k, n):
        soma = 0
        for t in range(0, k - 1):
            soma = soma + (L[i][k] * U[t][k])
        L[i][k] = a[i][k] - soma
    U[k][k] = 1
    for j in range(k + 1, n):
        soma = 0
        for t in range(0, k - 1):
            soma = soma + (L[k][t] * U[t][j])
        U[k][j] = (a[k][j] - soma) / L[k][k]

print(L)
print('\n', U)