f = @(t, y) 6-0.1*y(1)^3;
g = @(t, y) -1.8*y^2+0.03*y^5;
y0 = 0;

iab = [0, 1.04];
h = 0.08;
N = stepsNH(iab(1),iab(2),h);

[T Y] = taylor2h(f, g, iab(1), iab(2), y0, h);

printf("En [%g, %g]:\n", iab(1), iab(2));
printf("\ty(%g) = %.6f\n", T(1), Y(1));
printf("\ty(%g) = %.6f\n", T(2), Y(2));
printf("\ty(%g) = %.6f\n", T(3), Y(3));
printf("\ty(%g) = %.6f\n", T(4), Y(4));
printf("\ty(%g) = %.6f\n", T(5), Y(5));
printf("\tN = %g\n", N);
printf("\tk = %g\n", length(T)/h);
