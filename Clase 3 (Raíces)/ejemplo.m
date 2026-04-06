function ejemplo()
  g = 9.81; #m/s^2
  c = 12.5; #Kg/s
  t = 6; #s
  tol = 5e-4;
  f = @(m) (g.*m./c).*(1 - exp(-(c./m).*t)) - 35;
  err = inf;
  n=0
  a = 40
  b = 80
  fa = f(a)
  fb = f(b)
  while err > tol
    c = (a + b)/2
    fc = f(c)
    err = abs(fc)
    if fa*fc < 0
        b = c
        fb = fc
    else
        a = c
        fa = fc
    endif
    n = n + 1
  endwhile


endfunction
