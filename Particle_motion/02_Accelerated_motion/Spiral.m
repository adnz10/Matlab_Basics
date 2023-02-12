clc,clear,close all
%% Helix Motion
maxi = 8*pi;
n = maxi/500;
theta = 0:n:maxi;
a = 0.1;
b = 1;
% r = a*exp(theta(1)*cot(b));
r = 5;
x = r*cos(theta(1));
y = r*sin(theta(1));
z = 0;
Z = 0;

plot3(x,y,z,'o-')
grid on
hold on

view(3)

set(gca,'ZLim',[0 1000],'YLim',[-10 10], 'XLim',[-10 10])
m = 1;
frame(m) = getframe;

%% code

count = 1;
while count <= length(theta)
%     r = a*exp(theta(count)*cot(b));
    x(count) = r*cos(theta(count));
    y(count) = r*sin(theta(count));
    z(count) =  Z;
    plot3(x,y,z,'o-')
    m = m+1;
    frame(m) = getframe;
    count = count+1;
    Z = Z+2;
end


