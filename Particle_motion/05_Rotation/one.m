clc,clear,close all

%% Given
R = 1;
[x1,y1,z1] = sphere(24);
x1 = R*x1(:)'+2;
y1 = R*y1(:)'+10;
z1 = R*z1(:)'+10;
% x1 = [8 8 10 10 8 8 10 10 8 8 10 10];
% y1 = [8 10 8 10 8 10 8 10 8 10 8 10];
% z1 = [10 10 10 10 12 12 12 12 8 8 8 8];

dist = 1;
n = 1;
m = length(x1);
TotalMass = [50];
M = ones(n,m+1).*TotalMass/m;
ti = 0;
dt = 0.01;
count = 55;
B = [0 5 5;
    15 15 15];
x = [x1];
x = center_mass(x);
y = [y1];
y = center_mass(y);
z = [z1];
z = center_mass(z);

Pv = [x y z];
u1 = 5*ones(1,size(x,2));
u = [u1];

theta = [0 90 0];
DCv = [cosd(theta(1,1)) cosd(theta(1,2)) sqrt(1-cosd(theta(1,1))^2 - cosd(theta(1,2))^2)];
a1 = 0*ones(1,size(x,2));
a = [a1];
thetaA = [0 90 0];
DCa = [cosd(thetaA(1,1)) cosd(thetaA(1,2)) sqrt(1-cosd(thetaA(1,1))^2 -cosd(thetaA(1,2))^2)];
wx = 5*ones(1,size(x,2));
wy = 5*ones(1,size(x,2));
wz = 5*ones(1,size(x,2));
w = [wx(1:end-1) 0; wy(1:end-1) 0;wz(1:end-1) 0]';
w_theta = zeros(m+1,3);
w_Rad = zeros(m+1,3);
for Q = 1:m
    qdx = x(1,Q)-x(1,end);
    qdy = y(1,Q)-y(1,end);
    qdz = z(1,Q)-z(1,end);
    w_theta(Q,1:3) = [atan2(qdz,qdy) atan2(qdz,qdx) atan2(qdx,qdy)];
    w_Rad(Q,1:3) = [sqrt(qdy^2+qdz^2) sqrt(qdz^2+qdx^2) sqrt(qdx^2+qdy^2)];

end
%% Initial state
h = initial_state(x,y,z,B);

%% state
for i = 1:count

    [Pv,t,u,a,DCv,DCa,w_theta] = state(Pv,ti,dt,u,a,DCv,DCa,B,h,M,dist,m,n, w,w_Rad,w_theta);
    ti = t;
    count = count + 1;
end
