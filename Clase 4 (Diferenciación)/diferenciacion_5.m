function diferenciacion_5()
  %% Punto 5: Aceleración dt = 0.1
  %% Paso de tiempo
  dt = 0.1;
  t = 0:dt:1;
  y = posicion(t);
  n = length(t);
  a = zeros(1,n);
  % Primer punto (progresiva)
  a(1) = (y(3) - 2*y(2) + y(1)) / dt^2;
  % Puntos intermedios (centrada)
  for i = 2:n-1
      a(i) = (y(i+1) - 2*y(i) + y(i-1)) / dt^2;
  end
  % Último punto (regresiva)
  a(n) = (y(n) - 2*y(n-1) + y(n-2)) / dt^2;

  disp('Aceleraciones aproximadas dt=0.1:');
  disp(a);
endfunction
