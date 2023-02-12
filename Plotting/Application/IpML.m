% function [N,C] = IpML(f,n)

clc,clear,close all

f = imread("D:/IMG_20220202_121445.jpg");
f = imrotate(f,90,'crop');
f1 = im2gray(f);
% imshow(f)
r = f(:,:,3);
r = abs(255-r);
bw = im2bw(r,0.1);
f1(bw~=1) = 0;
g = f1;

f = g;
f = imcrop(f,[114.5 1398.5 420 432]);
f = imresize(f,[400 400]);
for i = 1:5
    f = imfilter(f,fspecial("average",[10 10]));
end

% [gCanny_default,tc] = edge(f,'canny');
% gCanny_best = edge(f,'canny',tc);
% figure,imshow(gCanny_best)

gg = kmeans(double(f(:)),4);
ggg = reshape(gg,[400 400]);
fg = uint8(ggg);
figure;
imshow(fg==4)
