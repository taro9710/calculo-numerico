function A = minimoscuadrados(X,Y,base)
	%{
		Datos:
				- X: es el vector de orden 1xn de las abscisas.
				- Y: es el vector de orden 1xn de las ordenadas.
				- base: es la base de funciones para los mínimos cuadrádos.
						Ejemplo: una base que sea {1;x;x²} 
						base = {
  								@(x) 1
    							@(x) sin(x)
    							@(x) exp(x)
								};

		Devuelve: 
				- A es el vector de coeficientes del polinomio de la aproximación.
	%}

	X = X(:);
	Y = Y(:);

    n = length(X);
    m = length(base);

    Phi = zeros(n,m);

    for j = 1:m
        Phi(:,j) = base{j}(X);
    end
	% (Φ'Φ)A=Φ'Y
    A = (Phi'*Phi)\(Phi'*Y);
end		
