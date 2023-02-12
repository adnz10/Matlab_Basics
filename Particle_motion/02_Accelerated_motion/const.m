clc,clear,close all

% t = 0:0.1:10;
ti = 0;
Tf = 10;
dt = 0.1;
n = 1;
x = [0];
y = [0];
z = [0];
u = 0;
a = 1;
h = initialize(n,x,y,z);
set(gca,'ZLim',[-1 1],'YLim',[-1 1], 'XLim',[0 50])
m = 1;
frame(m) = getframe;
count = 1;

while count <= (Tf)/dt
    [x,y,z,tf,u] = state(x,y,z,ti,u,a,dt,h);
    X(count) = x; 
    U(count) = u;
    count = count+1;
    m = m+1;
    frame(m) = getframe;
end


