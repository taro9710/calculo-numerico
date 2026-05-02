function equilibrio_estatico()
	tol = 1.6e-6;
	err = inf;

  A = [27.58e6 7.004e6 -7.004e6 0 0;
       7.004e6 29.57e6 -5.253e6 0 -24.32e6;
       -7.004e6 -5.253e6 29.57e6 0 0;
       0 0 0 27.58e6 -7.004e6;
       0 -24.31e6 0 -7.004e6 29.57e6];
	b = [0; 0; 0; 0; -47000];
  [m,n] = size(A);
  x = [0.001;0.001;0.001;0.001;0.001];


	while err > tol
		xn = zeros(m,1);
		for i = 1:m
			suma1 = A(i,1:i-1) * xn(1:i-1);
			suma2 = A(i,i+1:n) * x(i+1:n);
			xn(i) = (b(i) - suma1 - suma2)/A(i,i);
		end
		err = norm(xn-x,1);
		x = xn;
	end

  x = xn;
  x = 1000*x;
  disp("Método de Gauss-Seidel.");
  disp("Los resultados para los desplazamientos elásticos u_i en mm:");
  for i = 1:5
      disp(['u_',num2str(i),': ',num2str(x(i))]);
  end
  end
