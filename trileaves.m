function [sc, tc] = trileaves(n, rold, stringa)
theta1 = linspace(pi/2, pi/2 + 2*pi, n + 1);
% coordinates of n equidistant points along the circle
% of radius rold
xx = rold*cos(theta1(1:n)); 
yy = rold*sin(theta1(1:n));
% rc1 is the radius of the circular arc constructed at each point 
% (xx(i), yy(i)).
rc1 = norm([xx(1) yy(1)] - [xx(2) yy(2)]);
hold on
for i = 1:n
    % next and prev are the indices 
    % of the neighboring points relative to index i
    next = mod(i,n) + 1;
    prev=mod(i-2,n)+1;
    %t0 and t1 are the first and last angle to be used to
    % generate the arc of circle. 
    % t0 is the angle between points i and prev
    % t1 is the angle between points i and next
    t0=  atan2(yy(prev) - yy(i), xx(prev) - xx(i));
    t1 = atan2(yy(next) - yy(i), xx(next) - xx(i));
    % Ensure the arc is drawn in a counter-clockwise direction
    if t1< t0
        t1 = t1 + 2*pi;
    end
    theta2 = linspace(t0, t1);
    sc = xx(i) + rc1 * cos(theta2);
    tc = yy(i) + rc1 * sin(theta2);
    plot(sc, tc, 'Color', stringa, 'LineWidth', 2,'LineJoin','chamfer')
    hold on
 end
end
