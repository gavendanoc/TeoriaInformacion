function e = my_entropy(p)
  % DESCRIPCI�N: calcula entropia
  % ENTRADAS: - p   = vector o matriz
  % SALIDAS:  - e   = entropia
  log_p = log2 (p);
  log_p(~isfinite(log_p)) = 0;
  e = - sum(sum(p .* log_p));
endfunction