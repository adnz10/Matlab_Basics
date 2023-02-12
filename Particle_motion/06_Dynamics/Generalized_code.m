clc,clear,close all

%% Given
M = [5;5];
ti = 0;
dt = 0.1;
count = 50;
n = 2;
bounds = [0;20];
bx = bounds;
by = bounds;
bz = bounds;
B = [bx by bz];
x = [0 ; 10];
y = [10; 10];
z = [0 ; 0];
Pv = [x y z];
% U = 0;
u = [5;0];
DCv = [cosd(0) cosd(90) cosd(90); cosd(90) cosd(90) cosd(90)];
A = 0;
a = A*ones(size(x));
DCa = [0 0 1];
theta2_ = 30;
%% Initial state
h = initial_state(x,y,z,B);

%% state
for i = 1:count
    [Pv,t,u,a,DCv] = state(Pv,ti,dt,u,a,DCv,DCa,B,h,M,theta2_);
    ti = t;
    count = count + 1;
end





