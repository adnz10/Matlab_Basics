function h = initial_state(x,y,z,B)

if nargin == 0
    x = 0;
    y = 0;
    z = 0;
    B = [-1 -1 -1; 1 1 1];
    h = plot3(x,y,z,'o');
    set(gca,'xlim',B(:,1),'ylim',B(:,2),'zlim',B(:,3))
    grid on
    xlabel('x-axis')
    ylabel('y-axis')
    zlabel('z-axis')
    title('Particle Motion')
else
    h = plot3(x,y,z,'o');
    set(gca,'xlim',B(:,1),'ylim',B(:,2),'zlim',B(:,3))
    grid on
    xlabel('x-axis')
    ylabel('y-axis')
    zlabel('z-axis')
    title('Particle Motion')
end