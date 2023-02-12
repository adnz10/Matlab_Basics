function [x,y,z] = rnd_state(x,y,z,h,bx,by,bz)

for i = 1:size(x,2)
    x(i) = x(i)+randi([-1 1]) ;
    while x(i) > bx(2) | x(i)< bx(1)
        x(i) = x(i)+randi([-1 1]);
    end
    y(i) = y(i)+randi([-1 1]);
    while y(i)  > by(2) | y(i) < by(1)
        y(i)  = y(i) +randi([-1 1]);
    end
    z(i) =  z(i)+randi([-1 1]);
    while z(i) > bz(2) | z(i)< bz(1)
        z(i) = z(i)+randi([-1 1]);
    end
end






    set(h,'XData',x,'YData',y,'ZData',z)
