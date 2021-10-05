clc
clear
#interpolação de lagrange 
function interpolacaolagrangeexemplo
x=[-3 -2 1 3];
y=[-1 2 1 10];
n=length(x);
xx=2;
px=Lag(x,y,n,xx)
exato=log(xx)
#grafico
x1=[x(1):0.01:x(n)];
n1=length(x1);
for k=1:n1
  p1(k)=Lag(x,y,n,x1(k));
endfor
plot(x,y,'*')
grid
hold on 
plot(x1,p1,'r')
hold on
plot(xx,px,'go')
endfunction
#
function p=Lag(x,y,n,xx)
p=0;
  for i=1:n
  num=1;
  den=1;
  for j=1:n
    if (j!=i)
      num=num*(xx-x(j));
      den=den*(x(i)-x(j));
    endif
  endfor
L=num/den;
p=p+y(i)*L;
endfor
endfunction