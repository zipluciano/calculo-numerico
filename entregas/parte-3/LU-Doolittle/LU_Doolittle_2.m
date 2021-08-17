clear
clc
a = [4 2 3; 2 -4 -1; -1 1 4];
b = [7 1 -5];
ca = a;
n = length(b);

for k = 1 : n
  for j = k : n
    soma = 0;
    for t = 1 : k - 1
      soma = soma + a(k,t) * a(t,j);
    end      
    a(k,j) = a(k,j) - soma;
  end  
  for i = k + 1 : n
    soma = 0;
      for t = 1 : k - 1
        soma = soma + a(i,t) * a(t,k);
      end
      a(i,k) = (a(i,k) - soma) / a(k,k);
  end
end
a
# -- Ly = b
y(1)  = b(1);
for i = 2 : n
  soma = 0;
  for j = 1 : i - 1
    soma = soma + (a(i,j) * y(j));
  end
  y(i) = (b(i) - soma);
end
y
# -- Ux=y
x(n) = y(n) / a(n,n);
for i = n - 1 : -1 : 1
  soma = 0;
  for j = i + 1 : n
    soma = soma + (a(i,j) * x(j));
  end
  x(i) = (y(i) - soma) / a(i,i);
end
x
# -- resíduo
r = abs(b' - (ca * x'))