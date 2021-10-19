function [c,k,err] = biseccion(fun,a,b,prec,maxiter)
% Método de bisección
% Entrada
%  - fun: la funcion
%  - a, b: límites del intervalo [a; b]
%  - prec: máx precisión
%  - maxiter: núm. máx. de iteraciones
% Salida
%  - c: cero en [a; b]
%  - k: es el número de iteraciones
%  - err: es la estimación del error para 'c'
  fa = feval(fun,a);
  fb = feval(fun,b);
  if (fa*fb>0)
    printf("f(%d)*f(%d) > 0 !! No cumple con el T. de Bolzano.\n", a, b);
    c = NaN;
    return;
  endif
  err = (b-a)/2;
  c = (a+b)/2;
  k = 0;
  while (err > prec)*(k < maxiter)
    fc = feval(fun,c);
    if fa*fc > 0
      a  = c;
      fa = fc;
    else
      b  = c;
      fb = fc;
    endif
    err = (b-a)/2;
    c = (a+b)/2;
    k = k + 1;
  endwhile
endfunction
