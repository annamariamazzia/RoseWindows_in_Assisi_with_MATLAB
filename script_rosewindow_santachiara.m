% script_rosewindow_santachiara.m
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates the rose window of the Church of Santa Chiara
% 
% Functions called: circle, treleaves, ncrosspetals, plot_tricircle
% Note: The number of petals can be changed within the script.
% For more details, refer to the comments below.
clear
close all
r0=0.1; % the radius of the gem
purple = [128, 0, 128] / 255; % definition of the color
stringa=purple; % Choose the color in the 'stringa' variable.
% creation of the gem with a flower-like inner decoration
theta=linspace(0,2*pi);
[x0,y0]=circle(r0,theta);
plot(x0,y0,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
hold on
axis square
rold=r0;
r0=0.3;
[x,y]=circle(r0,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
% inner decoration
n=5; 
trileaves(n,rold,stringa);
%
%  creation of a band with 15 columns and intersecting arches 
r=r0+1;
n=15; m=2*n;
[xxc,yyc,rc1,theta1]=ncrosspetals(n,r0,r,stringa);
% A trefoil motif is inserted between the arches
% xxc and yyc are the coordinates of the  the centroid where the trefoil 
% motif is placed
xxc=xxc+(3*rc1/4)*cos(theta1(1:2:m)); yyc=yyc+(3*rc1/4)*sin(theta1(1:2:m));
rrr=rc1/6; % radius for the trefoil motif
plot_tricircle(n,xxc,yyc,rrr,stringa);
% outer band with a doubled number (30) of columns and intersecting arches;
% a trefoil motif is inserted between the arches.
r1=r;
r=r0+r1+rc1/2;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
r1=r; r=r1+r;
n=2*n; m=2*n;
[xxc,yyc, rc1,theta1]=ncrosspetals(n,r1,r,stringa);
r1=r;
r=r1+rc1;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
xxc=xxc+(3*rc1/4)*cos(theta1(1:2:m)); yyc=yyc+(3*rc1/4)*sin(theta1(1:2:m));
rrr=rc1/6;
plot_tricircle(n,xxc,yyc,rrr,stringa);
%%%%%%%
% external band with 25 squares and 25 circles alternating 
n=25;
theta1=linspace(pi/2,pi/2+2*pi,2*n+1);
m=2*n;
r=r+0.3;
xx0=r*cos(theta1(1:2:m)); yy0=r*sin(theta1(1:2:m)); % points used 
% to construct the squares
xxc=r*cos(theta1(2:2:m+1)); yyc=r*sin(theta1(2:2:m+1)); % points used as
% centroids of the circles
rr=norm([xx0(1) yy0(1)]-[xxc(1) yyc(1)]);
rsmall=rr/2;
% circles
for i=1:n
    xcs=xxc(i)+rsmall*cos(theta);
    ycs=yyc(i)+rsmall*sin(theta);
    plot(xcs,ycs,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
    xcs=xxc(i)+rsmall/2*cos(theta);
    ycs=yyc(i)+rsmall/2*sin(theta);
    plot(xcs,ycs,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
end
% squares
d=rsmall;
for i=1:n
    px=[xx0(i),  xx0(i)+d ,xx0(i), xx0(i)-d,  xx0(i) ];
    py=[yy0(i)-d, yy0(i) , yy0(i)+d, yy0(i) yy0(i)-d];
    plot(px,py,'Color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
end
for i=1:n
    px=[xx0(i),  xx0(i)+d/2 ,xx0(i), xx0(i)-d/2,  xx0(i) ];
    py=[yy0(i)-d/2, yy0(i) , yy0(i)+d/2, yy0(i) yy0(i)-d/2];
    plot(px,py,'Color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
end
% external final band
%%%%%%%%%%%%%
r=r+rsmall+0.1;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
%%%%%%%%%%%%%%
r=r+0.3;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
%%%%%%%%%%%%%%
r=r+0.1;
[x,y]=circle(r,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
axis off
