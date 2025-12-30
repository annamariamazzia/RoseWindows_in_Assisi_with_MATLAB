% script_rosewindow_sanfrancesco_upper
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates the central rose window of the San Francesco upper Church
% 
% Functions called: circle, npetals, trilobi, creapentastella
% For more details, refer to the comments below.
clear
close all
stringa=[0 0.4 0.7]; %  Assign the color to the variable stringa
%
% creation of the gem
r0=0.1;
theta=linspace(0,2*pi);
[x0,y0]=circle(r0,theta);
plot(x0,y0,'color',stringa,'LineWidth',4,'LineJoin', 'chamfer');
hold on
axis square
%
r0=0.2;
[x,y]=circle(r0,theta);
plot(x,y,'color',stringa,'LineWidth',4,'LineJoin', 'chamfer');
% creation of a band with 12 columns and arches
r=r0+1;
n=12; %m=2*n;
rc1=npetals(n,r0,r,stringa);
% a half treoil motif inside the arches
trilobi(n,r,r0,rc1,stringa);
% the next circular crown
r=r+rc1+0.1;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
rold=r;
r=rold+rold/2;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
% 14 circles with an internal five-pointed star curve
n=14;
theta2=linspace(pi/2,pi/2+2*pi,2*n+1);
rr=(r+rold)/2;
xxc=rr*cos(theta2(1:2:2*n)); yyc=rr*sin(theta2(1:2:2*n));
r1=norm([xxc(1) yyc(1)]-[xxc(2) yyc(2)])/2 -0.1;
creapentastella(n,xxc,yyc,r1,stringa);
% creation of a band with 46 columns and arches
r0=r;
r=r0+1;
n=46; % m=2*n;
rc1=npetals(n,r0,r,stringa);
% a trefoil motif inside the arches
trilobi(n,r,r0,rc1,stringa);
% External band with a serpentine pattern, stylized by alternating 
% smaller and larger annuli.
r=r+rc1+0.1;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
n=22;
rold=r;
r=r+1;
rr=(r+rold)/2;
theta3=linspace(pi/2,pi/2+2*pi,2*n+1);
m=2*n;
xx0=rr*cos(theta3(1:2:m)); yy0=rr*sin(theta3(1:2:m)); %centroids of the smaller annuli
xxc=rr*cos(theta3(2:2:m+1)); yyc=rr*sin(theta3(2:2:m+1)); %centroids of the larger annuli
rr1=norm([xx0(1) yy0(1)]-[xxc(1) yyc(1)]);
rsmall=rr1*0.6; % radius of larger circles
% larger annulus
for i=1:n
    xcs=xxc(i)+rsmall*cos(theta);
    ycs=yyc(i)+rsmall*sin(theta);
    plot(xcs,ycs,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
    xcs=xxc(i)+rsmall/2*cos(theta);
    ycs=yyc(i)+rsmall/2*sin(theta);
    plot(xcs,ycs,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
end
rsmall=rr1-rsmall; % radius of smaller circles
% smaller annulus
for i=1:n
    xcs=xx0(i)+rsmall*cos(theta);
    ycs=yy0(i)+rsmall*sin(theta);
    plot(xcs,ycs,'color',stringa,'LineWidth',1,'LineJoin', 'chamfer')
    xcs=xx0(i)+rsmall/2*cos(theta);
    ycs=yy0(i)+rsmall/2*sin(theta);
    plot(xcs,ycs,'color',stringa,'LineWidth',1,'LineJoin', 'chamfer')
end
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
axis off

