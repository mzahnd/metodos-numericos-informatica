% Euler : y_(k+1) = y_k + h*y'_k
%
% y'(t) = 10 - 0.1 * y(t) - 0.01 * y(t)^5
%  y(0) = 2
%
% y_(k+1) = A y_k + B + C y_k^5
% Quiero el límite de y_k cuando k->infty
f = @(t, y) 10 - 0.1*y - 0.01 * y^5;
y0 = 2;

% En este ejercicio el intervalo de integración se hace "a ojo" (el iab(2))
% para que de una cantidad de intervalos útil
% Lo importante es observar que los últimos valores de Y se empiecen a repetir.
% Ese será el límite.
iab = [0, 30];
h = 0.1;
cotaErr = 1e-3;
N = ceil(stepsNH(iab(1), iab(2), h))

[T Y] = euler(f, iab(1), iab(2), 1, N);
[T Y]
