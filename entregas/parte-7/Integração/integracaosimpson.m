a = 0; # LI
b = 3; # LS
n=8;
h = (b - a) / n;
x = [a : h : b];
y = exp(x)+(2 * x);
soma1 = 0;
soma2 = 0;
for i = 1 : (n / 2) - 1
  soma1 = soma1 + y(2 * i);
  soma2 = soma2 + y(2*i+1);
endfor
soma1 = soma1+y(n);
S = (h / 3) * (y(1) + 4 * soma1 + 2 * soma2 + y(n+1))