function [aprox_coseno,numero_sumas] = aproximacioncoseno()
  angulo = input("Ingrese el ángulo: ");
  tolerancia = input("Ingrese la tolerancia: ");
  error_absoluto_aproximado = 999;
  suma_anterior = 0;
  aprox_coseno = 1;
  n = 1;
  while error_absoluto_aproximado > tolerancia
    suma_anterior= aprox_coseno;
    aprox_coseno = aprox_coseno + (-1)^(n) * angulo^(2*n) / (factorial(2*n));
    n = n + 1;
    error_absoluto_aproximado = abs(suma_anterior - aprox_coseno);
  endwhile
  numero_sumas = n;
  display(aprox_coseno)
  display(numero_sumas)
endfunction
