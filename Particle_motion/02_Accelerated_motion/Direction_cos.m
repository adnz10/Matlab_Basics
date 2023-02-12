clc,clear,close all

%% Given
n = 1;
bounds = [0 20];
x = [0];
y = [0];
z = [0];
bx = bounds;
by = bounds;
bz = bounds;
V = [10];
dt = 0.1;
lx = 1/sqrt(3);  %% direction cosine cos(alpha)
my = 1/3^0.5;   %% direction cosine cos(beta)
nz = (1/3)^0.5; %% direction cosine cos(gamma)

%% initialize
h = initialize(x,y,z,bx,by,bz);

%% code
count = 1;
while count <=50
    [x,y,z,V] = const_vel_DC_state(x,y,z,h,V,dt,lx,my,nz,bx,by,bz);
    v(count,:) = [x' y' z'];
    count = count + 1;
end
