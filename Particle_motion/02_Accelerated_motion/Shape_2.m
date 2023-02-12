clc,clear,close all

%% Given
n = 1;
bounds = [0 20];
x = [10 10 10];
x = center_mass(x);
y = [10 10 10];
y = center_mass(y);
z = [20 10 13];
z = center_mass(z);
bx = bounds;
by = bounds;
bz = bounds;
V = -1*[5 5 5 5];
dt = 0.1*ones(size(x));
lx = 0;  %% direction cosine cos(alpha)
my = 0;   %% direction cosine cos(beta)
nz = (1/3)^0.5; %% direction cosine cos(gamma)

%% initialize
h = initialize(x,y,z,bx,by,bz);

%% code
count = 1;
while count <=50
    [x,y,z,V] = Shape_state(x,y,z,h,V,dt,bx,by,bz,lx,my,nz);
    count = count + 1;
end
