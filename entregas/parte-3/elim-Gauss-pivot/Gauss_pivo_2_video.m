clc
clear
# processo com escolha de uma linha pivô
#a = [-0.421 0.784 0.279; 0.448 0.832 0.193; 0.421 0.784 -0.207];
#b = [0 1 0];
#a = [4 2 3; 2 -4 -1; -1 1 4];
#b = [7 1 -5];
a = [1 -1 1; 2 3 -1; -3 1 1];
b = [1 4 -1];
ca = a;
cb = b;
n = length(b);
o = [1 2 3];
for k = 1 : n - 1
  maior  = abs(a(o(k),k));
  p = k;
  for i = k + 1 : n
    if (abs(a(o(i),k)) > maior)
      maior = abs(a(o(i),k));
      p = i;
    end
  end
  if (p > k)    
    aux = o(k);
    o(k) = o(p);
    o(p) = aux;
  end  
  for i = k + 1 : n
    mult = a(o(i),k) / a(o(k),k);
    for j = k : n
      a(o(i),j) = a(o(i),j) - (mult * a(o(k),j));
    end
    b(o(i)) = b(o(i)) - (mult * b(o(k)));
  end
end
format long
a
b
# retrosubstituição
x(n) = b(o(n)) / a(o(n),n);
for i = n - 1 : -1 : 1
  soma = 0;
  for j = i + 1 : n
    soma = soma + (a(o(i),j) * x(j));
  end
  x(i) = (b(o(i)) - soma) / a(o(i),i);
end
x
o
# resíduo
r = abs(cb' - (ca * x'))