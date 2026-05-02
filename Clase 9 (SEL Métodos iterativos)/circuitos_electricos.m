function circuitos_electricos()
	tol = 1.6e-6;
	err = inf;
	iter = 0;

  R = zeros(6);
  E = zeros(3);
  for i = 1:6
    mensaje = ['Ingrese el valor para la resistencia ' num2str(i) ': '];
    R(i) = input(mensaje);
  end

  for i = 1:3
    mensaje = ['Ingrese el valor para la fuente ' num2str(i) ': '];
    E(i) = input(mensaje);
  endfor

	A = [(R(1)+R(3)+R(4)) R(3) R(4);
        R(3) (R(2)+R(3)+R(5)) (-R(5));
        R(4) (-R(5)) (R(4)+R(5)+R(6))];

	b = [E(1); E(2); E(3)];
	x = [1;1;1];

	D = diag(diag(A));
	R = A - D;
	T = - D \ R;
	c = D \ b;


	while err > tol
		xn = T*x + c;
		err = norm(xn-x,1);
		x = xn;
		iter++;
	end
  disp("Método de Jacobi.");
  disp("Los resultados para las Intensidades de corriente I_i:");
  for i = 1:3
      disp(['I_',num2str(i),': ',num2str(x(i))]);
  endfor
end
