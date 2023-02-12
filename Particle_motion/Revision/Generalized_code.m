clc,clear,close all

%% Given
ti = 0;
dt = 0.1;
count = 50;
n = 1;
bounds = [0;20];
bx = bounds;
by = bounds;
bz = bounds;
B = [bx by bz];
x = randi([bounds],[n 1]);
y = randi([bounds],[n 1]);
z = randi([bounds],[n 1]);
Pv = [x y z];
U = 0;
u = U*ones(size(x));
DCv = [0 0 1];
A = -9.81;
a = A*ones(size(x));
DCa = [0 0 1];

%% Initial state
h = initial_state(x,y,z,B);

%% state
for i = 1:count
    [Pv,t,u,a] = state(Pv,ti,dt,u,a,DCv,DCa,B,h);
    ti = t;
    count = count + 1;
end





