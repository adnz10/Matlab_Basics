function f = PotentialParticle(n,N,Ac,sh,bound)

[x,y,z] = meshgrid(bound(1):bound(2));
f = zeros(size(x));
x = x-sh(1);
y = y-sh(2);
z = z-sh(3);
for i = 1:n
    f1 = N(1,i)*x + N(2,i)*y + N(3,i)*z - N(4,i);
    f1(f1<=0) = 0;    % Macaulay brackets;
    f = f + f1;
end
f = (1-Ac(2))*( (f/Ac(1)).^2 -1) + Ac(2) * ((x.^2 +y.^2 + z.^2)/Ac(3)^2 -1);
f = f <= 0;
isosurface(x,y,z,f)

grid on
set(gca,'xlim',bound,'ylim',bound,'zlim',bound)
xlabel('X Axis')
ylabel('Y Axis')
zlabel('Z Axis')
title('Bodies')