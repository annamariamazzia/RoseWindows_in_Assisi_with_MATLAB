function [x,y]=circle(r,theta)
% function [x,y]=circle(r,theta)
% inputs
%        r - the radius of the circle centered in (0,0)
%        theta - a vector containing the values used to calculate 
%               the points of the circle.
% output
%  x and y coordinates of the points on the circle.
%  Example:
%  in the Command Window or in a script write:
%  r=1; theta=linspace(0,2*pi);
%  [x,y]=circle(r,theta);
%  plot(x,y)
% The instructions above  generate the two vectors, x and y, and a plot
% of a circle centered at (0,0) with a radius of 1.
%
% MIT license 
% Copyright (c) Annamaria Mazzia
%
x=r*cos(theta);
y=r*sin(theta);
end
