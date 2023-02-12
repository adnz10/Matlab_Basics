clc,clear,close all

%% Given
n = 1;
bounds = [0 20];
x = [5 5 10 5.1];
x = center_mass(x);
y = [10 15 12 10];
y = center_mass(y);
z = [20 20 20 20];
z = center_mass(z);
bx = bounds;
by = bounds;
bz = bounds;
V = -5*ones(size(x));
dt = 0.1*ones(size(x));
lx = 0;  %% direction cosine cos(alpha)
my = 0;   %% direction cosine cos(beta)
nz = (1/3)^0.5; %% direction cosine cos(gamma)

%% initialize
h = initialize_surf(x,y,z,bx,by,bz);

%% code
count = 1;
while count <=50
    [x,y,z,V] = surface_state(x,y,z,h,V,dt,bx,by,bz,lx,my,nz);
    count = count + 1;
end
