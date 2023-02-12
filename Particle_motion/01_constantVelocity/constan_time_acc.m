clc,clear,close all

%% Given
ti = 0;
Ti = 0;
tf = 10;
Tf = 10;
dt = 0.1;
n = 1;
y = 0;
z = 0;
u = 10;
a = 1;
x = 0;
h = initialize(n,x,y,z);
set(gca,'ZLim',[0 1],'YLim',[-1 1], 'XLim',[0 50])
m = 1;
frame(m) = getframe;

%% Code
count = 1;
while count <= (Tf-Ti)/dt
    [x,y,z,u,tf] = state(x,y,z,u,ti,a,dt,h);
    m = m+1;
    frame(m) = getframe;
    count = count+1;
    ti = tf;
end





