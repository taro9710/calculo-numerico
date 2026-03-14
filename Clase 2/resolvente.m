function[x_1,x_2] = resolvente()
  a=input('a:');
  b=input('b:');
  c=input('c:');
  D = b*b - 4*a*c;
  if D>0
    x_1 = (-b - sqrt(D))/(2*a);
    x_2 = (-b + sqrt(D))/(2*a);
  elseif D==0
    x_1 = -b/(2*a);
    x_2 = x_1;
  else
    display('No calculo raícies imaginarias');
    x_1 = "error";
    x_2 = "error";
  endif
  endfunction

