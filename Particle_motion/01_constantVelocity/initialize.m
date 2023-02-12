function h = initialize(n,x,y,z)

if n == 1
    x = 0;
    y = 0;
    z = 0;
end
h = plot3(x,y,z,'o');
grid on
