clc,clear,close all

t = 0:0.1:10;
T = 5;
n = 1;
x = [0 0];
y = [0 sin(2*pi*t(1)/T)];
z = [sin(2*pi*t(1)/T) 0];
h = initialize(n,x,y,z);
set(gca,'ZLim',[-1 1],'YLim',[-1 1], 'XLim',[0 10])
m = 1;
frame(m) = getframe;
for i = 2:length(t)
    x(i,:) = [t(i) t(i)];
    y(i,:) = [0 sin(2*pi*t(i)/T) ];
    z(i,:) =  [sin(2*pi*t(i)/T) 0];
    set(h,'XData',x(i,:),'YData',y(i,:),'ZData',z(i,:))
    m = m+1;
    frame(m) = getframe;
end