function ecn_tp_edo_orden_superior()
	% Definimos los parámetros de la ecuación
	k = 5; % N/m
	m = 2; % kg
	dt = 0.01; %segundos
	t = 0:dt:10; % ti = 0s; tf = 10s; dt = 0.01s
	n = length(t);

	% Sea f la función
	f = @(t,Z) [Z(2); (-k/m)*Z(1)];


	% Definimos los valores iniciales del problema
	Z = zeros(2,n);
	Z(1,1) = 2; % X(t = 0) = 2m
	Z(2,1) = 0; % X'(t = 0)= 0 m/s^2
	
	% Rungekutta de orden 2
	rk2(f,t,dt,n,Z);
	% Rungekutta de orden 4
	rk4(f,t,dt,n,Z);
endfunction
