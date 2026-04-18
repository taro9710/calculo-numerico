function dif_finitas_centradas(k,m,t,dt,n,Z)
	x = zeros(1,n);
	v = zeros(1,n);
	% condiciones iniciales
	x(1) = Z(1,1);
	v(1) = Z(2,1);

	% calcular x(2) usando Taylor
	x(2) = x(1) + dt*v(1) + 0.5*(-k/m*x(1))*dt^2;
	for i = 2:n-1
		x(i+1) = 2*x(i) - x(i-1) - (k/m)*dt^2*x(i);
	end

	% velocidad aproximada
	for i = 2:n-1
    		v(i) = (x(i+1)-x(i-1))/(2*dt);
	end

	% gráficos
	figure;
	plot(t,x);
	title('x vs t (Dif. Finitas)');
	xlabel('t'); ylabel('x');

	figure;
	plot(x,v);
	title('x vs v (Dif. Finitas)');
	xlabel('x'); ylabel('v');
endfunction
