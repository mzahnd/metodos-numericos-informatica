% Ejercicio PUNTO FIJO en el que se pide cociente E_(k+1)/E_k
g = @(x) 10 - 5*(exp(-x/10));
p0 = 7;
cotaErr = 1e-3;

maxIters = 50;

[k, r, err, E, X] = ptofijo(g, p0, cotaErr, maxIters);

printf("OJO CON LA PRECISIÓN DEL PRINTF !!");
printf("r = %g\nk = %d\nE(%d)/E(%d) = %.4f\n", r, k, k, k-1, E(end)/E(end-1));
