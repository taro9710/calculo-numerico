function rk4(f,t,dt,n,Z)
	% En esta función realizaremos el método de RungeKutta de Orden 4
	for i = 1 : n-1
		k1 = f(t(i),Z(:,i));
		k2 = f(t(i) + 0.5*dt, Z(:,i) + 0.5*dt*k1);
		k3 = f(t(i) + 0.5*dt, Z(:,i) + 0.5*dt*k2);
		k4 = f(t(i) + dt ,Z(:,i) + dt*k3);
		% Actualización	
		FI = (1/6) * (k1+ 2*k2+2*k3+k4);
		Z(:,i+1) = Z(:,i) + dt * FI;
	endfor
	% Graficas
	figure;
	plot(t,Z(1,:));
	title('t vs x (RK4)');
	xlabel('t'); ylabel('x');

	figure;
	plot(Z(1,:), Z(2,:));
	title('x vs v (RK4)');
	xlabel('x'); ylabel('v');
endfunction
