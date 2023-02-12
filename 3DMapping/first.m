clc,clear,close all

book = xlsread("book.xlsx");
ax = book(:,1);
ay = book(:,2);
az = book(:,3);

ax = int64(100*(ax - min(ax(:))) / (max(ax(:))- min(ax(:))));
ax(ax==0) = 1;

ay = int64(100*(ay - min(ay(:))) / (max(ay(:))- min(ay(:))));
ay(ay==0) = 1;

az = 1000*(az - min(az(:))) / (max(az(:))- min(az(:)));

for i = 1:size(ax,1)
    EM(ax(i),ay(i)) = az(i);
end

z = uint8(EM);
z = flip(z,1);

for j = 1:10
    z = imfilter(z,fspecial("average",[10 10]));
end

[x,y]  = meshgrid(1:100);
% surf(x,y,z)

f = imread("Screenshot (25).png");
f = imcrop(f,[638.5 92.5 714 549]);
f = imresize(f,[100 100]);

warp(x,y,z,f)
