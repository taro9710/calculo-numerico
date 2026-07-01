function tp_cuadratura()
	C = 1e-5;
	t = 0:0.2:1.6;
	i = [0.2,0.3683,0.3819,0.2282,0.0486,0.0082,0.1441,0.4563,0.9819]*1e-3;

	% Puntos 1 y 2: Trapecios
	i_t04 = i(1:2:end);
	V_T04 = trapecio(i_t04, 0.4) /C;
	V_T02 = trapecio(i, 0.2) /C;
	fprintf('1. Voltaje Trapecios (h = 0.4s): %.3f V\n', V_T04);
	fprintf('2. Voltaje Trapecios (h = 0.2s): %.3f V\n\n', V_T02);

	% Punto 3: Richardson Trapecios
	V_R_Trap = integral_richardson(V_T04,V_T02,0.4,0.2,2);
	fprintf('3. Extrapolación de Richardson (Trapecios): %.3f V\n\n', V_R_Trap);

	% Puntos 4 y 5: Simpson 1/3
	V_S04 = simpson(i_t04, 0.4) /C;
	V_S02 = simpson(i, 0.2) /C;
	fprintf('4. Voltaje Simpson 1/3 (h = 0.4s): %.3f V\n', V_S04);
	fprintf('5. Voltaje Simpson 1/3 (h = 0.2s): %.3f V\n\n', V_S02);

	% Punto 7: Richardson Simpson
	V_R_Simp =	integral_richardson(V_S04,V_S02,0.4,0.2,4);
	fprintf('7. Extrapolación de Richardson (Simpson 1/3): %.5f V\n\n', V_R_Simp);

	% Punto 8: Cuadratura de Gauss
	f_erf = @(x) exp(-x.^2);
	erf_aprox = (2 / sqrt(pi)) * gauss2(f_erf, 0, 1.5);
	fprintf('8. Cuadratura de Gauss (2 puntos) para erf(1.5):\n');
	fprintf('   - Valor Aproximado: %.6f\n', erf_aprox);
	fprintf('   - Valor Real:       0.966105\n');
	fprintf('   - Error Absoluto:   %.6f\n', abs(0.966105 - erf_aprox));
end
