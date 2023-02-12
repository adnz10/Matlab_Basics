clc,clear,close all

%% Given
n = 2;
bounds = [0 20];
x = [0 5];
y = [0 0];
z = [0 0];
bx = bounds;
by = bounds;
bz = bounds;
V = [10 3];
dt = 0.1;
m1 = 1;
m2 = 1;

%% initialize
h = initialize(x,y,z,bx,by,bz);
m = 1;
frame(m) = getframe;

%% code
count = 1;
while count <=20
    [x,y,z,V] = elastic_collision_state(x,y,z,h,V,dt);
    v = [int64(x') y' z'];
    un = unique(v,'rows');
    if size(un,1) ~= size(v,1)
        logic = true;
        A = [m1 m2; 1 -1];
        B = [m1*V(1)+m2*V(2); V(2)-V(1)];
        V = (inv(A)*B)';
    end
    m = m+1;
    frame(m) = getframe;
    count = count + 1;
end


