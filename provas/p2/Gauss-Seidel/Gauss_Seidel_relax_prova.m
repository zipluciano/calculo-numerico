clear
clc
a = [4 1 2; 1 2 1; 1 0.1 1];
b = [1 4 -3];
n = length(b);
x0 = zeros(1,n);
xa = x0;
erro = 10^(-6);
k = 0;
d = 1;
w = 1.1;
while (d > erro)
  k = k + 1;
  for i = 1 : n
    soma = 0;
    for j = 1 : n
      if j ~= i
        soma = soma + (a(i,j) * x0(j));
      end
    end
    x0(i) = ((1 - w) * x0(i)) + (w * ((b(i) - soma) / a(i,i)));
  end
  d = max(abs(x0 - xa)); # pode ser sum()
  xa = x0;  
end
format long
w
k
x0
d