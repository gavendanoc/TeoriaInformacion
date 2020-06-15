function [idx] = findRow(row, H)
  % DESCRIPCIÓN: calcula entropia
  % ENTRADAS: - row = Fila a buscar
  %           - H   = Matriz a buscar
  % SALIDAS:  - idx = Indice posicion de la fila
  
  [n  m] = size(H);
  for i = 1:n
    if (isequal(row, H(i, :)) == 1)
      idx = i;
      return;
    endif
  endfor
  
  idx = 0; % No encontrado 
endfunction