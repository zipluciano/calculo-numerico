function Interpola
  clc
  clear
  format long  
  #x = [-1 0 1];
  #y = [4; 1; -1];
  x = [2 : 0.05 : 2.15];
  y = log(x)
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
  xx = 2.14; # ponto de interpolação
  px = avalia(xx, n, a) # valor calculado
  exato = log(xx) # valor exato da linguagem
  # --- somente para o gráfico ---
  x1 = [x(1) : 0.05 : x(n)]; # mesmo espaçamento do x
  n1 = length(x1);
  for j = 1 : n1
    p(j) = avalia(x1(j), n, a);
  end
  # ------
  p
  plot(x, y, '*') 
  grid
  hold on
  plot(x1, p, 'r')
  hold on
  plot(xx, px, 'go')
end

function p = avalia(xx, n, a)
  p = 0;
  for i = 1 : n
    p = p + (a(i) * (xx ^ (i - 1)));
  end  
end 