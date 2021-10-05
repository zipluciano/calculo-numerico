#                   ajuste de curvas 

#               m�todo dos minimos quarados 

#utilizando os pontos tabelados, faz-se uma combina��o linear com Xi e Yi para a determina��o dos coeficientes da curva, 
#a curva n�o ir� passar pelos pontos, mas sera o minimo valor de erro da cruva calculada a cada ponto 

x=[1.3 3.4 5.1 6.8 8]; #dados tabelados 
y=[2 5.2 3.8 6.1 5.8];

n=length(x); #numero de pontos 
M=1; #grau do ajuste (1- reta; 2- parabola; .....) quanto maior o grau do ajuste, pior � o numero de condicionamento 
#para a determina��o do grau do polinomio, utiliza-se o calculo da variancia

for i=1:M+1
  for j=1:M+1
    a(i,j)=0;
    for k=1:n
      a(i,j)=a(i,j)+x(k)^(j+i-2);
    endfor
  endfor
  b(i)=0;
  for k=1:n
    b(i)=b(i)+y(k)*x(k)^(i-1);
  endfor
endfor
a 
b
D=det(a)
NC=cond(a)
c=a\b' #pode-se chamar a fun��o elimina��o gaussiana 

##### plot do gr�fico 

#para melhorar a qualidade do gr�fico, adicionam-se mais pontos, deixar mais suave

for i=1:n
  g(i)=0;
  for j=1:M+1
    g(i)=g(i)+c(j)*x(i)^(j-1);
  endfor
endfor
g
plot (x,y,'o')
grid
hold on
plot(x,g,'r')