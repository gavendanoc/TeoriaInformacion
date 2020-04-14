function res = b(n, x, T_0)
  func_b = inline ('x(t) .* sin(n .* 2 .* pi ./ T_0 .* t)', 't');
  res = quad(func_b, 0, T_0);
  res = res .* 2 ./ T_0;
endfunction