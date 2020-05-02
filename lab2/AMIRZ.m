function y = AMIRZ(RZ,y_niveles_binario)
% DESCRIPCI�N: genera onda de pulso y segun formato de se�alizacion AMIRZ.
% ENTRADAS: - RZ = formato de se�alizacion RZ.
%           - y_niveles_binario = se�al binaria codificada a representar.
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