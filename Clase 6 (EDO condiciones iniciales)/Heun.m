function U = euler_mejorado(f, u0, t0, tf, h)
	%Implementación del método de euler mejorado (Hrun)
	N = round((tf - t0) / h);
    t = linspace(t0, tf, N+1);
    U = zeros(length(u0), N+1);
    U(:,1) = u0;
    for n = 1:N
		k1 = f(t(n), U(:,n));
    	k2 = f(t(n) + h,  U(:,n) + h*k1);
    	U(:, n+1) = U(:,n) + (h/2) * (k1 + k2);
    end
end
