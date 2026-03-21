function ejercicio_125()
  # Parámetros
  gamma = 5/3;
  eta_objetivo = 0.3;

  # Función y valores iniciales
  f = @(x) ( log(x) - (1 - 1./x) ) ./ ( log(x) + (gamma - 1)*(1 - 1./x) ) - eta_objetivo;
  x0 = 1.5;
  x1 = 3;
  # Inicializo el error y el contador de iteraciones y la tolerancia
  err = Inf;
  n = 0;
  tol = 1e-6;

  while err > tol
      f0 = f(x0);
      f1 = f(x1);
      x2 = x1 - f1*(x1 - x0)/(f1 - f0);       # Fórmula de la secante
      err = abs(f(x2));
      x0 = x1;
      x1 = x2;
      n = n + 1;
  endwhile
  # Resultado
  fprintf("Metodo: Secante\n");
  fprintf("T2/T1 = %.6f\n", x2);
  fprintf("Error = %.6e\n", err);
  fprintf("Iteraciones = %d\n", n);
endfunction
