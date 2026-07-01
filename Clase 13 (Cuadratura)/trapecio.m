function I = trapecio(Y,h)
	%{
		Datos:
			- Y el vector de los valores discretos de la función a integrar.
			- h el paso entre f(x_i) y f(x_i+1))
		Devuelve: 
			- I la aproximación de la intregral por el método del trapecio compuesto.

		Warning: El vector 'Y' debe tener al menos 2 elementos.
		No ingresar vectores vacíos o de longitud 1 para evitar errores de índice.
	%}
    I = (h/2) * (Y(1) + 2*sum(Y(2:end-1)) + Y(end));
end
