x=[1 2 3 4 5 6 7 8];

y=[0.5 0.6 0.9 0.8 1.2 1.5 1.7 2.0];

n=length(x); %numero de pontos 
M=1; %grau do ajuste (1- reta; 2- parabola; .....) quanto maior o grau do ajuste, pior é o numero de condicionamento 
%para a determinação do grau do polinomio, utiliza-se o calculo da variancia

for i=1:M+1
  for j=1:M+1
    a(i,j)=0;
    for k=1:n
      a(i,j)=a(i,j)+x(k)^(j+i-2);
    end
    end
  b(i)=0;
  for k=1:n
    b(i)=b(i)+y(k)*x(k)^(i-1);
  end
end
a 
b
D=det(a)
NC=cond(a)
c=a\b'