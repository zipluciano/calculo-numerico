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
w = 0.82;
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
k
x0
d