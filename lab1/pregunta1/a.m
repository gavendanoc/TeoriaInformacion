function res = a(n, x, T_0)
  % DESCRIPCIÓN: calcula coeficiente a_n
  % ENTRADAS: - x   = funcion de entrada.
  %           - T_0 = Periodo funcion
  %           - n   = Indicardor del coeficiente en la sumatoria
  % SALIDAS:  -.a_n
  
  func_a = inline ('x(t) .* cos(n .* 2 .* pi ./ T_0 .* t)', 't');
  res = quad(func_a, 0, T_0);
  res = res .* 2 ./ T_0;
endfunction
