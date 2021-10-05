# interpolação antes de lagrange 
function interpolacaoexemplo
x=[2:0.05:2.15];
y=log(x)
n=length(x);
grau=n-1;
for i=1:n
  for j=1:n
    V(i,j)=x(i)^(j-1); 
  endfor
endfor
det(V)
cond(V)
a=V\y';
#avaliação de qualquer pontoo dentro da interpolação 
xx=[2.14];
px=avalia(xx,n,a);
exato=log(xx);

x1=[x(1):0.05:x(n)];
n1=length(x1);
for j=1:n1
  p(j)=avalia(x1(j),n,a);
endfor
p
plot(x,y,'*')
grid
hold on 
plot(xx,p,'r')
hold on
plot(xx,px,'go')
endfunction
function p=avalia(x1,n,a)
p=0;
for i=1:n
  p=p+a(i)*x1^(i-1);
endfor
endfunction