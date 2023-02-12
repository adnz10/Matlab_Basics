clc,clear,close all

%% Given
R = 1;
[x1,y1,z1] = sphere(24);
x1 = R*x1(:)'+ 4;
y1 = R*y1(:)'+ 4;
z1 = R*z1(:)'+ 4;

% x1 = [8 8 ];
% y1 = [8 10 ];
% z1 = [10 10 ];

dist = 1;
n = 1;
m = length(x1);
TotalMass = [50];
M = ones(n,m+1).*TotalMass/m;
ti = 0;
dt = 0.01;
count = 210;
B = [1 1 1;
    7 7 7];
x = [x1];
x = center_mass(x);
y = [y1];
y = center_mass(y);
z = [z1];
z = center_mass(z);

Pv = [x y z];
u1 = 0*ones(1,size(x,2));
u = [u1];

theta = [0 90 0];
DCv = [cosd(theta(1,1)) cosd(theta(1,2)) sqrt(1-cosd(theta(1,1))^2 - cosd(theta(1,2))^2)];
a1 = 0*ones(1,size(x,2));
a = [a1];
thetaA = [0 90 0];
DCa = [cosd(thetaA(1,1)) cosd(thetaA(1,2)) sqrt(1-cosd(thetaA(1,1))^2 -cosd(thetaA(1,2))^2)];
wx = 3*ones(1,size(x,2));
wy = 3*ones(1,size(x,2));
wz = 3*ones(1,size(x,2));
w = [wx(1:end-1) 0 wy(1:end-1) 0 wz(1:end-1) 0];
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
