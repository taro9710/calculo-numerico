function P = lagrange(xeval,x,y)
	%{
	 LAGRANGE Evalúa el polinomio interpolante de Lagrange
	
	 Datos:
	 	- xeval es el punto donde se evalúa el polinomio
		- x es el vector columna con las abscisas
		- y es el vector columna con las ordenadas
	
	 Salida:
	 	- P valor del polinomio interpolante en xeval, es decir P(xeval)
	%}

	n = length(x);
	L = ones(n,1);
	for i=1:n
  		for k=1:n
    			if i!=k
    				L(i,1) = L(i,1)*(xeval - x(k))/(x(i) - x(k));
    			end
  		end
	end
	P = y'*L;
end
