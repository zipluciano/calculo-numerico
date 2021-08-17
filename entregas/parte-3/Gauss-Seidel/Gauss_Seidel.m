clear
clc
a = [3 -1 -1; 1 3 1; 2 -2 4];
b = [1 5 4];
n = length(b);
x0 = zeros(1,n);
xa = x0;
erro = 10^(-7);
k = 0;
d = 1;
while (d > erro)
  k = k + 1;
  for i = 1 : n
    soma = 0;
    for j = 1 : n
      if j ~= i
        soma = soma + (a(i,j) * x0(j));
      end
    end
    x0(i) = (b(i) - soma) / a(i,i);
  end
  d = max(abs(x0 - xa)); # pode ser sum()
  xa = x0;  
end
format long
k
x0
d
# NOTAS(se aplica à todos os métodos):
# se um sistema não for diagonal dominante, ele "pode" não convergir, mas
# não é uma garantia.
# um sistema mal condicionado pode levar à soluções incorretas
# abs(det(a)) < 0,01 -> indica mal condinamento
# se cond(a) >> 1 (ex.: cond(a) > 100) -> indica mal condinamento
# usar dupla precisão(double) para identificar problemas de mal condinamento
# x = a\b -> resolve o sistema, quando a e b são vetores