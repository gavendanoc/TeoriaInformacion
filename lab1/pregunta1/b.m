function res = b(n, x, T_0)
  % DESCRIPCIÓN: calcula coeficiente b_n
  % ENTRADAS: - x   = funcion de entrada.
  %           - T_0 = Periodo funcion
  %           - n   = Indicardor del coeficiente en la sumatoria
  % SALIDAS:  - b_n
  
  func_b = inline ('x(t) .* sin(n .* 2 .* pi ./ T_0 .* t)', 't');
  res = quad(func_b, 0, T_0);
  res = res .* 2 ./ T_0;
endfunction