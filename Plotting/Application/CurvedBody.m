clc,clear,close all

f = imread("IMG_20220202_121445.jpg");
g = extractGrain(f,1);imshow(g)
[N,C] = IpML(g,3)












% a = [1 0 0];
% a = [a -a];
% b = [0 1 0];
% b = [b -b];
% c = [0 0 1];
% c = [c -c];
% d = 3*ones(size(a));
% xc = 5;
% yc = 5;
% zc = 0;
% 
% %% Potential Particle
% bound = [-10 10];
% n = size(a,2);
% r = 0.3;
% k = 0;
% R = 3;
% C = [xc;yc;zc];
% N = [a;b;c;d];
% Ac = [r;k;R];
% 
% f = PotentialParticle(n,N,Ac,C,bound);

