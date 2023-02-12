clc,clear,close all

t = 0:0.1:10;
T = 5;
n = 1;
x = [0];
y = [0 ];
z = [0];
u = 0;
a = 1;
h = initialize(n,x,y,z);
set(gca,'ZLim',[-1 1],'YLim',[-1 1], 'XLim',[0 50])
m = 1;
frame(m) = getframe;
for i = 2:length(t)
    x(i,:) = [u*t(i) + 0.5*a*t(i)^2]
    y(i,:) = [0 ];
    z(i,:) =  [0];
    set(h,'XData',x(i,:),'YData',y(i,:),'ZData',z(i,:))
    m = m+1;
    frame(m) = getframe;
end