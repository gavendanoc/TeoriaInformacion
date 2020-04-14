function res = x_series(x, n, T_0, t)
  res = a(0, x, T_0) ./ 2;
  for i = 1:n
    component_a = a(i, x, T_0);
    component_b = b(i, x, T_0);
    res = res + component_a .* cos (i .* 2 .* pi ./ T_0 .* t); 
    res = res + component_b .* sin (i .* 2 .* pi ./ T_0 .* t); 
  endfor
endfunction
