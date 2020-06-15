% punto 1
clc;
clear;

pkg load communications;


% matriz de paridad definida en el laboratorio 
P = [1 0 1; 
     1 1 1;
     1 1 0];

# Ingresar  matriz de datos
ok = false;
while (~ok)
  try
    D = input("Ingrese matriz de datos D : ");
    
    [m k] = size(D);
    
    if (k != 3)
      printf("El tamaño del mensaje debe ser 3 en bloques (6,3)\n\n");
    elseif (sum(D(:) == 1 | D(:) == 0) != m*k)
      printf("La matriz debe ser binaria \n\n");
    else
      ok = true;  
    endif
  catch
    printf("Hubo un error al ingresar esa fila, vuelvelo a intentar\n\n");
  end_try_catch
endwhile


# Ingresar vector o matriz de errores
ok = false;
while (~ok)
  try
    e = input("Ingrese vector o matriz de errores e : ");
    
    [r n] = size(e);
    
    if (n != 6 || ((r != 1) & (r != m)))
      printf("El tamaño del mensaje debe ser (1, 6) o (%d, 6)\n\n", m);
    elseif (sum(e(:) == 1 | e(:) == 0) != r*n)
      printf("La matriz debe ser binaria \n\n");
    else
      ok = true;  
    endif
  catch
    printf("Hubo un error al ingresar esa fila, vuelvelo a intentar\n\n");
  end_try_catch
endwhile


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

printf("\n------------------------ \n\n");

% imprimir e
printf(" Matriz de errores e : \n");
disp(e);

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
