#integração numérica 

#método de Newton - Cotês

#Substituição de uma função complicada ou dados tabelados por um poilinomio interpolador
#A integração é feita sobre o polinomio
#Neste caso, o polinomio que interpola f(X) o faz em pontos igualmente espaçados de [a,b]

                      #Regra do trapézio (area do trapezio)
#substitui a função por um polinomio de grau 1 e calcula a integral 

#Formula I = h/2 *(f(a)+f(b)) **onde h é o intervalo (b-a)**
          #(para uma divisão do intervalo, erro maior) 


                      #Regra do trapézio composta (vários trapézios)
#divide-se o intervalo (a,b) em varias partes e calcula-se o trapézio em cada uma 
# h = (b-a) / n **onde n é o numero de divisões do intervalo** 

#Formula do trapezio composto I= h/2 * (y1+[2*(soma[i=2 até n](yi))]+...+y(n+1)

#erro pode ser calculado, comparando o T de varios n, comparando o valor anterior com o proximo pode ser feita com ''while''

a=0;
b=1;  #limite de integração
n=4; #subintervalos
h=(b-a)/n;
x=[a:h:b];
y=x.^3;
soma=0;
for i=2:n
  soma=soma+y(i);
endfor
T=(h/2)*(y(1)+2*soma+y(n+1))