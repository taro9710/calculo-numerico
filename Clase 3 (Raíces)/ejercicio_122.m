function ejercicio_122()

  # Parámetros (en SI)
  A = 25800e-6;
  e = 85e-3;
  c_parametro = 170e-3;
  r = 142e-3;
  L = 7100e-3;
  E = 71e9;
  sigma_max = 120e6;

  # Función f(P) = sigma(P) - sigma_max
  f = @(P) (P/A)*(1 + (e*c_parametro/r^2)*sec((L/(2*r))*sqrt(P/(A*E)))) - sigma_max;

  # Parámetros del intervalo.
  a = 8e6;
  b = 100e6;
  fa = f(a)
  fb = f(b)
  # Verificación para que funcione el critero.
  if fa*fb > 0
      error("No hay cambio de signo, no puedo asegurar que haya una raiz.");
  endif
  # Defino el error, la tolerancia y el contador de iteraciones
  tol = 1e-6;
  err = Inf;
  n = 0;
 while err > tol
      c = b - fb * (b-a) / (fb - fa);
      fc = f(c);
      err = abs(fc);
      if fa*fc == 0
        break;
      elseif fa*fc < 0
        b  = c;
        fb = f(b);
      else
        a = c;
        fa = f(a);
      endif
      n = n + 1;
  endwhile
  # Resultado final
  fprintf("Metodo: Regula Falsi\n");
  fprintf("Metodo: Bisección\n");
  fprintf("Carga P = %.6f N\n", c);
  fprintf("Error = %.6e\n", err);
  fprintf("Iteraciones = %d\n", n);
  #}
endfunction
