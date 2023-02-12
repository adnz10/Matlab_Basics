clc,clear,close all

%% Given
t = 0:0.1:10;
n = 1;
y = 0;
z = 0;
u = 0;
a = 1;
x = u*t(1)+0.5*a*t(1)^2;
h = initialize(n,x,y,z);
set(gca,'ZLim',[0 1],'YLim',[-1 1], 'XLim',[0 50])
m = 1;
frame(m) = getframe;

%% Code
for i = 2:length(t)
    x = u*t(i)+0.5*a*t(i)^2;
    y = 0;
    z = 0;
    set(h,'XData',x,'YData',y,'ZData',z)
    m = m+1;
    frame(m) = getframe;
end





