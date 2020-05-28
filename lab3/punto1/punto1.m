clear;
clc;

# ingresar simbolo entrada m
ok = false;
while (~ok)
  try
    m = input("Cuantos simbolos de entrada? m: ");
    
    if (mod(m, 1) == 0)
      ok = true;
    else
      printf("Se necesita un numero natural\n\n");
    endif
  catch
    printf("Se necesita un numero natural\n\n");
  end_try_catch
endwhile

# ingresar simbolo salida n
ok = false;
while (~ok)
  try
    n = input("Cuantos simbolos de salida? n: ");
    
    if (mod(n, 1) == 0)
      ok = true;
    else
      printf("Se necesita un numero natural\n\n");
    endif
  catch
    printf("Se necesita un numero natural\n\n");
  end_try_catch
endwhile


# Ingresar  vector probabilidad
ok = false;
while (~ok)
  try
    s = input("Ingrese vector probabilida [P(X)]: ","s");
    
    p_x = cellfun("str2num",strsplit(s," "));
    
    if (length(p_x) != m)
      printf("Son %d variables, vuelvelo a intentar\n\n", m);
    elseif (sum(p_x) != 1)
      printf("Las probabilidades no suman 1, volver a intentar\n\n", m);
    else
      ok = true;  
    endif
  catch
    printf("Hubo un error al ingresar esa fila, vuelvelo a intentar\n\n");
  end_try_catch
endwhile


# Ingresar matriz probabilidad
printf("\n\nIngresar la matrix de probabilidad [P(Y|X)]\n\n", m);
P_y_given_x = [];
for i=1: m
  ok = false;
  while (~ok)
    try
      v = input(strcat("Fila  ", num2str(i), " : "),"s");
      % split the string delimited by space and convert each string to number 
      s = cellfun("str2num",strsplit(v," "));
      
      if (length(s) != n)
        printf("Son %d variables, vuelvelo a intentar\n\n", n);
      elseif (sum(s) != 1)
        printf("Las probabilidades no suman 1, volver a intentar\n\n", m);
      else
        ok = true;  
      endif
    catch
      printf("Error al ingresar esa fila, vuelvelo a intentar\n\n");
    end_try_catch
  endwhile
  P_y_given_x = [P_y_given_x;s];
endfor

printf("\n------------------------ \n");
printf("-------- INPUTS -------- \n");
printf("------------------------ \n\n");

% imprimir P(X)
printf(" [P(X)] : \n");
disp(p_x);

printf("\n------------------------ \n\n");

% imprimir [P(Y|X)]
printf(" [P(Y|X)] : \n");
disp(P_y_given_x);

printf("\n------------------------ \n");
printf("------- OUTPUTS -------- \n");
printf("------------------------ \n\n");
% calcular [P(Y)] 


p_y = p_x * P_y_given_x;

printf(" Value of [P(Y)] : \n");
disp(p_y);

% calcular[P(X,Y)]
printf("\n------------------------ \n\n");

P_xy = diag(p_x) * P_y_given_x;

printf(" Value of [P(X,Y)] : \n");
disp(P_xy);

% calcular H(X) 
printf("\n------------------------ \n\n");

e_x = my_entropy(p_x);

printf(" Value of H(X) : ");
disp(e_x);

% calcular H(Y|X) 
printf("\n------------------------ \n\n");

e_y_given_x = my_conditional_entropy(P_xy, P_y_given_x);

printf(" Value of H(Y|X) : ");
disp(e_y_given_x);

% calcular H(Y)
printf("\n------------------------ \n\n");

e_y = my_entropy(p_y);

printf(" Value of H(Y) : ");
disp(e_y);

% calcular H(X,Y) 
printf("\n------------------------ \n\n");

e_xy = my_entropy (P_xy);

printf(" Value of H(X,Y) : ");
disp(e_xy);

% calcular I(X;Y) (ec 10.31).
printf("\n------------------------ \n\n");

i_xy = e_y - e_y_given_x;

printf(" Value of I(X;Y) : ");
disp(i_xy);

% calcular canal binario simetrico
printf("\n------------------------ \n\n");

if (all(size(P_y_given_x) == [2 2]) && P_y_given_x(1, 1) == P_y_given_x(2, 2))
  Cs = 1 - my_entropy (P_y_given_x(1, :));
  
  printf("Value of Cs : ");
  disp(Cs);
else
  printf("This is not a Binary Simmetric Chanel\n");
endif












