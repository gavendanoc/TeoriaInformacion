clear;
pkg load signal;

% ingresar la funcion
ok = false;
while (~ok)
  try
    fun = input("Ingrese la funcion f(t)= ","s");
    x = inline(fun,'t');#crea la funcion
    ok = true;
  catch
    printf("Favor ingresar una funcion apropiada\n");
  end_try_catch
endwhile


# ingresar T_0
ok=false;
while (~ok)
  try
    T_0 = input("Ingrese el periodo: ");
    ok  = true;
  catch
    printf("Favor ingresar un numero\n");
  end_try_catch
endwhile

# ingresar N
ok=false;
while (~ok)
  try
    n = input("Ingrese n: ");
    if (floor(n) != n)
      printf("Favor ingresar un numero entero\n");
    else
      ok = true;
    endif
  catch
    printf("Favor ingresar un numero entero\n");
  end_try_catch
endwhile


t = linspace(-2 * T_0, 2 * T_0, 500);

plot(t, x(t));
xlabel('t');
ylabel('y');
title('Combine Plots x(t), x_n(t)');

hold on

plot(t, x_series(x, n, T_0, t));

hold off

legend("x(t)", "X_n(t)");

