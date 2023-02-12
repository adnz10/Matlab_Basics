function [Pv,t,u,a,DCv] = state(Pv,ti,dt,u,a,DCv,DCa,B,h,M,dist,m)
x = Pv(:,1:m+1) + dt*u.*DCv(:,1);
y = Pv(:,m+2:2*(m+1)) + dt*u.*DCv(:,2);
z = Pv(:,2*(m+1)+1:3*(m+1)) + dt*u.*DCv(:,3);
Pv = [x y z];

EuleDist = sqrt( (x(1,end)-x(2,end)).^2 + (y(1,end)-y(2,end)).^2 + (z(1,end)-z(2,end)).^2 );
if EuleDist <= dist
    theta2_ = ((y(2)-y(1))/(x(2)-x(1)))*180/pi;
    coord = [M(1),M(2),u(1),u(2),acosd(DCv(1,1)),acosd(DCv(2,1)),theta2_];
    out = collision_2d(coord);
    u(1,:) = out(1)*ones(1,size(u,2));
    u(2,:) = out(2)*ones(1,size(u,2));
    DCv = [cosd(out(3)) cosd(90-out(3)) cosd(90); cosd(out(4)) cosd(90-out(4)) cosd(90)];
    x = Pv(:,1:m+1) + dt*u.*DCv(:,1);
    y = Pv(:,m+2:2*(m+1)) + dt*u.*DCv(:,2);
    z = Pv(:,2*(m+1)+1:3*(m+1)) + dt*u.*DCv(:,3);
    Pv = [x y z];

end

for i = 1:size(M,1)
    maxi = max(Pv(i,:));
    mini = min(Pv(i,:));
    logic = maxi > B(2,1) | mini < B(1,1);
    logic2 = sum(logic(:));
    if logic2 > 0
        %         disp('work')
        u(i,:) = -u(i,:);
        DCv(i,:) = DCv(i,:);
        x(i,:) = Pv(i,1:m+1) + dt*u(i,:).*DCv(i,1);
        y(i,:) = Pv(i,m+2:2*(m+1)) + dt*u(i,:).*DCv(i,2);
        z(i,:) = Pv(i,2*(m+1)+1:3*(m+1)) + dt*u(i,:).*DCv(i,3);
        Pv = [x y z];
    end
end

t = ti+dt;
set(h,'XData',x(:),'YData',y(:),'ZData',z(:))
drawnow;
getframe(1);
