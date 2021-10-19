% Busco raíz r > 1 de f en (a; a+1), con x_0 = a

f = @(x) 3*x*log(x)-2*x-2;
fp = @(x) 3*log(x) + 1;

cotaErr = 1e-7;

maxIters = 10;
maxA = 15;
% Empieza en 2 porque r > 1
for a=2:maxA
  printf("Calculando con a = %d ...\n", a);
  [r k E X] = newton(f, fp, a, cotaErr, maxIters);
  printf("r = %g\nk = %d\nErr = %g\n", r(end), k, E(end));
  printf("\n");

  if (r > a && r < (a+1))
    printf("!! r in (%d, %d) !!\n", a, a+1);
    printf("Si el ejercicio pide k, la respuesta es: %d\n", k);
    break;
  endif
endfor

