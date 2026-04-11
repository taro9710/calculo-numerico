function ECN_TP_EDO_CI()
  # ATRACTOR DE LORENZ - Resolución por EDO con condiciones iniciales
  # metodos: Euler simple y Euler mejorado (Heun)

  #definición de parámetros y condiciones iniciales
  S = 10;
  R = 28;
  B = 8/3;

  x0 = 1;
  y0 = 0;
  z0 = 0;

  estado0 = [x0; y0; z0];

  t0 = 0;
  tf = 50;
  #definición del sistema de EDOs
  # f(t, estado) devuelve las derivadas [dx/dt; dy/dt; dz/dt]
  #   dx/dt = -S*x + S*y
  #   dy/dt = -x*z + R*x - y
  #   dz/dt =  x*y - B*z
  f = @(t, u) [ -S*u(1) + S*u(2);
                -u(1)*u(3) + R*u(1) - u(2);
                 u(1)*u(2) - B*u(3) ];


  # Implementación del método de Euler simple
  function U = euler_simple(f, u0, t0, tf, h)
    N = round((tf - t0) / h);
    t = linspace(t0, tf, N+1);
    U = zeros(length(u0), N+1);
    U(:,1) = u0;
    for n = 1:N
      U(:, n+1) = U(:,n) + h * f(t(n), U(:,n));
    end
  end


  #Implementación del método de euler mejorado (Hrun)
  function U = euler_mejorado(f, u0, t0, tf, h)
    N = round((tf - t0) / h);
    t = linspace(t0, tf, N+1);
    U = zeros(length(u0), N+1);
    U(:,1) = u0;
    for n = 1:N
      k1 = f(t(n), U(:,n));
      k2 = f(t(n) + h,  U(:,n) + h*k1);
      U(:, n+1) = U(:,n) + (h/2) * (k1 + k2);
    end
  end

  #Funcion para graficar, grafica los 3 pasos en una misma ventana
  function graficadora(U, h, metodo, posicion,color="b",n_figura)
    figure(n_figura)
    subplot(1,3,posicion)
    plot(U(1, :), U(3, :),color);
    xlabel('x(t)');
    ylabel('z(t)');
    title(sprintf('%s (h=%.3f)', metodo, h));
    grid on;
  end


  #Calculo para h1= 0.02, h2=0.01 y h3=0.005
  pasos = [0.02,0.01,0.005];
  resultados_es=[];
  resultados_em = [];

  for i=1:length(pasos)
    h = pasos(i);

    es = euler_simple(f,estado0,t0,tf,h);
    em = euler_mejorado(f,estado0,t0,tf,h);
    es_end = es(:,end);
    em_end = em(:,end);

    #Creo dos matrices con los estados finales de cada paso para cada metodo
    resultados_es = [resultados_es,es_end];
    resultados_em = [resultados_em,em_end];

    #Grafico
    graficadora(es,h,"Euler",i,"r",1)
    graficadora(em,h,"Euler Mejorado",i,"b",2)
  endfor

  resultados_euler_simple_h02 = resultados_es(:,1)
  resultados_euler_simple_h01 = resultados_es(:,2)
  resultados_euler_simple_h005 = resultados_es(:,3)
  resultados_euler_mejorado_h02 = resultados_em(:,1)
  resultados_euler_mejorado_h01 = resultados_em(:,2)
  resultados_euler_mejorado_h005 = resultados_em(:,3)

  #ERROR RELATIVO
  #error_relativo = |u_aprox - u_ref| / |u_ref|
  # Calculo del error relativo entre pasos tomo como referencia h=0.005 con euler mejorado

  referencia = resultados_em(:,end);
  errores_es = [];
  errores_em = [];

  for i=1:size(resultados_es,2)
    error_es = norm(resultados_es(:,i)-referencia) / norm(referencia);
    errores_es = [errores_es,error_es];
    error_em = norm(resultados_em(:,i)-referencia) / norm(referencia);
    errores_em = [errores_em,error_em];
  endfor
  errores_euler_simple_h02 = errores_es(:,1)
  errores_euler_simple_h01 = errores_es(:,2)
  errores_euler_simple_h005 = errores_es(:,3)
  errores_euler_mejorado_h02 = errores_em(:,1)
  errores_euler_mejorado_h01 = errores_em(:,2)
  errores_euler_mejorado_h005 = errores_em(:,3)
endfunction
