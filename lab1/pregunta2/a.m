function res = a(n, x, T_0)
  func_a = inline ('x(t) .* cos(n .* 2 .* pi ./ T_0 .* t)', 't');
  res = quad(func_a, 0, T_0);
  % disp(res);
  res = res .* 2 ./ T_0;
endfunction
