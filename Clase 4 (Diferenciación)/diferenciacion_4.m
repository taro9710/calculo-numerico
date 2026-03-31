function diferenciacion_4()
  %% Tiempos
  t_dt1 = 0:0.2:1;  % dt = 0.2
  t_dt2 = 0:0.1:1;   % dt = 0.1
  t_Rich = t_dt1;    % Richardson coincide con dt1
  v_dt1 = velocidad(.2);
  v_dt2 = velocidad(.1);
  v_Rich = diferenciacion_3();
  %% Graficar usando subplot
  figure;
  %Gráfica 1
  subplot(3,1,1)
  plot(t_dt1, v_dt1, '-o', 'LineWidth', 2)
  title('Velocidad dt = 0.2')
  xlabel('Tiempo (s)')
  ylabel('Velocidad (m/s)')
  grid on
  %Gráfica 2
  subplot(3,1,2)
  plot(t_dt2, v_dt2, '-o', 'LineWidth', 2)
  title('Velocidad dt = 0.1')
  xlabel('Tiempo (s)')
  ylabel('Velocidad (m/s)')
  grid on
  %Gráfica 3
  subplot(3,1,3)
  plot(t_Rich, v_Rich, '-o', 'LineWidth', 2)
  title('Velocidad con Richardson (O(dt^4))')
  xlabel('Tiempo (s)')
  ylabel('Velocidad (m/s)')
  grid on
endfunction
