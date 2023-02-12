clc,clear,close all

% t = 0:0.1:10;
ti = 0;
tf = 10;
dt = 0.5;
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

while ti<10
    x = [x + u*dt + 0.5*a*dt^2];
    y = 0;
    z=  0;
    set(h,'XData',x,'YData',y,'ZData',z)
    m = m+1;
    frame(m) = getframe;
    ti = ti+dt;
    u = u + a*dt;
end