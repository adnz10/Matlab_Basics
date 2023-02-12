function [x,y,z,V] = Structure_state(x,y,z,h,V,dt,bx,by,bz)

for i = 1:size(x,2)
    x(i) = x(i);
    if x(i) > bx(2) 
        x(i) = x(i)-1;
    end
    if x(i)< bx(1)
        x(i) = x(i)+1;
    end
    y(i) = y(i);
    if y(i)  > by(2) 
        y(i)  = y(i) -1;
    end
    if y(i) < by(1)
        y(i)  = y(i) +1;
    end
    z(i) = z(i)+ V*dt;
    if z(i) > bz(2)
        z(i) = z(i)-1;
    end
    if  z(i)< bz(1)
        z(i) = z(i)+1;
    end
end


set(h,'XData',x,'YData',y,'ZData',z)
frame(1) = getframe;