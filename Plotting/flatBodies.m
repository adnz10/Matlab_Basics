function f = flatBodies(n,a,b,c,d,range)

[x,y,z] = meshgrid(range);
f = zeros(size(x));

for i = 1:n
    f1 = a(1,i)*x + b(1,i)*y +c(1,i)*z - d(1,i);
    f1(f1<=0) = 0;    % Macaulay brackets;
    f = f + f1;
end
f = f == 0;
isosurface(x,y,z,f)

grid on
xlabel('X Axis')
ylabel('Y Axis')
zlabel('Z Axis')
title('Flat Bodies')