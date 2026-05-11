function [lambdamin,vmin] = ejemplo_lu()
	A = [10 -12 -6; 5 -5 -4; -1 0 3];
	tol = 1e-6;
	err = inf;
	y0 = [1;1;1];
	
	[m,n] = size(A);
	L = eye(m,n);

	for i = 1:n-1
		for j = i+1:m
			f = A(j,i)/A(i,i);
			A(j,:)-f*A(i,:);
			L(j,i) =f;
		end
	end
	U = A;

	while err > tol
		x = y0/norm(y0,2);
		% Sustitución progresiva
		z = zeros(m,1);
		for i = 1:m
			z(i,1) = (x(1,:) - L(i,1)*z)/L(i,i);
		end

		% Sustitución regresiva
		y = zeros(m,1);
		for i = m-1:1
			y(i,1)=(z(i,1)-U(i,:)*y)/U(i,i);
		end

		alfa = y./x;
		err = abs(max(alfa)-min(alfa));
		y0 = y;
	end

	lamdamin = 1/alfa(1);
	vmin = y/norm(y,2);
end
