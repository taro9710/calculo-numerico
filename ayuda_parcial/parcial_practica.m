function parcial_practica()
	dfdt = @(t, y) t^2 * y;
	y0 = [1];
	t0 = 0;
	tf = 5;
	
	% Resolución de la ecuación diferencial
	% heun(df/dt, y0, t0, tf, h)
	disp("dt1");
	Ydt1 = heun(dfdt, y0, t0, tf, 1);
	display(Ydt1);
	disp("dt2");
	Ydt2 = heun(dfdt, y0, t0, tf, 0.5);
	display(Ydt2);
	
	disp("----------------------------error absoluto---------------------------------"); 
	ea = abs(Ydt1(end)-Ydt2(end))
	disp("----------------------------error relativo dt1-------------------------------"); 
	er =  abs(Ydt1(end)-Ydt1(end-1))/abs(Ydt1(end))

	% Aproximación mínimos cuadrádos
	% Con los datos de dt1
	disp("--------------------------------aprox-----------------------------"); 
	X = t0:1:tf;
	base = { 
		@(x) 1
		@(x) x
		@(x) x.^2
		};
	A = minimoscuadrados(X,Ydt1,base);
	% P evalua la aproximación en un punto
	P = @(x) funcionAproximacion(x,A,base);
	P5 = P(5);
	for i=1:length(A)
		display(["a",num2str(i-1)," = ", num2str(A(i))]);
	end
	display(P5);
end
