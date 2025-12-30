function  [sc,tc]=trileaves(n,rold,stringa)
theta1=linspace(pi/2,pi/2+2*pi,2*n+1);
m=2*n;
xx=rold*cos(theta1(1:2:m)); yy=rold*sin(theta1(1:2:m));
rc1=norm([xx(1) yy(1)]-[xx(2) yy(2)]);
j=1;
for i=1:n
    thetac=linspace(theta1(j)-3*pi/4+0.2, theta1(j)+3*pi/4-0.1);
    sc=xx(i)+rc1*cos(thetac);
    tc=yy(i)+rc1*sin(thetac);
    plot(sc,tc,'Color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
    j=j+2;
end
end