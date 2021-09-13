a = [1, 0, 3, -5]
n = len(a)
b = [a[0]]
c = [a[0]]
x0 = complex(-1 + (-1j))
erro = 10 ** (-7)
k = 0
r = 1

while abs(r) > erro:
    k += 1
    for i in range(1, n):
        b.append((b[i - 1] * x0) + a[i])
    for i in range(1, n - 1):
        c.append((c[i - 1] * x0) + b[i])        
    r = b[n - 1]
    r1 = c[n - 2]
    x0 = x0 - (r / r1)    
    b = [1]
    c = [1]

print(f"\nk: {k} | x0: {x0} | r: {r}")