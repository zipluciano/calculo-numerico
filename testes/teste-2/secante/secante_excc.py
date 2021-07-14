from func_excc import func
import os
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

cwd = os.path.join(os.getcwd(), "testes", "teste-2", "secante")
img = os.path.join(cwd, "secante_excc.png")

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
    fa = func(a)
    fb = func(b)

erro = 10 ** (-5)
k = 0 
x0 = 1
x1 = 2
f0 = func(x0)
f1 = func(x1)
x_c = []
r_c = []
X = np.arange(a, b, (b - a) * 0.1)
y = list(map(func, X))

font = {'color':  'darkred',
        'weight': 'normal',
        'size': 15
        }
fig = plt.figure()
plt.plot(X, y, linewidth = 2)

while abs(f1) > erro:
    k += 1    
    x_c.append(X)
    r = f0 + (((f1- f0) / (x1 - x0)) * (X - x0))
    r_c.append(r)        
    xk = x1 - (((x1 - x0) * f1) / (f1 - f0))
    x0 = x1
    x1 = xk
    f0 = f1
    f1 = func(x1)

for x in range(0, k):
    plt.plot(x_c[x], r_c[x], 'r')

plt.title("Raízes - Método da Secante (Exercício)", fontdict = font)
plt.xlabel("Valores de x")
plt.ylabel("Valores de f(x)")
plt.grid()
fig.savefig(img)

print(f"\nNúmero de iterações: {k}")
print("Raiz da função: {:.11f}".format(xk))
print("Função aplicada na raiz: {:.11f}".format(f1))

# Gráfico plotado para valores de:
# a = 0
# b = 1