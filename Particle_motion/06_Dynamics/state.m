function [Pv,t,u,a,DCv] = state(Pv,ti,dt,u,a,DCv,DCa,B,h,M,theta2_)

x = Pv(:,1) + dt*u.*DCv(:,1);
y = Pv(:,2) + dt*u.*DCv(:,2);
z = Pv(:,3) + dt*u.*DCv(:,3) ;
Pv = [x y z];
if Pv(:,1) >= Pv(:,2)-0.5 & Pv(:,1) <= Pv(:,2)+0.5 
    coord = [M(1),M(2),u(1),u(2),acosd(DCv(1,1)),acosd(DCv(2,1)),theta2_];
    out = collision_2d(coord);
    u = [out(1);out(2)];
    DCv = [cosd(out(3)) cosd(90-out(3)) cosd(90); cosd(out(4)) cosd(90-out(4)) cosd(90)];
end
t = ti+dt;
set(h,'XData',x,'YData',y,'ZData',z)
drawnow;
getframe(1);
