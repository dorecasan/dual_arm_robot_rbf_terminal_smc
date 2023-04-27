function y = noise_add(t)
y1 = (2*cos(5*t) - sin(8.1*t) - sin(2.5*t)*cos(3.5*t) - sin(10.5*t+3));
 y2 = (cos(8*t)^2 + sin(4.5*t-2)+3*sin(7*t)*cos(2*t)*sin(t)-cos(6.5*t));
 y3 = 0.2*(sin(4*t)-cos(3.2*t)+sin(7*t+5));
 y = [y1 y2 y3];
end