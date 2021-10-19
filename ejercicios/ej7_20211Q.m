% Busco raíz r > 1 de f en (a; a+1), con x_0 = a usando PUNTO FIJO

f = @(x) x*exp(-x) + 2*x - 9;
g = @(x) x - feval(f,x)/4;

cotaErr = 1e-4;

maxIters = 10;
maxA = 15;
% Empieza en 2 porque r > 1
for a=2:maxA
  if (maxIters > 50)
    printf("Demasiadas iteraciones. Seguro?");
  endif 

  printf("Calculando con a = %d ...\n", a);
  [k r err E X] = ptofijo(g, a, cotaErr, maxIters);
  printf("r = %g\nk = %d\nErr = %g\n", r(end), k, err);
  printf("\n");

  if (r > a && r < (a+1))
    printf("!! r in (%d, %d) !!\n", a, a+1);
    printf("Si el ejercicio pide k, la respuesta es: %d\n", k);
    break;
  endif

  if (isequaln(r,NaN) || isequaln(k, NaN))
    printf("Cambiando el número máximo de iteraciones de %d ", maxIters);
    maxIters *= 2;
    printf("a %d !!\n", maxIters);
    a = 2;
  endif
endfor

