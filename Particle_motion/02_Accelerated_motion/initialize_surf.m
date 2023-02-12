function h = initialize_surf(x,y,z,bx,by,bz)

if nargin == 0
    x = 0;
    y = 0;
    z = 0;
    bx = [-1 1];
    by = [-1 1];
    bz = [-1 1];
end
P = [x' y' z'];
shp = alphaShape(P);
h = plot(shp);
grid on
set(gca,'ZLim',bz,'YLim',by, 'XLim',bx)
xlabel('X Axis')
ylabel('Y Axis')
zlabel('Z Axis')
