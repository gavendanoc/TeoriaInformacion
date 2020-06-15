function R = dmc(C, e)
  % DESCRIPCIÓN: Simula un canal discreto sin-memoria 
  %              Discrete Memoryless channel (DMC)
  % ENTRADAS: - C   = Matriz de codigo
  %           - e   = Errores
  % SALIDAS:  - R   = Palabras recibidas
  
  R = xor(C, e);
endfunction