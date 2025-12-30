% script1.m
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates a rose window with an empty central gem, which is filled
% with a user-specified color. It also creates an external band with 12 columns 
% with their arches.  
% 
% Functions called: circle, npetals
% Note: The number of petals can be changed within the script.
% For more details, refer to the comments below.
clear
close all
r0=0.5;        % the radius of the gem
stringa='m';   % Choose the color in the 'stringa' variable.
theta=linspace(0,2*pi);
[x0,y0]=circle(r0,theta);
r0=r0+1;     % the external radius of a circular annulus that will be
             % filled with color.
[x,y]=circle(r0,theta);
% instructions to plot the circular annulus filled with the user-specified color
fill([x0 flip(x)], [y0 flip(y)], stringa, 'EdgeColor', 'none')
hold on
axis square
r=r0+3;  % the radius where the column segments will end.
%%%%%%%%% 
n=12;  % number of columns  with their arches
rc1=npetals(n,r0,r,stringa);
r=r+rc1; % the radius of the outer closing band of the rose window.
[x,y]=circle(r,theta);
plot(x,y,stringa,'LineWidth',2, 'LineJoin', 'chamfer');
% it is also ok 'LineJoin', 'miter' in MATLABR2025b
% to avoid a bug on Linux
axis off
