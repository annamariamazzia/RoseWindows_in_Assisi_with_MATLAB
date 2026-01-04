% script_trefoilmotif.m
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates  a trefoil curve inside a unit circle and saves the
% coordinates in the file filetricircle.dat
% 
% For more details, refer to the comments below.
clear
close all
theta=linspace(0,2*pi);
[xv , yv]=circle(1,theta); % unitary circle
plot(xv,yv,'b')
hold on
% select of 3 equidistant points along the circle
theta1=linspace(pi/2,pi/2+2*pi,4);
xv=cos(theta1(1:3)); yv=sin(theta1(1:3));
plot(xv,yv,'bo')
% preallocation of variables xu, yu and t
xu=zeros(size(xv)); yu=xu; t=xu;
for i=1:3
    indm=mod(i-2,3)+1;
    % indm - previous index along the circle
    % centroids of the three circles
    xu(i)=(xv(i))/2;
    yu(i)=(yv(i))/2;
    t(i)=atan2(yv(indm),xv(indm)); 
   % select the angle  for drawing the circles
    plot(xu(i),yu(i),'ro')
end
 r1=norm([xu(1),yu(1)]-[xv(1) yv(1)]); % radius of the three circles
A=[]; % matrix to store the coordinates of the trefoil curve
% plot of the three circles
 for i=1:3
     theta2=linspace(t(i), t(i)+4*pi/3);
     xi=xu(i)+r1*cos(theta2);
     yi=yu(i)+r1*sin(theta2);
     plot(xi,yi,'b','LineWidth',2,'LineJoin', 'chamfer')
     if ~isempty(A)
     A=[A(1,:) xi; A(2,:) yi];
     else
         A=[xi; yi];
     end
 end
 axis square
 save('filetricircle.dat', 'A', '-ascii');
