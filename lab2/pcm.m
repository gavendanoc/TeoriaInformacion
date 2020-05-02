function y = pcm(xq,n,a)
% DESCRIPCIÓN: retorna señal binaria de codigo pcm para señal cuantizada xq segun a amplitud maxima y n numeros de bits de cuantizacion
% ENTRADAS: - xq = señal cuantizada.
%           - a = amplitud maxima de la señal.
%           - n = numeros de bits de cuantizacion.
% SALIDAS:  - y = señal binaria de codigo pcm.
  y = [];
  temp=[];
  k=(2*a)/2^n;
  z= [-a:k:a];
    
	for i=1:length(xq)
	  n=xq(i);
    [val,idx]=min(abs(xq-n));
    minVal=dec2bin(idx-1,n);
    temp=[temp minVal];
	end
  for i=1:length(temp)
    y=[y str2num(temp(i))];
  end
end