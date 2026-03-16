function raiz = RN_recursivo(x,tol)
  f = @(y) x.^2 - 4;
  df = @(y) 2*x;
  raiz = x - (f(x)/df(x));
  if abs(f(raiz)) > tol
    raiz = RN_recursivo(raiz, tol);
  endif
endfunction
