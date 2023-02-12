clc,clear,close all

[x,y,z] = meshgrid(-10:10);
a = 1;
b = 0;
c = 0;
R = 5;
surf1 = a.*x + b.*y + c.*z <= R;
surf2 = (a-1).*x + (b+1).*y + c.*z <= R;
surf3 = -a.*x + b.*y + c.*z <= R;
surf4 = (a-1).*x + -(b+1).*y + c.*z <= R;
spheres = x.^2 + y.^2 + z.^2 <= R.^2;

% isosurface(x,y,z,spheres,1e-5)
% 
% hold on 
% isosurface(x,y,z,surf1)
% isosurface(x,y,z,surf2)
% isosurface(x,y,z,surf3)
% isosurface(x,y,z,surf4)


surfi = surf1+spheres;
isosurface(x,y,z,surfi)