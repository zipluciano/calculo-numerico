# interpolação

#uma função que passe por todo os pontos 

# 1 - função pode vir de experimentos (tabela de pontos)
# 2 - possui uma expressão conhecida mas impossivel de ser utilizada 

#funções faceis de se trabalhar (polinomiais, racionais e trigonométricas)


# interpolação polinomial 

#obter um polinomio interpolador Pn(x) tal que Pn(Xi)=Yi. 0<i<n


# teorema da existencia e unicidade do polinomio interpolador 
function interpolacao
x=[-1 0 1];
y=[4; 1; -1];
n=length(x);
grau=n-1;
for i=1:n
  for j=1:n
    V(i,j)=x(i)^(j-1); 
    
  endfor
endfor
a=V\y
#avaliação de qualquer pontoo dentro da interpolação 
xx=0.5;
px=avalia(xx,n,a);
x1=[x(1):0.2:x(n)];
n1=length(x1);
for j=1:n1
  p(j)=avalia(x1(j),n,a);
endfor
plot(x,y,'*')
grid
hold on 
plot(x1,p,'r')
hold on
plot(xx,px,'go')
endfunction
function p=avalia(x1,n,a)
p=0;
for i=1:n
  p=p+a(i)*x1^(i-1);
endfor
endfunction