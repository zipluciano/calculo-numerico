function Interpola
  clc
  clear
  format long  
  x = [3 -2 1 3];
  y = [-1 2 -1 10];  
  n = length(x);
  grau = n - 1;
  for i = 1 : n
    for j = 1 : n
      # matriz de Vandermonde
      V(i,j) = x(i) ^ (j - 1);
    end
  end
  det(V)
  cond(V)
  a = V \ y'
  xx = 2; # ponto de interpolação
  px = avalia(xx, n, a) # valor calculado
  exato = log(xx) # valor exato da linguagem 
end

function p = avalia(xx, n, a)
  p = 0;
  for i = 1 : n
    p = p + (a(i) * (xx ^ (i - 1)));
  end  
end 