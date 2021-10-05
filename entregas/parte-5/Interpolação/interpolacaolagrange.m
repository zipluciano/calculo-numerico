#interpolação de lagrange 
function interpolacaolagrange
x=[-1 0 1];
y=[4 1 -1];
n=length(x);
xx=0.5;
px=Lag(x,y,n,xx)
#grafico
x1=[x(1):0.2:x(n)];
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