function [C_decoded, S, errors, D_decoded] = decoder(P, R)
  % DESCRIPCIÓN: calcula entropia
  % ENTRADAS: - P           = Matriz de paridad
  %           - R           = Palabras recibidas
  % SALIDAS:  - D_decoded   = Matriz de datos decodificada
  %           - errors      = posicion de los errores por palabra
  %           - S           = Sindrome
  %           - C_decoded   = Matriz de codigo corregida
  
  [m k] = size(P);
  
  % Calcular sindromes 
  H = [P eye(m)];
  S = matmulXOR(R,  H');
  
  % Decodificar sindromes
  [messages, n] = size(R);
  errors = zeros(messages, 1);
  for i = 1:messages
    errors(i, 1) = findRow(S(i, :), H');
  endfor
  
  % Corregir errores
  C_decoded = R;
  for i = 1:messages
    if (errors(i, 1) != 0)
      error_bit = errors(i, 1);
      C_decoded(i, error_bit) = xor(C_decoded(i, error_bit), 1); % cambiar i-esimo bit
    endif
  endfor
  
  % extraer bits de datos
  D_decoded = C_decoded(:, 1:k);
endfunction