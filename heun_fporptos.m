% Funcion conocida por puntos con Heun
%
% Ej:
% f(0) = 1.002, f(0.1) = 0.922, f(0.2)=0.696, 
% f(0.3) = 0.564 y f(0.4) = 0.432
%
% Y me piden y(0.4)
%
% !! CAMBIAR PRECISIÓN EN EL PRINTF AL FINAL DEL ARCHIVO !!

iab = [0, 1];
h = 0.2;

fVALS=[0.356 0.468 0.694 0.784 0.852 0.882];
dy = @(t, y) fVALS(t * 5 + 1); % * 5 porque h = 0.2 (se calcula como 1/h)
y0 = 0;

N = stepsNH(iab(1), iab(2), h);

[T Y] = heun(dy, iab(1), iab(2), y0, N);

printf("OJO CON LA PRECISIÓN DEL PRINTF!!\n");% Comentar esta línea si está OK
printf("y(%d) = %.3f\n", iab(2), Y(end));

