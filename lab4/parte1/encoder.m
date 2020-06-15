function C = encoder(P, D)
  % DESCRIPCIÓN: calcula entropia
  % ENTRADAS: - P   = Matriz de paridad
  %           - D   = Matriz de datos
  % SALIDAS:  - C   = Matriz de codificacion
  [m k] = size(P);
  G = [eye(k) P'];
  C = matmulXOR(D, G);
endfunction