% script_halvedtrefoilmotif.m
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates  a halved trefoil curve inside a unit circle and saves the
% coordinates in the file filesemitricircle.dat
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
xu=zeros(size(xv)); % x-coordinates of the centroids
yu=xu; % y-coordinated of the centroids. Only for the
% central semicircle is the y-coordinate not equal to zero
t=xu; 
for i=1:3
     % centroids of the three circles
    xu(i)=(xv(i))/2;
    if i==1
      yu(i)=(yv(i))/2;
    end
    t(i)=theta1(i)-pi/2; % select the angle for drawing the circles
    plot(xu(i),yu(i),'ro')
end
r1=norm([xu(1),yu(1)]-[xv(1) yv(1)]); % radius of the three arcs
% plot of the three arcs
 for i=1:3
     % define the interval [a,b] of the angles for drawing the arcs
     if i==1 % we have the central semicircle 
         a=t(i); b=t(i)+pi; 
     elseif i==2 %  we have the left quarter circle 
         a=angle(complex(xi(end)-xu(i),yi(end))); b=pi;  
     else   % we have the right quarter circle
          a=0; b=angle(complex(aa-xu(i),bb));
     end
     theta2=linspace(a,b);
     xi=xu(i)+r1*cos(theta2);
     yi=yu(i)+r1*sin(theta2);
     % plot the three curves with different colors
     if i==1
     plot(xi,yi,'b','LineWidth',2,'LineJoin', 'chamfer')
     elseif i==2
         plot(xi,yi,'r','LineWidth',2,'LineJoin', 'chamfer')
     else
         plot(xi,yi,'g','LineWidth',2,'LineJoin', 'chamfer')
     end
     if i==1 
         aa=xi(1); bb=yi(1); % these values are useful for connecting the
         % central semicircle with the right arc.
     end
     if i==1  
         A1=[xi; yi]; % matrix to store the coordinates of the central arc
     elseif i==2 
         A2=[xi; yi]; % matrix to store the coordinates of the left arc
     else  
         A3=[xi; yi]; % matrix to store the coordinates of the right arc
     end
 end
 A=[A3 A1 A2]; % matrix to store the coordinates of the trefoil curve 
 % from right to left
 axis square
 save('filesemitricircle.dat', 'A', '-ascii');
