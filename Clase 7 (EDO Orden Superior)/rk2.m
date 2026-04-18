function rk2(f,t,dt,n,Z)
	% En esta función realizaremos el método de RungeKutta de Orden 2
	% Método de Heun
	for i = 1 : n-1
		k1 = f(t(i),Z(:,i));
		k2 = f(t(i) + dt, Z(:,i) + dt*k1);
		% Actualización	
		FI = 0.5*(k1+ k2);
		Z(:,i+1) = Z(:,i) + dt * FI;
	endfor
	% Graficas	
	figure;
	plot(t,Z(1,:));
	title('t vs x (RK2 Heun)')
	xlabel('t'); ylabel('x');

	figure;
	plot(Z(1,:), Z(2,:));
	title('x vs v (RK2 Huen)');
	xlabel('x'); ylabel('v');
endfunction	
