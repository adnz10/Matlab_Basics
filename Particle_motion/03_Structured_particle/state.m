function [x,y,z,V] = state(x,y,z,h,V,A,dt,B,DCv,DCa)

x = x + (V*DCv(1)).*dt + 0.5*(A*DCa(1)).*(dt.^2);
y = y + (V*DCv(2)).*dt + 0.5*(A*DCa(2)).*(dt.^2);
z = z + (V*DCv(3)).*dt + 0.5*(A*DCa(3)).*(dt.^2);
V = V + A.*dt;
if min(x(:)) < B(1,1) | max(x(:)) > B(2,1)
    x = x - (V*DCv(1)).*dt - 0.5*(A*DCa(1)).*(dt.^2);
end
if min(y(:)) < B(1,2) | max(y(:)) > B(2,2)
    y = y - (V*DCv(2)).*dt - 0.5*(A*DCa(2)).*(dt.^2);
end
if min(z(:)) < B(1,3) | max(z(:)) > B(2,3)
    z = z - (V*DCv(3)).*dt - 0.5*(A*DCa(3)).*(dt.^2);
end

set(h,'XData',x,'YData',y,'ZData',z)
drawnow;
fr(1) = getframe;