% El intervalo tiene que estar dado entre dos potencias de 2 consecutivas, es
% decir: [2^n, 2^(n+1)], con n natural.
% En caso contrario, el ejercicio no tendría sentido.

n = 2;
iab=[2^n, 2^(n+1)];

R = 0;
k = 0;
maxIters = 50; % Para evitar un loop infinito. Nunca debería llegar a esto
while (R == 0)
  R=(iab(1)+ k*eps - iab(1))/eps;
  k+=1;
  if (k >= maxIters)
    printf("Llegamos a k = %d. Todo en orden?\n", maxIters);
    break;
  endif
endwhile

disp(R);
