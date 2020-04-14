clear

%Lectura de input y variables
fid = fopen('input.txt');
tline = fgetl(fid);
tline = fgetl(fid);
in = [];

while ischar(tline)
    [num, status] = str2num(tline);

    if status
        in = [in, num];
    else
        fprintf("Favor ingresar un numero valido \ n");
        return
    end

    tline = fgetl(fid);
    tline = fgetl(fid);
end

fclose(fid);
ancho = in(1);

T = in(2);
Ts = in(3);

W0 = in(4);
W01 = in(5);
W02 = in(6);

%Tiempo
tiempo = (-T:Ts:T);
%Frecuencia
frec = tiempo(1:2:end);

%Funciones

%Funcion señal rectangular sobre tiempo

X = zeros(1, length(tiempo));

for i = 1:length(tiempo)

    if abs(tiempo(i)) <= ancho
        X(i) = 1;
    end

end

%Funcion senal rectangular sobre frecuencia
frecAnch = frec .* ancho;
sa = 1;
  if frecAnch ~= 0
    sa=sin(frecAnch)./frecAnch;
  end
  
ref = 2 * ancho * sa;
%Pasar al dominio de la frecuencia para poder aplicar los filtros
temp = fftshift(fft(X) * Ts);
aplf = temp(1:2:end);

%Filtros

%Se multiplican las funciones termino a termino para aplicar el filtro

%Filtro pasa bajas en frecuencia
FilPBJF = ref .* FilPBJF(frec, W0);

%Pasar al dominio del tiempo con la ifft(x)
IfftPBJT = ifftshift(ifft(FilPBJF));

%Filtro pasa altas en frecuencia
FiltPAF = ref .* FiltPAF(frec, W0);

%Pasar al dominio del tiempo con la ifft(x)
IfftPAT = ifftshift(ifft(FiltPAF));

%Filtro pasa bandas en frecuencia
FiltPBDF = ref .* FiltPBDF(frec, W01, W02);
IfftPBDT = ifftshift(ifft(FiltPBDF));

%Filtro suprime bandas en frecuencia
FiltSPBF = ref .* FiltSPBF(frec, W01, W02);
IfftSPBF = ifftshift(ifft(FiltSPBF));


%Graficas

%Transformada con FFT y analitica
figure('name', 'Punto 1');
plot(frec, aplf);
hold on
plot(frec, ref);
legend('FFT', 'Analitica')
title("Transformada con FFT y analitica");
grid;


figure('name', 'Original y pasa bajas');
%Filtro pasa bajas en tiempo
subplot(2, 1, 1);
plot(tiempo, X);
hold on
plot(frec, abs(IfftPBJT));
xlabel("t");
ylabel("X(w)");
title("Filtro pasa bajas y funcion original en tiempo");
legend('Original', 'Pasa bajas')
grid;

%Filtro pasa bajas en frecuencia
subplot(2, 1, 2);
plot(frec, ref);
hold on
plot(frec, abs(FilPBJF));
xlabel("w");
ylabel("X(w)");
legend('Original', 'Pasa bajas')
title("Filtro pasa bajas y funcion original en frecuencia");

grid;


figure('name', 'Original y pasa altas');
%Filtro pasa altas en tiempo
subplot(2, 1, 1);
plot(tiempo, X);
hold on
plot(frec, abs(IfftPAT))
xlabel("t");
ylabel("X(w)");
grid;
legend('Original', 'Pasa altas')
title("Filtro pasa altas y funcion original en tiempo")
%Filtro pasa altas en frecuencia
subplot(2, 1, 2);
plot(frec, ref);
hold on
plot(frec, abs(FiltPAF));
xlabel("w");
ylabel("X(w)");
grid;
legend('Original', 'Pasa altas')
title("Filtro pasa altas y funcion original en frecuencia")


figure('name', 'Original y pasa bandas');
%Filtro pasa bandas en tiempo
subplot(2, 1, 1);
plot(tiempo, X)
hold on
plot(frec, abs(IfftPBDT));
xlabel("w");
ylabel("X(w)");
legend('Original', 'Pasa bandas')
title("Funcion original y pasa bandas en tiempo");
grid;

%Filtro pasa bandas en frecuencia
subplot(2, 1, 2);
plot(frec, ref);
hold on
plot(frec, abs(FiltPBDF));
xlabel("w");
ylabel("X(w)");
legend('Original', 'Pasa bandas')
title("Funcion original y pasa bandas en frecuencia");
grid;


figure('name', 'Original y suprime bandas');
%Filtro suprime bandas en tiempo
subplot(2, 1, 1);
plot(tiempo, X);
hold on
plot(frec, abs(IfftSPBF));
xlabel("w");
ylabel("X(w)");
legend('Original', 'Suprime bandas')
title("Funcion original y suprime bandas en tiempo");
grid;

%Filtro suprime bandas en frencuencia
subplot(2, 1, 2)
plot(frec, ref);
hold on
plot(frec, abs(FiltSPBF));
xlabel("w");
ylabel("X(w)");
legend('Original', 'Suprime bandas')
title("Funcion original y suprime bandas en frecuencia");
