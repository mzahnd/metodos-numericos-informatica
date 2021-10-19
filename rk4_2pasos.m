% Resolver ejercicio de RK4 con 2 pasos diferentes (h1 y h2)
%
% Cambiar precisión al imprimir float en las últimas líneas !!
%
f = @(t, y) 5-0.2*y-0.1*sin(y);
y0 = 0;

iab = [0;2]; % Intervalo de integración
h1 = 0.2;    % Primer paso
h2 = 0.1;    % Segundo paso

N1=stepsNH(iab(1), iab(2), h1);
N2=stepsNH(iab(1), iab(2), h2);

% Paso h1
[t1, y1] = rk4(f, iab(1), iab(2), y0, N1);
% Paso h2
[t2, y2] = rk4(f, iab(1), iab(2), y0, N2);

% Diferencia entre y1(end) y y2(end)
diffY1Y2 = abs(y2(end) - y1(end));
cotaDiffY1Y2 = potenciaCotaError(diffY1Y2);

printf("OJO CON LA PRECISIÓN DEL PRINTF !!\n");
printf("y1(%d) = %.6f\n", iab(2), y1(end));
printf("y2(%d) = %.6f\n", iab(2), y2(end));
printf("Diferencia entre ambas: %g (|dif| < 1e%d)\n", diffY1Y2, cotaDiffY1Y2);
