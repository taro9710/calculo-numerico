function [lambda1,v1] = metodo_potencias(A,x,tol,max1)
	%{
	Datos:
		- A es una matriz de orden nxn
		- x es el vector inicial de orden nx1
		- tol es la tolerancia
		- max1 es el número máximo de iteraciones

	Resultados:
		- lambda1 es el autovalor dominante
		- v1 es el autovector dominante
	%}

	% Inicialización de parámetros
	iter = 0;
	err = inf;
	% Seteamos los valores iniciales
	x = x/norm(x,2); % Normalizamos el vector inicial
	lambda_old = 0;	% Valor inicial del autovalor aproximado

	while ((err > tol) && (iter < max1))
		y = A*x; % Multiplicación principal del método de la potencia
		x = y/norm(y,2); % Normalizamos el nuevo vector
		lambda = x'*A*x; % Aproximación del autovalor
		err = abs(lambda - lambda_old);	% Error
		lambda_old = lambda;
		iter++;
	end
	% Resultados finales
	lambda1 = lambda;
	v1 = x;
end
