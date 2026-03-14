function [] = Area_Tangram()
  function area_rectangulo = calcular_area_rectangulo(lado)
    area_rectangulo = lado*lado;
  endfunction

  function area_triangulo = calcular_area_triangulo(base,altura)
    area_triangulo = base*altura/2;
  endfunction

  function area_paralelogramo = calcular_area_paralelogramo(base,altura)
    area_paralelogramo = base*altura;
  endfunction

  lado_tangram = input("Ingrese cuánto un Lado del Tangram: ");
  lado_sobre_2 = lado_tangram / 2 #Lado del tangram sobre 2 (L/2)
  lado_sobre_4 = lado_tangram /4; #L/4

  area_tangram = calcular_area_rectangulo(lado_tangram)


  # Calculamos las areas A1,A2,A7
  # Podemos ver que A1 = A2 donde son un triángulo de base L y altura L/2
  A1 = calcular_area_triangulo(lado_tangram,lado_sobre_2)
  A2 = calcular_area_triangulo(lado_tangram,lado_sobre_2)
  # Podemos ver a A7 como un triángulo de base=altura= L/2
  A7 = calcular_area_triangulo(lado_sobre_2,lado_sobre_2)
  #Para calcular el A4 vemos que uno de sus lados es la mitad de la hipotenusa
  # de el triangulo 7
  lado_A4 = sqrt(2*(lado_sobre_2^2))/2;
  A4 = calcular_area_rectangulo(lado_A4)
  #A6 lo puedo ver como un paralelogramo de base L/2 y altura L/2
  A6 = calcular_area_paralelogramo(lado_sobre_2,lado_sobre_4)
  # A3 y A5 pueden ser vistos como triangulos de base L/2 y altura L/4
  A3 = calcular_area_triangulo(lado_sobre_2,lado_sobre_4)
  A5 = calcular_area_triangulo(lado_sobre_2,lado_sobre_4)

  Area_Tangram_suma = A1+A2+A3+A4+A5+A6+A7

endfunction
