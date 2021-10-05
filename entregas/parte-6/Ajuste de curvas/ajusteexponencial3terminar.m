#AJUSTE DE CURVAS 

#          TERMINAR 


#ajuste logaritmico
#y= a*ln(x)+b
# aplica-se ln em ambos os lados, e lineariza a função 

x=[1 3 4 6]; #ln(x)
y=[2.5 13 22 36];
z=log(y); #ln(y)
n=length(x);
M=1; #sempre 1 caso exponencial 

for i=1:M+1
  for j=1:M+1
    a(i,j)=0;
    for k=1:n
      a(i,j)=a(i,j)+x(k)^(j+i-2);
    endfor
  endfor
  b(i)=0;
  for k=1:n
    b(i)=b(i)+z(k)*x(k)^(i-1);
  endfor
end
a
b
D=det(a)
NC=cond(a)
c=a\b';
c=exp(c)

for i=1:n
  g(i)=c(1)+c(2)*x(i); #############
endfor
g;
plot(x,y,'o')
grid
hold on
plot(x,g,'r')