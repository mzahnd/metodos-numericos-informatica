function [x0 k E X]=newton(f,fp,x0,prec,M)
% Entradas 
%  - f: funcion a evaluar
%  - fp: derivada de f
%  - x0: aprox. inicial de la raíz de f
%  - prec: cota del error
%  - M: número máx de iteraciones
% Salida 
%  - x0: aprox. para la raíz
%  - k: número de iteraciones
%  - E: estamación del error para x0
%  - X: valores calculados
%
  e = 1; k = 0; X = x0; E = [];
  while (e > prec) * (k <= M)
    x  = x0 - feval(f, x0)/feval(fp, x0);
    e  = abs(x-x0); 
    E  = [E; e];
    x0 = x;
    k  = k + 1;
    X  = [X; x0];
  end
end
