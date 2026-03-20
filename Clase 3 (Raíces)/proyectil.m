function [t,error,n] = proyectil(t,tol)
  u = 2510;
  M0 = 2.8e6;
  mdot = 13.3e3;
  g = 9.81;
  v = 335;
  f = @(t) u*log(M0/(M0-mdot*t)) - g*t - v;
  df = @(t) (u*mdot)/(M0-mdot*t) - g;
  error = 999;
  n = 0;
  while error > tol
      t_new = t - f(t)/df(t);
      error = abs(f(t_new));
      t = t_new;
      n = n + 1;
  end


  endfunction
