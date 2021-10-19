function [k, p0, err, E, X] = ptofijo(g,p0,tol,max1)
% Método de punto fijo
% Entrada
%  - g es la funcion iteradora como cadena de caracteres 'g'
%  - p0 es la aproximacion inicial a la raíz de f
%  - tol es la tolerancia para p0
%  - max1 es número maximo de iteraciones
% Salida
%  - p es la aproximación de Newton-Raphson para la raíz
%  - err es la estimación del error para p
%  - E es un vector con todos los errores
%  - k es el número de iteraciones
  E=zeros(1);
  X=[p0];

  %% Para el ejercicio con distancia a k cte.
  %n = 0;
  %k_prev=0;

  for k=1:max1
    p1 = feval(g,p0);
    err = abs(p1-p0);

    %% Distancia entre x_k y x_(k-1) es menor a 10^(-n)
    %if ( err < 10^(-1 * n) )
    %  printf("Cambia el orden de magnitud en k = %d\n", k);
    %  printf("k - k_prev = %d\n", k-k_prev);
    %  k_prev = k;
    %  n += 1;
    %endif
    
    p0 = p1;
    E = [E err];
    X = [X p0];
    if (err < tol)
      break;
    end
  endfor

  if k == max1
    warningmsg("Número máximo de iteraciones excedido.");
    p0 = NaN;
    k = NaN;
  endif
endfunction
