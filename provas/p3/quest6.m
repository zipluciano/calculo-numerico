clc
clear
format long
function rungekutta
  a=0;
  b=0.5;  %intervalo
  h=0.1;  %numero de pontos 
  x=[a:h:b];
  n=length(x);
  y(1)=1; %PVI 
  for i=1:n-1
    k1=h*fxy(x(i),y(i));
    k2=h*fxy(x(i)+h,y(i)+k1);
    y(i+1)=y(i)+(k1+k2)/2;  %equação de euler
  end
  y
  #ye=exp(((x.^3)/3)-x))    %solução exata
  ye=exp(((x.^3)/3)-x)
  d=abs(ye-y)
  ye
end
function f=fxy(x,y)
  f=y*x^2 - y;   %função EDO
end

