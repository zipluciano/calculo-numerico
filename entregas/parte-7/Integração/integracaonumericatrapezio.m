#integra��o num�rica 

#m�todo de Newton - Cot�s

#Substitui��o de uma fun��o complicada ou dados tabelados por um poilinomio interpolador
#A integra��o � feita sobre o polinomio
#Neste caso, o polinomio que interpola f(X) o faz em pontos igualmente espa�ados de [a,b]

                      #Regra do trap�zio (area do trapezio)
#substitui a fun��o por um polinomio de grau 1 e calcula a integral 

#Formula I = h/2 *(f(a)+f(b)) **onde h � o intervalo (b-a)**
          #(para uma divis�o do intervalo, erro maior) 


                      #Regra do trap�zio composta (v�rios trap�zios)
#divide-se o intervalo (a,b) em varias partes e calcula-se o trap�zio em cada uma 
# h = (b-a) / n **onde n � o numero de divis�es do intervalo** 

#Formula do trapezio composto I= h/2 * (y1+[2*(soma[i=2 at� n](yi))]+...+y(n+1)

#erro pode ser calculado, comparando o T de varios n, comparando o valor anterior com o proximo pode ser feita com ''while''

a=0;
b=1;  #limite de integra��o
n=4; #subintervalos
h=(b-a)/n;
x=[a:h:b];
y=x.^3;
soma=0;
for i=2:n
  soma=soma+y(i);
endfor
T=(h/2)*(y(1)+2*soma+y(n+1))