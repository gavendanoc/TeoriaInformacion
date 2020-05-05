%-----laboratorio 2-----------
ok = false;
while (~ok)
  try
    fun = input("Ingrese la funcion m(t)= ","s");
    m = inline(fun,'t');#crea la funcion
    ok = true;
  catch
    printf("Favor ingresar una funcion apropiada\n");
  end
end


ok=false;
while (~ok)
  try
    T_m = input("Ingrese el periodo: ");
    ok  = true;
  catch
    printf("Favor ingresar un numero\n");
  end
end

ok=false;
while (~ok)
  try
    n = input("Ingrese el numero de bits de cuantizacion: ");
    ok  = true;
  catch
    printf("Favor ingresar un numero\n");
  end
end



%-----a. MUESTREO-----------

p=2; #numeros de veces de muestreo
f_m=1/T_m; #Frecuencia original
t=[0:0.02:p*T_m]; #Arreglo visualizacion funcion original
f_s=p/T_m; #Frecuencia de muestreo
t_s=[0:f_s:p*T_m]; #Arreglo de periodo de muestreo

figure(1);
subplot(3,1,1),plot(t,m(t),'k'); title('m(t) original'); grid;
subplot(3,1,2),stem(t_s,m(t_s),'k'); title('m(t) muestreada'); grid;

%------b. CUANTIZACION-------

x=m(t_s); #señal a ser cuantizada
a=max(max(x),abs(min(x))); #amplitud maximo de la señal
xq=cuantUniforme(x,a,n); #señal cuantizada

subplot(3,1,3);stem(t_s,xq,'k'); title('m(t) cuantizada');xlabel('nT_s'); ylabel('x(nT_s)'); grid;

%------c. CODIFICACION--------

x_pcm=pcm(xq,n,a);

%-------d. REPRESENTACION DEL PULSO-------------------------------
bitrate=1;
unipolar=1;
bipolar=2;
NRZ=1;
RZ=2;
manchester=3;
amiRZ=4;

[t_wave,unipolarNRZ]=encoding(x_pcm,bitrate,unipolar,NRZ);
[t_wave,bipolarNRZ]=encoding(x_pcm,bitrate,bipolar,NRZ);
[t_wave,unipolarRZ]=encoding(x_pcm,bitrate,unipolar,RZ);
[t_wave,bipolarRZ]=encoding(x_pcm,bitrate,bipolar,RZ);
[t_wave,AMIRZ]=encoding(x_pcm,bitrate,unipolar,amiRZ);
[t_wave,w_manchester]=encoding(x_pcm,bitrate,unipolar,manchester);

figure(2);
plot(t_wave, unipolarNRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada unipolar NRZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(3);
plot(t_wave, bipolarNRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada bipolar NRZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(4);
plot(t_wave, unipolarRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada unipolar RZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(5);
plot(t_wave, bipolarRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada Bipolar RZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(6);
plot(t_wave, AMIRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada AMIRZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(7);
plot(t_wave, w_manchester,'k'); ylim([-1.1 1.1]); title('Señal codificada Manchester');xlabel('nT_s'); ylabel('x(nT_s)');

%-------e. RECUPERAR M(T)---------

sum=0;
w_m=2*pi*f_m;
for i=t_s 
  fun=m(i*(1/f_s))*sinc((t-(i*(1/f_s)))/(1/f_s)); # Whittaker–Shannon interpolation formula
  sum=sum+fun;
endfor
figure(8);
plot(t,sum); title('Señal m(t) recuperada');

