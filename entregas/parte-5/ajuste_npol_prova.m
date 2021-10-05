# algorítimo y = a * (e^(bx))
clc
clear
format long
x = [0 0.5 1 2.5 3];
y = [2 2.6 3.7 13.2 21];
z = log(y);
n = length(x); # número de pontos
M = 1; # grau do ajuste
for i = 1 : M + 1
  for j = 1 : M + 1
    a(i,j) = 0;
    for k = 1 : n
      a(i,j) = a(i,j) + (x(k)^(j + i - 2));
    end
  end
  b(i) = 0;
  for k = 1 : n
    b(i) = b(i) + (z(k) * (x(k)^(i - 1)));
  end
end
a
b
d = det(a)
nc = cond(a)
c = a \ b'; # resolve o sistema
c(1) = exp(c(1)); 
c
for i = 1 : n
  g(i) = c(1) * exp(c(2) * x(i));  
end 
g
plot(x, y, 'o')
grid
hold on
plot(x, g, 'r')