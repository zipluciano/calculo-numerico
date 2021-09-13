clc
clear
x = [1; 5];
erro = 10^(-6);
k = 0;
dif = 1;
while (dif > erro)
  k = k + 1;
  # Jacobiano (vetor das derivadas parciais)
  J(1,1) = 1;
  J(1,2) = 1;
  J(2,1) = 2 * x(1);
  J(2,2) = 2 * x(2);
  # funcoes do sistema de equacoes
  F(1) = x(1) + x(2) - 3;
  F(2) = (x(1)^2) + (x(2)^2) - 9;  
  d = J \ -F'; # Gauss com pivotamento parcial
  x = x + d;
  k
  dif = max(abs(d));
  d
  x
end