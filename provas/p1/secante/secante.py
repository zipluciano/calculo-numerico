from func import func

erro = 10 ** (-8)
k = 0 
x0 = 0.05
x1 = 0.15
f0 = func(x0)
f1 = func(x1)

while abs(f1) > erro:
    k += 1          
    xk = x1 - (((x1 - x0) * f1) / (f1 - f0))
    x0 = x1
    x1 = xk
    f0 = f1
    f1 = func(x1)

print(f"\nNúmero de iterações: {k}")
print("Raiz da função: {:.11f}".format(xk))
print("Função aplicada na raiz: {:.15f}".format(f1))
