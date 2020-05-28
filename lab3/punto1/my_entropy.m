function e = my_entropy(p)
  % DESCRIPCI�N: calcula entropia
  % ENTRADAS: - p   = vector o matriz
  % SALIDAS:  - e   = entropia
  e = - sum(sum(p .* log2 (p)));
endfunction