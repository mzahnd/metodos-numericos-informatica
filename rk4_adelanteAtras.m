% Resolver ejercicio de RK4 con 2 pasos diferentes (h1 y h2)
%
% Cambiar precisión al imprimir float en las últimas líneas !!
f = @(t, y) 10-0.5*y-0.1*sin(y);
y0 = 0;

iab=[0, 3]; % Intervalo de integración
h = 0.1;

N = stepsNH(iab(1), iab(2), h);

% Adelante
[t1, y1] = rk4(f, iab(1), iab(2), y0, N);
% Atrás
[t2, y2] = rk4(f, iab(2), iab(1), y1(end), N);

% Cálculo del error en y(0) (obtenido del paso atrás)
errTf = abs(y2(end) - y0);
cotaErr = potenciaCotaError(errTf);

printf("OJO CON LA PRECISIÓN DEL PRINTF !!\n");
printf("N: %g\nh: %g\n", N, h);
printf("y(%g): %g\n", t2(end), y2(end));
printf("Error: %g (|E| < 1e%d)\n", errTf, cotaErr);

