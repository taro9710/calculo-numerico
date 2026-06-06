function parcial_intento2()
	%{
		La ecuación es:
			dV/dt = [Vs - V(t)]/(R(t)*C)
		con 
			R(t) = R0 + A sin(w*t)
	%}
	Vs = 5;      % Voltaje de la fuente
	C  = 1;      % Capacidad

	R0 = 2;      % Resistencia media
	B  = 0.5;    % Amplitud
	w  = 0.1;    % Frecuencia angular
	V0 = 0;

	R = @(t) R0 + B*sin(w*t);

	dVdt = @(t,V) (Vs - V) ./ (C*R(t));
	
	y0 = [V0];
	t0 = 0;
	tf = 20;
	
	% Resolución de la ecuación diferencial
	% heun(df/dt, y0, t0, tf, h)
	dt1 = 1;
	Ydt1 = heun(dVdt, y0, t0, tf, dt1);
	display("T(final):");
	display(Ydt1(end));

	disp("--------------------------------aprox-----------------------------"); 
	X = t0:dt1:tf;
	base = { 
		@(x) ones(size(x))
		@(x) x
		@(x) x.^2
		};
	A = minimoscuadrados(X,Ydt1,base);
	% P evalua la aproximación en un punto
	P = @(x) funcionAproximacion(x,A,base);
	P5 = P(5);
	for i=1:length(A)
		display(["a",num2str(i-1),":"]);
		display(A(i));
		disp("-----------------------------")
	end
	display(P5);
end
