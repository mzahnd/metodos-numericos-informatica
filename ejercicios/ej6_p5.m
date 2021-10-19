% PVI con y''(t) a resolver con Taylor 2

iab = [0, 0.5]; % Intervalo
h = 0.1;        % Paso de integración

N = stepsNH(iab(1), iab(2), h); % Num. pasos

% Y_(k+1) = Y_k + h * F(t_k, Y_k) + h^2/2 * F'(t_k, Y_k)
%
% Y  = [ y(t)  , y'(t)   ] -> Y(1) = y(t) ; Y(2) = y'(t)
% F  = [ y'(t) , y''(t)  ]
% F' = [ y''(t), y'''(t) ]
%
f  = @(t, Y) [ Y(2), -0.1*(Y(1))^3]; % F
fp = @(t, Y) [-0.1*(Y(1))^3, -0.3*(Y(1)^2)]; % F'
y0  = 1; % y(t=0)
dy0 = 1; % y'(t=0)

[T Y] = taylor2(f, fp, iab(1), iab(2), [y0, dy0], N);

printf("OJO CON LA PRECISIÓN DEL PRINTF!!\n");% Comentar esta línea si está OK
printf(" y(%.2f) = %.3f\n", T(end), Y(end,1));
printf("y'(%.2f) = %.3f\n", T(end), Y(end,2));

