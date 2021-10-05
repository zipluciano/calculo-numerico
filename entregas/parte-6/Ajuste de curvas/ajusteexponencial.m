#AJUSTE DE CURVAS 


#ajuste exponencial 
#y= a*e^b*x
# aplica-se ln em ambos os lados, e lineariza a função 

x=[0.2:0.1:0.8];
y=[3.16 2.38 1.75 1.34 1 0.74 0.56];
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
c=a\b' 
c(1)=exp(c(1));

for i=1:n
  g(i)=c(1)*exp(c(2)*x(i));
endfor
g;
plot(x,y,'o')
grid
hold on
plot(x,g,'r')