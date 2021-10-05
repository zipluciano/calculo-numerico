#EDO 
#a ordem da EDO é o maior grau da derivada presente 


#metodo de euler 

function metododeeuler
  a=0;
  b=0.5;  #intervalo
  h=0.01;  #numero de pontos 
  x=[a:h:b];
  n=length(x);
  y(1)=-1; #PVI 
  for i=1:n-1
    y(i+1)=y(i)+h*fxy(x(i),y(i));  #equação de euler
  end
  y
  ye=-3*exp(-x)-2*x+2;    #solução exata
  d=abs(ye-y);
  plot(x,y)
  grid
  hold on
  plot(x,ye,'r')  
end
function f=fxy(x,y)
  f=-2*x-y;   #função EDO
end