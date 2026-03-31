function [dy1,dy2]=ejder()
  f= @(x) -0.1*x.^4 - 0.15*x.^3 - 0.5*x.^2 - 0.25*x.^1 +1.2;
  %Elijo un intervalo sobre el que quiero calcular la derivada
  %para acotar y poder aplicar los distintos métodos.
  %en caso de quiera calcular la derivada para un solo punto,
  %según el orden de derivada que use me voy hacia atrás y/o hacia adelante
  %la cantidad de puntos que necesite

  %En este ejemplo vamos a calcular la derivada para dos pasos distintos dx1=0.5
  %y dx2=0.25. Como el paso dx2 es más chico, generamos más puntos para evaluar
  %la función por lo que determinaremos los puntos x en base a este. Tomamos x0=0 y
  %xf=1
  x0=0;
  xf=1;
  dx1=0.5;
  dx2=0.25;
  x=x0:dx2:xf %determino un vector horizontal que contiene los puntos x
  y=f(x) %calculo la función para cada punto x.
  n=length(x); %calculo cuantos puntos x hay
  dy1=zeros(1,n);
  dy2=zeros(1,n);%creo dos vectores de ceros de igual longitud para poder aplicar
                 %las formulas usando un "for" de manera más sencilla.


  %---Derivada para dx1=0.5---%
  %El paso dx1=0.5 generaría los puntos x=[0,0.5,1] pero en nuestro vector derivada lo veremos como
  %dy1=[dy,0,dy,0,dy] (por eso creamos el vector todo ceros); ya que generamos x=[0,0.25,0.5,0.75,1];

  dy1(1,1)=(-y(1,5)+4*y(1,3)-3*y(1,1))/(2*dx1); %esquema O(h^2) hacia adelante. C
  dy1(1,end)=(y(1,end-4)-4*y(1,end-2)+3*y(1,end))/(2*dx1);%esquema O(h^2) hacia atras.
  for i=3:2:n-1
    dy1(1,i) = (y(1,i+2)-y(1,i-2))/(2*dx1); %esquema O(h^2) centrado
  endfor

  %---Derivada para dx1=0.25---%
  dy2(1,1)=(-y(1,3)+4*y(1,2)-3*y(1,1))/(2*dx2); %esquema O(h^2) hacia adelante
  dy2(1,end)=(y(1,end-2)-4*y(1,end-1)+3*y(1,end))/(2*dx2);%esquema O(h^2) hacia atras
  for i=2:1:n-1
    dy2(1,i) = (y(1,i+1)-y(1,i-1))/(2*dx2);%esquema O(h^2) centrado
  endfor
plot(x(1,1:2:end),dy1(1,1:2:end),'r'); %solo tomo los valores correspondiente a dx1
hold on %para varias curvas en una misma gráfica
plot(x(1,:),dy2(1,:),'b');
hold off
endfunction

