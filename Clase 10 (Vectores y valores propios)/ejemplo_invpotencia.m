function [lambda2,v1] = ejemplo_invpotencia()
	A = [10 -12 -6; 5 -5 -4; -1 0 3];
	tol = 1e-6;
	err = inf;
	y0 = [1;1;1];
	Ainv = inv(A);

	while err > tol 
		x = y0/norm(y0,2);
		y = Ainv*x;
		alfa = y./x;
		err = abs(max(alfa)-min(alfa));
		y0 = y;
	end

	lamda1 = 1/alfa(1);
	v1 = y/norm(y,2);
end
