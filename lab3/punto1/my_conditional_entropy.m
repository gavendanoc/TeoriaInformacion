function e = my_conditional_entropy(p1, p2)
  % DESCRIPCIÓN: calcula entropia
  % ENTRADAS: - p   = vector o matriz
  % SALIDAS:  - e   = entropia
  log_p2 = log2 (p2);
  log_p2(~isfinite(log_p2)) = 0;
  e = - sum(sum(p1 .* log_p2));
endfunction