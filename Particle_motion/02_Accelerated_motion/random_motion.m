clc,clear,close all

%% Given
n = 1;
x = [10];
y = [10];
z = [10];
bx = [0 20];
by = [0 20];
bz = [0 20];

%% initialize
h = initialize(n,x,y,z,bx,by,bz);
m = 1;
frame(m) = getframe;

%% code

count = 1;
while count <= 100
    [x,y,z] = rnd_state(x,y,z,h,bx,by,bz);
    m = m+1;
    frame(m) = getframe;
    count = count+1;
end


