function [t Y]=taylor1a4(f1,f2,f3,f4,a,b,y0,N)
  h=(b-a)/N;
  t=zeros(N+1,1);t(1)=a;
  Y=zeros(N+1,4);Y(1,:)=y0*ones(1,4);
  for k=1:N
    t(k+1)=t(k)+h;
    Y(k+1,1)=Y(k,1)+h*f1(t(k),Y(k,1));
    Y(k+1,2)=Y(k,2)+h*f1(t(k),Y(k,2))+h^2/2*f2(t(k),Y(k,2));
    Y(k+1,3)=Y(k,3)+h*f1(t(k),Y(k,3))+h^2/2*f2(t(k),Y(k,3))+h^3/6*f3(t(k),Y(k,3));
    Y(k+1,4)=Y(k,4)+h*f1(t(k),Y(k,4))+h^2/2*f2(t(k),Y(k,4))+h^3/6*f3(t(k),Y(k,3))+h^4/24*f4(t(k),Y(k,4));
    end