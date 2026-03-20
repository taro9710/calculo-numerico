function proyectil(t,tol)
#{
  La velocidad vertical de despegue v de un cohete próximo a la superficie
  terrestre se puede aproximarmediante v(t) = u*log(M0/(M0-mdot*t)) - g*t,
  Quiero conocer el tiempo t en el cuál se alcanza la velocidad del sonido. Para
  comstruyo una función f(t)= v(t) - v_sonido, donde f(t) tendrá una raíz cuando
  v(t) = v_sonido y utilizo el método de Newton-Raphson para resolverlo
  para las pruebas utilizaré un t inicial de 10s y una tolerancia de 0,000001
  #}
  # Seteo los parámetros iniciales.
  u = 2510;
  M0 = 2.8e6;
  mdot = 13.3e3;
  g = 9.81;
  v = 335;

  # Defino f(t)
  f = @(t) u*log(M0/(M0-mdot*t)) - g*t - v;
  # Defino df/dt
  df = @(t) (u*mdot)/(M0-mdot*t) - g;

  # Defino el error y el contador de iteraciones
  error = abs(f(t));
  n = 0;
  while error > tol
      t_new = t - f(t)/df(t); #Utilizo la funcón iteración de
      error = abs(f(t_new));
      t = t_new;
      n = n + 1;
  end

  % Resultado
  fprintf("Metodo: Newton-Raphson\n");
  fprintf("Tiempo t = %.6f s\n", t);
  fprintf("Error |f(t)| = %.6e\n", error);
  fprintf("Iteraciones = %d\n", n);
  endfunction
