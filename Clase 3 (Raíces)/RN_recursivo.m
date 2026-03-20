function [raiz,iter] = RN_recursivo(x,tol,n=1)
  f = @(y) x.^2 - 4;
  df = @(y) 2*x;
  iter= n;
  raiz = x - (f(x)/df(x));
  if abs(f(raiz)) > tol
    [raiz,iter] = RN_recursivo(raiz, tol,n+1);
  endif
endfunction
