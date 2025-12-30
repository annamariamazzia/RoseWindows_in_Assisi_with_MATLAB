% script_fivepointstarcurve
% MIT license
% Copyright (c) Annamaria Mazzia
%
% This script generates a five-points star curve inside a unit circle and saves the
% coordinates in the file pentastella.dat
% 
% For more details, refer to the comments below.
clear
close all
stringa='r';
theta=linspace(0,2*pi);
% unitary circle
[x,y]=circle(1,theta);
plot(x,y,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer');
hold on
% selection of five points along the circle
n=5;
theta1=linspace(pi/2,pi/2+2*pi,n+1);
xx=cos(theta1(1:n)); yy=sin(theta1(1:n));
plot(xx,yy,'o')
% The vertices of a pentagon, which will be the centers of the five 
% circles used to construct the overall curve.
xu=xx/2; 
yu=yy/2;
plot(xu,yu,'m*')
r1=norm([xu(1),yu(1)]-[xx(1) yy(1)]); 
r1=r1/2;  % radius of the circles
A=[]; % Matrix to store the curve points
for i=1:n
     % Assuming the centers are ordered anti-clockwise, indm denotes 
     % the index of the preceding center and indp the index of 
     % the succeeding center
     if i==1 
         indm=n;
     else
         indm=i-1;
     end  
     if i==n
         indp=1;
     else
         indp=i+1;
     end
     % We draw the circles external to the pentagon so that they are 
     % connected by the segments  of the pentagon that remain  unused. 
     % We must, therefore, determine the intersection points between 
     % the circles and the pentagon to obtain the start and end angles 
     % for drawing each circular arc.
     m=(yu(indp)-yu(i))/(xu(indp)-xu(i)); %The slope of the line connecting 
     % the i-th center with the next one
     % x1 and x2 are the  x-coordinates of the intersection  points 
     % between the circle centered at (xu(i),yu(i)) and the line with slope m
     x1=xu(i)+ sqrt(r1^2/(1+m^2));
     x2=xu(i)- sqrt(r1^2/(1+m^2));
     % Selection of the correct intersection point
     if xu(i)<x1 && x1< xu(indp)
         xx=x1; yy= m*(x1-xu(i))+yu(i);
     else
         xx=x2; yy= m*(x2-xu(i))+yu(i);
     end
     t2=angle(complex(xx,yy));  % The angle of the vector from the origin 
     % (0,0) to the intersection point.
     m=(yu(indm)-yu(i))/(xu(indm)-xu(i));  %The slope of the line connecting 
     % the i-th center with the previous one
     % x1 and x2 are the  x-coordinates of the intersection  points 
     % between the circle centered at (xu(i),yu(i)) and the line with slope m
     x1=xu(i)+ sqrt(r1^2/(1+m^2)); 
     x2=xu(i)- sqrt(r1^2/(1+m^2));
     % Selection of the correct intersection point
     if xu(indm)>x1 && x1>xu(i)
         xxx=x1; yyy= m*(x1-xu(i))+yu(i);
     else
         xxx=x2; yyy= m*(x2-xu(i))+yu(i);
     end
     t1=angle(complex(xxx,yyy)); % The angle of the vector from the origin 
     % (0,0) to the intersection point.
     %
     % theta2=  the range in which the angle t1 must 
     % vary to obtain the correct portion of the circle.
      if t1<t2
       theta2=linspace(t1-pi/2,t2+pi/2);
      else
        theta2=linspace(t1-pi/2,2*pi+t2+pi/2);
      end
      % (xi,yi): points along the arc to be drawn
     xi=xu(i)+r1*cos(theta2);
     yi=yu(i)+r1*sin(theta2);
     plot(xi,yi,'color',stringa,'LineWidth',2,'LineJoin', 'chamfer')
     plot(xi(1),yi(1),'ko')
     plot(xx,yy,'bo')
     plot(xxx,yyy,'g*')
     plot([xu(i) xx xu(indp)], [yu(i) yy yu(indp)],'b')
     plot([xu(i) xxx xu(indm)], [yu(i) yyy yu(indm)],'g')
     if isempty(A)
     A=[xi; yi];
     else
         A=[A(1,:) xi; A(2,:) yi];
     end
end
 A=[A(1,:) A(1,1); A(2,:) A(2,2)]; % Append the first point 
 % to the end of the matrix to close the shape.
 axis square
 save('pentastella.dat', 'A', '-ascii');
