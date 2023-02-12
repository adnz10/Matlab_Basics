function [x,y] = concentricCircle(i)

[x, y] = meshgrid(0:19);
f1 = (x-10).^2 + (y-10).^2 == i^2;
[x,y] = find(f1==1);