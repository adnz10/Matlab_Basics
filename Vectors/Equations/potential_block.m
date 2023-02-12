clc,clear,close all


[x,y,z] = meshgrid(-10:0.1:10);
a = [1,-1,0,0,0] ;
b = [0,0,1,-1,0] ;
c = [0,0,0,0,-1] ;
d = 5.*ones(size(a));

num = size(a,2);
r = 1;

above = zeros(size(x));
boon1 = zeros(size(x));
outer = zeros(size(x));
for n = 1:num
    macauly = (a(1,n).*x + b(1,n).*y + c(1,n).*z - d(1,n) - r);
    macauly(macauly <= 0) = 0;

    macauly1 = (a(1,n).*x + b(1,n).*y + c(1,n).*z - d(1,n));
    macauly1(macauly1 <= 0) = 0;

    macauly2 = (a(1,n).*x + b(1,n).*y + c(1,n).*z - d(1,n) + r);
    macauly2(macauly2 <= 0) = 0;

    above = macauly + above;
    boon1 = macauly2 + boon1;

    outer = macauly1 + outer;
end

f = above == 0 ;
fo = outer ==0;
isosurface(x,y,z,f)
hold on
isosurface(x,y,z,fo)

boon =  boon1.^2 == 0 ;

figure;
isosurface(x,y,z,f)



