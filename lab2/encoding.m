function [t,y] = encoding(bits, bitrate, polos, tipo)
% DESCRIPCIÓN: genera onda de pulso y segun formato de señalizacion NRZ(1) o RZ(2) o manchester(3) o amiRZ(4), y si es unipolar (1) o bipolar(2).
% ENTRADAS: - bits = señal binaria codificada a representar.
%           - bitrate = frecuencia de reloj
%           - polos = valor representativo del numero de polos (1 = unipolar, 2 = bipolar).
%           - tipo = formato de señalizacion(NRZ(1), RZ(2), Manchester(3), amiRZ(4)).
% SALIDAS:  - y = forma de onda de pulso.

T = length(bits)/bitrate;
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
y = zeros(1,length(t));
ami=1;
for i = 0:length(bits)-1
  if bits(i+1) == 1 #1
    if (tipo==4)#AMIRZ
      y(i*n+1:(i+0.5)*n) = ami;
      y((i+0.5)*n+1:(i+1)*n) = 0;
      ami = -ami;
    elseif (tipo==1)#NRZ
      y(i*n+1:(i+1)*n) = 1;
    elseif (tipo==2)#RZ
      y(i*n+1:(i+0.5)*n) = 1;
      y((i+0.5)*n+1:(i+1)*n) = 0;
    elseif (tipo==3)#manchester
      y(i*n+1:(i+0.5)*n) = 1;
      y((i+0.5)*n+1:(i+1)*n) = -1;
    end
  else #0
    if (tipo==3)#manchester
      y(i*n+1:(i+0.5)*n) = -1;
      y((i+0.5)*n+1:(i+1)*n) = 1;
    elseif (polos==1||tipo==4)#NRZ-RZ-AMIRZ unipolar
      y(i*n+1:(i+1)*n) = 0;
    elseif (polos==2&&tipo==1)#NRZ bipolar
      y(i*n+1:(i+1)*n) = -1;
    elseif (polos==2&&tipo==2)#RZ bipolar
      y(i*n+1:(i+0.5)*n) = -1;
      y((i+0.5)*n+1:(i+1)*n) = 0;
    end
  end
end