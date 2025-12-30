% script_makelily.m
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script applies the Bézier algorithm to generates the x and y -
% coordinates of a lily flower's left and right petals.
% The coordinates are saved to two files: gigliod.txt and gigliol.txt.
clear
close all
% circle with radius=1
r=1; 
t=linspace(pi/2, pi/2+2*pi); 
[xc,yc]=circle(r,t);
plot(xc,yc,'r', 'DisplayName','unitary circle')
hold on
% % Point selection to create the right petal of the lily flower.
x(1)=0;
y(1)=0;
x(2)=xc(98);
y(2)=yc(98);
x(3)=xc(85);
y(3)=yc(85);
x(4)=(x(1)+xc(80))/2;
y(4)=yc(80);
plot(x,y,'b^-','DisplayName','control points - right side')
for i=1:4
text(x(i)+0.05,y(i),num2str(i))
end
% Set of symmetric points to create the left petal.
xl=[x(1) -x(2)+2*x(1) -x(3)+2*x(1) -x(4)+2*x(1)]; yl=y;  
plot(xl,yl,'go-','DisplayName','control points - left side')
 for i=1:4
text(xl(i)+0.05,yl(i),num2str(i))
end
t=linspace(0,1,50);
% Application of the Bézier algorithm
% ---> right petal
xx=(1-t).^3 * x(1) + ...
        3*(1-t).^2 .* t * x(2) + ...
        3*(1-t) .* t.^2 * x(3) + ...
        t.^3 * x(4);
yy=(1-t).^3 * y(1) + ...
        3*(1-t).^2 .* t * y(2) + ...
        3*(1-t) .* t.^2 * y(3) + ...
        t.^3 * y(4);
plot(xx,yy,'b','LineWidth',2, 'LineJoin', 'chamfer','DisplayName','Bézier curve - right side')
% -->  left petal
xx1=(1-t).^3 * xl(1) + ...
        3*(1-t).^2 .* t * xl(2) + ...
        3*(1-t) .* t.^2 * xl(3) + ...
        t.^3 * xl(4);
yy1=(1-t).^3 * yl(1) + ...
        3*(1-t).^2 .* t * yl(2) + ...
        3*(1-t) .* t.^2 * yl(3) + ...
        t.^3 * yl(4); 
plot(xx1,yy1,'g','LineWidth',2,'LineJoin', 'chamfer','DisplayName','Bézier curve - left side')
%
Ad=[xx' yy']; As=[xx1' yy1'];
save('gigliod.txt',  'Ad', '-ascii')
save('gigliol.txt',  'As','-ascii')
axis square
legend('Location','southwest')
