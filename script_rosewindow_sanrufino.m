% script_rosewindow_sanrufino.m
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates the central rose window of the San Rufino church
% 
% Functions called: circle, npetals, funleavesribbon
% Note: The number of petals can be changed within the script.
% For more details, refer to the comments below.
clear
close all
pink=[1 0.4 0.7]; % Definition of the color
stringa=pink; % Choose the color in the 'stringa' variable.
% creation of the gem
theta=linspace(0,2*pi);
r0=0.2; 
[x,y]=circle(r0,theta);
plot(x,y,'Color', stringa,'LineWidth',4,'LineJoin', 'chamfer');
hold on
%%%%
% creation of a band with 12 columns and arches
r=r0+1.5;
n=12; 
rc1=npetals(n,r0,r,stringa);
r=r+rc1+0.1;
[x,y]=circle(r,theta);
plot(x,y,'Color', stringa,'LineWidth',2,'LineJoin', 'chamfer')
rold=r;
r=rold+rold/2;
[x,y]=circle(r,theta);
plot(x,y,'Color', stringa,'LineWidth',2,'LineJoin', 'chamfer')
% creation of a band with 20 carved ribbon-like curves
n=20;
theta2=linspace(pi/2,pi/2+2*pi,2*n+1);
rr=(r+rold)/2;
funleavesribbon(n,rr,stringa);
r0=r;
r=r0+1.5;
% creation of a band with 33 columns and arches
n=33; 
rc1=npetals(n,r0,r,stringa);
r=r+rc1+0.1;
[x,y]=circle(r,theta);
plot(x,y,'Color',stringa,'LineWidth',4,'LineJoin', 'chamfer')
axis square
axis off
