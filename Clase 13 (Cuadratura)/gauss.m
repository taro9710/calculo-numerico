function I = gauss(f,a,b,xg,wg)
	%{
	Cuadratura de Gauss genérico.
	Datos:
            - f  : Función anónima a integrar (ej: @(x) exp(-x.^2)).
            - a  : Límite inferior del intervalo de integración original.
            - b  : Límite superior del intervalo de integración original.
            - xg : Vector con los nodos (raíces de Legendre) en el intervalo [-1, 1].
            - wg : Vector con los pesos asociados a cada nodo.

        Devuelve:
            - I  : Aproximación numérica de la integral definida de f(x) en [a,b].
    %}
    xm = (a+b)/2;
    xr = (b-a)/2;
    I = 0;
    for k = 1:length(xg)
        x = xm + xr*xg(k);
        I = I + wg(k)*f(x);
    end
    I = xr*I;
end
