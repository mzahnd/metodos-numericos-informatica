f = @(t, y) 10-0.5*y-0.1*sin(y);
y0 = 0;
iab=[0, 3]; % Intervalo
h = 0.1;

% N a partir del paso
%N = (iab(2)-iab(1))/h;
N=stepsNH(iab(1), iab(2), h);

% Adelante
[t1, y1] = rk4(f, iab(1), iab(2), y0, N);
% Atrás
[t2, y2] = rk4(f, iab(2), iab(1), y1(end), N);

% Cálculo del error en y(0) (obtenido del paso atrás)
errTf = abs(y2(end) - y0);
cotaErr = floor(log10(errTf));
if cotaErr < 0
  cotaErr += 1;
else
  cotaErr -= 1;
endif

printf("Resultado: %g\nError: %g (|Er| < 1e%d)\n", y2(end), errTf, cotaErr)
printf("N: %g\nh: %g\n", N, h)

