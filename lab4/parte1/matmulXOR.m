function M = matmulXOR(A, B)
  % DESCRIPCIÓN: Multiplicacion de matrices cuando la suma es XOR
  % ENTRADAS: - A = Matriz (n1, m1)
  %           - B = Matriz (n2, m2)
  % SALIDAS:  - M = Matriz resultado (n1, m2)
  [Ar Ac] = size(A);
  [Br Bc] = size(B);
    
  if (Ac ~= Br)
    OCTAVE_QUIT; % exception []
  endif;
  
  M = zeros(Ar, Bc);
  
  for i = 1:Ar
    for j = 1:Bc
      temp = A(i, :)(:) .* B(:, j);
      sum = 0;
      for k = 1:Ac
        sum = xor(sum, temp(k));
      endfor
      M(i, j) = sum;
    endfor
  endfor
endfunction