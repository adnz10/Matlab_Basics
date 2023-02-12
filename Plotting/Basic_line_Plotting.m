clc,clear,close

a = 100;
b = 50;
[x,y] = meshgrid(0:300);
f = (x-100).^2./(a^2) + (y-100).^2./(b^2) <= 1;
f = flip(f,1);
imshow(f)


