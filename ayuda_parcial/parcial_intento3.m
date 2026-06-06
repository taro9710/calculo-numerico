function parcial_intento3()
	%{
		La ecuación es:
			m*cp*dT/dt =P(t)−hA(T(t)−Ta)
			entonces 
			dT/dt = [P(t) - hA(T(t)-Ta)]/(m*cp)
			con
			P(t) = 2+1,5 cos(π t/300)
	%}
	m = 0.01; %kg
	cp = 700; %J/Kg K
	hA = 0.5;
	Tamb = 25;
	dTdt = @(t, T) (2 + 1.5*cos(pi*t/300) - hA*(T - Tamb))./(m*cp);
	
	y0 = [Tamb];
	t0 = 0;
	tf = 1200;
	
	% Resolución de la ecuación diferencial
	% heun(df/dt, y0, t0, tf, h)
	dt = 1;
	Y = heun(dTdt, y0, t0, tf, dt);
	display("T(final):");
	display(Y(end));
	disp("--------------------------------aprox-----------------------------"); 
	X = t0:dt:tf;
	base = { 
		@(x) ones(size(x))
		@(x) x
		@(x) x.^2
		};
	A = minimoscuadrados(X,Y,base);
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
