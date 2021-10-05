function difdivnewton
  x=[-3 -2 1 3];
  y=[-1 2 -1 10];
  n=length(x);
  a=zeros(n,n);
  for i=1:n
    a(i,1)=y(1,i);
  end
  xx=[2];
  pxx=New(x,y,n,a,xx)
  for i=1:n
    px=New(x,y,n,a,x(i))
  end
end

function p=New(x,y,n,a,xx)
  for j=2:n
    for i=j:n
      a(i,j)=(a(i,j-1)-a(i-1,j-1))/(x(i)-x(i-j+1));
    end
  end
  p=0;
  mul=1;
  for i=1:n
    for j=1:i-1
      mul=mul*(xx-x(j));
    end
    p=p+a(i,i)*mul;
    mul=1;
  end
end