# exercício avaliativo 1, contido na página 5 do arquivo "\aulas\parte-1\Parte1_Introducao.pdf"
# além de calcular a série, foi solicitado que fosse encontrado o erro entre o valor "real" de e^x
# e o valor calculado. Assim que fosse menor que 0.00001 o programa encerra.

import math

def main():
    e = math.exp(1)
    x = int(input("\nInsira um valor para x: "))
    i = 0

    def serie(x, i):
        values = []
        for m in range(0, i + 1):
            values.append((x ** m) / math.factorial(m))
        return sum(values)
    
    erro = abs((e ** x) - serie(x, i))

    while erro > 0.00001:
        i = i + 1
        erro = abs((e ** x) - serie(x, i))
        print("\ne^x = {:.6f} | Série = {:.6f} | x = {} | i = {} | erro = {:.6f}".format((e ** x), serie(x, i), x, i, erro))

    def valores(x, i):    
        print("\nValores finais:\nx: {}\nexp(x): {:.6f}\ni: {}\nSérie: {:.6f}".format(x, (e ** x), i, serie(x, i)))

    valores(x, i)

if __name__ == "__main__":
    main()