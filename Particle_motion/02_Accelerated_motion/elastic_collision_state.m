function [x,y,z,V] = elastic_collision_state(x,y,z,h,V,dt)

for i = 1:size(x,2)
    x(i) = x(i)+ V(i)*dt;
    y(i) = y(i);
    z(i) = z(i);
end


set(h,'XData',x,'YData',y,'ZData',z)

frame(1) = getframe;