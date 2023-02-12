clc,clear,close all

%% Given
R1 = 1;
[x1,y1,z1] = sphere(6);
x1 = R1*x1(:)'+2;
y1 = R1*y1(:)'+10;
z1 = R1*z1(:)'+10;

R2 = 1;
[x2,y2,z2] = sphere(6);
x2 = R2*x2(:)'+12;
y2 = R2*y2(:)'+10;
z2 = R2*z2(:)'+10;


% x1 = [8 8 ];
% y1 = [8 10 ];
% z1 = [10 10 ];
% x2 = [12 12 ];
% y2 = [8 10 ];
% z2 = [10 10 ];

dist = R1;
n = 2;
m = length(x1);
TotalMass = [50;
    50];
M = ones(n,m+1).*TotalMass/m;
ti = 0;
dt = 0.01;
count = 600;
B = [0 0 0;
    20 20 20];
x = [x1;
    x2];
x = center_mass(x);
y = [y1;
    y2];
y = center_mass(y);
z = [z1;
    z2];
z = center_mass(z);

Pv = [x y z];
u1 = 5*ones(1,size(x,2));
u2 = 0*ones(1,size(x,2));
u = [u1;
    u2];

theta = [0 90 0;
    0 90 0];
DCv = [cosd(theta(1,1)) cosd(theta(1,2)) sqrt(1-cosd(theta(1,1))^2 - cosd(theta(1,2))^2);
    cosd(theta(2,1)) cosd(theta(2,2)) sqrt(1-cosd(theta(2,1))^2 - cosd(theta(2,2))^2)];
a1 = 0*ones(1,size(x,2));
a2 = 0*ones(1,size(x,2));
a = [a1;
    a2];
thetaA = [0 90 0;
    0 90 0];
DCa = [cosd(thetaA(1,1)) cosd(thetaA(1,2)) sqrt(1-cosd(thetaA(1,1))^2 -cosd(thetaA(1,2))^2);
    cosd(thetaA(2,1)) cosd(thetaA(2,2)) sqrt(1-cosd(thetaA(2,1))^2 -cosd(thetaA(2,2))^2)];
wx1 = 5*ones(1,size(x,2));
wx2 = -5*ones(1,size(x,2));
wy1 = 5*ones(1,size(x,2));
wy2 = 0*ones(1,size(x,2));
wz1 = 5*ones(1,size(x,2));
wz2 = -5*ones(1,size(x,2));

w = [wx1(1:end-1) 0 wy1(1:end-1) 0 wz1(1:end-1) 0;
    wx2(1:end-1) 0 wy2(1:end-1) 0 wz2(1:end-1) 0];
qdx = x-x(:,end);
qdy = y-y(:,end);
qdz = z-z(:,end);
w_theta = [atan2(qdz,qdy) atan2(qdz,qdx) atan2(qdx,qdy)];
w_Rad = [sqrt(qdy.^2+qdz.^2) sqrt(qdz.^2+qdx.^2) sqrt(qdx.^2+qdy.^2)];

%% Initial state
h = initial_state(x,y,z,B);

%% state
for i = 1:count

    [Pv,t,u,a,DCv,DCa,w_theta] = state(Pv,ti,dt,u,a,DCv,DCa,B,h,M,dist,m,n, w,w_Rad,w_theta);
    ti = t;
    count = count + 1;
end
