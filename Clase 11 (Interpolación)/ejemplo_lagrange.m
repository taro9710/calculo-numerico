function P = ejemplo_lagrange()
	x = [0;5;10;15];
	y = [1.792;1.519;1.308;1.14];
	xeval = linspace(x(1),x(end),16);
	m = length(xeval);
	P = zeros(m,1);
	for i=1:m
		P(i) = lagrange(xeval(i),x,y);
	end
	plot (xeval',P);
end
