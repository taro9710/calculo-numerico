function P = newton(xeval)
	x = [0;5;10;15];
	y = [1.792;1.519;1.308;1.14];
	n = length(x);
	A = zeros(n,n);
	A(:,1) = y;

	for j=2:n
		for k=j:n
			A(k,j) = (A(k,j-1) - A(k-1,j-1))/(x(k)-x(k-j+1));
		end
	end
	a = diag(A);
	P=a(n);
	for i=1:n-1
		P = a(n-i) + (xeval - x(n-i)) * P;
	end
	
end
