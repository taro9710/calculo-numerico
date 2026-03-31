function v = velocidad(dt)
  %velocidad esquema orden 2
  t = 0:dt:1;% vector de tiempo
  n = length(t); %puntos
  v = zeros(1,n);%inicio vector de velocidades
  y = posicion(t);
  % Diferencia progresiva en el primer punto porque no hay puntos anteriores
  v(1) = (-3*y(1) + 4*y(2) - y(3)) / (2*dt);
  % Diferencias centradas en los puntos intermedios
  for i = 2:n-1
    v(i) = (y(i+1) - y(i-1)) / (2*dt);
  end
  % Diferencia regresiva en el último punto
  v(n) = (3*y(n) - 4*y(n-1) + y(n-2)) / (2*dt);
endfunction
