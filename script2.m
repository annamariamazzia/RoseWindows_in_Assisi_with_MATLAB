% script2.m
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates a rose window with an empty central gem, which is filled
% with a user-specified color. It also creates an external band with 12 columns 
% with their arches.  
% 
% Functions called: circle, npetals, funreplicateflower
% Note: The number of petals can be changed within the script.
% For more details, refer to the comments below.
clear
close all
r0=0.8;  % the radius of the gem
stringa='m';  % Choose the color in the 'stringa' variable.
theta=linspace(0,2*pi);
[x0,y0]=circle(r0,theta);
plot(x0,y0,stringa,'LineWidth',2,'LineJoin', 'chamfer');
hold on
axis square
% %%%%%%%%%%%%%%%%
r1=r0+1;    % This is the external radius of a circular annulus. 
            % We will place a parametric curve in it that forms a 
            % pattern like a 12-petal flower.
            % The same pattern will be replicated around the external band.
[x,y]=circle(r1,theta);
plot(x,y,stringa,'LineWidth',4,'LineJoin', 'chamfer'); 
% polar function of the parametric curve
p=r0+0.5;
rf=cos(6*theta).*sin(6*theta)+p;
% xxf and yyf cartesian coordinates of the parametric curve
xxf=rf.*cos(theta);
yyf=rf.*sin(theta);
% plot of the parametric curve in the central gem
plot(xxf,yyf,stringa,'LineWidth',2,'LineJoin', 'chamfer')
% we create a band with n columns with their arches.
r=r1+4; % the radius where the column segments will end.
n=12; 
rc1=npetals(n,r1,r,stringa);
r=r+rc1;
[x,y]=circle(r,theta);
plot(x,y,stringa,'LineWidth',2,'LineJoin', 'chamfer')
%Now we replicate the parametric curve used in the gem 
%along the external band, a number of times specified by the variable nr
r=r+2; % the radius of the circles within which we place the parametric curves.
nr=24;
rc1=funreplicateflower(nr,r,xxf,yyf,stringa);
r=r+1.5*rc1; % the radius of the outer closing band of the rose window.
[x,y]=circle(r,theta);
plot(x,y,stringa,'LineWidth',4,'LineJoin', 'chamfer')
axis off
