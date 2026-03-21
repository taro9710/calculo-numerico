function ejercicio_123()
  #{
  En una acequia de ancho constante b con un obstáculo de altura H, en condición
  subcrı́tica, el caudal Q y el tirante h se relacionan mediante la ecuación de
  Bernoulli.
      Q^2/(2 g b^2 h0^2) + h0 = Q^2/(2 g b^2 h^2) + h + H
  Se desea determinar el tirante h sobre el obstáculo.Para ello, reescribo la
  ecuación construyendo la función:
      f(h) = lado_izquierdo - lado_derecho
      f(h) = Q^2/(2 g b^2 h0^2) + h0 - [Q^2/(2 g b^2 h^2) + h + H]
  De esta manera, la raíz de f(h) corresponde al valor de h buscado.
  En este ejercicio encuentro la raiz de esa función por el método Regula Falsi,
  en un intervalo inicial [a, b] = [1e5, 100e6], verificando previamente que se
  cumple el criterio del Teorema de Bolzano (cambio de signo en el intervalo),
  iterando hasta que se cumple |f(P)| < tol, con una tolerancia de 1e-6.

  Es importante notar que la función presenta una singularidad en h = 0,
  por lo que el intervalo inicial debe elegirse evitando valores cercanos
  a cero.
#}
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
