clc,clear,close all

[x,y,z] = meshgrid(-10:10);

a = 1;
b = 0;
c = 0;

d = 5;
r = 1;
R = 5;

sq = 2;
sq2 = 2;

k = 0.5;

surf1 = (1-k)*((a.*x + b.*y + c.*z -d).^sq - r.^sq2) == 0;
surf2 = (1-k)*(((a-1).*x + (b+1).*y + c.*z -d).^sq- r.^sq2) == 0;
surf3 = (1-k)*((-a.*x + b.*y + c.*z -d).^sq - r.^sq2) == 0;
surf4 = (1-k)*(((a-1).*x + -(b+1).*y + c.*z -d).^sq - r.^sq2) == 0;

spheres = k*(x.^2 + y.^2 + z.^2- R.^2) <= 0;

surfi = surf1+surf2+surf3+surf4+spheres;


% isosurface(x,y,z,surfi)
% 
isosurface(x,y,z,surf1)
% hold on
% isosurface(x,y,z,surf2)
% isosurface(x,y,z,surf3)
% isosurface(x,y,z,surf4)


