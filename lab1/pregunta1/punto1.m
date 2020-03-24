clear;
pkg load signal;



n = 5;
T_0 = 2 * pi;
x = inline('square(t)', 't');

t = linspace(0, 2*pi);

plot(t, x(t));
xlabel('t');
ylabel('x(t)');
title('Combine Plots');

hold on

scatter(t, x_series(x, n, T_0, t));

hold off

