# Exercício avaliativo 1, contido na página 5 do arquivo "\aulas\parte-1\Parte1_Introducao.pdf".
# Encontrar exp(x) "artificial" através de uma série, ainda foi solicitado que fosse encontrado o erro em relação ao valor "real".
# O valor "real"(exp(x)) será calculado como um elemento de série também. O módulo "math" permite calcular diretamente
# o valor de exp(x) "real", porém o exercício solicita que seja calculado com um índice à frente(i + 1) do índice
# do exp(x) "artificial"(i). Quando o erro entre exp(x) "real" e "artificial" for menor que 0,00001 o programa encerra.

import math 

x = int(input("\nInsira um valor para x: "))
i = 1

def e_real(x, i):        
    n = 0
    values_real = []    

    while n < i:
        
        values_real.append((x ** n) / math.factorial(n))                
        n = n + 1    
            
    s_real = sum(values_real)    
    return s_real

def e_serie(x, i):
    m = 0
    values_serie = []    

    while m < i:
        
        values_serie.append((x ** m) / math.factorial(m))                
        m = m + 1                

    values_serie.pop(-1)
    s_serie = sum(values_serie)    
    return s_serie

def erro():
    return abs(e_real(x, i) - e_serie(x, i))

while erro() > 0.00001:
    i = i + 1
    erro()

print('\nValor de x: {}'.format(x))
print('exp(x) "real": {:.6f}'.format(e_real(x, i)))
print('exp(x) "artificial": {:.6f}'.format(e_serie(x, i)))
print('Valor de i: {}'.format(i))
print('Erro calculado: {:.6f}'.format(erro()))