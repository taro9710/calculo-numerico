function [x,iter] =  ejemplo_jacobi()
	#Jacobi
	tol = 1.6e-6;
	err = inf;
	iter = 0;

	A = [27.58e6 7.004e6 -7.004e6 0 0;
         7.004e6 29.57e6 -5.253e6 0 -24.32e6;
        -7.004e6 -5.253e6 29.57e6 0 0;
         0 0 0 27.58e6 -7.004e6;
         0 -24.31e6 0 -7.004e6 29.57e6];

	b = [0; 0; 0; 0; -47000];

  x = [0.001;0.001;0.001;0.001;0.001];


	D = diag(diag(A));
	R = A - D;

	T = - D \ R;
	c = D \ b;


	while err > tol
		xn = T*x + c;
		err = norm(xn-x,1)/norm(xn,1);
		x = xn;
		iter++;
	end
	display(x);
	display(iter)
end
