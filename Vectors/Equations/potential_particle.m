clc,clear,close all


[x,y,z] = meshgrid(-10:0.1:10);
a = [1,-1,0,0,0,0] ;
b = [0,0,1,-1,0,0] ;
c = [0,0,0,0,1,-1] ;
d = 3.*ones(size(a));

num = size(a,2);
r = 0.3;
R = 3;
k = 0.5;
above = zeros(size(x));
for n = 1:num
    macauly = (a(1,n).*x + b(1,n).*y + c(1,n).*z - d(1,n));
    macauly(macauly <= 0) = 0;
    above = macauly + above;
end

f1 = (1-k)*( ( above./ r ).^2 - 1) ;
f2 = k*((x.^2+y.^2+z.^2)./R.^2 - 1) ;
f = f1 + f2 <= 0 ;
isosurface(x,y,z,f)



