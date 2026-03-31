function y = posicion(t)
  %% Caida vertical
  %% Constantes
  m = 0.3;   % kg
  c = 0.5;   % kg/m
  g = 9.81;  % m/s^2
  k = sqrt(c*g/m); % constante auxiliar
  y = (m/c)*log(cosh(k*t)); % posición
  endfunction
