%Filtro pasa altas en frecuencia
%Vector resultado = FiltPAF(Vector de las frefuencia, ancho de el filtro desde cero)
function X = FiltPAF(frec,w0)
  len=length(frec);
  y1=abs(frec);
  X=zeros(1,len);
  for i=1:len
    if y1(i) >= w0
      X(i)=2;
    end
  end
end
