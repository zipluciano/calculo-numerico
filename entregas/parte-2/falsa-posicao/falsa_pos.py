from func import func
import os
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

cwd = os.path.join(os.getcwd(), "entregas", "parte-2", "falsa-posicao")
img = os.path.join(cwd, "falsa_pos_chart.png")

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

erro = (10 ** (-7))
k = 0
fxm = 1
x_c = []
r_c = []
X = np.arange(a, b, (b - a) * 0.1)
y = list(map(func, X))

font = {'color':  'darkred',
        'weight': 'normal',
        'size': 15
        }
fig = plt.figure()
plt.plot(X,y)

while (abs(fxm) > erro):
    k += 1
    xm = a - ((fa * (b - a)) / (fb - fa))    
    x_c.append(X)
    fxm = func(xm)
    r = fa + ((fb - fa) / (b - a)) * (X - a)
    r_c.append(r)    
    if (fa * fxm) < 0:
        b = xm
        fb = fxm
    else:
        a = xm
        fa = fxm    

for x in range(0, 26):
    plt.plot(x_c[x], r_c[x])

plt.title("Raízes - Método da Falsa Posição", fontdict = font)
plt.xlabel("Valores de xm")
plt.ylabel("Valores de f(xm)")
plt.grid()
fig.savefig(img)

print("\nNúmero de iterações: {}".format(k))
print("Raiz da função: {:.7f}".format(xm))
print("Função aplicada na raiz: {:.8f}".format(fxm))