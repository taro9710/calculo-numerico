function ejemplo()
	# Definimos constantes
	g = 9.81;
	L = 1;
	
	# Definiimos la función 
	f = @(t,Z) [Z(2); (-g/L)*Z(1)];
	
	# Definimos parámetros
	# Intervalo de tiempo
	t0 = 0;
	tf = 10;
	dt = 0.001;
	t = t0:dt:tf;
	n = length(t);
	
	# Condiciones iniciales
	theta0 = 0.7;
	dtheta0 = 0;
	Z(1,1) = theta0;
	Z(2,1) = dtheta0;

	for i = 1 : n-1
		k1 = f(t(i),Z(:,i));
		k2 = f(t(i) + dt/2,Z(:,i) + (dt/2) * k1);
		k3 = f(t(i) + dt/2,Z(:,i));
		k4 = f(t(i),Z(:,i));
		FI = (1/6) * (k1+ 2*k2+2*k3+k4);
		Z(:,i+1) = Z(:,i) + dt * FI;
	endfor
	plot(Z(1,:),Z(2,:),'r');
