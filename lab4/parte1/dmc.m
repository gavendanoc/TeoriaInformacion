function R = dmc(C, e)
  % DESCRIPCI�N: Simula un canal discreto sin-memoria 
  %              Discrete Memoryless channel (DMC)
  % ENTRADAS: - C   = Matriz de codigo
  %           - e   = Errores
  % SALIDAS:  - R   = Palabras recibidas
  
  R = xor(C, e);
endfunction