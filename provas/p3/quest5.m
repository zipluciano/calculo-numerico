%interpolação de lagrange 
function interpolacaolagrangeexemplo
x=[0 0.6 0.9];
y=log(x+1);
n=length(x);
xx=0.7;
px=Lag(x,y,n,xx)
exato=log(xx+1)
%grafico
x1=[x(1):0.01:x(n)];
n1=length(x1);
for k=1:n1
  p1(k)=Lag(x,y,n,x1(k));
end
plot(x,y,'*')
grid
hold on 
plot(x1,p1,'r')
hold on
plot(xx,px,'go')
erro=px-exato
end

%
function p=Lag(x,y,n,xx)
p=0;
  for i=1:n
  num=1;
  den=1;
  for j=1:n
    if (j~=i)
      num=num*(xx-x(j));
      den=den*(x(i)-x(j));
    end
  end
L=num/den;
p=p+y(i)*L;
end
end
