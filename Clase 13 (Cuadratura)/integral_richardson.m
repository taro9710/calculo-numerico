function I_richardson = integral_richardson(I1,I2,h1,h2,p)
	%{
		Mejora la aproximación de la integral usando Extrapolación de Richardson.
		Datos: 
			- I1 I2 son la aproximación de la integral de los respectivos pasos h1 y h2.				
			- p es el grado de la aproximación O(h^n). p=n
		Devuelve: 
			- Integral mejorada por la extraplación de Richardson.
	%}
	beta = (h1/h2)^p;  
    I_richardson = (beta * I2 - I1) / (beta - 1);
end
