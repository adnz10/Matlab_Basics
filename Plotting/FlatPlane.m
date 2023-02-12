clc,clear,close all

a = 1;
b = 0;
c = 0;
d = 3;
[x,y,z] = meshgrid(0:0.1:10);
f = a*x + b*y + c*z - d == 0;

v = single(f);



