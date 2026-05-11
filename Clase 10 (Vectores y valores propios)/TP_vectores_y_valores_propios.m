function TP_vectores_y_valores_propios()
  % Seteamos los parámetros del probrlema
  tol = 1e-6;
  maxiter = 10000;
	k1 = 3000000; % N/m
	k2 = 2400000; % N/m
	k3 = 1800000; % N/m
	m1 = 12000; % kg
	m2 = 10000; % kg
	m3 = 8000; % kg
  % Armamos la matriz
  A = [((k1+k2)/m1) (-k2/m1) 0;
      (-k2/m2) ((k2 + k3)/m2) (-k3/m2);
      0 (-k3/m3) (k3/m3)];
  % Polinomio característico y sus raíces
  polinomio_caracteristico(A);

  % Proponemos un autovector
	x = [1; 1; 1];
  % Metodo de la potencia
  disp("MÉTODO DE LA POTENCIA");
	[lambda_max,v_dominante] = metodo_potencias(A,x,tol,maxiter)

  % Metodo de la delfación
  disp("MÉTODO DE LA DEFLACIÓN");
  [lamda_int,v_int] = metodo_deflacion(A,x,lambda_max,v_dominante,tol,maxiter)

  % Metodo de la potencia inversa
  disp("MÉTODO DE LA POTENCIA INVERSA");
  [lambda_min,v_fundamental] = metodo_potencia_inversa(A,x,tol,maxiter)

  % Gráfica
  figure()

  altura = [0;3;6];

  subplot(1,3,1)
  plot(v_fundamental,altura,'-o','LineWidth',2,'MarkerSize',8)
  grid on
  xlabel('Amplitud')
  ylabel('Altura [m]')
  title('Modo 1 (Fundamental)')

  subplot(1,3,2)
  plot(v_int,altura,'-o','LineWidth',2,'MarkerSize',8)
  grid on
  xlabel('Amplitud')
  ylabel('Altura [m]')
  title('Modo 2')

  subplot(1,3,3)
  plot(v_dominante,altura,'-o','LineWidth',2,'MarkerSize',8)
  grid on
  xlabel('Amplitud')
  ylabel('Altura [m]')
  title('Modo 3')
end
