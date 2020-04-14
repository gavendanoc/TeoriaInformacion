%Filtro pasa bajas en frecuencia
%Vector resultado = FilPBJF(Vector de las frefuencia, Ancho de el filtro desde cero)
function X = FilPBJF(frec,w0)
  len=length(frec);
  y1=abs(frec);
  X=zeros(1,len);
  for i=1:len
    if y1(i) <= w0
      X(i)=2;
    end
  end
end
