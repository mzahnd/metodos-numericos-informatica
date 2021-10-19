% Raíces en el intervalo (a; a+1) usando bisección.
%
f = @(x) x*(x*(x + 2) - 5) - 4;

cotaErr = 1e-9;
maxIter = 50;

lastRoot = NaN;
maxA = 10;
for a=-10:maxA
  iab = [a, a+1];
  
  % Condición del T. de Bolzano
  if (feval(f, iab(1)) * feval(f, iab(2)) > 0)
    continue;
  endif

  % Bisección
  r = 0; k = 0; err = 0;
  [r, k, err] = biseccion(f, iab(1), iab(2), cotaErr, maxIter);
  
  potCotaErr = potenciaCotaError(err)

  if (isequaln(lastRoot, NaN) || ! (abs(lastRoot - r) < cotaErr))
    printf("Raíz en intervalo [%d, %d]\n", a, a+1);
    printf("\tr = %g\n\tk = %g\n", r, k);
    printf("\tE = %g (|E| < 1e%d)\n", err, potCotaErr);
    printf("\n");
    lastRoot = r;
  endif
endfor
