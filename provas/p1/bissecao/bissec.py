from func import func
import os
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

cwd = os.path.join(os.getcwd(), "provas", "p1", "bissecao")
img = os.path.join(cwd, "bissec.png")

a = int(input("\nInsira o início do intervalo (a): "))
b = int(input("Insira o fim do intervalo (b): "))
while a > b:
    print("\nO (a) é maior que o (b)")
    a = int(input("Insira novos valores para o início do intervalo (a): "))
    b = int(input("Insira novos valores para o fim do intervalo (b): "))

fa = func(a)
fb = func(b)

while (fa * fb) > 0:
    print("\nEsse intervalo não contém uma raiz, tente um novo")
    a = int(input("Insira novos valores para o início do intervalo (a): "))
    b = int(input("Insira novos valores para o fim do intervalo (b): "))
    while a > b:
        print("\nO (a) é maior que o (b)")
        a = int(input("Insira novos valores para o início do intervalo (a): "))
        b = int(input("Insira novos valores para o fim do intervalo (b): "))
    X = np.arange(a, b, (b - a) * 0.1)
    y = list(map(func, X))
    fa = func(a)
    fb = func(b)

X = np.arange(a, b, (b - a) * 0.1)
y = list(map(func, X))
erro = 5 * (10 ** (-5))
k = 0
fxm = 1
X_xm = []
y_fxm = []

while (abs(fxm) > erro):
    k += 1
    xm = (a + b) / 2
    fxm = func(xm)
    if (fa * fxm) < 0:
        b = xm
        fb = fxm
    else:
        a = xm
        fa = fxm
    X_xm.append(xm)
    y_fxm.append(fxm)

font = {'color':  'darkred',
        'weight': 'normal',
        'size': 15
        }

fig = plt.figure()
plt.plot(X, y)
plt.plot(X_xm, y_fxm, "r+", linewidth = 2)
plt.title("Raízes - Método da Bisseção", fontdict = font)
plt.xlabel("Valores de xm")
plt.ylabel("Valores de f(xm)")
plt.grid()
fig.savefig(img)

print("\nNúmero de iterações: {}".format(k))
print("Raiz da função: {:.11f}".format(xm))
print("Função aplicada na raiz: {:.11f}".format(fxm))

# Gráfico plotado para valores de:
# a = 0
# b = 1
