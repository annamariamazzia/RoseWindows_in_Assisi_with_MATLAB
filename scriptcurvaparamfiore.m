clear
close all
theta=linspace(0,2*pi,200);
n=6; p=3;
rf=sin(n*theta).*cos(n*theta)+p;
xx=rf.*cos(theta);
yy=rf.*sin(theta);
plot(xx,yy,'b','LineWidth',2,'LineJoin', 'chamfer')
hold on
r0=max(rf);
[x,y]=circle(r0,theta);
plot(x,y,'m','LineWidth',2,'LineJoin', 'chamfer');
r1=min(rf);
[x,y]=circle(r1,theta);
plot(x,y,'m','LineWidth',2,'LineJoin', 'chamfer');
axis equal
 axis off
