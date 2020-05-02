function y = AMIRZ(RZ,y_niveles_binario)
% DESCRIPCIÓN: genera onda de pulso y segun formato de señalizacion AMIRZ.
% ENTRADAS: - RZ = formato de señalizacion RZ.
%           - y_niveles_binario = señal binaria codificada a representar.
% SALIDAS:  - y = forma de onda de pulso.
  y = [];
	count = 0;
  for i=1:length(y_niveles_binario)
	  if (y_niveles_binario(i)==1)
      if rem (count, 2) == 0
        y=[y  RZ];
      else
        y=[y  -RZ];		          	
      end
      count++;
	  elseif (y_niveles_binario(i)==0)
	    y=[y  (0*RZ)];        
	  end
	end
end