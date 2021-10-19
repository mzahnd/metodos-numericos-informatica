function pot = potenciaCotaError(err)
% Potencia de 10 que acota al error.
% Entrada:
%  - err: Error
% Salida:
%  - pot: Potencia (entero)
%
% Por ejemplo, si el error es 1.2545e-6, la función devuelve -5 pues la cota
% es E < 1e-5
% Si fuera 3.2145e8, la función devuelve 9, así E < 1e9
%
  pot = 1 + floor(log10(err));
endfunction
