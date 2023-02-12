function [Pv,t,u,a] = state(Pv,ti,dt,u,a,DCv,DCa,B,h)

x = Pv(:,1) + u*dt*DCv(1) + 0.5*a*dt^2.*DCa(1);
y = Pv(:,2) + u*dt*DCv(2) + 0.5*a*dt^2.*DCa(2);
z = Pv(:,3) + u*dt*DCv(3) + 0.5*a*dt^2.*DCa(3);
if min(x(:)) < B(1,1) | max(x(:)) > B(2,1)
    x = Pv(:,1) - u*dt*DCv(1) - 0.5*a*dt^2*DCa(1);
end
Pv(:,1) = x;
if min(y(:)) < B(1,2) | max(y(:)) > B(2,2)
    y = Pv(:,2) - u*dt*DCv(2) - 0.5*a*dt^2*DCa(2);
end
Pv(:,2) = y;
if min(z(:)) < B(1,3) | max(z(:)) > B(2,3)
    z = Pv(:,3) - u*dt*DCv(3) - 0.5*a*dt^2*DCa(3);
end
Pv(:,3) = z;
u = u + a*dt;
t = ti+dt;

set(h,'XData',x,'YData',y,'ZData',z)
drawnow;
getframe(1);
