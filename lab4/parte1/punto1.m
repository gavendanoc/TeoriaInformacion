% punto 1
clc;
clear;

pkg load communications

P = [1 0 1; 
     1 1 1;
     1 1 0];
     
     
D = [0 1 0;
    0 0 1;
    0 1 1;
    0 1 1;
    1 0 0; 
    1 0 1;
    1 1 1;
    1 1 1];

e = [ 0 0 0 0 0 0;  
      0 1 0 0 0 0;  
      0 0 1 0 0 0;  
      0 0 0 1 0 0;  
      0 0 0 0 1 0;  
      0 0 0 0 0 1;  
      0 0 0 0 1 0;  
      0 0 0 1 0 0;];


C = encoder(P, D);
R = dmc(C, e);
[C_decoded, S, errors, D_decoded] = decoder(P, R);


printf("\n------------------------ \n");
printf("------ ENTRADAS -------- \n");
printf("------------------------ \n\n");

% imprimir D
printf(" Matriz de datos D : \n");
disp(D);

printf("\n------------------------ \n\n");

% imprimir P
printf(" Matriz de paridad P : \n");
disp(P);

printf("\n------------------------ \n");
printf("---- CODIFICADOR ------- \n");
printf("------------------------ \n\n");


% imprimir C
printf(" Matriz de codificacion C: \n");
disp(C);

printf("\n------------------------ \n");
printf("---- DECODIFICADOR ----- \n");
printf("------------------------ \n\n");

% imprimir R
printf(" Palabras recibidas R : \n");
disp(R);

printf("\n------------------------ \n\n");

% imprimir posicion bit con error
for i = 1:size(errors)(1)
  if errors(i) == 0
    printf("Palabra %d : No se detecto error\n", i);
  else
    printf("Palabra %d : Se detecto un error en el bit %d\n", i, errors(i));
  endif
endfor

printf("\n------------------------ \n\n");

% imprimir C_decoded
printf(" Matriz de codigo corregida : \n");
disp(C_decoded);

printf("\n------------------------ \n\n");

% imprimir D_decoded
printf(" Matriz de datos decodificada : \n");
disp(D_decoded);
