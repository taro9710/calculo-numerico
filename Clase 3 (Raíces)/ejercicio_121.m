function ejercicio_121()
  #{
  Sea un cable de longitud s extendido entre dos extremos separados a una
  distancia L. La longitud s y la deflexión transversal h se pueden describir
  mediante las siguientes ecuaciones donde λ es la relación entre la densidad
  lineal y la tensión en los extremos.
      h(λ) = (1/λ) * (cosh(λL/2) - 1)
  Se desea determinar el valor de λ tal que la deflexión sea h = 15 m. Para ello,
  construyo una función:
      f(λ) = (1/λ)*(cosh(λL/2) - 1) - h
  De esta manera, la raíz de f(λ) corresponde al valor de λ buscado.Para
  encontrar dicha raíz utilizo el método de bisección, partiendo de un
  intervalo inicial [a, b] = [0.001, 0.02], verificando previamente que se
  cumple el criterio del Teorema de Bolzano (cambio de signo en el intervalo).
  El algoritmo itera dividiendo el intervalo a la mitad y seleccionando el
  subintervalo donde ocurre el cambio de signo, hasta que se cumple
  |f(λ)| < tol, con una tolerancia de 1e-6.

  Una vez obtenido λ, se calcula la longitud del cable mediante:
      s = (2/λ)*sinh(λL/2)
  #}
  # Seteo los parámetros del problema
  L = 160;
  h = 15;
  # Seteo la función f(lambda) = h(lambda) - 15m
  f = @(lambda) (1./lambda).*(cosh(lambda*L/2) - 1) - h;
  # seteo los parámetros iniciales
  a = 0.001;
  b = 0.02;
  fa = f(a);
  fb = f(b);
  tol = 1e-6;
  # Verificación
  if fa*fb > 0
      error("No hay cambio de signo, no se cumple el crnio del Teorema de Bolzano");
  endif
# Defino el error y el contador de iteraciones
  err = Inf;
  n = 0;

  while err > tol
    c = (a + b)/2;
    fc = f(c);
    err = abs(fc);
    if fa*fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    endif
    n = n + 1;
  endwhile
  c = (a + b)/2;
  #Calcular s
  s = (2/c)*sinh(c*L/2);
  # Resultado final
  fprintf("Metodo: Bisección\n");
  fprintf("lambda = %.6f\n", c);
  fprintf("Longitud s = %.6f m\n", s);
  fprintf("Error = %.6e\n", err);
  fprintf("Iteraciones = %d\n", n);
endfunction
