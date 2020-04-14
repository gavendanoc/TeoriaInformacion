%Filtro pasa bandas en frecuencia
%Vector resultado = FiltPBDF(Vector de las frefuencia, limite izquierda del filtro, Limite
function X = FiltPBDF(frec,w01,w02)
  len=length(frec);
  y1=abs(frec);
  X=zeros(1,len);
  for i=1:len
    if (y1(i) <= w02) && (y1(i) >= w01 )
      X(i)=2;
    end
  end
end
