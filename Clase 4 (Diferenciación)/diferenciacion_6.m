function diferenciacion_6()
  %% Punto 6: Derivada centrada O(dt^4) en t = 0.6
  %% Paso de tiempo
  dt = 0.1;
  t = 0:dt:1;
  y = posicion(t);
  v_Rich = diferenciacion_3();
  %% Índice correspondiente a t = 0.6
  i = find(abs(t-0.6) < 1e-10);  % i = 7
  %% Derivada centrada O(dt^4)
  v_O4 = (-y(i+2) + 8*y(i+1) - 8*y(i-1) + y(i-2)) / (12*dt);
  disp(['Velocidad en t=0.6 con derivada centrada O(dt^4): ', num2str(v_O4)])
  % Supongamos que v_Rich corresponde a t = [0 0.2 0.4 0.6 0.8 1]
  % Interpolamos para t = 0.6
  disp(['Velocidad en t=0.6 con Richardson: ', num2str(v_Rich(4))])
endfunction
