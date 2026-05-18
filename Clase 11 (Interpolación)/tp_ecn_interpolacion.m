function tp_ecn_interpolacion()
	% Datos originales
	x = [2;3;4;5];
	y = [0.5;0.3333;0.25;0.2];

	%Evaluar en el punto 2.6
  disp("Inciso 1.a")
	display(['P(2.6) = ',num2str(lagrange(2.6,x,y))]);

	% Puntos a evaluar
	xe = [2 2.25 2.5 2.75 3 3.25 3.5 3.75 4 4.25 4.5 4.75 5];
  n = length(xe);

	% Vector resultado
	ye = zeros(size(xe));

	% Evaluación del polinomio
  disp("Evaluamos el polinomio en los puntos dados en el inciso 1.b");
	for k = 1:length(xe)
		ye(k) = lagrange(xe(k),x,y);
    disp(["P(",num2str(xe(k)),") = ",num2str(ye(k))]);
	end

	% Graficar curva interpolada
	plot(xe, ye, 'r', 'LineWidth', 2);
	hold on;
	% Graficar puntos originales
	plot(x, y, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
	xlabel('x');
	ylabel('P(x)');
	title('Interpolación de Lagrange');
	grid on;
	legend('Polinomio interpolante', 'Puntos dados');
end
