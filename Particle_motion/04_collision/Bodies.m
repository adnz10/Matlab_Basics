clc,clear,close all

%% Given
Radius = 1;
[x1,y1,z1] = sphere(24);
x2 = Radius*x1(:)'+ 10;
y2 = Radius*y1(:)'+ 10;
z2 = Radius*z1(:)'+ 10;

x1 = Radius*x1(:)'+ 2;
y1 = Radius*y1(:)'+ 10;
z1 = Radius*z1(:)'+ 10;

n = 2;
m = length(x1);
TotalMass = [100;
    100];
M = ones(n,m+1).*TotalMass/m;
ti = 0;
dt = 0.1;
count = 100;
B = [0 0 0;
    20 20 20];
x = [x1; 
    x2];
x = center_mass(x);
distx1 = abs(x(1,end)-x(1,end-1));
distx2 = abs(x(2,end)-x(2,end-1));
distx = abs(distx1+distx2);
y = [y1; 
    y2];
y = center_mass(y);
disty1 = abs(y(1,end)-y(1,end-1));
disty2 = abs(y(2,end)-y(2,end-1));
disty = abs(disty1+disty2);
dist = max(distx,disty);
z = [z1; 
    z2];
z = center_mass(z);
distz1 = abs(z(1,end)-z(1,end-1));
distz2 = abs(z(2,end)-z(2,end-1));
distz = abs(distz1+distz2);
dist = max(distz,dist);
Pv = [x y z];
u1 = 5*ones(1,size(x,2));
u2 = 0*ones(1,size(x,2));
u = [u1;
    u2];

theta = [0 0 0;
    0 0 0];
DCv = [cosd(theta(1,1)) cosd(90-theta(1,1)) cosd(90); 
    cosd(theta(2,1)) cosd(90-theta(2,1)) cosd(90)];
a = [0 0 0;
    0 0 0];
thetaA = [0 0 0;
    0 0 0];
DCa = [cosd(thetaA(1)) cosd(90-thetaA(1)) cosd(90); 
    cosd(thetaA(2)) cosd(90-thetaA(2)) cosd(90)];

%% Initial state
h = initial_state(x,y,z,B);

%% state
for i = 1:count
    [Pv,t,u,a,DCv] = state(Pv,ti,dt,u,a,DCv,DCa,B,h,M,dist,m);
    ti = t;
    count = count + 1;
end
