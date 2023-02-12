clc,clear,close all

%% Given

x1 = 2;
y1 = 10;
z1 = 10;

x2 = x1+2;
y2 = y1 +2;
z2 = z1+2;


n = 2;
m = length(x1);
TotalMass = [50;
    50];
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
a1 = 0*ones(1,size(x,2));
a2 = 0*ones(1,size(x,2));
a = [a1;
    a2];
thetaA = [0 0 0;
    0 0 0];
DCa = [cosd(thetaA(1,1)) cosd(90-thetaA(1,1)) cosd(90); 
    cosd(thetaA(2,1)) cosd(90-thetaA(2,1)) cosd(90)];

%% Initial state
h = initial_state(x,y,z,B);

%% state
for i = 1:count
    [Pv,t,u,a,DCv] = state(Pv,ti,dt,u,a,DCv,DCa,B,h,M,dist,m);
    ti = t;
    count = count + 1;
end
