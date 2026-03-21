function ejercicio_125()
  #{
  Un motor térmico es una máquina térmica que transforma calor en trabajo
  mecánico por medio del aprovechamiento del gradiente de temperatura entre una
  fuente de calor (foco caliente) y un sumidero de calor (foco frı́o). El ciclo
  termodinámico se puede modelar asumiendo que el gas es monoatómico y el
  proceso es reversible, como se presenta en la figura. La eficiencia del ciclo
  en este caso es:
      η(x) = [ln(x) - (1 - 1/x)] / [ln(x) + (γ - 1)(1 - 1/x)]
  donde x = T2/T1 es el cociente de temperaturas y γ es la relación
  de capacidades caloríficas del gas.
  Se desea determinar el valor de x = T2/T1 tal que la eficiencia sea
  η = 0.3.Para ello, construyo una función:
      f(x) = η(x) - η_objetivo
      f(x) = [ln(x) - (1 - 1/x)] / [ln(x) + (γ - 1)(1 - 1/x)] - 0.3
  De esta manera, la raíz de f(x) corresponde al valor del cociente
  de temperaturas buscado.
  En este ejercicio encuentro la raiz de esa función por el método de la secante,
  partiendo de dos valores iniciales x0 = 1.5 y x1 = 3, iterando hasta que se
  cumple |f(x)| < tol, con una tolerancia de 1e-6.
  #}
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
