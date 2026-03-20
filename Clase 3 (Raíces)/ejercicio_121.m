function ejercicio_121()

  # Seteo los parámetros del problema
  L = 160;
  h = 15;
  # Seteo la función f(lambda) = h(lambda) - 15m
  f = @(lambda) (1./lambda).*(cosh(lambda*L/2) - 1) - h;
  # seteo los parámetros iniciales
  a = 0.001;
  b = 0.02;
  tol = 0.000001;
  # Verificación
  if f(a)*f(b) > 0
      error("No hay cambio de signo, no se cumple el crnio del Teorema de Bolzano");
  endif
# Defino el error y el contador de iteraciones
  err = 999;
  n = 0;

  while err > tol
      c = (a + b)/2;
      fc = f(c);
      err = abs(fc);
      if f(a)*fc < 0
          b = c;
      else
          a = c;
      endif
      n = n + 1;
  endwhile
  #Calcular s
  s = (2/c)*sinh(c*L/2);
  # Resultados
  fprintf("Metodo: Biseccion\n");
  fprintf("lambda = %.6f\n", c);
  fprintf("Longitud s = %.6f m\n", s);
  fprintf("Error = %.6e\n", err);
  fprintf("Iteraciones = %d\n", n);

endfunction
