%-----laboratorio 2-----------
IN= input('Ingrese la función: ', "s");
F=inline(IN,'t');

%-----a. MUESTREO-----------

T_m=4*pi; #Periodo de visualizacion
f_m=1/T_m; #Frecuencia original
t=[0:0.02:2*T_m]; #Arreglo visualizacion funcion original
f_s=2*f_m; #Frecuencia de muestreo
t_s=[0:f_s:2*T_m]; #Arreglo de periodo de muestreo

figure(1);
subplot(3,1,1),plot(t,F(t),'k');axis([0 2*T_m]); title('F(t) original'); grid;
subplot(3,1,2),stem(t_s,F(t_s),'k');axis([0 2*T_m]); title('F(t) muestreada'); grid;

%------b. CUANTIZACION-------

n= 2; #Numero de bits de cuantizacion
x=F(t_s); #señal a ser cuantizada
a=max(max(x),abs(min(x))); #amplitud maximo de la señal
xq=cuantUniforme(x,a,n);

subplot(3,1,3);stem(t_s,xq,'k');axis([0 2*T_m]); title('F(t) cuantizada');xlabel('nT_s'); ylabel('x(nT_s)');

%------c. CODIFICACION--------



%-------d. REPRESENTACION DEL PULSO-------------------------------
y1=[];
y2=[];
y3=[];
y4=[];
y5=[];
y6=[];

f_s=100;
#Non Return to Zero
NRZ=ones(1,f_s);
#Return Zero
RZ= [ones(1,f_s/2) zeros(1,f_s/2)];
#Manchester
Man=[ones(1,f_s/2)  -ones(1,f_s/2)] ;

unipolar=0;
bipolar=-1;

y1=encoding(NRZ,unipolar,x_pcm);
y2=encoding(NRZ,bipolar,x_pcm);
y3=encoding(RZ,unipolar,x_pcm);
y4=encoding(RZ,bipolar,x_pcm);
y5=AMIRZ(RZ,x_pcm);
y6=encoding(Man,bipolar,x_pcm);

t1=(0:(length(y1)-1))/f_s;
t2=(0:(length(y2)-1))/f_s;
t3=(0:(length(y3)-1))/f_s;
t4=(0:(length(y4)-1))/f_s;
t5=(0:(length(y5)-1))/f_s;
t6=(0:(length(y6)-1))/f_s;
figure(2);
subplot(3,1,1);plot(t1,y1,'k');axis([0 100 -1.1 1.1]); title('Señal codificada unipolar NRZ');xlabel('nT_s'); ylabel('x(nT_s)');
subplot(3,1,2);plot(t2,y2,'k');axis([0 100 -1.1 1.1]); title('Señal codificada bipolar NRZ');xlabel('nT_s'); ylabel('x(nT_s)');
subplot(3,1,3);plot(t3,y3,'k');axis([0 100 -1.1 1.1]); title('Señal codificada unipolar RZ');xlabel('nT_s'); ylabel('x(nT_s)');
figure(3);
subplot(3,1,1);plot(t4,y4,'k');axis([0 100 -1.1 1.1]); title('Señal codificada Bipolar RZ');xlabel('nT_s'); ylabel('x(nT_s)');
subplot(3,1,2);plot(t5,y5,'k');axis([0 100 -1.1 1.1]); title('Señal codificada AMIRZ');xlabel('nT_s'); ylabel('x(nT_s)');
subplot(3,1,3);plot(t6,y6,'k');axis([0 100 -1.1 1.1]); title('Señal codificada Manchester');xlabel('nT_s'); ylabel('x(nT_s)');

%-------e. RECUPERAR M(T)---------

##x_recovered
##figure(4);
##plot(t_s,x_recovered); title('Recuperacion de la señal');

