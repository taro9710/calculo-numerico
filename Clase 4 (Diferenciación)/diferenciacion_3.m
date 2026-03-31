function v_Rich = diferenciacion_3()
  %Punto 3, extrapolación de Richardson, usamos los datos anteriores
  %% Velocidades (de los puntos 1 y 2)
  v_dt1 = velocidad(.2);  % dt=0.2
  v_dt2 = velocidad(.1); % dt=0.1

  %% Tomamos los puntos de dt2 que coinciden con dt1
  v_dt2_coinc = v_dt2([1:2:11]);%t = 0,0.2,0.4,0.6,0.8,1]

  %% Extrapolación Richardson
  v_Rich = (4*v_dt2_coinc - v_dt1)/3;

  disp('Velocidades mejoradas con Richardson (O(dt^4))')
  disp(v_Rich)
endfunction
