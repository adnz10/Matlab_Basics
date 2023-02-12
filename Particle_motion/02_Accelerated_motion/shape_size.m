clc,clear,close all

%% Given
n = 1;
bounds = [0 20];
x = [8 11];
x = center_mass(x);
y = [7 11];
y = center_mass(y);
z = [20 20];
z = center_mass(z);
bx = bounds;
by = bounds;
bz = bounds;
V = [-5];
dt = 0.1;
% lx = 1/sqrt(3);  %% direction cosine cos(alpha)
% my = 1/3^0.5;   %% direction cosine cos(beta)
% nz = (1/3)^0.5; %% direction cosine cos(gamma)

%% initialize
h = initialize(x,y,z,bx,by,bz);

%% code
count = 1;
while count <=50
    [x,y,z,V] = Structure_state(x,y,z,h,V,dt,bx,by,bz);
%     v(count,:) = [x' y' z'];
    count = count + 1;
end
