function TP_ECN()
  %Código hecho por Maxi Vanrell
  % Funcion f(x)
  f = @(x) 0.12*x.^3 - 2.4*x.^2 + 12*x;

  % Condiciones de frontera
  T0 = 40;
  T10 = 200;

  % funcion para las diferencias finitas
  function [x, T] = EDO(h, f, T0, T10)

      x = 0:h:10;
      n = length(x);

      % Crear matriz A con las ecuaciones y vector b del lado derecho
      A = zeros(n-2);
      b = zeros(n-2,1);

      for i = 1:n-2
          xi = x(i+1);

          % Llenar matriz
          if i > 1
              A(i,i-1) = 1;
          end

          A(i,i) = -2;

          if i < n-2
              A(i,i+1) = 1;
          end

          % Llenar vector
          b(i) = h^2 * f(xi);
      end

      % Ajustar por condiciones de frontera
      b(1) = b(1) - T0;
      b(end) = b(end) - T10;

      % Resolver sistema
      T_interior = A \ b;

      % Agregar fronteras
      T = [T0; T_interior; T10]';
  end

  % Para h=2.5
  [x1, T1] = EDO(2.5, f, T0, T10);

  % Para h=1.25

  [x2, T2] = EDO(1.25, f, T0, T10);

  % Grafico
  figure;
  plot(x1, T1, 'o-', 'LineWidth', 2); hold on;
  plot(x2, T2, 'x-', 'LineWidth', 2);
  xlabel('x'); ylabel('Temperatura');
  legend('h=2.5','h=1.25');
  title('Distribucion de Temperatura');
  grid on;

  % Extrapolacion de richardson en x=5

  % Buscar indice de x=5
  idx1 = find(abs(x1 - 5) < 1e-6);
  idx2 = find(abs(x2 - 5) < 1e-6);

  T_h   = T1(idx1);
  T_h2  = T2(idx2);

  % Richardson (orden 2)
  T_mejor = T_h2 + (T_h2 - T_h)/3;

  % Mostrar resultados
  fprintf('T(5) con h=2.5  = %.5f\n', T_h);
  fprintf('T(5) con h=1.25 = %.5f\n', T_h2);
  fprintf('Mejor aproximacion (Richardson) = %.5f\n', T_mejor);
endfunction
