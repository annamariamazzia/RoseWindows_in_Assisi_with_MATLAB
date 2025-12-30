% script_rosewindow_sanrufinolateral_v1.m
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates the lateral rose window of the San Rufino church
% 
% Functions called: circle, npetals, funleaves
% Note: The number of petals can be changed within the script.
% For more details, refer to the comments below.
clear
close all
stringa='r'; % Choose the color in the 'stringa' variable.
choice=2; 
% If choice = 1, two circles will be drawn to represent the decoration 
% of the external band.
% If choice = 2, two Archimedean spirals will be drawn to reproduce the lily.
%
% creation of the gem
theta=linspace(0,2*pi);
r0=0.5; 
[x0,y0]=circle(r0,theta);
r0=r0+1.5;
[x,y]=circle(r0,theta);
fill([x0 flip(x)], [y0 flip(y)], stringa,'EdgeColor', 'none');
hold on
axis square
%%%%
% creation of a band with 12 columns and arches
n=12;
r=r0+4;
rc1=npetals(n,r0,r,stringa);
r=r+rc1+0.1;
[x,y]=circle(r,theta);
plot(x,y,'Color', stringa,'LineWidth',2,'LineJoin', 'chamfer')
% creation of a band with 19 carved lilies
n=19;
rr=funleaves(n,r,choice,stringa);
[x,y]=circle(rr,theta);
plot(x,y,'Color', stringa,'LineWidth',2,'LineJoin', 'chamfer')
r=rr+0.3;
[x,y]=circle(r,theta);
plot(x,y,'Color',stringa,'LineWidth',4,'LineJoin', 'chamfer')
axis off
