clear;
clc;
pkg load image;

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
P_y_x=[];
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
  P_y_x = [P_y_x;s];
endfor


% calcular [P(Y)] 

p_y = p_x * P_y_x;
p_y

% calcular[P(X,Y)]

diag(p_x)

P_x_y = diag(p_x) * P_y_x;
P_x_y

% calcular H(X) 

e_x = entropy(p_x);
e_x

% calcular H(Y|X) 

% calcular H(Y)

e_y = entropy(p_y);
e_y

% calcular H(X,Y) 

e_x_y = entropy (P_x_y);
e_x_y

% calcular I(X;Y).














