clc
clear
x = [1; -1];
erro = 10^(-7);
k = 0;
dif = 1;
while (dif > erro)
  k = k + 1;
  # Jacobiano (vetor das derivadas parciais)
  J(1,1) = exp(x(1));
  J(1,2) = 1;
  J(2,1) = 2 * x(1);
  J(2,2) = 2 * x(2);
  # funcoes do sistema de equacoes
  F(1) = exp(x(1)) + x(2) - 1;
  F(2) = (x(1)^2) + (x(2)^2) - 4;  
  d = J \ -F'; # Gauss com pivotamento parcial
  x = x + d;
  dif = max(abs(d));  
end
k
x
dif