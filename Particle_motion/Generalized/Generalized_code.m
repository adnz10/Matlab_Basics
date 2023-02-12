clc,clear,close all

%% Given
n = 2;
m = 2;
TotalMass = [5;
    5];
M = ones(n,m+1).*TotalMass/3;
ti = 0;
dt = 0.1;
count = 100;
B = [0 0 0;
    20 20 20];
x = [0 1; 
    10 11];
x = center_mass(x);
distx1 = abs(x(1,end)-x(1,end-1));
distx2 = abs(x(2,end)-x(2,end-1));
distx = abs(distx1+distx2);
y = [10 10; 
    10 10];
y = center_mass(y);
disty1 = abs(y(1,end)-y(1,end-1));
disty2 = abs(y(2,end)-y(2,end-1));
disty = abs(disty1+disty2);
dist = max(distx,disty);
z = [0 0; 
    0 0 ];
z = center_mass(z);
distz1 = abs(z(1,end)-z(1,end-1));
distz2 = abs(z(2,end)-z(2,end-1));
distz = abs(distz1+distz2);
dist = max(distz,dist);
Pv = [x y z];
u = [5 5 5;
    0 0 0];
theta = [0 0 0;
    0 0 0];
DCv = [cosd(theta(1)) cosd(90-theta(1)) cosd(90); 
    cosd(theta(2)) cosd(90-theta(2)) cosd(90)];
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
