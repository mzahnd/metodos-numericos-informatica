% Busco raíz r > 1 de f en (a; a+1), con x_0 = a usando PUNTO FIJO

f = @(x) x^3 - 9;

cotaErr = 1e-3;

maxIters = 10;
maxA = 15;
% Empieza en 2 porque r > 1
% for a=2:maxA
%   printf("Calculando con a = %d ...\n", a);
%   [k r err E X] = ptofijo(g, a, cotaErr, maxIters);
%   printf("r = %g\nk = %d\nErr = %g\n", r(end), k, err);
%   printf("\n");
% 
%   if (r > a && r < (a+1))
%     printf("!! r in (%d, %d) !!\n", a, a+1);
%     printf("Si el ejercicio pide k, la respuesta es: %d\n", k);
%     break;
%   endif
% endfor

% Empieza en 2 porque r > 1
for a=2:maxA
  p0 = a;
  E=zeros(1);
  X=[p0];

  for k=1:maxIters
    p1 = sqrt(1 + 9/p0); % Consigna
    err = abs(p1 - p0);
    p0 = p1;
    E = [E err];
    X = [X p0];
    if (err < cotaErr)
      break;
    endif
  endfor

  printf("r = %g\nk = %d\nErr = %g\n", r(end), k, err);
  printf("\n");
  
  if (r > a && r < (a+1))
    printf("!! r in (%d, %d) !!\n", a, a+1);
    printf("Si el ejercicio pide k, la respuesta es: %d\n", k);
    break;
  endif

endfor

