clc,clear,close all

r = 0.3;
k = 0.1;
R = 3;
a = [1 0 0];
a = [a -a];
b = [0 1 0];
b = [b -b];
c = [0 0 1];
c = [c -c];
d = 3*ones(size(a));
n = size(a,2);

f = PotentialParticle(n,a,b,c,d,-10:0.1:10,r,k,R);

