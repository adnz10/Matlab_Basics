clc,clear,close all

%% Given
n = 10;
bounds = [0 20];
x = randi(bounds,[1 n]);
y = randi(bounds,[1 n]);
z = randi(bounds, [1 n]);
bx = bounds;
by = bounds;
bz = bounds;

%% initialize
h = initialize(x,y,z,bx,by,bz);
m = 1;
frame(m) = getframe;

%% code
logic = false;
while logic == false
    [x,y,z] = rnd_state(x,y,z,h,bx,by,bz);
    v = [x' y' z'];
    un = unique(v,'rows');
    if size(un,1) ~= size(v,1)
        logic = true;
    end
    m = m+1;
    frame(m) = getframe;
end


