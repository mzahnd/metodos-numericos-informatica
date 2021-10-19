% Busco raíz r > 1 de f en (a; a+1), con x_0 = a usando PUNTO FIJO

f = @(x) x*exp(-x) + 2*x - 9;
g = @(x) x - feval(f,x)/4;

cotaErr = 1e-4;

maxIters = 10;
maxA = 15;
% Empieza en 2 porque r > 1
initA = 2;
for a=initA:maxA
  if (maxIters > 50)
    printf("Demasiadas iteraciones. Seguro?");
  endif 

  printf("Calculando con a = %d ...\n", a);
  [k r err E X] = ptofijo(g, a, cotaErr, maxIters);
  potCotaError = potenciaCotaError(err);

  printf("Raíz en el intervalo [%d, %d]\n", a, a+1);
  printf("\tr = %g\n\tk = %g\n", r, k);
  printf("\tErr = %g (|E| < 1e%d)\n", err, potCotaError);
  printf("\n");

  if (r > a && r < (a+1))
    printf("!! Encontramos la raíz en [%d, %d] !!\n", a, a+1);
    printf("Si el ejercicio pide k, la respuesta es: %d\n", k);
    break;
  endif

  if (isequaln(r,NaN) || isequaln(k, NaN))
    maxIters *= 2;
    warningmsg(
        sprintf(
        "Cambiando el número máximo de iteraciones de %d a %d !!", 
        maxIters/2, maxIters
        )
    );
    % Reiniciamos a
    a = initA;
  endif
endfor

