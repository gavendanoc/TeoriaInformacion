function y = pcm(xq,n)
% DESCRIPCI�N: retorna se�al binaria de codigo pcm para se�al cuantizada xq y n numeros de bits de cuantizacion
% ENTRADAS: - xq = se�al cuantizada.
%           - n = numeros de bits de cuantizacion.
% SALIDAS:  - y = se�al binaria de codigo pcm.
  y = [];
  temp=[];
  z= sort(unique(xq));
	for i=1:length(xq)
	  j=xq(i);
    [val,idx]=min(abs(z-j));
    minVal=dec2bin((idx-1),n);
    temp=[temp minVal];
	end
  for i=1:length(temp)
    y=[y str2num(temp(i))];
  end
end