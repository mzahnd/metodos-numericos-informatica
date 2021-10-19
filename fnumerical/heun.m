function [T Y]=heun(f,a,b,ya,N) 
% Entradas 
%  - a, b: extremos del intervalo de integración 
%  - ya: condición inicial y(a) 
%  - N: número de pasos 
% Salida 
%  - T: vector de las abscisas 
%  - Y: vector de la solución aproximada. 
  h=(b-a)/N; 
  T=zeros(N+1,1); 
  Y=zeros(N+1,length(ya)); 
  T(1)=a; 
  Y(1,:)=ya; 
  for j=1:N 
    T(j+1)=T(j)+h;
    K1=h*feval(f,T(j),Y(j,:)); 
    K2=h*feval(f,T(j+1),Y(j,:)+K1); 
    Y(j+1,:)=Y(j,:)+(K1+K2)/2; 
  endfor
endfunction
