% script_rosewindow_sanfrancesco_lower
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates the central rose window of the San Francesco lower Church
% 
% Functions called: circle, fourcircles, npetals, trilobi
% For more details, refer to the comments below.
% clear
close all
stringa=[0.4660 0.5740 0.1880]; %%  Assign the color to the variable stringa
%
% creation of the gem
r0=0.1;
theta=linspace(0,2*pi);
[x0,y0]=circle(r0,theta);
plot(x0,y0,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
hold on
axis square
% %%%%%%%%%%%%%%%%
fourcircles(r0,stringa);
r0=10*r0; % radius of the band that encloses the central gem
[x0,y0]=circle(r0,theta);
plot(x0,y0,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
r0=r0+0.2; % external radius of the band that encloses the central gem
[x,y]=circle(r0,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
% Circular band that mimics the intricate ornamental work 
% of the corresponding band in the church's rose window.
p=r0+0.5;
rf=sin(6*theta).*cos(6*theta)+p; 
xx=rf.*cos(theta);
yy=rf.*sin(theta);
plot(xx,yy,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
r0=p+0.5; 
[x0,y0]=circle(r0,theta);
r0=r0+1.0;
[x,y]=circle(r0,theta);
fill([x0 flip(x)], [y0 flip(y)],stringa,'EdgeColor', 'none');
%%%%%%%%%%%%%%%%%%%%
% circular band with  14 columns 
r=r0+4;
n=14; m=2*n;
rc1=npetals(n,r0,r,stringa);
% Between the columns, we insert a three-lobed motif.
r1=r+1.2*rc1;
theta1=linspace(pi/2,pi/2+2*pi,m+1);
rot=@(t1) [cos(t1) -sin(t1); sin(t1) cos(t1)]; % matrix rotation function
[xu,yu]=trilobi(n,r,r0,rc1,stringa);
%%%%%%%%%%%%
% now we work on the final external band
xxo=r1*cos(theta1(1:2:m+1)); yyo=r1*sin(theta1(1:2:m+1)); % coordinates
% of the centroid of the astroid curves
r=r+2.8*rc1;
xx=r*cos(theta1(2:2:m+1)); yy=r*sin(theta1(2:2:m+1)); % centroid of the
% semicirles
r1=norm([xx(1) yy(1)]-[xx(2) yy(2)])/2; % radius of the semicircles
jj=1; jjj=2;
for i=1:n
    % construction of the semicircles
    thetac=linspace(theta1(jjj)+pi/2, theta1(jjj)+3*pi/2);
    x=xx(i)+r1*cos(thetac);
    y=yy(i)+r1*sin(thetac);
    plot(x,y,'color',stringa,'LineWidth',3,'LineJoin', 'chamfer');
    % construction of the three-lobed motif in the external band
     dxx=r1*xu; dyy=r1*yu;
        for ii=1:length(xu)
            yr=rot(theta1(jjj)+pi/2)*[dxx(ii); dyy(ii)];
            dxx(ii)=yr(1)+xx(i);
            dyy(ii)=yr(2)+yy(i);
        end
        jjj=jjj+2;
        plot(dxx,dyy,'Color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
%  construction of the astroid curve centered at the (xxo,yyo) points
    x=r1/3.*(cos(theta)).^3;
    y=r1/3.*(sin(theta).^3);
    for ii=1:length(x)
    b=rot(theta1(jj)-pi)*[x(ii); y(ii)];
    x(ii)=xxo(i)+b(1);
    y(ii)=yyo(i)+b(2);
    end
    plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
    jj=jj+2;
end
% final external circles
r=r+0.3;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
r=r+0.1;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',4,'LineJoin', 'chamfer')
axis off

