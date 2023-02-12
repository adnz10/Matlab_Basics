function [x,y,z,u,tf] = state(x,y,z,u,ti,a,dt,h)

x = x + u*dt + 0.5*a*dt^2;
y = y;
z = z;
u = u + a*dt;
y = 0;
z = 0;
set(h,'XData',x,'YData',y,'ZData',z)
tf = ti+dt