clc,clear,close all

%% Given
n = 10;
Bound = [0 20];
x = randi(Bound,[1 n]);
y = randi(Bound,[1 n]);
z = randi(Bound,[1 n]);
bx = Bound;
by = Bound;
bz = Bound;

%% initialize
h = initialize(x,y,z,bx,by,bz);
m = 1;
frame(m) = getframe;

%% code

logic = false;
while logic == false
    [x,y,z] = rnd_state(x,y,z,h,bx,by,bz);
    v = [x' y' z'];
    Un = unique(v,'rows');
    if size(Un,1) ~= size(v,1)
        logic = true;
    end
    m = m+1;
    frame(m) = getframe;
end


