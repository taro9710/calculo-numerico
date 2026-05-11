function [lambda,v,iter] = metodo_potencia_inversa(A,x,tol,maxiter)
  %{
   Metodo de la potencia inversa
   Entradas:
		- A es una matriz de orden nxn
		- x es el vector inicial de orden nx1
		- tol es la tolerancia
		- maxiter es el número máximo de iteraciones
	Resultados:
		- lambda es el autovalor minimo
		- v es el autovector fundamental
  %}

  % Inicialización de parámetros
  x = x/norm(x); % Normalizamos el vector inicial
  err = inf;
  iter = 0;
  while err > tol && iter < maxiter
    y = A\x; % Multiplicar por la inversa es equivalente a resolver A*y = x
    alpha = max(abs(y));  % Aproximacion del autovalor
    x_new = y/alpha; % Normalizacion
    % Error
    err = norm(x_new - x);
    % Actualizar
    x = x_new;
    iter++;
  end
  lambda = 1/alpha;
  v = x/norm(x,2);
end
