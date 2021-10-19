f = @(x) (x^5)/(exp(x)-1);
y0 = 0;
iab = [1, 4];
N1 = 10;
N2 = 20;

[T1 Y1] = rk4(f, iab(1), iab(2), y0, N1);
[T2 Y2] = rk4(f, iab(1), iab(2), y0, N2);

printf("Con %d pasos:\n\t\ty(%g)=%.5f\n", N1, T1(end), Y1(end));
printf("Con %d pasos:\n\t\ty(%g)=%.5f\n", N2, T2(end), Y2(end));
