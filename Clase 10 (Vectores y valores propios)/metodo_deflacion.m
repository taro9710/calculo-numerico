function [lambda,v] = metodo_deflacion(A,x,lambda_sup,v_sup,tol,maxiter)
  %{
     Metodo de la deflación (Método de Wielandt)
   Entradas:
		- A es una matriz de orden nxn
		- x es el vector inicial de orden nx1
    - lambda_sup el autovalor de orden superior
    - v_sup es el autovector de orden superior
		- tol es la tolerancia
		- maxiter es el número máximo de iteraciones
	Resultados:
		- lambda es el autovalor resultante de eliminar el modo superio
		- v es el autovector resultante de eliminar el modo superior
  %}

  % Inicialización de parámetros
  x = x/norm(x); % Normalizamos el vector inicial
  err = inf;
  iter = 0;

  %Aplica el método de la potencia para calcular lambda1 y v1
  if isempty(v_sup)
    [lambda1,v1] = metodo_potencias(A,x,tol,maxiter);
  else
    lambda1 = lambda_sup;
    v1 = v_sup;
  endif

  %Deflacion
  %busco la posición del elemento de orden superior en valor absoluto de v1
  [m,n]=max(abs(v1));
  u=(1/(lambda1*v1(n))*A(n,:))'; %calculo de u segun Wielandt
  B=A-lambda1*v1*u'; %calculo la nueva matriz B
  %elimino la fila n (número de fila de la componente elegida de v1)
  B(n,:)=[];
  %elimino la columna n (número de columna según componente elegida de v1)
  B(:,n)=[];
  N = size(B,1);
  y0 = ones(N,1);
  y=y0;
  while err>tol && iter < maxiter
    x=y0/norm(y0,2);
    y=B*x;
    lambda = (x'*y)/(x'*x);
    % Error
    err = norm(y - lambda*x);
    % Actualizar
    y0=y;
    iter++;
  endwhile
  w=y/norm(y,2);
  w=[w(1:n-1);0;w(n:end)]; %armo w y completo con 0 en la posición n
  v=(lambda-lambda1)*w + lambda1*(u'*w)*v1; %calculo v1 según Wielandt
  v=v/norm(v,2);
end

