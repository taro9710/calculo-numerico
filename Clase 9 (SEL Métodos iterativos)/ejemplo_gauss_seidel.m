function [x,iter] =  ejemplo_gauss_seidel()
	tol = 1.6e-4;
	err = inf;
	iter = 0;

	A = [4 -1 1; 4 -8 1; -2 1 5];
	b = [7; -21; 15];

	[m,n] = size(A);

	x = [1;1;1];

	while err > tol
		xn = zeros(m,1);
		for i = 1:m
			suma1 = A(i,1:i-1) * xn(1:i-1);
			suma2 = A(i,i+1:n) * x(i+1:n);
			xn(i) = (b(i) - suma1 - suma2)/A(i,i);
		end
		err = norm(xn-x,1);
		x = xn;
		iter++;
	end
	display(x);
	display(iter)
end
