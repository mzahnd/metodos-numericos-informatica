function [T Y]=taylor2h(f,g,a,b,ya,h) 
% Entradas 
% - a y b son los extremos del intervalo de integración 
% - ya es la condición inicial y(a) 
% - h: paso de integración
% Salida 
% - T es el vector de las abscisas e Y el 
% vector de la solución aproximada. 
N=round((b-a)/h); 
T=zeros(N+1,1); 
Y=zeros(N+1,length(ya)); 
T(1)=a; 
Y(1,:)=ya; 
for j=1:N 
  T(j+1)=T(j)+h;
  K1=h*feval(f,T(j),Y(j,:)); 
  K2=h^2/2*feval(g,T(j),Y(j,:)); 
  Y(j+1,:)=Y(j,:)+K1+K2; 
end 
end
