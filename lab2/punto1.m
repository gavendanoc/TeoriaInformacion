%-----laboratorio 2-----------
ok = false;
while (~ok)
  try
    fun = input("Ingrese la funcion f(t)= ","s");
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

f_m=1/T_m; #Frecuencia original
t=[0:0.02:2*T_m]; #Arreglo visualizacion funcion original
f_s=2*f_m; #Frecuencia de muestreo
t_s=[0:f_s:2*T_m]; #Arreglo de periodo de muestreo
#t_s=[0:1/f_s:2*T_m]; #Arreglo de periodo de muestreo

figure(1);
subplot(3,1,1),plot(t,m(t),'k'); title('m(t) original'); grid;
subplot(3,1,2),stem(t_s,m(t_s),'k'); title('m(t) muestreada'); grid;

%------b. CUANTIZACION-------

x=m(t_s); #señal a ser cuantizada
a=max(max(x),abs(min(x))); #amplitud maximo de la señal
xq=cuantUniforme(x,a,n); #señal cuantizada

subplot(3,1,3);stem(t_s,xq,'k'); title('m(t) cuantizada');xlabel('nT_s'); ylabel('x(nT_s)');

%------c. CODIFICACION--------

x_pcm=pcm(xq,n,a);

%-------d. REPRESENTACION DEL PULSO-------------------------------
y1=[];
y2=[];
y3=[];
y4=[];
y5=[];
y6=[];

bitrate=1;
unipolar=1;
bipolar=2;
NRZ=1;
RZ=2;
manchester=3;

[t_wave,unipolarNRZ]=encoding(x_pcm,bitrate,unipolar,NRZ);
[t_wave,bipolarNRZ]=encoding(x_pcm,bitrate,bipolar,NRZ);
[t_wave,unipolarRZ]=encoding(x_pcm,bitrate,unipolar,RZ);
[t_wave,bipolarRZ]=encoding(x_pcm,bitrate,bipolar,RZ);
#[t_wave,AMIRZ]=encoding(x_pcm,bitrate,unipolar,NRZ);
[t_wave,w_manchester]=encoding(x_pcm,bitrate,unipolar,manchester);

figure(2);
subplot(1,1,1);plot(t_wave, unipolarNRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada unipolar NRZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(3);
subplot(1,1,1);plot(t_wave, bipolarNRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada bipolar NRZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(4);
subplot(1,1,1);plot(t_wave, unipolarRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada unipolar RZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(5);
subplot(1,1,1);plot(t_wave, bipolarRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada Bipolar RZ');xlabel('nT_s'); ylabel('x(nT_s)');
#figure(6);
#subplot(1,1,2);plot(t_wave, AMIRZ,'k'); ylim([-1.1 1.1]); title('Señal codificada AMIRZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(7);
subplot(1,1,1);plot(t_wave, w_manchester,'k'); ylim([-1.1 1.1]); title('Señal codificada Manchester');xlabel('nT_s'); ylabel('x(nT_s)');

%-------e. RECUPERAR M(T)---------

##x_recovered
##figure(4);
##plot(t_s,x_recovered); title('Recuperacion de la señal');

