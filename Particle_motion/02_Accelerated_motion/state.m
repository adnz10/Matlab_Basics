function [x,y,z,tf,u] = state(x,y,z,ti,u,a,dt,h)

x = x + u*dt + 0.5*a*dt^2;
y = 0;
z=  0;
set(h,'XData',x,'YData',y,'ZData',z)
tf = ti+dt;
u = u + a*dt;