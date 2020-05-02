function y = encoding(formato,valor_polo,y_niveles_binario)
% DESCRIPCI�N: genera onda de pulso y segun formato de se�alizacion y si es unipolar (0) o bipolar(-1).
% ENTRADAS: - formato = formato de se�alizacion(NRZ, RZ, Manchester).
%           - valor_polo = valor representativo del numero de polos (0 = unipolar, -1 = bipolar).
%           - y_niveles_binario = se�al binaria codificada a representar.
% SALIDAS:  - y = forma de onda de pulso.
  y = [];
	for i=1:length(y_niveles_binario)
	  if (y_niveles_binario(i)==1)
	    y=[y  formato];
    elseif (y_niveles_binario(i)==0)
	    y=[y  (valor_polo*formato)];        
	  end
	end
end