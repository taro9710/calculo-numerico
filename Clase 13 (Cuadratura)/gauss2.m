function I = gauss2(f, a, b)
    %{
        Fórmula de Cuadratura de Gauss-Legendre de 2 puntos.
        Datos:
            - f : Función anónima a integrar.
            - a : Límite inferior de integración.
            - b : Límite superior de integración.
        Devuelve:
            - I : Aproximación de la integral en el intervalo [a, b].
    %}

    % Definición fija de Nodos y Pesos para la regla de 2 puntos
    nodos = [-1/sqrt(3), 1/sqrt(3)];
    pesos = [1, 1];

    I = gauss(f, a, b, nodos, pesos);
end
