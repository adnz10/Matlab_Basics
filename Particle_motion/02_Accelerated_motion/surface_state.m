function [x,y,z,V] = surface_state(x,y,z,h,V,dt,bx,by,bz,lx,my,nz)

x = x+ (V*lx).*dt;
y = y + (V*my).*dt;
z = z + (V*nz).*dt;
if min(x(:)) < bx(1) | max(x(:)) > bx(2)
    x = x - V.*dt;
end
if min(y(:)) < by(1) | max(y(:)) > by(2)
    y = y - V.*dt;
end
if min(z(:)) < bz(1) | max(z(:)) > bz(2)
    z = z - V.*dt;
end

set(h,'XData',x,'YData',y,'ZData',z)
frame(1) = getframe;