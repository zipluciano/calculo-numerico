#m�todo de Runge-Kutta
    k3=h*fxy(x(i)+(h/2),y(i)+(k2/2));
    k4=h*fxy(x(i)+h,y(i)+k3);