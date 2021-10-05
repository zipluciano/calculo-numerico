#diferenças divididas 

#mesmo polinomio interpolador encontrado antes 
      # Regra de formação 
      #F[x1]=f[x1]                                      1 ordem = a0
      #F[x1,x2]=( F[x1] - F[x2] ) / x2-x1               2 ordem = a1
      #F[x1,x2,x3]= ( F[x2,x3] - F[x1,x2] ) / x3-x1     3 ordem = a2 

      # Contrução do polinomio 
      #P2(x) = F[x1] + F[x1,x2]*(x-x1) + F[x1,x2,x3]*(x-x1)*(x-x2)
x=[-1 0 1];
y=[4 1 -1];
n=length(x);
p=0;
a=0;
for j=2:n
  for i=j:n
    a(i,j)=(a(i,j-1)-a(i-1,j-1)) / (x(i)-x(i-j+1));
  endfor
endfor
x
y