function ejercicio_123()
  # Parámetros
  Q = 1.2;
  g = 9.81;
  b_canal = 1.8;
  h0 = 0.6;
  H = 0.075;

  # Función
  f = @(h) (Q^2)/(2*g*b_canal^2*h0^2) + h0 - ( (Q^2)./(2*g*b_canal^2*h.^2) + h + H );
  # Parámetros de la primera recta.
  a = 0.1;
  b = 0.3;
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
  fprintf("h = %.6f m\n", c);
  fprintf("Error = %.6e\n", err);
  fprintf("Iteraciones = %d\n", n);
endfunction
