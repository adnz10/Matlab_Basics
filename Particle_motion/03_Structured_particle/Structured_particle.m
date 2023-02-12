clc,clear,close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Given
n = 1;
R = 10;

% Boundary
for i = 1
bounds = [0;100];
bx = bounds;
by = bounds;
bz = bounds;
B = [bx by bz];
end

% Coordinate
for i = 1
[x1,y1,z1] = sphere(24);
x = [];
y = [];
z = [];
end
for i = 1:n
    x = [x; R*x1(:) + 50];
    y = [y; R*y1(:) + 50];
    z = [z; R*z1(:) + 90];
    V = 0*ones(size(x));
    A = -9.81*ones(size(x));
    dt = 0.1*ones(size(x));
    DCv = [0 0 (1/3)^0.5];
    DCa = [0 0 1];
end
% x = [5 5 10 5.1];
% x = center_mass(x);
% y = [10 15 12 10];
% y = center_mass(y);
% z = [20 20 20 20];
% z = center_mass(z);
% V = 0*ones(size(x));
% A = -9.81*ones(size(x));
% dt = 0.1*ones(size(x));
% DCv = [0 0 (1/3)^0.5];
% DCa = [0 0 1];

%% initialize
h = initial_state(x,y,z,bx,by,bz);

%% code
count = 1;
while count <=100
    [x,y,z,V] = state(x,y,z,h,V,A,dt,B,DCv,DCa);
    count = count + 1;
end
