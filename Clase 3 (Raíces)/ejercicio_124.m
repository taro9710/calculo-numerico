function ejercicio_124()
#{
  La velocidad vertical de despegue v de un cohete próximo a la superficie
  terrestre se puede aproximarmediante
      v(t) = u*log(M0/(M0-mdot*t)) - g*t,
  Quiero conocer el tiempo t en el cuál se alcanza la velocidad del sonido. Para
  comstruyo una función:
      f(t)= v(t) - v_sonido
      f(t) = u * ln(M0 / (M0 - ṁ t)) - g t - v_sonido
  En este ejercicio encuentro la raiz de esa función por el método de
  Newton-Raphson para resolverlo  para las pruebas utilizaré un t inicial de
  10s e iterando hasta que se cumple |f(P)| < tol, con una tolerancia de
  1e-6.
  #}
  # Seteo los parámetros iniciales.
  u = 2510;
  M0 = 2.8e6;
  mdot = 13.3e3;
  g = 9.81;
  v_sonido = 335;

  # Defino f(t)
  f = @(t) u*log(M0/(M0-mdot*t)) - g*t - v_sonido;
  # Defino df/dt
  df = @(t) (u*mdot)/(M0-mdot*t) - g;

  # Defino el valor de t con el que comienzo, la tolerancia, el error y el
  # contador de iteraciones
  t = 10;
  tol = 1e-6;
  error = abs(f(t));
  n = 0;
  while error > tol
      t_new = t - f(t)/df(t); #Utilizo la funcón iteración de
      error = abs(f(t_new));
      t = t_new;
      n = n + 1;
  end

  #Resultado
  fprintf("Metodo: Newton-Raphson\n");
  fprintf("Tiempo t = %.6f s\n", t);
  fprintf("Error |f(t)| = %.6e\n", error);
  fprintf("Iteraciones = %d\n", n);
endfunction
