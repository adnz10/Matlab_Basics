function g = extractGrain(f,n)

f = imread("D:/IMG_20220202_121445.jpg");
f = imrotate(f,90,'crop');
f1 = im2gray(f);
% imshow(f)
r = f(:,:,3);
r = abs(255-r);
bw = im2bw(r,0.1);
f1(bw~=1) = 0;
g = f1;

