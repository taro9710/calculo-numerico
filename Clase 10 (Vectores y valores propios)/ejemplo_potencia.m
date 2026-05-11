function [lambda1,v1] = ejemplo_potencia()
	k1 = 3000000; % N/m
	k2 = 2400000; % N/m
	k3 = 1800000; % N/m
	m1 = 12000; % kg
	m2 = 10000; % kg
	m3 = 8000; % kg

	A = [((k1+k2)/m1) (-k2/m1) 0;
		(-k2/m2) ((k2 + k3)/m2) (-k3/m2);
		0 (-k3/m3) (k3/m3)]
	tol = 1e-6;
	err = inf;
	y0 = [1;1;1];

	while err > tol 
		x = y0/norm(y0,2);
		y = A*x;
		alfa = y./x;
		err = abs(max(alfa)-min(alfa));
		y0 = y;
	end

	lambda1 = alfa(1)
	v1 = y/norm(y,2)
end
