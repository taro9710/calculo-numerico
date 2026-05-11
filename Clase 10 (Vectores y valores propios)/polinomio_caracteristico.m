function polinomio_caracteristico(A)
  %{
    POLINOMIO CARACTERISTICO
    Entrada:
      - A: matriz cuadrada
    Salida:
      - Muestra coeficientes del polinomio característico
      - Muestra valores propios
  %}
  disp('POLINOMIO CARACTERISTICO')
  [n,m] = size(A);
  if n ~= m
    error('La matriz debe ser cuadrada')
  end
  % Coeficientes del polinomio característico
  coef = poly(A);
  disp('Coeficientes del polinomio característico:')
  disp(coef)
  % Valores propios
  lambda = roots(coef);
  disp('Valores propios:')
  disp(lambda)
end
